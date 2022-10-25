package com.wmspanel.libstream;

import com.wmspanel.libstream.e;
import java.nio.ByteBuffer;
/* loaded from: classes3.dex */
class f {
    int X;
    int height;
    int width;

    f() {
    }

    private static boolean b(byte[] bArr, int i, int i2) {
        if (i2 < 3) {
            return true;
        }
        int i3 = i2 - 3;
        while (i <= i3) {
            if (bArr[i] != 0 || bArr[i + 1] != 0 || bArr[i + 2] != 3) {
                i++;
            } else {
                return false;
            }
        }
        return true;
    }

    private static void b(ByteBuffer byteBuffer) {
        if (byteBuffer.position() >= 3) {
            int position = byteBuffer.position() - 3;
            int i = 0;
            while (i <= position) {
                if (byteBuffer.get(i) == 0 && byteBuffer.get(i + 1) == 0 && byteBuffer.get(i + 2) == 3) {
                    b(byteBuffer, i + 2);
                    position = byteBuffer.position() - 3;
                    i += 2;
                }
                i++;
            }
        }
    }

    private static void b(ByteBuffer byteBuffer, int i) {
        if (i < byteBuffer.position()) {
            System.arraycopy(byteBuffer.array(), i + 1, byteBuffer.array(), i, (byteBuffer.position() - i) - 1);
            byteBuffer.position(byteBuffer.position() - 1);
        }
    }

    private static void a(e eVar, int i) throws e.a {
        int i2 = 8;
        int i3 = 0;
        int i4 = 8;
        while (i3 < i) {
            if (i4 != 0) {
                i4 = ((eVar.D() + i2) + 256) % 256;
            }
            if (i4 != 0) {
                i3++;
                i2 = i4;
            } else {
                return;
            }
        }
    }

    private static boolean a(e eVar) throws e.a {
        int C = eVar.C();
        if (C > 1024) {
            return false;
        }
        eVar.skip(8);
        for (int i = 0; i <= C; i++) {
            eVar.C();
            eVar.C();
            eVar.skip(1);
        }
        eVar.skip(20);
        return true;
    }

    private static f b(e eVar) {
        int i;
        int i2;
        int i3;
        int i4;
        try {
            int A = eVar.A();
            eVar.skip(16);
            eVar.C();
            if (A == 100 || A == 110 || A == 122 || A == 244 || A == 44 || A == 83 || A == 86 || A == 118 || A == 128 || A == 138 || A == 144) {
                int C = eVar.C();
                if (C == 3) {
                    eVar.skip(1);
                }
                eVar.C();
                eVar.C();
                eVar.skip(1);
                if (eVar.B() != 0) {
                    int i5 = 0;
                    while (true) {
                        if (i5 >= (C != 3 ? 8 : 12)) {
                            break;
                        }
                        if (eVar.B() != 0) {
                            if (i5 < 6) {
                                a(eVar, 16);
                            } else {
                                a(eVar, 64);
                            }
                        }
                        i5++;
                    }
                }
            }
            eVar.C();
            int C2 = eVar.C();
            if (C2 == 0) {
                eVar.C();
            } else if (C2 == 1) {
                eVar.skip(1);
                eVar.D();
                eVar.D();
                int C3 = eVar.C();
                if (C3 > 1024) {
                    return null;
                }
                for (int i6 = 0; i6 < C3; i6++) {
                    eVar.D();
                }
            }
            eVar.C();
            eVar.skip(1);
            int C4 = eVar.C();
            int C5 = eVar.C();
            int B = eVar.B();
            if (B == 0) {
                eVar.skip(1);
            }
            eVar.skip(1);
            if (eVar.B() != 0) {
                i4 = eVar.C();
                i3 = eVar.C();
                i2 = eVar.C();
                i = eVar.C();
            } else {
                i = 0;
                i2 = 0;
                i3 = 0;
                i4 = 0;
            }
            f fVar = new f();
            fVar.width = (((C4 + 1) * 16) - (i4 * 2)) - (i3 * 2);
            fVar.height = ((((2 - B) * (C5 + 1)) * 16) - (i2 * 2)) - (i * 2);
            if (eVar.B() != 0) {
                if (eVar.B() != 0 && eVar.A() == 255) {
                    eVar.skip(32);
                }
                if (eVar.B() != 0) {
                    eVar.skip(1);
                }
                if (eVar.B() != 0) {
                    eVar.skip(4);
                    if (eVar.B() != 0) {
                        eVar.skip(24);
                    }
                }
                if (eVar.B() != 0) {
                    eVar.C();
                    eVar.C();
                }
                if (eVar.B() != 0) {
                    eVar.skip(65);
                }
                int B2 = eVar.B();
                if (B2 != 0 && !a(eVar)) {
                    return null;
                }
                int B3 = eVar.B();
                if (B3 != 0 && !a(eVar)) {
                    return null;
                }
                if (B2 != 0 || B3 != 0) {
                    eVar.skip(1);
                }
                eVar.skip(1);
                if (eVar.B() != 0) {
                    eVar.skip(1);
                    eVar.C();
                    eVar.C();
                    eVar.C();
                    eVar.C();
                    fVar.X = eVar.C();
                    eVar.C();
                }
            }
            return fVar;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static f a(byte[] bArr, int i) {
        f fVar = null;
        try {
            e eVar = new e(bArr, i);
            if ((eVar.A() & 31) == 7) {
                if (b(bArr, 1, i - 1)) {
                    fVar = b(eVar);
                } else {
                    ByteBuffer allocate = ByteBuffer.allocate(i - 1);
                    allocate.put(bArr, 1, i - 1);
                    b(allocate);
                    fVar = b(new e(allocate.array(), allocate.position()));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return fVar;
    }
}
