package com.facebook.common.streams;

import java.io.FilterInputStream;
import java.io.IOException;
import java.io.InputStream;
/* loaded from: classes.dex */
public class TailAppendingInputStream extends FilterInputStream {
    private int mMarkedTailOffset;
    private final byte[] mTail;
    private int mTailOffset;

    public TailAppendingInputStream(InputStream inputStream, byte[] tail) {
        super(inputStream);
        if (inputStream == null) {
            throw new NullPointerException();
        }
        if (tail == null) {
            throw new NullPointerException();
        }
        this.mTail = tail;
    }

    @Override // java.io.FilterInputStream, java.io.InputStream
    public int read() throws IOException {
        int readResult = this.in.read();
        return readResult != -1 ? readResult : readNextTailByte();
    }

    @Override // java.io.FilterInputStream, java.io.InputStream
    public int read(byte[] buffer) throws IOException {
        return read(buffer, 0, buffer.length);
    }

    @Override // java.io.FilterInputStream, java.io.InputStream
    public int read(byte[] buffer, int offset, int count) throws IOException {
        int readResult = this.in.read(buffer, offset, count);
        if (readResult == -1) {
            if (count == 0) {
                return 0;
            }
            int bytesRead = 0;
            while (bytesRead < count) {
                int nextByte = readNextTailByte();
                if (nextByte == -1) {
                    break;
                }
                buffer[offset + bytesRead] = (byte) nextByte;
                bytesRead++;
            }
            if (bytesRead <= 0) {
                bytesRead = -1;
            }
            return bytesRead;
        }
        return readResult;
    }

    @Override // java.io.FilterInputStream, java.io.InputStream
    public void reset() throws IOException {
        if (this.in.markSupported()) {
            this.in.reset();
            this.mTailOffset = this.mMarkedTailOffset;
            return;
        }
        throw new IOException("mark is not supported");
    }

    @Override // java.io.FilterInputStream, java.io.InputStream
    public void mark(int readLimit) {
        if (this.in.markSupported()) {
            super.mark(readLimit);
            this.mMarkedTailOffset = this.mTailOffset;
        }
    }

    private int readNextTailByte() {
        if (this.mTailOffset >= this.mTail.length) {
            return -1;
        }
        byte[] bArr = this.mTail;
        int i = this.mTailOffset;
        this.mTailOffset = i + 1;
        return bArr[i] & 255;
    }
}
