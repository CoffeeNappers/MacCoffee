package com.google.android.gms.internal;

import android.support.annotation.Nullable;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
@zzji
/* loaded from: classes.dex */
public class zzcy {
    private int zzavx;
    private final Object zzako = new Object();
    private List<zzcx> zzavy = new LinkedList();

    public boolean zza(zzcx zzcxVar) {
        boolean z;
        synchronized (this.zzako) {
            z = this.zzavy.contains(zzcxVar);
        }
        return z;
    }

    public boolean zzb(zzcx zzcxVar) {
        synchronized (this.zzako) {
            Iterator<zzcx> it = this.zzavy.iterator();
            while (it.hasNext()) {
                zzcx next = it.next();
                if (!zzdr.zzbfa.get().booleanValue() || com.google.android.gms.ads.internal.zzu.zzgq().zzuq()) {
                    if (zzdr.zzbfc.get().booleanValue() && !com.google.android.gms.ads.internal.zzu.zzgq().zzur() && zzcxVar != next && next.zzja().equals(zzcxVar.zzja())) {
                        it.remove();
                        return true;
                    }
                } else if (zzcxVar != next && next.zziy().equals(zzcxVar.zziy())) {
                    it.remove();
                    return true;
                }
            }
            return false;
        }
    }

    public void zzc(zzcx zzcxVar) {
        synchronized (this.zzako) {
            if (this.zzavy.size() >= 10) {
                zzkx.zzdg(new StringBuilder(41).append("Queue is full, current size = ").append(this.zzavy.size()).toString());
                this.zzavy.remove(0);
            }
            int i = this.zzavx;
            this.zzavx = i + 1;
            zzcxVar.zzn(i);
            this.zzavy.add(zzcxVar);
        }
    }

    @Nullable
    public zzcx zzjg() {
        int i;
        zzcx zzcxVar;
        int i2;
        zzcx zzcxVar2 = null;
        int i3 = 0;
        synchronized (this.zzako) {
            if (this.zzavy.size() == 0) {
                zzkx.zzdg("Queue empty");
                return null;
            } else if (this.zzavy.size() < 2) {
                zzcx zzcxVar3 = this.zzavy.get(0);
                zzcxVar3.zzjb();
                return zzcxVar3;
            } else {
                int i4 = Integer.MIN_VALUE;
                int i5 = 0;
                for (zzcx zzcxVar4 : this.zzavy) {
                    int score = zzcxVar4.getScore();
                    if (score > i4) {
                        i2 = score;
                        zzcxVar = zzcxVar4;
                        i = i5;
                    } else {
                        i = i3;
                        zzcxVar = zzcxVar2;
                        i2 = i4;
                    }
                    i5++;
                    i4 = i2;
                    zzcxVar2 = zzcxVar;
                    i3 = i;
                }
                this.zzavy.remove(i3);
                return zzcxVar2;
            }
        }
    }
}
