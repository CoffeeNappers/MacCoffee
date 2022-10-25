package ru.mail.libverify.utils.bouncycastle;
/* loaded from: classes3.dex */
abstract class a {
    private final byte[] a = new byte[4];
    private int b = 0;
    private long c;

    public void a() {
        long j = this.c << 3;
        a(Byte.MIN_VALUE);
        while (this.b != 0) {
            a((byte) 0);
        }
        a(j);
        c();
    }

    public void a(byte b) {
        byte[] bArr = this.a;
        int i = this.b;
        this.b = i + 1;
        bArr[i] = b;
        if (this.b == this.a.length) {
            a(this.a, 0);
            this.b = 0;
        }
        this.c++;
    }

    protected abstract void a(long j);

    protected abstract void a(byte[] bArr, int i);

    public void a(byte[] bArr, int i, int i2) {
        int i3 = 0;
        int max = Math.max(0, i2);
        if (this.b != 0) {
            int i4 = 0;
            while (true) {
                if (i4 >= max) {
                    i3 = i4;
                    break;
                }
                byte[] bArr2 = this.a;
                int i5 = this.b;
                this.b = i5 + 1;
                int i6 = i4 + 1;
                bArr2[i5] = bArr[i4 + i];
                if (this.b == 4) {
                    a(this.a, 0);
                    this.b = 0;
                    i3 = i6;
                    break;
                }
                i4 = i6;
            }
        }
        int i7 = ((max - i3) & (-4)) + i3;
        while (i3 < i7) {
            a(bArr, i + i3);
            i3 += 4;
        }
        while (i3 < max) {
            byte[] bArr3 = this.a;
            int i8 = this.b;
            this.b = i8 + 1;
            bArr3[i8] = bArr[i3 + i];
            i3++;
        }
        this.c += max;
    }

    public void b() {
        this.c = 0L;
        this.b = 0;
        for (int i = 0; i < this.a.length; i++) {
            this.a[i] = 0;
        }
    }

    protected abstract void c();
}
