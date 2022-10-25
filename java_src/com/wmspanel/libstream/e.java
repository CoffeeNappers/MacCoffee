package com.wmspanel.libstream;

import android.support.v4.media.TransportMediator;
import com.google.android.exoplayer2.extractor.ts.PsExtractor;
/* loaded from: classes3.dex */
class e {
    static final int[] V = {255, TransportMediator.KEYCODE_MEDIA_PAUSE, 63, 31, 15, 7, 3, 1};
    static final int[] W = {0, 128, 192, 224, PsExtractor.VIDEO_STREAM_MASK, 248, 252, 254, 255};
    byte[] R;
    int S;
    int T = 0;
    int U = 0;

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes3.dex */
    public static class a extends Exception {
        a() {
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public e(byte[] bArr, int i) {
        this.R = bArr;
        this.S = i;
    }

    void b(int i) {
        this.T += i / 8;
        this.U += i % 8;
        this.T += this.U / 8;
        this.U %= 8;
    }

    boolean c(int i) {
        boolean z = true;
        if (i <= 0) {
            return false;
        }
        int i2 = this.T + (i / 8);
        int i3 = this.U + (i % 8);
        int i4 = i2 + (i3 / 8);
        int i5 = i3 % 8;
        if (i4 > this.S) {
            return false;
        }
        if (i4 < this.S) {
            return true;
        }
        if (this.U != 0) {
            z = false;
        }
        return z;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public int A() throws a {
        if (!c(8)) {
            throw new a();
        }
        byte b = this.R[this.T];
        if (this.U != 0) {
            int i = (b & V[this.U]) << this.U;
            int i2 = (this.R[this.T + 1] & W[this.U]) >> (8 - this.U);
            this.T++;
            return i | i2;
        }
        this.T++;
        return b;
    }

    int d(int i) throws a {
        if (!c(i)) {
            throw new a();
        }
        byte b = this.R[this.T];
        if (this.U != 0) {
            if (i > 8 - this.U) {
                int i2 = i - (8 - this.U);
                int i3 = ((b & V[this.U]) << i2) + ((this.R[this.T + 1] & W[i2]) >> (8 - i2));
                b(i);
                return i3;
            }
            int i4 = ((b & V[this.U]) & W[this.U + i]) >> ((8 - this.U) - i);
            b(i);
            return i4;
        }
        int i5 = (b & W[i]) >> (8 - i);
        b(i);
        return i5;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public int B() throws a {
        if (!c(1)) {
            throw new a();
        }
        int i = (this.R[this.T] >> (7 - this.U)) & 1;
        b(1);
        return i;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public int C() throws a {
        int i = 0;
        int B = B();
        int i2 = 0;
        while (B == 0 && i2 <= 31) {
            B = B();
            i2++;
        }
        if (B == 0 || i2 > 31) {
            throw new a();
        }
        int i3 = i2;
        while (i3 >= 8) {
            int A = (A() << (i3 - 8)) + i;
            i3 -= 8;
            i = A;
        }
        if (i3 > 0) {
            i += d(i3);
        }
        return (i + (1 << i2)) - 1;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public int D() throws a {
        int C = C();
        if (C == 0) {
            return 0;
        }
        int i = C / 2;
        if ((C & 1) == 0) {
            return -i;
        }
        return i + 1;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void skip(int skip) throws a {
        if (!c(skip)) {
            throw new a();
        }
        b(skip);
    }
}
