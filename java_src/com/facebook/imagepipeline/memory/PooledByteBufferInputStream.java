package com.facebook.imagepipeline.memory;

import com.facebook.common.internal.Preconditions;
import com.facebook.common.internal.VisibleForTesting;
import java.io.InputStream;
import javax.annotation.concurrent.NotThreadSafe;
@NotThreadSafe
/* loaded from: classes.dex */
public class PooledByteBufferInputStream extends InputStream {
    @VisibleForTesting
    int mMark;
    @VisibleForTesting
    int mOffset;
    @VisibleForTesting
    final PooledByteBuffer mPooledByteBuffer;

    public PooledByteBufferInputStream(PooledByteBuffer pooledByteBuffer) {
        Preconditions.checkArgument(!pooledByteBuffer.isClosed());
        this.mPooledByteBuffer = (PooledByteBuffer) Preconditions.checkNotNull(pooledByteBuffer);
        this.mOffset = 0;
        this.mMark = 0;
    }

    @Override // java.io.InputStream
    public int available() {
        return this.mPooledByteBuffer.size() - this.mOffset;
    }

    @Override // java.io.InputStream
    public void mark(int readlimit) {
        this.mMark = this.mOffset;
    }

    @Override // java.io.InputStream
    public boolean markSupported() {
        return true;
    }

    @Override // java.io.InputStream
    public int read() {
        if (available() <= 0) {
            return -1;
        }
        PooledByteBuffer pooledByteBuffer = this.mPooledByteBuffer;
        int i = this.mOffset;
        this.mOffset = i + 1;
        return pooledByteBuffer.read(i) & 255;
    }

    @Override // java.io.InputStream
    public int read(byte[] buffer) {
        return read(buffer, 0, buffer.length);
    }

    @Override // java.io.InputStream
    public int read(byte[] buffer, int offset, int length) {
        if (offset < 0 || length < 0 || offset + length > buffer.length) {
            throw new ArrayIndexOutOfBoundsException("length=" + buffer.length + "; regionStart=" + offset + "; regionLength=" + length);
        }
        int available = available();
        if (available <= 0) {
            return -1;
        }
        if (length <= 0) {
            return 0;
        }
        int numToRead = Math.min(available, length);
        this.mPooledByteBuffer.read(this.mOffset, buffer, offset, numToRead);
        this.mOffset += numToRead;
        return numToRead;
    }

    @Override // java.io.InputStream
    public void reset() {
        this.mOffset = this.mMark;
    }

    @Override // java.io.InputStream
    public long skip(long byteCount) {
        Preconditions.checkArgument(byteCount >= 0);
        int skipped = Math.min((int) byteCount, available());
        this.mOffset += skipped;
        return skipped;
    }
}
