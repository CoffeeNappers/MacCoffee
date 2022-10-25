package com.googlecode.mp4parser.h264.read;

import com.googlecode.mp4parser.h264.CharCache;
import java.io.IOException;
import java.io.InputStream;
/* loaded from: classes2.dex */
public class BitstreamReader {
    protected static int bitsRead;
    private int curByte;
    protected CharCache debugBits = new CharCache(50);
    private InputStream is;
    int nBit;
    private int nextByte;

    public BitstreamReader(InputStream is) throws IOException {
        this.is = is;
        this.curByte = is.read();
        this.nextByte = is.read();
    }

    public boolean readBool() throws IOException {
        return read1Bit() == 1;
    }

    /* JADX WARN: Code restructure failed: missing block: B:5:0x000c, code lost:
        if (r3.curByte == (-1)) goto L5;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public int read1Bit() throws java.io.IOException {
        /*
            r3 = this;
            r0 = -1
            int r1 = r3.nBit
            r2 = 8
            if (r1 != r2) goto Lf
            r3.advance()
            int r1 = r3.curByte
            if (r1 != r0) goto Lf
        Le:
            return r0
        Lf:
            int r1 = r3.curByte
            int r2 = r3.nBit
            int r2 = 7 - r2
            int r1 = r1 >> r2
            r0 = r1 & 1
            int r1 = r3.nBit
            int r1 = r1 + 1
            r3.nBit = r1
            com.googlecode.mp4parser.h264.CharCache r2 = r3.debugBits
            if (r0 != 0) goto L2e
            r1 = 48
        L24:
            r2.append(r1)
            int r1 = com.googlecode.mp4parser.h264.read.BitstreamReader.bitsRead
            int r1 = r1 + 1
            com.googlecode.mp4parser.h264.read.BitstreamReader.bitsRead = r1
            goto Le
        L2e:
            r1 = 49
            goto L24
        */
        throw new UnsupportedOperationException("Method not decompiled: com.googlecode.mp4parser.h264.read.BitstreamReader.read1Bit():int");
    }

    public long readNBit(int n) throws IOException {
        if (n > 64) {
            throw new IllegalArgumentException("Can not readByte more then 64 bit");
        }
        long val = 0;
        for (int i = 0; i < n; i++) {
            val = (val << 1) | read1Bit();
        }
        return val;
    }

    private void advance() throws IOException {
        this.curByte = this.nextByte;
        this.nextByte = this.is.read();
        this.nBit = 0;
    }

    public int readByte() throws IOException {
        if (this.nBit > 0) {
            advance();
        }
        int res = this.curByte;
        advance();
        return res;
    }

    public boolean moreRBSPData() throws IOException {
        if (this.nBit == 8) {
            advance();
        }
        int tail = 1 << ((8 - this.nBit) - 1);
        int mask = (tail << 1) - 1;
        boolean hasTail = (this.curByte & mask) == tail;
        return this.curByte != -1 && (this.nextByte != -1 || !hasTail);
    }

    public long getBitPosition() {
        return (bitsRead * 8) + (this.nBit % 8);
    }

    public long readRemainingByte() throws IOException {
        return readNBit(8 - this.nBit);
    }

    /* JADX WARN: Code restructure failed: missing block: B:9:0x0017, code lost:
        if (r8.curByte == (-1)) goto L10;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public int peakNextBits(int r9) throws java.io.IOException {
        /*
            r8 = this;
            r4 = -1
            r7 = 8
            if (r9 <= r7) goto Le
            java.lang.IllegalArgumentException r5 = new java.lang.IllegalArgumentException
            java.lang.String r6 = "N should be less then 8"
            r5.<init>(r6)
            throw r5
        Le:
            int r5 = r8.nBit
            if (r5 != r7) goto L1a
            r8.advance()
            int r5 = r8.curByte
            if (r5 != r4) goto L1a
        L19:
            return r4
        L1a:
            int r5 = r8.nBit
            int r5 = 16 - r5
            int[] r0 = new int[r5]
            r1 = 0
            int r3 = r8.nBit
            r2 = r1
        L24:
            if (r3 < r7) goto L35
            r3 = 0
        L27:
            if (r3 < r7) goto L44
            r4 = 0
            r3 = 0
        L2b:
            if (r3 >= r9) goto L19
            int r4 = r4 << 1
            r5 = r0[r3]
            r4 = r4 | r5
            int r3 = r3 + 1
            goto L2b
        L35:
            int r1 = r2 + 1
            int r5 = r8.curByte
            int r6 = 7 - r3
            int r5 = r5 >> r6
            r5 = r5 & 1
            r0[r2] = r5
            int r3 = r3 + 1
            r2 = r1
            goto L24
        L44:
            int r1 = r2 + 1
            int r5 = r8.nextByte
            int r6 = 7 - r3
            int r5 = r5 >> r6
            r5 = r5 & 1
            r0[r2] = r5
            int r3 = r3 + 1
            r2 = r1
            goto L27
        */
        throw new UnsupportedOperationException("Method not decompiled: com.googlecode.mp4parser.h264.read.BitstreamReader.peakNextBits(int):int");
    }

    public boolean isByteAligned() {
        return this.nBit % 8 == 0;
    }

    public void close() throws IOException {
    }

    public int getCurBit() {
        return this.nBit;
    }
}
