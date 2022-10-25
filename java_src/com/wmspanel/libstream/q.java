package com.wmspanel.libstream;
/* loaded from: classes3.dex */
class q implements c {
    @Override // com.wmspanel.libstream.c
    public byte[] a(byte[] bArr, int i, int i2) {
        byte[] bArr2 = new byte[bArr.length];
        int i3 = i * i2;
        int i4 = i3 / 4;
        System.arraycopy(bArr, 0, bArr2, 0, i3);
        System.arraycopy(bArr, i3, bArr2, i3 + i4, i4);
        System.arraycopy(bArr, i3 + i4, bArr2, i3, i4);
        return bArr2;
    }
}
