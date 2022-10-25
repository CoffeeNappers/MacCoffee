package com.google.android.gms.internal;
/* loaded from: classes2.dex */
public class zzaqt {
    private final byte[] brQ = new byte[256];
    private int brR;
    private int brS;

    public zzaqt(byte[] bArr) {
        for (int i = 0; i < 256; i++) {
            this.brQ[i] = (byte) i;
        }
        int i2 = 0;
        for (int i3 = 0; i3 < 256; i3++) {
            i2 = (i2 + this.brQ[i3] + bArr[i3 % bArr.length]) & 255;
            byte b = this.brQ[i3];
            this.brQ[i3] = this.brQ[i2];
            this.brQ[i2] = b;
        }
        this.brR = 0;
        this.brS = 0;
    }

    public void zzay(byte[] bArr) {
        int i = this.brR;
        int i2 = this.brS;
        for (int i3 = 0; i3 < bArr.length; i3++) {
            i = (i + 1) & 255;
            i2 = (i2 + this.brQ[i]) & 255;
            byte b = this.brQ[i];
            this.brQ[i] = this.brQ[i2];
            this.brQ[i2] = b;
            bArr[i3] = (byte) (bArr[i3] ^ this.brQ[(this.brQ[i] + this.brQ[i2]) & 255]);
        }
        this.brR = i;
        this.brS = i2;
    }
}
