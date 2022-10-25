package com.google.android.exoplayer2.util;
/* loaded from: classes.dex */
public final class ParsableBitArray {
    private int bitOffset;
    private int byteLimit;
    private int byteOffset;
    public byte[] data;

    public ParsableBitArray() {
    }

    public ParsableBitArray(byte[] data) {
        this(data, data.length);
    }

    public ParsableBitArray(byte[] data, int limit) {
        this.data = data;
        this.byteLimit = limit;
    }

    public void reset(byte[] data) {
        reset(data, data.length);
    }

    public void reset(byte[] data, int limit) {
        this.data = data;
        this.byteOffset = 0;
        this.bitOffset = 0;
        this.byteLimit = limit;
    }

    public int bitsLeft() {
        return ((this.byteLimit - this.byteOffset) * 8) - this.bitOffset;
    }

    public int getPosition() {
        return (this.byteOffset * 8) + this.bitOffset;
    }

    public void setPosition(int position) {
        this.byteOffset = position / 8;
        this.bitOffset = position - (this.byteOffset * 8);
        assertValidOffset();
    }

    public void skipBits(int n) {
        this.byteOffset += n / 8;
        this.bitOffset += n % 8;
        if (this.bitOffset > 7) {
            this.byteOffset++;
            this.bitOffset -= 8;
        }
        assertValidOffset();
    }

    public boolean readBit() {
        return readBits(1) == 1;
    }

    public int readBits(int numBits) {
        int byteValue;
        if (numBits == 0) {
            return 0;
        }
        int returnValue = 0;
        int wholeBytes = numBits / 8;
        for (int i = 0; i < wholeBytes; i++) {
            if (this.bitOffset != 0) {
                byteValue = ((this.data[this.byteOffset] & 255) << this.bitOffset) | ((this.data[this.byteOffset + 1] & 255) >>> (8 - this.bitOffset));
            } else {
                byteValue = this.data[this.byteOffset];
            }
            numBits -= 8;
            returnValue |= (byteValue & 255) << numBits;
            this.byteOffset++;
        }
        if (numBits > 0) {
            int nextBit = this.bitOffset + numBits;
            byte writeMask = (byte) (255 >> (8 - numBits));
            if (nextBit > 8) {
                returnValue |= (((this.data[this.byteOffset] & 255) << (nextBit - 8)) | ((this.data[this.byteOffset + 1] & 255) >> (16 - nextBit))) & writeMask;
                this.byteOffset++;
            } else {
                returnValue |= ((this.data[this.byteOffset] & 255) >> (8 - nextBit)) & writeMask;
                if (nextBit == 8) {
                    this.byteOffset++;
                }
            }
            this.bitOffset = nextBit % 8;
        }
        assertValidOffset();
        return returnValue;
    }

    private void assertValidOffset() {
        Assertions.checkState(this.byteOffset >= 0 && this.bitOffset >= 0 && this.bitOffset < 8 && (this.byteOffset < this.byteLimit || (this.byteOffset == this.byteLimit && this.bitOffset == 0)));
    }
}