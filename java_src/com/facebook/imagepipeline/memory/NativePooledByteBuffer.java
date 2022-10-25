package com.facebook.imagepipeline.memory;

import com.facebook.common.internal.Preconditions;
import com.facebook.common.internal.VisibleForTesting;
import com.facebook.common.references.CloseableReference;
import com.facebook.imagepipeline.memory.PooledByteBuffer;
import javax.annotation.concurrent.GuardedBy;
import javax.annotation.concurrent.ThreadSafe;
@ThreadSafe
/* loaded from: classes.dex */
public class NativePooledByteBuffer implements PooledByteBuffer {
    @VisibleForTesting
    @GuardedBy("this")
    CloseableReference<NativeMemoryChunk> mBufRef;
    private final int mSize;

    public NativePooledByteBuffer(CloseableReference<NativeMemoryChunk> bufRef, int size) {
        Preconditions.checkNotNull(bufRef);
        Preconditions.checkArgument(size >= 0 && size <= bufRef.get().getSize());
        this.mBufRef = bufRef.m198clone();
        this.mSize = size;
    }

    @Override // com.facebook.imagepipeline.memory.PooledByteBuffer
    public synchronized int size() {
        ensureValid();
        return this.mSize;
    }

    @Override // com.facebook.imagepipeline.memory.PooledByteBuffer
    public synchronized byte read(int offset) {
        byte read;
        boolean z = true;
        synchronized (this) {
            ensureValid();
            Preconditions.checkArgument(offset >= 0);
            if (offset >= this.mSize) {
                z = false;
            }
            Preconditions.checkArgument(z);
            read = this.mBufRef.get().read(offset);
        }
        return read;
    }

    @Override // com.facebook.imagepipeline.memory.PooledByteBuffer
    public synchronized void read(int offset, byte[] buffer, int bufferOffset, int length) {
        ensureValid();
        Preconditions.checkArgument(offset + length <= this.mSize);
        this.mBufRef.get().read(offset, buffer, bufferOffset, length);
    }

    @Override // com.facebook.imagepipeline.memory.PooledByteBuffer
    public synchronized long getNativePtr() {
        ensureValid();
        return this.mBufRef.get().getNativePtr();
    }

    @Override // com.facebook.imagepipeline.memory.PooledByteBuffer
    public synchronized boolean isClosed() {
        return !CloseableReference.isValid(this.mBufRef);
    }

    @Override // com.facebook.imagepipeline.memory.PooledByteBuffer, java.io.Closeable, java.lang.AutoCloseable
    public synchronized void close() {
        CloseableReference.closeSafely(this.mBufRef);
        this.mBufRef = null;
    }

    synchronized void ensureValid() {
        if (isClosed()) {
            throw new PooledByteBuffer.ClosedException();
        }
    }
}
