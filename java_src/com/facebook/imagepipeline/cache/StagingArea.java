package com.facebook.imagepipeline.cache;

import com.facebook.cache.common.CacheKey;
import com.facebook.common.internal.Preconditions;
import com.facebook.common.logging.FLog;
import com.facebook.common.references.CloseableReference;
import com.facebook.imagepipeline.image.EncodedImage;
import com.facebook.imagepipeline.memory.PooledByteBuffer;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.concurrent.GuardedBy;
/* loaded from: classes.dex */
public class StagingArea {
    private static final Class<?> TAG = StagingArea.class;
    @GuardedBy("this")
    private Map<CacheKey, EncodedImage> mMap = new HashMap();

    private StagingArea() {
    }

    public static StagingArea getInstance() {
        return new StagingArea();
    }

    public synchronized void put(CacheKey key, EncodedImage encodedImage) {
        Preconditions.checkNotNull(key);
        Preconditions.checkArgument(EncodedImage.isValid(encodedImage));
        EncodedImage oldEntry = this.mMap.put(key, EncodedImage.cloneOrNull(encodedImage));
        EncodedImage.closeSafely(oldEntry);
        logStats();
    }

    public void clearAll() {
        List<EncodedImage> old;
        synchronized (this) {
            old = new ArrayList<>(this.mMap.values());
            this.mMap.clear();
        }
        for (int i = 0; i < old.size(); i++) {
            EncodedImage encodedImage = old.get(i);
            if (encodedImage != null) {
                encodedImage.close();
            }
        }
    }

    public boolean remove(CacheKey key) {
        EncodedImage encodedImage;
        Preconditions.checkNotNull(key);
        synchronized (this) {
            encodedImage = this.mMap.remove(key);
        }
        if (encodedImage == null) {
            return false;
        }
        try {
            return encodedImage.isValid();
        } finally {
            encodedImage.close();
        }
    }

    public synchronized boolean remove(CacheKey key, EncodedImage encodedImage) {
        boolean z = false;
        synchronized (this) {
            Preconditions.checkNotNull(key);
            Preconditions.checkNotNull(encodedImage);
            Preconditions.checkArgument(EncodedImage.isValid(encodedImage));
            EncodedImage oldValue = this.mMap.get(key);
            if (oldValue != null) {
                CloseableReference<PooledByteBuffer> oldRef = oldValue.getByteBufferRef();
                CloseableReference<PooledByteBuffer> ref = encodedImage.getByteBufferRef();
                if (oldRef != null && ref != null && oldRef.get() == ref.get()) {
                    this.mMap.remove(key);
                    CloseableReference.closeSafely(ref);
                    CloseableReference.closeSafely(oldRef);
                    EncodedImage.closeSafely(oldValue);
                    logStats();
                    z = true;
                } else {
                    CloseableReference.closeSafely(ref);
                    CloseableReference.closeSafely(oldRef);
                    EncodedImage.closeSafely(oldValue);
                }
            }
        }
        return z;
    }

    public synchronized EncodedImage get(CacheKey key) {
        EncodedImage encodedImage;
        Preconditions.checkNotNull(key);
        EncodedImage storedEncodedImage = this.mMap.get(key);
        if (storedEncodedImage != null) {
            try {
                synchronized (storedEncodedImage) {
                    try {
                        if (!EncodedImage.isValid(storedEncodedImage)) {
                            this.mMap.remove(key);
                            FLog.w(TAG, "Found closed reference %d for key %s (%d)", Integer.valueOf(System.identityHashCode(storedEncodedImage)), key.getUriString(), Integer.valueOf(System.identityHashCode(key)));
                            encodedImage = null;
                        } else {
                            storedEncodedImage = EncodedImage.cloneOrNull(storedEncodedImage);
                        }
                    } catch (Throwable th) {
                        th = th;
                        throw th;
                    }
                }
            } catch (Throwable th2) {
                th = th2;
            }
        }
        encodedImage = storedEncodedImage;
        return encodedImage;
    }

    public synchronized boolean containsKey(CacheKey key) {
        boolean z = false;
        synchronized (this) {
            Preconditions.checkNotNull(key);
            if (this.mMap.containsKey(key)) {
                EncodedImage storedEncodedImage = this.mMap.get(key);
                synchronized (storedEncodedImage) {
                    if (!EncodedImage.isValid(storedEncodedImage)) {
                        this.mMap.remove(key);
                        FLog.w(TAG, "Found closed reference %d for key %s (%d)", Integer.valueOf(System.identityHashCode(storedEncodedImage)), key.getUriString(), Integer.valueOf(System.identityHashCode(key)));
                    } else {
                        z = true;
                    }
                }
            }
        }
        return z;
    }

    private synchronized void logStats() {
        FLog.v(TAG, "Count = %d", Integer.valueOf(this.mMap.size()));
    }
}
