package com.facebook.imagepipeline.cache;

import bolts.Task;
import com.facebook.binaryresource.BinaryResource;
import com.facebook.cache.common.CacheKey;
import com.facebook.cache.common.WriterCallback;
import com.facebook.cache.disk.FileCache;
import com.facebook.common.internal.Preconditions;
import com.facebook.common.logging.FLog;
import com.facebook.common.references.CloseableReference;
import com.facebook.imagepipeline.image.EncodedImage;
import com.facebook.imagepipeline.memory.PooledByteBuffer;
import com.facebook.imagepipeline.memory.PooledByteBufferFactory;
import com.facebook.imagepipeline.memory.PooledByteStreams;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.concurrent.Callable;
import java.util.concurrent.CancellationException;
import java.util.concurrent.Executor;
import java.util.concurrent.atomic.AtomicBoolean;
/* loaded from: classes.dex */
public class BufferedDiskCache {
    private static final Class<?> TAG = BufferedDiskCache.class;
    private final FileCache mFileCache;
    private final ImageCacheStatsTracker mImageCacheStatsTracker;
    private final PooledByteBufferFactory mPooledByteBufferFactory;
    private final PooledByteStreams mPooledByteStreams;
    private final Executor mReadExecutor;
    private final StagingArea mStagingArea = StagingArea.getInstance();
    private final Executor mWriteExecutor;

    public BufferedDiskCache(FileCache fileCache, PooledByteBufferFactory pooledByteBufferFactory, PooledByteStreams pooledByteStreams, Executor readExecutor, Executor writeExecutor, ImageCacheStatsTracker imageCacheStatsTracker) {
        this.mFileCache = fileCache;
        this.mPooledByteBufferFactory = pooledByteBufferFactory;
        this.mPooledByteStreams = pooledByteStreams;
        this.mReadExecutor = readExecutor;
        this.mWriteExecutor = writeExecutor;
        this.mImageCacheStatsTracker = imageCacheStatsTracker;
    }

    public boolean containsSync(CacheKey key) {
        return this.mStagingArea.containsKey(key) || this.mFileCache.hasKeySync(key);
    }

    public Task<Boolean> contains(CacheKey key) {
        return containsSync(key) ? Task.forResult(true) : containsAsync(key);
    }

    private Task<Boolean> containsAsync(final CacheKey key) {
        try {
            return Task.call(new Callable<Boolean>() { // from class: com.facebook.imagepipeline.cache.BufferedDiskCache.1
                /* JADX WARN: Can't rename method to resolve collision */
                @Override // java.util.concurrent.Callable
                /* renamed from: call */
                public Boolean mo213call() throws Exception {
                    return Boolean.valueOf(BufferedDiskCache.this.checkInStagingAreaAndFileCache(key));
                }
            }, this.mReadExecutor);
        } catch (Exception exception) {
            FLog.w(TAG, exception, "Failed to schedule disk-cache read for %s", key.getUriString());
            return Task.forError(exception);
        }
    }

    public boolean diskCheckSync(CacheKey key) {
        if (containsSync(key)) {
            return true;
        }
        return checkInStagingAreaAndFileCache(key);
    }

