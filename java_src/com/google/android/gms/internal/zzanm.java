package com.google.android.gms.internal;

import java.util.Random;
/* loaded from: classes2.dex */
public class zzanm {
    static final /* synthetic */ boolean $assertionsDisabled;
    private static final Random bkh;
    private static long bki;
    private static final int[] bkj;

    static {
        $assertionsDisabled = !zzanm.class.desiredAssertionStatus();
        bkh = new Random();
        bki = 0L;
        bkj = new int[12];
    }

    private static void B() {
        for (int i = 11; i >= 0; i--) {
            if (bkj[i] != 63) {
                bkj[i] = bkj[i] + 1;
                return;
            }
            bkj[i] = 0;
        }
    }

    public static synchronized String zzco(long j) {
        String sb;
        synchronized (zzanm.class) {
            boolean z = j == bki;
            bki = j;
            char[] cArr = new char[8];
            StringBuilder sb2 = new StringBuilder(20);
            for (int i = 7; i >= 0; i--) {
                cArr[i] = "-0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ_abcdefghijklmnopqrstuvwxyz".charAt((int) (j % 64));
                j /= 64;
            }
            if (!$assertionsDisabled && j != 0) {
                throw new AssertionError();
            }
            sb2.append(cArr);
            if (!z) {
                for (int i2 = 0; i2 < 12; i2++) {
                    bkj[i2] = bkh.nextInt(64);
                }
            } else {
                B();
            }
            for (int i3 = 0; i3 < 12; i3++) {
                sb2.append("-0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ_abcdefghijklmnopqrstuvwxyz".charAt(bkj[i3]));
            }
            if (!$assertionsDisabled && sb2.length() != 20) {
                throw new AssertionError();
            }
            sb = sb2.toString();
        }
        return sb;
    }
}
