package com.vkontakte.android.cache;

import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import com.vkontakte.android.utils.Utils;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.EOFException;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.Map;
/* loaded from: classes2.dex */
public class FileLruCache {
    final Map<String, Entry> mJournalEntries = new HashMap();
    final File mJournalFile;
    final long mMaxSize;
    final File mRootPath;
    int total;

    public FileLruCache(File path, long maxSize) throws IOException {
        this.mMaxSize = maxSize;
        this.mRootPath = path;
        if (!this.mRootPath.exists() && !this.mRootPath.mkdirs()) {
            throw new IOException("Unable to create path directory");
        }
        this.mJournalFile = new File(this.mRootPath, "lru_cache.journal");
        if (!this.mJournalFile.exists() && !this.mJournalFile.createNewFile()) {
            throw new IOException("Unable to create cache journal");
        }
        readJournal();
    }

    @Nullable
    public final synchronized Entry get(String key) throws IOException {
        Entry entry;
        entry = this.mJournalEntries.get(convertKey(key));
        if (entry != null) {
            entry.lastRecentlyUsed = System.currentTimeMillis();
            updateJournal();
        }
        return entry;
    }

    @NonNull
    public final synchronized Editor insert(String key) throws IOException {
        return new Editor(convertKey(key));
    }

    public final synchronized boolean contains(String key) {
        return this.mJournalEntries.get(convertKey(key)) != null;
    }

    final synchronized void readJournal() throws IOException {
        DataInputStream is;
        DataInputStream is2 = null;
        try {
            this.total = 0;
            this.mJournalEntries.clear();
            try {
                is = new DataInputStream(new FileInputStream(this.mJournalFile));
            } catch (EOFException e) {
            } catch (Throwable th) {
                th = th;
            }
            try {
                int entriesCount = is.readInt();
                if (entriesCount > 0) {
                    for (int i = 0; i < entriesCount; i++) {
                        Entry entry = new Entry(is.readUTF(), is.readLong(), is.readLong());
                        this.mJournalEntries.put(entry.key, entry);
                        this.total = (int) (this.total + entry.size);
                    }
                }
                try {
                    Utils.closeSilently(is);
                } catch (Throwable th2) {
                    th = th2;
                    throw th;
                }
            } catch (EOFException e2) {
                is2 = is;
                Utils.closeSilently(is2);
            } catch (Throwable th3) {
                th = th3;
                is2 = is;
                Utils.closeSilently(is2);
                throw th;
            }
        } catch (Throwable th4) {
            th = th4;
        }
    }

    final synchronized void updateJournal() throws IOException {
        DataOutputStream out;
        DataOutputStream out2 = null;
        try {
            out = new DataOutputStream(new FileOutputStream(this.mJournalFile));
        } catch (Throwable th) {
            th = th;
        }
        try {
            out.writeInt(this.mJournalEntries.size());
            for (Entry entry : this.mJournalEntries.values()) {
                out.writeUTF(entry.key);
                out.writeLong(entry.size);
                out.writeLong(entry.lastRecentlyUsed);
            }
            try {
                Utils.closeSilently(out);
            } catch (Throwable th2) {
                th = th2;
                throw th;
            }
        } catch (Throwable th3) {
            th = th3;
            out2 = out;
            try {
                Utils.closeSilently(out2);
                throw th;
            } catch (Throwable th4) {
                th = th4;
                throw th;
            }
        }
    }

    final synchronized void trim(Entry exclude) throws IOException {
        while (this.total > this.mMaxSize) {
            Entry lastUsedEntry = null;
            for (Entry entry : this.mJournalEntries.values()) {
                if (lastUsedEntry == null || entry.lastRecentlyUsed < lastUsedEntry.lastRecentlyUsed) {
                    if (entry != exclude) {
                        lastUsedEntry = entry;
                    }
                }
            }
            if (lastUsedEntry != null) {
                if (!lastUsedEntry.file.delete()) {
                    throw new IOException("Unable to delete unused file");
                }
                this.mJournalEntries.remove(lastUsedEntry.key);
                this.total = (int) (this.total - lastUsedEntry.size);
            }
        }
        updateJournal();
    }

    final synchronized Entry addEntry(Editor editor, long lastRecentlyUsed) throws IOException {
        Entry entry;
        entry = new Entry(editor.key, editor.file.length(), lastRecentlyUsed);
        this.mJournalEntries.put(editor.key, entry);
        this.total = (int) (this.total + entry.size);
        trim(entry);
        return entry;
    }

    /* loaded from: classes2.dex */
    public final class Editor {
        public final File file;
        public final String key;

        Editor(String key) throws IOException {
            this.key = key;
            this.file = new File(FileLruCache.this.mRootPath, key);
            if (!this.file.exists() && !this.file.createNewFile()) {
                throw new IOException("Unable to create file");
            }
        }

        public OutputStream getOutputStream() {
            try {
                return new FileOutputStream(this.file);
            } catch (FileNotFoundException e) {
                throw new RuntimeException("This should never happen!");
            }
        }

        public Entry commit() throws IOException {
            return FileLruCache.this.addEntry(this, System.currentTimeMillis());
        }
    }

    /* loaded from: classes2.dex */
    public final class Entry {
        public final File file;
        public final String key;
        long lastRecentlyUsed;
        public final long size;

        Entry(String key, long size, long lastRecentlyUsed) {
            this.key = key;
            this.file = new File(FileLruCache.this.mRootPath, key);
            this.size = size;
            this.lastRecentlyUsed = lastRecentlyUsed;
        }
    }

    protected String convertKey(String input) {
        return input;
    }
}
