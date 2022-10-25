package com.wmspanel.libstream;

import com.vkontakte.android.media.audio.AudioMessageUtils;
import java.util.Arrays;
/* loaded from: classes3.dex */
class l {
    private static final String TAG = "RtspBuilder";
    private byte[] R;

    private l(byte[] bArr) {
        Arrays.fill(bArr, (byte) 0);
        this.R = bArr;
    }

    public static l e(byte[] bArr) {
        return new l(bArr);
    }

    public l a(int i, int i2) {
        this.R[0] = 36;
        this.R[1] = (byte) (i & 255);
        this.R[2] = (byte) ((i2 >> 8) & 255);
        this.R[3] = (byte) (i2 & 255);
        return this;
    }

    public l a(byte b) {
        byte[] bArr = this.R;
        bArr[4] = (byte) (bArr[4] | ((b & 3) << 6));
        return this;
    }

    public l b(byte b) {
        byte[] bArr = this.R;
        bArr[4] = (byte) (bArr[4] | ((b & 1) << 5));
        return this;
    }

    public l c(byte b) {
        byte[] bArr = this.R;
        bArr[4] = (byte) (bArr[4] | ((b & 1) << 4));
        return this;
    }

    public l d(byte b) {
        byte[] bArr = this.R;
        bArr[4] = (byte) (bArr[4] | (b & 15));
        return this;
    }

    public l e(byte b) {
        byte[] bArr = this.R;
        bArr[5] = (byte) (bArr[5] | ((b & 1) << 7));
        return this;
    }

    public l f(byte b) {
        byte[] bArr = this.R;
        bArr[5] = (byte) (bArr[5] | (b & Byte.MAX_VALUE));
        return this;
    }

    public l m(int i) {
        this.R[6] = (byte) ((i >> 8) & 255);
        this.R[7] = (byte) (i & 255);
        return this;
    }

    public l n(int i) {
        this.R[8] = (byte) ((i >> 24) & 255);
        this.R[9] = (byte) ((i >> 16) & 255);
        this.R[10] = (byte) ((i >> 8) & 255);
        this.R[11] = (byte) (i & 255);
        return this;
    }

    public l o(int i) {
        this.R[12] = (byte) ((i >> 24) & 255);
        this.R[13] = (byte) ((i >> 16) & 255);
        this.R[14] = (byte) ((i >> 8) & 255);
        this.R[15] = (byte) (i & 255);
        return this;
    }

    public void a(short s) {
        this.R[16] = 0;
        this.R[17] = 16;
        this.R[18] = (byte) ((s >> 5) & 255);
        this.R[19] = (byte) ((s << 3) & 248);
    }

    public void g(byte b) {
        this.R[16] = 28;
        byte[] bArr = this.R;
        bArr[16] = (byte) (bArr[16] | ((b & 3) << 5));
    }

    public void a(byte b, boolean z, boolean z2) {
        this.R[17] = (byte) (b & AudioMessageUtils.NORMALIZED_MAX_VALUE);
        if (z) {
            byte[] bArr = this.R;
            bArr[17] = (byte) (bArr[17] | 128);
        } else if (z2) {
            byte[] bArr2 = this.R;
            bArr2[17] = (byte) (bArr2[17] | 64);
        }
    }

    public void h(byte b) {
        byte[] bArr = this.R;
        bArr[4] = (byte) (bArr[4] | (b & AudioMessageUtils.NORMALIZED_MAX_VALUE));
    }

    public void i(byte b) {
        byte[] bArr = this.R;
        bArr[5] = (byte) (bArr[5] | (b & 255));
    }

    public void p(int i) {
        int i2 = (i / 4) - 1;
        this.R[6] = (byte) ((i2 >> 8) & 255);
        this.R[7] = (byte) (i2 & 255);
    }

    public void q(int i) {
        this.R[8] = (byte) ((i >> 24) & 255);
        this.R[9] = (byte) ((i >> 16) & 255);
        this.R[10] = (byte) ((i >> 8) & 255);
        this.R[11] = (byte) (i & 255);
    }

    public void b(long j) {
        this.R[12] = (byte) ((j >> 56) & 255);
        this.R[13] = (byte) ((j >> 48) & 255);
        this.R[14] = (byte) ((j >> 40) & 255);
        this.R[15] = (byte) ((j >> 32) & 255);
        this.R[16] = (byte) ((j >> 24) & 255);
        this.R[17] = (byte) ((j >> 16) & 255);
        this.R[18] = (byte) ((j >> 8) & 255);
        this.R[19] = (byte) (j & 255);
    }

    public void c(long j) {
        this.R[20] = (byte) ((j >> 24) & 255);
        this.R[21] = (byte) ((j >> 16) & 255);
        this.R[22] = (byte) ((j >> 8) & 255);
        this.R[23] = (byte) (j & 255);
    }

    public void r(int i) {
        this.R[24] = (byte) ((i >> 24) & 255);
        this.R[25] = (byte) ((i >> 16) & 255);
        this.R[26] = (byte) ((i >> 8) & 255);
        this.R[27] = (byte) (i & 255);
    }

    public void s(int i) {
        this.R[28] = (byte) ((i >> 24) & 255);
        this.R[29] = (byte) ((i >> 16) & 255);
        this.R[30] = (byte) ((i >> 8) & 255);
        this.R[31] = (byte) (i & 255);
    }
}
