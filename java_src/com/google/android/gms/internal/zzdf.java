package com.google.android.gms.internal;

import com.fasterxml.jackson.core.util.MinimalPrettyPrinter;
import java.security.MessageDigest;
@zzji
/* loaded from: classes.dex */
public class zzdf extends zzdc {
    private MessageDigest zzaxn;

    byte[] zza(String[] strArr) {
        if (strArr.length == 1) {
            return zzde.zzp(zzde.zzai(strArr[0]));
        }
        if (strArr.length >= 5) {
            byte[] bArr = new byte[strArr.length];
            for (int i = 0; i < strArr.length; i++) {
                bArr[i] = zzr(zzde.zzai(strArr[i]));
            }
            return bArr;
        }
        byte[] bArr2 = new byte[strArr.length * 2];
        for (int i2 = 0; i2 < strArr.length; i2++) {
            byte[] zzs = zzs(zzde.zzai(strArr[i2]));
            bArr2[i2 * 2] = zzs[0];
            bArr2[(i2 * 2) + 1] = zzs[1];
        }
        return bArr2;
    }

    @Override // com.google.android.gms.internal.zzdc
    public byte[] zzag(String str) {
        byte[] bArr;
        int i = 4;
        byte[] zza = zza(str.split(MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR));
        this.zzaxn = zzjr();
        synchronized (this.zzako) {
            if (this.zzaxn == null) {
                bArr = new byte[0];
            } else {
                this.zzaxn.reset();
                this.zzaxn.update(zza);
                byte[] digest = this.zzaxn.digest();
                if (digest.length <= 4) {
                    i = digest.length;
                }
                bArr = new byte[i];
                System.arraycopy(digest, 0, bArr, 0, bArr.length);
            }
        }
        return bArr;
    }

    byte zzr(int i) {
        return (byte) ((((i & 255) ^ ((65280 & i) >> 8)) ^ ((16711680 & i) >> 16)) ^ (((-16777216) & i) >> 24));
    }

    byte[] zzs(int i) {
        int i2 = (65535 & i) ^ (((-65536) & i) >> 16);
        return new byte[]{(byte) i2, (byte) (i2 >> 8)};
    }
}
