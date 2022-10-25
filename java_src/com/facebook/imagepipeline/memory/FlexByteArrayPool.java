package com.facebook.imagepipeline.memory;

import com.facebook.common.internal.Preconditions;
import com.facebook.common.internal.VisibleForTesting;
import com.facebook.common.memory.MemoryTrimmableRegistry;
import com.facebook.common.references.CloseableReference;
import com.facebook.common.references.ResourceReleaser;
import java.util.Map;
import javax.annotation.concurrent.ThreadSafe;
@ThreadSafe
/* loaded from: classes.dex */
public class FlexByteArrayPool {
    @VisibleForTesting
    final SoftRefByteArrayPool mDelegatePool;
    private final ResourceReleaser<byte[]> mResourceReleaser;

    public FlexByteArrayPool(MemoryTrimmableRegistry memoryTrimmableRegistry, PoolParams params) {
        Preconditions.checkArgument(params.maxNumThreads > 0);
        this.mDelegatePool = new SoftRefByteArrayPool(memoryTrimmableRegistry, params, NoOpPoolStatsTracker.getInstance());
        this.mResourceReleaser = new ResourceReleaser<byte[]>() { // from class: com.facebook.imagepipeline.memory.FlexByteArrayPool.1
            @Override // com.facebook.common.references.ResourceReleaser
            public void release(byte[] unused) {
                FlexByteArrayPool.this.release(unused);
            }
        };
    }

    public CloseableReference<byte[]> get(int size) {
        return CloseableReference.of(this.mDelegatePool.get(size), this.mResourceReleaser);
    }

    public void release(byte[] value) {
        this.mDelegatePool.release(value);
    }

    public Map<String, Integer> getStats() {
        return this.mDelegatePool.getStats();
    }

    public int getMinBufferSize() {
        return this.mDelegatePool.getMinBufferSize();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    @VisibleForTesting
    /* loaded from: classes.dex */
    public static class SoftRefByteArrayPool extends GenericByteArrayPool {
        public SoftRefByteArrayPool(MemoryTrimmableRegistry memoryTrimmableRegistry, PoolParams poolParams, PoolStatsTracker poolStatsTracker) {
            super(memoryTrimmableRegistry, poolParams, poolStatsTracker);
        }

        @Override // com.facebook.imagepipeline.memory.BasePool
        Bucket<byte[]> newBucket(int bucketedSize) {
            return new OOMSoftReferenceBucket(getSizeInBytes(bucketedSize), this.mPoolParams.maxNumThreads, 0);
        }
    }
}
