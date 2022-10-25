package com.wmspanel.libstream;
/* loaded from: classes3.dex */
class p implements c {
    @Override // com.wmspanel.libstream.c
    public byte[] a(byte[] bArr, int i, int i2) {
        byte[] bArr2 = new byte[bArr.length];
        int i3 = i * i2;
        int i4 = i3 / 4;
        System.arraycopy(bArr, 0, bArr2, 0, i3);
        for (int i5 = 0; i5 < i4; i5++) {
            bArr2[(i5 * 2) + i3] = bArr[i3 + i4 + i5];
            bArr2[(i5 * 2) + i3 + 1] = bArr[i3 + i5];
        }
        return bArr2;
    }
}
