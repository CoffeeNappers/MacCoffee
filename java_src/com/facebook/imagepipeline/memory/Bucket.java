package com.facebook.imagepipeline.memory;

import com.facebook.common.internal.Preconditions;
import com.facebook.common.internal.VisibleForTesting;
import java.util.LinkedList;
import java.util.Queue;
import javax.annotation.Nullable;
import javax.annotation.concurrent.NotThreadSafe;
@VisibleForTesting
@NotThreadSafe
/* loaded from: classes.dex */
class Bucket<V> {
    final Queue mFreeList;
    private int mInUseLength;
    public final int mItemSize;
    public final int mMaxLength;

    public Bucket(int itemSize, int maxLength, int inUseLength) {
        boolean z = true;
        Preconditions.checkState(itemSize > 0);
        Preconditions.checkState(maxLength >= 0);
        Preconditions.checkState(inUseLength < 0 ? false : z);
        this.mItemSize = itemSize;
        this.mMaxLength = maxLength;
        this.mFreeList = new LinkedList();
        this.mInUseLength = inUseLength;
    }

    public boolean isMaxLengthExceeded() {
        return this.mInUseLength + getFreeListSize() > this.mMaxLength;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public int getFreeListSize() {
        return this.mFreeList.size();
    }

    @Nullable
    public V get() {
        V value = pop();
        if (value != null) {
            this.mInUseLength++;
        }
        return value;
    }

    @Nullable
    public V pop() {
        return (V) this.mFreeList.poll();
    }

    public void incrementInUseCount() {
        this.mInUseLength++;
    }

    public void release(V value) {
        Preconditions.checkNotNull(value);
        Preconditions.checkState(this.mInUseLength > 0);
        this.mInUseLength--;
        addToFreeList(value);
    }

    void addToFreeList(V value) {
        this.mFreeList.add(value);
    }

    public void decrementInUseCount() {
        Preconditions.checkState(this.mInUseLength > 0);
        this.mInUseLength--;
    }

    public int getInUseCount() {
        return this.mInUseLength;
    }
}
