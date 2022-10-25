package com.googlecode.mp4parser.h264.write;

import com.googlecode.mp4parser.h264.Debug;
import java.io.IOException;
import java.io.OutputStream;
/* loaded from: classes2.dex */
public class CAVLCWriter extends BitstreamWriter {
    public CAVLCWriter(OutputStream out) {
        super(out);
    }

    public void writeU(int value, int n, String string) throws IOException {
        Debug.print(String.valueOf(string) + "\t");
        writeNBit(value, n);
        Debug.println("\t" + value);
    }

    public void writeUE(int value) throws IOException {
        int bits = 0;
        int cumul = 0;
        int i = 0;
        while (true) {
            if (i >= 15) {
                break;
            } else if (value < (1 << i) + cumul) {
                bits = i;
                break;
            } else {
                cumul += 1 << i;
                i++;
            }
        }
        writeNBit(0L, bits);
        write1Bit(1);
        writeNBit(value - cumul, bits);
    }

    public void writeUE(int value, String string) throws IOException {
        Debug.print(String.valueOf(string) + "\t");
        writeUE(value);
        Debug.println("\t" + value);
    }

    public void writeSE(int value, String string) throws IOException {
        int i = 1;
        Debug.print(String.valueOf(string) + "\t");
        int i2 = (value < 0 ? -1 : 1) * (value << 1);
        if (value <= 0) {
            i = 0;
        }
        writeUE(i + i2);
        Debug.println("\t" + value);
    }

    public void writeBool(boolean value, String string) throws IOException {
        Debug.print(String.valueOf(string) + "\t");
        write1Bit(value ? 1 : 0);
        Debug.println("\t" + value);
    }

    public void writeU(int i, int n) throws IOException {
        writeNBit(i, n);
    }

    public void writeNBit(long value, int n, String string) throws IOException {
        Debug.print(String.valueOf(string) + "\t");
        for (int i = 0; i < n; i++) {
            write1Bit(((int) (value >> ((n - i) - 1))) & 1);
        }
        Debug.println("\t" + value);
    }

    public void writeTrailingBits() throws IOException {
        write1Bit(1);
        writeRemainingZero();
        flush();
    }

    public void writeSliceTrailingBits() {
        throw new IllegalStateException("todo");
    }
}
