package com.facebook.imagepipeline.memory;

import com.facebook.common.internal.Preconditions;
import com.facebook.common.internal.Throwables;
import com.facebook.common.internal.VisibleForTesting;
import com.facebook.common.memory.MemoryTrimType;
import com.facebook.common.memory.MemoryTrimmable;
import com.facebook.common.memory.MemoryTrimmableRegistry;
import com.facebook.common.references.CloseableReference;
import com.facebook.common.references.OOMSoftReference;
import com.facebook.common.references.ResourceReleaser;
import java.util.concurrent.Semaphore;
import javax.annotation.concurrent.ThreadSafe;
@ThreadSafe
/* loaded from: classes.dex */
public class SharedByteArray implements MemoryTrimmable {
    @VisibleForTesting
    final OOMSoftReference<byte[]> mByteArraySoftRef;
    @VisibleForTesting
    final int mMaxByteArraySize;
    @VisibleForTesting
    final int mMinByteArraySize;
    private final ResourceReleaser<byte[]> mResourceReleaser;
    @VisibleForTesting
    final Semaphore mSemaphore;

    public SharedByteArray(MemoryTrimmableRegistry memoryTrimmableRegistry, PoolParams params) {
        boolean z = false;
        Preconditions.checkNotNull(memoryTrimmableRegistry);
        Preconditions.checkArgument(params.minBucketSize > 0);
        Preconditions.checkArgument(params.maxBucketSize >= params.minBucketSize ? true : z);
        this.mMaxByteArraySize = params.maxBucketSize;
        this.mMinByteArraySize = params.minBucketSize;
        this.mByteArraySoftRef = new OOMSoftReference<>();
        this.mSemaphore = new Semaphore(1);
        this.mResourceReleaser = new ResourceReleaser<byte[]>() { // from class: com.facebook.imagepipeline.memory.SharedByteArray.1
            @Override // com.facebook.common.references.ResourceReleaser
            public void release(byte[] unused) {
                SharedByteArray.this.mSemaphore.release();
            }
        };
        memoryTrimmableRegistry.registerMemoryTrimmable(this);
    }

    public CloseableReference<byte[]> get(int size) {
        boolean z = true;
        Preconditions.checkArgument(size > 0, "Size must be greater than zero");
        if (size > this.mMaxByteArraySize) {
            z = false;
        }
        Preconditions.checkArgument(z, "Requested size is too big");
        this.mSemaphore.acquireUninterruptibly();
        try {
            byte[] byteArray = getByteArray(size);
            return CloseableReference.of(byteArray, this.mResourceReleaser);
        } catch (Throwable t) {
            this.mSemaphore.release();
            throw Throwables.propagate(t);
        }
    }

    private byte[] getByteArray(int requestedSize) {
        int bucketedSize = getBucketedSize(requestedSize);
        byte[] byteArray = this.mByteArraySoftRef.get();
        if (byteArray == null || byteArray.length < bucketedSize) {
            return allocateByteArray(bucketedSize);
        }
        return byteArray;
    }

    @Override // com.facebook.common.memory.MemoryTrimmable
    public void trim(MemoryTrimType trimType) {
        if (this.mSemaphore.tryAcquire()) {
            try {
                this.mByteArraySoftRef.clear();
            } finally {
                this.mSemaphore.release();
            }
        }
    }

    @VisibleForTesting
    int getBucketedSize(int size) {
        return Integer.highestOneBit(Math.max(size, this.mMinByteArraySize) - 1) * 2;
    }

    private synchronized byte[] allocateByteArray(int size) {
        byte[] byteArray;
        this.mByteArraySoftRef.clear();
        byteArray = new byte[size];
        this.mByteArraySoftRef.set(byteArray);
        return byteArray;
    }
}
