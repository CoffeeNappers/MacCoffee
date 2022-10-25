package com.google.android.gms.ads.internal.client;

import com.google.android.gms.ads.internal.client.zzy;
import com.google.android.gms.internal.zzji;
import java.util.Random;
@zzji
/* loaded from: classes.dex */
public class zzn extends zzy.zza {
    private Object zzako = new Object();
    private final Random zzbao = new Random();
    private long zzbap;

    public zzn() {
        zzkt();
    }

    @Override // com.google.android.gms.ads.internal.client.zzy
    public long getValue() {
        return this.zzbap;
    }

    public void zzkt() {
        synchronized (this.zzako) {
            int i = 3;
            long j = 0;
            while (true) {
                i--;
                if (i <= 0) {
                    break;
                }
                j = this.zzbao.nextInt() + 2147483648L;
                if (j != this.zzbap && j != 0) {
                    break;
                }
            }
            this.zzbap = j;
        }
    }
}
