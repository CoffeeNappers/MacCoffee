package com.google.android.exoplayer2.upstream.cache;

import android.util.Log;
import android.util.SparseArray;
import com.google.android.exoplayer2.upstream.cache.Cache;
import com.google.android.exoplayer2.util.Assertions;
import com.google.android.exoplayer2.util.AtomicFile;
import com.google.android.exoplayer2.util.ReusableBufferedOutputStream;
import com.google.android.exoplayer2.util.Util;
import java.io.BufferedInputStream;
import java.io.Closeable;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.security.GeneralSecurityException;
import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.Random;
import java.util.Set;
import javax.crypto.Cipher;
import javax.crypto.CipherInputStream;
import javax.crypto.CipherOutputStream;
import javax.crypto.NoSuchPaddingException;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;
/* loaded from: classes.dex */
final class CachedContentIndex {
    public static final String FILE_NAME = "cached_content_index.exi";
    private static final int FLAG_ENCRYPTED_INDEX = 1;
    private static final String TAG = "CachedContentIndex";
    private static final int VERSION = 1;
    private final AtomicFile atomicFile;
    private ReusableBufferedOutputStream bufferedOutputStream;
    private boolean changed;
    private final Cipher cipher;
    private final SparseArray<String> idToKey;
    private final HashMap<String, CachedContent> keyToContent;
    private final SecretKeySpec secretKeySpec;

    public CachedContentIndex(File cacheDir) {
        this(cacheDir, null);
    }

    public CachedContentIndex(File cacheDir, byte[] secretKey) {
        if (secretKey != null) {
            Assertions.checkArgument(secretKey.length == 16);
            try {
                this.cipher = Cipher.getInstance("AES/CBC/PKCS5PADDING");
                this.secretKeySpec = new SecretKeySpec(secretKey, "AES");
            } catch (NoSuchAlgorithmException | NoSuchPaddingException e) {
                throw new IllegalStateException(e);
            }
        } else {
            this.cipher = null;
            this.secretKeySpec = null;
        }
        this.keyToContent = new HashMap<>();
        this.idToKey = new SparseArray<>();
        this.atomicFile = new AtomicFile(new File(cacheDir, FILE_NAME));
    }

    public void load() {
        Assertions.checkState(!this.changed);
        if (!readFile()) {
            this.atomicFile.delete();
            this.keyToContent.clear();
            this.idToKey.clear();
        }
    }

    public void store() throws Cache.CacheException {
        if (this.changed) {
            writeFile();
            this.changed = false;
        }
    }

    public CachedContent add(String key) {
        CachedContent cachedContent = this.keyToContent.get(key);
        if (cachedContent == null) {
            return addNew(key, -1L);
        }
        return cachedContent;
    }

    public CachedContent get(String key) {
        return this.keyToContent.get(key);
    }

    public Collection<CachedContent> getAll() {
        return this.keyToContent.values();
    }

    public int assignIdForKey(String key) {
        return add(key).id;
    }

    public String getKeyForId(int id) {
        return this.idToKey.get(id);
    }

    public void removeEmpty(String key) {
        CachedContent cachedContent = this.keyToContent.remove(key);
        if (cachedContent != null) {
            Assertions.checkState(cachedContent.isEmpty());
            this.idToKey.remove(cachedContent.id);
            this.changed = true;
        }
    }

    public void removeEmpty() {
        LinkedList<String> cachedContentToBeRemoved = new LinkedList<>();
        for (CachedContent cachedContent : this.keyToContent.values()) {
            if (cachedContent.isEmpty()) {
                cachedContentToBeRemoved.add(cachedContent.key);
            }
        }
        Iterator<String> it = cachedContentToBeRemoved.iterator();
        while (it.hasNext()) {
            String key = it.next();
            removeEmpty(key);
        }
    }

    public Set<String> getKeys() {
        return this.keyToContent.keySet();
    }

    public void setContentLength(String key, long length) {
        CachedContent cachedContent = get(key);
        if (cachedContent != null) {
            if (cachedContent.getLength() != length) {
                cachedContent.setLength(length);
                this.changed = true;
                return;
            }
            return;
        }
        addNew(key, length);
    }

    public long getContentLength(String key) {
        CachedContent cachedContent = get(key);
        if (cachedContent == null) {
            return -1L;
        }
        return cachedContent.getLength();
    }

