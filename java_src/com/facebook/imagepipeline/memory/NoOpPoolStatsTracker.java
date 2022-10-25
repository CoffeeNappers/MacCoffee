package com.facebook.imagepipeline.memory;
/* loaded from: classes.dex */
public class NoOpPoolStatsTracker implements PoolStatsTracker {
    private static NoOpPoolStatsTracker sInstance = null;

    private NoOpPoolStatsTracker() {
    }

    public static synchronized NoOpPoolStatsTracker getInstance() {
        NoOpPoolStatsTracker noOpPoolStatsTracker;
        synchronized (NoOpPoolStatsTracker.class) {
            if (sInstance == null) {
                sInstance = new NoOpPoolStatsTracker();
            }
            noOpPoolStatsTracker = sInstance;
        }
        return noOpPoolStatsTracker;
    }

    @Override // com.facebook.imagepipeline.memory.PoolStatsTracker
    public void setBasePool(BasePool basePool) {
    }

    @Override // com.facebook.imagepipeline.memory.PoolStatsTracker
    public void onValueReuse(int bucketedSize) {
    }

    @Override // com.facebook.imagepipeline.memory.PoolStatsTracker
    public void onSoftCapReached() {
    }

    @Override // com.facebook.imagepipeline.memory.PoolStatsTracker
    public void onHardCapReached() {
    }

    @Override // com.facebook.imagepipeline.memory.PoolStatsTracker
    public void onAlloc(int size) {
    }

    @Override // com.facebook.imagepipeline.memory.PoolStatsTracker
    public void onFree(int sizeInBytes) {
    }

    @Override // com.facebook.imagepipeline.memory.PoolStatsTracker
    public void onValueRelease(int sizeInBytes) {
    }
}
