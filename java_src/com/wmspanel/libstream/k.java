package com.wmspanel.libstream;

import android.support.v4.view.ViewCompat;
/* loaded from: classes3.dex */
class k {
    static final String TAG = "Rtmp";
    byte cn;
    int ck = 0;
    int aq = 0;
    int cl = 0;
    int cm = -1;
    int co = 0;

    /* JADX INFO: Access modifiers changed from: package-private */
    public k(byte b) {
        this.cn = b;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void l(int i) {
        this.co = i;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public int f(byte[] bArr, int i, int i2) {
        int i3;
        if (this.cm == -1) {
            this.cm = 0;
            this.aq = i2;
            this.ck = i2;
            this.cl = i;
        } else if (i2 < this.ck) {
            this.cm = 0;
            this.aq = i2;
            this.ck = i2;
            this.cl = i;
        } else if (this.cl != i) {
            this.cm = 1;
            this.aq = i2 - this.ck;
            this.ck = i2;
            this.cl = i;
        } else if (i2 - this.ck == this.aq) {
            this.cm = 3;
            this.ck = i2;
        } else {
            this.cm = 2;
            this.aq = i2 - this.ck;
            this.ck = i2;
        }
        if (this.cn == 8) {
            i3 = 6;
        } else if (this.cn == 9) {
            i3 = 5;
        } else {
            i3 = this.cn == 18 ? 4 : 0;
        }
        bArr[0] = (byte) (i3 | (this.cm << 6));
        switch (this.cm) {
            case 0:
                if (this.ck >= 16777215) {
                    j.c(bArr, 1, ViewCompat.MEASURED_SIZE_MASK);
                } else {
                    j.c(bArr, 1, this.ck);
                }
                j.c(bArr, 4, this.cl);
                bArr[7] = this.cn;
                j.d(bArr, 8, this.co);
                if (this.ck < 16777215) {
                    return 12;
                }
                j.e(bArr, 12, this.ck);
                return 16;
            case 1:
                if (this.aq >= 16777215) {
                    j.c(bArr, 1, ViewCompat.MEASURED_SIZE_MASK);
                } else {
                    j.c(bArr, 1, this.aq);
                }
                j.c(bArr, 4, this.cl);
                bArr[7] = this.cn;
                if (this.aq < 16777215) {
                    return 8;
                }
                j.e(bArr, 8, this.aq);
                return 12;
            case 2:
                if (this.aq >= 16777215) {
                    j.c(bArr, 1, ViewCompat.MEASURED_SIZE_MASK);
                } else {
                    j.c(bArr, 1, this.aq);
                }
                if (this.aq < 16777215) {
                    return 4;
                }
                j.e(bArr, 4, this.ck);
                return 8;
            default:
                if (this.aq < 16777215) {
                    return 1;
                }
                j.e(bArr, 4, this.ck);
                return 5;
        }
    }
}
