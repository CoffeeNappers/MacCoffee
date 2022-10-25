package com.google.android.gms.internal;

import com.google.android.gms.internal.zzlw;
import java.util.concurrent.BlockingQueue;
import java.util.concurrent.LinkedBlockingQueue;
@zzji
/* loaded from: classes.dex */
public class zzlx<T> implements zzlw<T> {
    private final Object zzako = new Object();
    protected int zzbtt = 0;
    protected final BlockingQueue<zza> zzcys = new LinkedBlockingQueue();
    protected T zzcyt;

    /* loaded from: classes2.dex */
    class zza {
        public final zzlw.zzc<T> zzcyu;
        public final zzlw.zza zzcyv;

        public zza(zzlw.zzc<T> zzcVar, zzlw.zza zzaVar) {
            this.zzcyu = zzcVar;
            this.zzcyv = zzaVar;
        }
    }

    public int getStatus() {
        return this.zzbtt;
    }

    public void reject() {
        synchronized (this.zzako) {
            if (this.zzbtt != 0) {
                throw new UnsupportedOperationException();
            }
            this.zzbtt = -1;
            for (zza zzaVar : this.zzcys) {
                zzaVar.zzcyv.run();
            }
            this.zzcys.clear();
        }
    }

    @Override // com.google.android.gms.internal.zzlw
    public void zza(zzlw.zzc<T> zzcVar, zzlw.zza zzaVar) {
        synchronized (this.zzako) {
            if (this.zzbtt == 1) {
                zzcVar.zzd(this.zzcyt);
            } else if (this.zzbtt == -1) {
                zzaVar.run();
            } else if (this.zzbtt == 0) {
                this.zzcys.add(new zza(zzcVar, zzaVar));
            }
        }
    }

    @Override // com.google.android.gms.internal.zzlw
    public void zzg(T t) {
        synchronized (this.zzako) {
            if (this.zzbtt != 0) {
                throw new UnsupportedOperationException();
            }
            this.zzcyt = t;
            this.zzbtt = 1;
            for (zza zzaVar : this.zzcys) {
                zzaVar.zzcyu.zzd(t);
            }
            this.zzcys.clear();
        }
    }
}
