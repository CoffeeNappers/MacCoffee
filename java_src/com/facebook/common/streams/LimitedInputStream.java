package com.facebook.common.streams;

import java.io.FilterInputStream;
import java.io.IOException;
import java.io.InputStream;
/* loaded from: classes.dex */
public class LimitedInputStream extends FilterInputStream {
    private int mBytesToRead;
    private int mBytesToReadWhenMarked;

    public LimitedInputStream(InputStream inputStream, int limit) {
        super(inputStream);
        if (inputStream == null) {
            throw new NullPointerException();
        }
        if (limit < 0) {
            throw new IllegalArgumentException("limit must be >= 0");
        }
        this.mBytesToRead = limit;
        this.mBytesToReadWhenMarked = -1;
    }

    @Override // java.io.FilterInputStream, java.io.InputStream
    public int read() throws IOException {
        if (this.mBytesToRead == 0) {
            return -1;
        }
        int readByte = this.in.read();
        if (readByte != -1) {
            this.mBytesToRead--;
            return readByte;
        }
        return readByte;
    }

    @Override // java.io.FilterInputStream, java.io.InputStream
    public int read(byte[] buffer, int byteOffset, int byteCount) throws IOException {
        if (this.mBytesToRead == 0) {
            return -1;
        }
        int maxBytesToRead = Math.min(byteCount, this.mBytesToRead);
        int bytesRead = this.in.read(buffer, byteOffset, maxBytesToRead);
        if (bytesRead > 0) {
            this.mBytesToRead -= bytesRead;
            return bytesRead;
        }
        return bytesRead;
    }

    @Override // java.io.FilterInputStream, java.io.InputStream
    public long skip(long byteCount) throws IOException {
        long maxBytesToSkip = Math.min(byteCount, this.mBytesToRead);
        long bytesSkipped = this.in.skip(maxBytesToSkip);
        this.mBytesToRead = (int) (this.mBytesToRead - bytesSkipped);
        return bytesSkipped;
    }

    @Override // java.io.FilterInputStream, java.io.InputStream
    public int available() throws IOException {
        return Math.min(this.in.available(), this.mBytesToRead);
    }

    @Override // java.io.FilterInputStream, java.io.InputStream
    public void mark(int readLimit) {
        if (this.in.markSupported()) {
            this.in.mark(readLimit);
            this.mBytesToReadWhenMarked = this.mBytesToRead;
        }
    }

    @Override // java.io.FilterInputStream, java.io.InputStream
    public void reset() throws IOException {
        if (!this.in.markSupported()) {
            throw new IOException("mark is not supported");
        }
        if (this.mBytesToReadWhenMarked == -1) {
            throw new IOException("mark not set");
        }
        this.in.reset();
        this.mBytesToRead = this.mBytesToReadWhenMarked;
    }
}