    public Task<EncodedImage> get(CacheKey key, AtomicBoolean isCancelled) {
        EncodedImage pinnedImage = this.mStagingArea.get(key);
        return pinnedImage != null ? foundPinnedImage(key, pinnedImage) : getAsync(key, isCancelled);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public boolean checkInStagingAreaAndFileCache(CacheKey key) {
        EncodedImage result = this.mStagingArea.get(key);
        if (result != null) {
            result.close();
            FLog.v(TAG, "Found image for %s in staging area", key.getUriString());
            this.mImageCacheStatsTracker.onStagingAreaHit(key);
            return true;
        }
        FLog.v(TAG, "Did not find image for %s in staging area", key.getUriString());
        this.mImageCacheStatsTracker.onStagingAreaMiss();
        try {
            return this.mFileCache.hasKey(key);
        } catch (Exception e) {
            return false;
        }
    }

    private Task<EncodedImage> getAsync(final CacheKey key, final AtomicBoolean isCancelled) {
        try {
            return Task.call(new Callable<EncodedImage>() { // from class: com.facebook.imagepipeline.cache.BufferedDiskCache.2
                /* JADX WARN: Can't rename method to resolve collision */
                @Override // java.util.concurrent.Callable
                /* renamed from: call */
                public EncodedImage mo214call() throws Exception {
                    if (!isCancelled.get()) {
                        EncodedImage result = BufferedDiskCache.this.mStagingArea.get(key);
                        if (result != null) {
                            FLog.v(BufferedDiskCache.TAG, "Found image for %s in staging area", key.getUriString());
                            BufferedDiskCache.this.mImageCacheStatsTracker.onStagingAreaHit(key);
                            result.setEncodedCacheKey(key);
                        } else {
                            FLog.v(BufferedDiskCache.TAG, "Did not find image for %s in staging area", key.getUriString());
                            BufferedDiskCache.this.mImageCacheStatsTracker.onStagingAreaMiss();
                            try {
                                PooledByteBuffer buffer = BufferedDiskCache.this.readFromDiskCache(key);
                                CloseableReference<PooledByteBuffer> ref = CloseableReference.of(buffer);
                                try {
                                    EncodedImage result2 = new EncodedImage(ref);
                                    try {
                                        result2.setEncodedCacheKey(key);
                                        try {
                                            CloseableReference.closeSafely(ref);
                                            result = result2;
                                        } catch (Exception e) {
                                            return null;
                                        }
                                    } catch (Throwable th) {
                                        th = th;
                                        CloseableReference.closeSafely(ref);
                                        throw th;
                                    }
                                } catch (Throwable th2) {
                                    th = th2;
                                }
                            } catch (Exception e2) {
                            }
                        }
                        if (!Thread.interrupted()) {
                            return result;
                        }
                        FLog.v(BufferedDiskCache.TAG, "Host thread was interrupted, decreasing reference count");
                        if (result != null) {
                            result.close();
                        }
                        throw new InterruptedException();
                    }
                    throw new CancellationException();
                }
            }, this.mReadExecutor);
        } catch (Exception exception) {
            FLog.w(TAG, exception, "Failed to schedule disk-cache read for %s", key.getUriString());
            return Task.forError(exception);
        }
    }

    public void put(final CacheKey key, EncodedImage encodedImage) {
        Preconditions.checkNotNull(key);
        Preconditions.checkArgument(EncodedImage.isValid(encodedImage));
        this.mStagingArea.put(key, encodedImage);
        encodedImage.setEncodedCacheKey(key);
        final EncodedImage finalEncodedImage = EncodedImage.cloneOrNull(encodedImage);
        try {
            this.mWriteExecutor.execute(new Runnable() { // from class: com.facebook.imagepipeline.cache.BufferedDiskCache.3
                @Override // java.lang.Runnable
                public void run() {
                    try {
                        BufferedDiskCache.this.writeToDiskCache(key, finalEncodedImage);
                    } finally {
                        BufferedDiskCache.this.mStagingArea.remove(key, finalEncodedImage);
                        EncodedImage.closeSafely(finalEncodedImage);
                    }
                }
            });
        } catch (Exception exception) {
            FLog.w(TAG, exception, "Failed to schedule disk-cache write for %s", key.getUriString());
            this.mStagingArea.remove(key, encodedImage);
            EncodedImage.closeSafely(finalEncodedImage);
        }
    }

    public Task<Void> remove(final CacheKey key) {
        Preconditions.checkNotNull(key);
        this.mStagingArea.remove(key);
        try {
            return Task.call(new Callable<Void>() { // from class: com.facebook.imagepipeline.cache.BufferedDiskCache.4
                @Override // java.util.concurrent.Callable
                public Void call() throws Exception {
                    BufferedDiskCache.this.mStagingArea.remove(key);
                    BufferedDiskCache.this.mFileCache.remove(key);
                    return null;
                }
            }, this.mWriteExecutor);
        } catch (Exception exception) {
            FLog.w(TAG, exception, "Failed to schedule disk-cache remove for %s", key.getUriString());
            return Task.forError(exception);
        }
    }

    public Task<Void> clearAll() {
        this.mStagingArea.clearAll();
        try {
            return Task.call(new Callable<Void>() { // from class: com.facebook.imagepipeline.cache.BufferedDiskCache.5
                @Override // java.util.concurrent.Callable
                public Void call() throws Exception {
                    BufferedDiskCache.this.mStagingArea.clearAll();
                    BufferedDiskCache.this.mFileCache.clearAll();
                    return null;
                }
            }, this.mWriteExecutor);
        } catch (Exception exception) {
            FLog.w(TAG, exception, "Failed to schedule disk-cache clear", new Object[0]);
            return Task.forError(exception);
        }
    }

    private Task<EncodedImage> foundPinnedImage(CacheKey key, EncodedImage pinnedImage) {
        FLog.v(TAG, "Found image for %s in staging area", key.getUriString());
        this.mImageCacheStatsTracker.onStagingAreaHit(key);
        return Task.forResult(pinnedImage);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public PooledByteBuffer readFromDiskCache(CacheKey key) throws IOException {
        try {
            FLog.v(TAG, "Disk cache read for %s", key.getUriString());
            BinaryResource diskCacheResource = this.mFileCache.getResource(key);
            if (diskCacheResource == null) {
                FLog.v(TAG, "Disk cache miss for %s", key.getUriString());
                this.mImageCacheStatsTracker.onDiskCacheMiss();
                return null;
            }
            FLog.v(TAG, "Found entry in disk cache for %s", key.getUriString());
            this.mImageCacheStatsTracker.onDiskCacheHit();
            InputStream is = diskCacheResource.openStream();
            PooledByteBuffer mo232newByteBuffer = this.mPooledByteBufferFactory.mo232newByteBuffer(is, (int) diskCacheResource.size());
            is.close();
            FLog.v(TAG, "Successful read from disk cache for %s", key.getUriString());
            return mo232newByteBuffer;
        } catch (IOException ioe) {
            FLog.w(TAG, ioe, "Exception reading from cache for %s", key.getUriString());
            this.mImageCacheStatsTracker.onDiskCacheGetFail();
            throw ioe;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void writeToDiskCache(CacheKey key, final EncodedImage encodedImage) {
        FLog.v(TAG, "About to write to disk-cache for key %s", key.getUriString());
        try {
            this.mFileCache.insert(key, new WriterCallback() { // from class: com.facebook.imagepipeline.cache.BufferedDiskCache.6
                @Override // com.facebook.cache.common.WriterCallback
                public void write(OutputStream os) throws IOException {
                    BufferedDiskCache.this.mPooledByteStreams.copy(encodedImage.getInputStream(), os);
                }
            });
            FLog.v(TAG, "Successful disk-cache write for key %s", key.getUriString());
        } catch (IOException ioe) {
            FLog.w(TAG, ioe, "Failed to write to disk-cache for key %s", key.getUriString());
        }
    }
}
