package com.google.android.gms.internal;

import com.google.android.gms.internal.zzalh;
import com.google.firebase.database.DatabaseError;
import java.util.concurrent.atomic.AtomicBoolean;
/* loaded from: classes2.dex */
public abstract class zzajl {
    static final /* synthetic */ boolean $assertionsDisabled;
    private zzajm bdv;
    private AtomicBoolean bdu = new AtomicBoolean(false);
    private boolean bdw = false;

    static {
        $assertionsDisabled = !zzajl.class.desiredAssertionStatus();
    }

    public abstract zzajl zza(zzall zzallVar);

    public abstract zzalg zza(zzalf zzalfVar, zzall zzallVar);

    public void zza(zzajm zzajmVar) {
        if ($assertionsDisabled || !zzcvc()) {
            if (!$assertionsDisabled && this.bdv != null) {
                throw new AssertionError();
            }
            this.bdv = zzajmVar;
            return;
        }
        throw new AssertionError();
    }

    public abstract void zza(zzalg zzalgVar);

    public abstract void zza(DatabaseError databaseError);

    public abstract boolean zza(zzalh.zza zzaVar);

    public abstract boolean zzc(zzajl zzajlVar);

    public abstract zzall zzcud();

    public void zzcvb() {
        if (!this.bdu.compareAndSet(false, true) || this.bdv == null) {
            return;
        }
        this.bdv.zzd(this);
        this.bdv = null;
    }

    public boolean zzcvc() {
        return this.bdu.get();
    }

    public boolean zzcvd() {
        return this.bdw;
    }

    public void zzdb(boolean z) {
        this.bdw = z;
    }
}
