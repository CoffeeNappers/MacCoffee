package com.google.android.gms.internal;

import java.nio.charset.Charset;
import java.security.MessageDigest;
@zzji
/* loaded from: classes.dex */
public class zzdh extends zzdc {
    private MessageDigest zzaxn;
    private final int zzaxq;
    private final int zzaxr;

    public zzdh(int i) {
        int i2 = i / 8;
        this.zzaxq = i % 8 > 0 ? i2 + 1 : i2;
        this.zzaxr = i;
    }

    @Override // com.google.android.gms.internal.zzdc
    public byte[] zzag(String str) {
        byte[] bArr;
        synchronized (this.zzako) {
            this.zzaxn = zzjr();
            if (this.zzaxn == null) {
                bArr = new byte[0];
            } else {
                this.zzaxn.reset();
                this.zzaxn.update(str.getBytes(Charset.forName("UTF-8")));
                byte[] digest = this.zzaxn.digest();
                bArr = new byte[digest.length > this.zzaxq ? this.zzaxq : digest.length];
                System.arraycopy(digest, 0, bArr, 0, bArr.length);
                if (this.zzaxr % 8 > 0) {
                    long j = 0;
                    for (int i = 0; i < bArr.length; i++) {
                        if (i > 0) {
                            j <<= 8;
                        }
                        j += bArr[i] & 255;
                    }
                    long j2 = j >>> (8 - (this.zzaxr % 8));
                    for (int i2 = this.zzaxq - 1; i2 >= 0; i2--) {
                        bArr[i2] = (byte) (255 & j2);
                        j2 >>>= 8;
                    }
                }
            }
        }
        return bArr;
    }
}
