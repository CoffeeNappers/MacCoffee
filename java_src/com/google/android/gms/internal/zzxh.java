package com.google.android.gms.internal;

import com.google.android.gms.common.data.DataHolder;
/* loaded from: classes2.dex */
public class zzxh {
    private static final String TAG = zzxh.class.getSimpleName();
    int[] aCG;
    int aCi;

    public zzxh(DataHolder dataHolder, int i) {
        int[] zzaj;
        if (dataHolder != null && dataHolder.getStatusCode() == 0 && (zzaj = zzaj(dataHolder.zzg("", i, dataHolder.zzga(i)))) != null && zzaj.length >= 3 && zzaj[0] == 1 && zzaj[1] == 1936614772) {
            this.aCG = new int[zzaj.length];
            System.arraycopy(zzaj, 0, this.aCG, 0, zzaj.length);
            this.aCi = this.aCG[2];
        }
    }

    private static int zza(int[] iArr, long j) {
        int i = 3;
        int length = iArr.length - 1;
        while (i <= length) {
            int i2 = ((length - i) / 2) + i;
            long zzbs = zzbs(iArr[i2]);
            if (zzbs == j) {
                return i2;
            }
            if (zzbs < j) {
                i = i2 + 1;
            } else {
                length = i2 - 1;
            }
        }
        return -1;
    }

    private static long zzai(byte[] bArr) {
        return ((bArr[3] & 255) | ((bArr[2] & 255) << 8) | ((bArr[1] & 255) << 16) | ((bArr[0] & 255) << 24)) & 4294967295L;
    }

    public static int[] zzaj(byte[] bArr) {
        if (bArr == null || bArr.length % 4 != 0) {
            return null;
        }
        int[] iArr = new int[bArr.length / 4];
        for (int i = 0; i < bArr.length; i += 4) {
            iArr[i / 4] = (int) (((bArr[i + 3] & 255) | ((bArr[i + 2] & 255) << 8) | ((bArr[i + 1] & 255) << 16) | ((bArr[i] & 255) << 24)) & 4294967295L);
        }
        return iArr;
    }

    private static long zzbs(long j) {
        return 4294967295L & j;
    }

    public int getThreatType() {
        return this.aCi;
    }

    public boolean zzah(byte[] bArr) {
        if (this.aCG == null) {
            return false;
        }
        return zza(this.aCG, zzai(bArr)) != -1;
    }
}