    private boolean readFile() {
        InputStream inputStream;
        DataInputStream input;
        GeneralSecurityException e;
        DataInputStream input2 = null;
        try {
            try {
                inputStream = new BufferedInputStream(this.atomicFile.openRead());
                input = new DataInputStream(inputStream);
            } catch (Throwable th) {
                th = th;
            }
        } catch (FileNotFoundException e2) {
        } catch (IOException e3) {
            e = e3;
        }
        try {
            int version = input.readInt();
            if (version != 1) {
                if (input != null) {
                    Util.closeQuietly(input);
                }
                return false;
            }
            int flags = input.readInt();
            if ((flags & 1) == 0) {
                if (this.cipher != null) {
                    this.changed = true;
                }
                input2 = input;
            } else if (this.cipher == null) {
                if (input != null) {
                    Util.closeQuietly(input);
                }
                return false;
            } else {
                byte[] initializationVector = new byte[16];
                input.readFully(initializationVector);
                IvParameterSpec ivParameterSpec = new IvParameterSpec(initializationVector);
                try {
                    this.cipher.init(2, this.secretKeySpec, ivParameterSpec);
                    input2 = new DataInputStream(new CipherInputStream(inputStream, this.cipher));
                } catch (InvalidAlgorithmParameterException e4) {
                    e = e4;
                    throw new IllegalStateException(e);
                } catch (InvalidKeyException e5) {
                    e = e5;
                    throw new IllegalStateException(e);
                }
            }
            int count = input2.readInt();
            int hashCode = 0;
            for (int i = 0; i < count; i++) {
                CachedContent cachedContent = new CachedContent(input2);
                add(cachedContent);
                hashCode += cachedContent.headerHashCode();
            }
            if (input2.readInt() == hashCode) {
                if (input2 != null) {
                    Util.closeQuietly(input2);
                }
                return true;
            } else if (input2 == null) {
                return false;
            } else {
                Util.closeQuietly(input2);
                return false;
            }
        } catch (FileNotFoundException e6) {
            input2 = input;
            if (input2 == null) {
                return false;
            }
            Util.closeQuietly(input2);
            return false;
        } catch (IOException e7) {
            e = e7;
            input2 = input;
            Log.e(TAG, "Error reading cache content index file.", e);
            if (input2 == null) {
                return false;
            }
            Util.closeQuietly(input2);
            return false;
        } catch (Throwable th2) {
            th = th2;
            input2 = input;
            if (input2 != null) {
                Util.closeQuietly(input2);
            }
            throw th;
        }
    }

    private void writeFile() throws Cache.CacheException {
        DataOutputStream output;
        GeneralSecurityException e;
        int flags = 1;
        DataOutputStream output2 = null;
        try {
            try {
                OutputStream outputStream = this.atomicFile.startWrite();
                if (this.bufferedOutputStream == null) {
                    this.bufferedOutputStream = new ReusableBufferedOutputStream(outputStream);
                } else {
                    this.bufferedOutputStream.reset(outputStream);
                }
                output = new DataOutputStream(this.bufferedOutputStream);
            } catch (IOException e2) {
                e = e2;
            }
        } catch (Throwable th) {
            th = th;
        }
        try {
            output.writeInt(1);
            if (this.cipher == null) {
                flags = 0;
            }
            output.writeInt(flags);
            if (this.cipher != null) {
                byte[] initializationVector = new byte[16];
                new Random().nextBytes(initializationVector);
                output.write(initializationVector);
                IvParameterSpec ivParameterSpec = new IvParameterSpec(initializationVector);
                try {
                    this.cipher.init(1, this.secretKeySpec, ivParameterSpec);
                    output.flush();
                    output2 = new DataOutputStream(new CipherOutputStream(this.bufferedOutputStream, this.cipher));
                } catch (InvalidAlgorithmParameterException e3) {
                    e = e3;
                    throw new IllegalStateException(e);
                } catch (InvalidKeyException e4) {
                    e = e4;
                    throw new IllegalStateException(e);
                }
            } else {
                output2 = output;
            }
            output2.writeInt(this.keyToContent.size());
            int hashCode = 0;
            for (CachedContent cachedContent : this.keyToContent.values()) {
                cachedContent.writeToStream(output2);
                hashCode += cachedContent.headerHashCode();
            }
            output2.writeInt(hashCode);
            this.atomicFile.endWrite(output2);
            Util.closeQuietly((Closeable) null);
        } catch (IOException e5) {
            e = e5;
            output2 = output;
            throw new Cache.CacheException(e);
        } catch (Throwable th2) {
            th = th2;
            output2 = output;
            Util.closeQuietly(output2);
            throw th;
        }
    }

    private void add(CachedContent cachedContent) {
        this.keyToContent.put(cachedContent.key, cachedContent);
        this.idToKey.put(cachedContent.id, cachedContent.key);
    }

    void addNew(CachedContent cachedContent) {
        add(cachedContent);
        this.changed = true;
    }

    private CachedContent addNew(String key, long length) {
        int id = getNewId(this.idToKey);
        CachedContent cachedContent = new CachedContent(id, key, length);
        addNew(cachedContent);
        return cachedContent;
    }

    public static int getNewId(SparseArray<String> idToKey) {
        int size = idToKey.size();
        int id = size == 0 ? 0 : idToKey.keyAt(size - 1) + 1;
        if (id < 0) {
            id = 0;
            while (id < size && id == idToKey.keyAt(id)) {
                id++;
            }
        }
        return id;
    }
}
