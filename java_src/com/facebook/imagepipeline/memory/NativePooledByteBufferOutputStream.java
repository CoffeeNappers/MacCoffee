package com.facebook.imagepipeline.memory;

import com.facebook.common.internal.Preconditions;
import com.facebook.common.internal.VisibleForTesting;
import com.facebook.common.references.CloseableReference;
import java.io.IOException;
import javax.annotation.concurrent.NotThreadSafe;
@NotThreadSafe
/* loaded from: classes.dex */
public class NativePooledByteBufferOutputStream extends PooledByteBufferOutputStream {
    private CloseableReference<NativeMemoryChunk> mBufRef;
    private int mCount;
    private final NativeMemoryChunkPool mPool;

    public NativePooledByteBufferOutputStream(NativeMemoryChunkPool pool) {
        this(pool, pool.getMinBufferSize());
    }

    public NativePooledByteBufferOutputStream(NativeMemoryChunkPool pool, int initialCapacity) {
        Preconditions.checkArgument(initialCapacity > 0);
        this.mPool = (NativeMemoryChunkPool) Preconditions.checkNotNull(pool);
        this.mCount = 0;
        this.mBufRef = CloseableReference.of(this.mPool.get(initialCapacity), this.mPool);
    }

    @Override // com.facebook.imagepipeline.memory.PooledByteBufferOutputStream
    /* renamed from: toByteBuffer */
    public NativePooledByteBuffer mo236toByteBuffer() {
        ensureValid();
        return new NativePooledByteBuffer(this.mBufRef, this.mCount);
    }

    @Override // com.facebook.imagepipeline.memory.PooledByteBufferOutputStream
    public int size() {
        return this.mCount;
    }

    @Override // java.io.OutputStream
    public void write(int oneByte) throws IOException {
        byte[] buf = {(byte) oneByte};
        write(buf);
    }

    @Override // java.io.OutputStream
    public void write(byte[] buffer, int offset, int count) throws IOException {
        if (offset < 0 || count < 0 || offset + count > buffer.length) {
            throw new ArrayIndexOutOfBoundsException("length=" + buffer.length + "; regionStart=" + offset + "; regionLength=" + count);
        }
        ensureValid();
        realloc(this.mCount + count);
        this.mBufRef.get().write(this.mCount, buffer, offset, count);
        this.mCount += count;
    }

    @Override // com.facebook.imagepipeline.memory.PooledByteBufferOutputStream, java.io.OutputStream, java.io.Closeable, java.lang.AutoCloseable
    public void close() {
        CloseableReference.closeSafely(this.mBufRef);
        this.mBufRef = null;
        this.mCount = -1;
        super.close();
    }

    @VisibleForTesting
    void realloc(int newLength) {
        ensureValid();
        if (newLength > this.mBufRef.get().getSize()) {
            NativeMemoryChunk newbuf = this.mPool.get(newLength);
            this.mBufRef.get().copy(0, newbuf, 0, this.mCount);
            this.mBufRef.close();
            this.mBufRef = CloseableReference.of(newbuf, this.mPool);
        }
    }

    private void ensureValid() {
        if (!CloseableReference.isValid(this.mBufRef)) {
            throw new InvalidStreamException();
        }
    }

    /* loaded from: classes.dex */
    public static class InvalidStreamException extends RuntimeException {
        public InvalidStreamException() {
            super("OutputStream no longer valid");
        }
    }
}
