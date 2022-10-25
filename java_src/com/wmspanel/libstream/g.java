package com.wmspanel.libstream;
/* loaded from: classes3.dex */
class g implements c {
    @Override // com.wmspanel.libstream.c
    public byte[] a(byte[] bArr, int i, int i2) {
        byte[] bArr2 = new byte[bArr.length];
        int i3 = i * i2;
        System.arraycopy(bArr, 0, bArr2, 0, i3);
        for (int i4 = 0; i4 < (i * i2) / 2; i4 += 2) {
            bArr2[i3 + i4] = bArr[i3 + i4 + 1];
            bArr2[i3 + i4 + 1] = bArr[i3 + i4];
        }
        return bArr2;
    }
}
