package ru.mail.libverify.utils.bouncycastle;
/* loaded from: classes3.dex */
public final class c extends a {
    static final int[] a = {1116352408, 1899447441, -1245643825, -373957723, 961987163, 1508970993, -1841331548, -1424204075, -670586216, 310598401, 607225278, 1426881987, 1925078388, -2132889090, -1680079193, -1046744716, -459576895, -272742522, 264347078, 604807628, 770255983, 1249150122, 1555081692, 1996064986, -1740746414, -1473132947, -1341970488, -1084653625, -958395405, -710438585, 113926993, 338241895, 666307205, 773529912, 1294757372, 1396182291, 1695183700, 1986661051, -2117940946, -1838011259, -1564481375, -1474664885, -1035236496, -949202525, -778901479, -694614492, -200395387, 275423344, 430227734, 506948616, 659060556, 883997877, 958139571, 1322822218, 1537002063, 1747873779, 1955562222, 2024104815, -2067236844, -1933114872, -1866530822, -1538233109, -1090935817, -965641998};
    private int b;
    private int c;
    private int d;
    private int e;
    private int f;
    private int g;
    private int h;
    private int i;
    private int[] j = new int[64];
    private int k;

    public c() {
        b();
    }

    private static int a(int i) {
        return (((i >>> 2) | (i << 30)) ^ ((i >>> 13) | (i << 19))) ^ ((i >>> 22) | (i << 10));
    }

    private static int a(int i, int i2, int i3) {
        return (i & i2) ^ ((i ^ (-1)) & i3);
    }

    public static byte[] a(byte[] bArr) {
        c cVar = new c();
        super.a(bArr, 0, bArr.length);
        byte[] bArr2 = new byte[32];
        super.a();
        b.a(cVar.b, bArr2, 0);
        b.a(cVar.c, bArr2, 4);
        b.a(cVar.d, bArr2, 8);
        b.a(cVar.e, bArr2, 12);
        b.a(cVar.f, bArr2, 16);
        b.a(cVar.g, bArr2, 20);
        b.a(cVar.h, bArr2, 24);
        b.a(cVar.i, bArr2, 28);
        cVar.b();
        return bArr2;
    }

    private static int b(int i) {
        return (((i >>> 6) | (i << 26)) ^ ((i >>> 11) | (i << 21))) ^ ((i >>> 25) | (i << 7));
    }

    private static int b(int i, int i2, int i3) {
        return ((i & i2) ^ (i & i3)) ^ (i2 & i3);
    }

    @Override // ru.mail.libverify.utils.bouncycastle.a
    public final /* bridge */ /* synthetic */ void a() {
        super.a();
    }

    @Override // ru.mail.libverify.utils.bouncycastle.a
    public final /* bridge */ /* synthetic */ void a(byte b) {
        super.a(b);
    }

    @Override // ru.mail.libverify.utils.bouncycastle.a
    protected final void a(long j) {
        if (this.k > 14) {
            c();
        }
        this.j[14] = (int) (j >>> 32);
        this.j[15] = (int) ((-1) & j);
    }

    @Override // ru.mail.libverify.utils.bouncycastle.a
    protected final void a(byte[] bArr, int i) {
        int i2 = i + 1;
        int i3 = i2 + 1;
        this.j[this.k] = (bArr[i] << 24) | ((bArr[i2] & 255) << 16) | ((bArr[i3] & 255) << 8) | (bArr[i3 + 1] & 255);
        int i4 = this.k + 1;
        this.k = i4;
        if (i4 == 16) {
            c();
        }
    }

    @Override // ru.mail.libverify.utils.bouncycastle.a
    public final /* bridge */ /* synthetic */ void a(byte[] bArr, int i, int i2) {
        super.a(bArr, i, i2);
    }

    @Override // ru.mail.libverify.utils.bouncycastle.a
    public final void b() {
        super.b();
        this.b = 1779033703;
        this.c = -1150833019;
        this.d = 1013904242;
        this.e = -1521486534;
        this.f = 1359893119;
        this.g = -1694144372;
        this.h = 528734635;
        this.i = 1541459225;
        this.k = 0;
        for (int i = 0; i != this.j.length; i++) {
            this.j[i] = 0;
        }
    }

    @Override // ru.mail.libverify.utils.bouncycastle.a
    protected final void c() {
        for (int i = 16; i <= 63; i++) {
            int[] iArr = this.j;
            int i2 = this.j[i - 2];
            int i3 = ((i2 >>> 10) ^ (((i2 >>> 17) | (i2 << 15)) ^ ((i2 >>> 19) | (i2 << 13)))) + this.j[i - 7];
            int i4 = this.j[i - 15];
            iArr[i] = i3 + ((i4 >>> 3) ^ (((i4 >>> 7) | (i4 << 25)) ^ ((i4 >>> 18) | (i4 << 14)))) + this.j[i - 16];
        }
        int i5 = this.b;
        int i6 = this.c;
        int i7 = this.d;
        int i8 = this.e;
        int i9 = this.f;
        int i10 = this.g;
        int i11 = this.h;
        int i12 = i6;
        int i13 = i5;
        int i14 = i8;
        int i15 = i7;
        int i16 = i10;
        int i17 = i9;
        int i18 = this.i;
        int i19 = i11;
        int i20 = 0;
        for (int i21 = 0; i21 < 8; i21++) {
            int b = i18 + b(i17) + a(i17, i16, i19) + a[i20] + this.j[i20];
            int i22 = i14 + b;
            int a2 = b + a(i13) + b(i13, i12, i15);
            int i23 = i20 + 1;
            int b2 = i19 + b(i22) + a(i22, i17, i16) + a[i23] + this.j[i23];
            int i24 = i15 + b2;
            int a3 = b2 + a(a2) + b(a2, i13, i12);
            int i25 = i23 + 1;
            int b3 = i16 + b(i24) + a(i24, i22, i17) + a[i25] + this.j[i25];
            int i26 = i12 + b3;
            int a4 = b3 + a(a3) + b(a3, a2, i13);
            int i27 = i25 + 1;
            int b4 = i17 + b(i26) + a(i26, i24, i22) + a[i27] + this.j[i27];
            int i28 = i13 + b4;
            int a5 = b4 + a(a4) + b(a4, a3, a2);
            int i29 = i27 + 1;
            int b5 = i22 + b(i28) + a(i28, i26, i24) + a[i29] + this.j[i29];
            i18 = a2 + b5;
            i14 = b5 + a(a5) + b(a5, a4, a3);
            int i30 = i29 + 1;
            int b6 = i24 + b(i18) + a(i18, i28, i26) + a[i30] + this.j[i30];
            i19 = a3 + b6;
            i15 = b6 + a(i14) + b(i14, a5, a4);
            int i31 = i30 + 1;
            int b7 = i26 + b(i19) + a(i19, i18, i28) + a[i31] + this.j[i31];
            i16 = a4 + b7;
            i12 = b7 + a(i15) + b(i15, i14, a5);
            int i32 = i31 + 1;
            int b8 = i28 + b(i16) + a(i16, i19, i18) + a[i32] + this.j[i32];
            i17 = a5 + b8;
            i13 = b8 + a(i12) + b(i12, i15, i14);
            i20 = i32 + 1;
        }
        this.b += i13;
        this.c += i12;
        this.d += i15;
        this.e += i14;
        this.f += i17;
        this.g += i16;
        this.h += i19;
        this.i += i18;
        this.k = 0;
        for (int i33 = 0; i33 < 16; i33++) {
            this.j[i33] = 0;
        }
    }
}
