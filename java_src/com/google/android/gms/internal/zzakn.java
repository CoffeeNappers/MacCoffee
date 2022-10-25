package com.google.android.gms.internal;
/* loaded from: classes2.dex */
public abstract class zzakn {
    protected final zzajq aZr;
    protected final zza bgi;
    protected final zzako bgj;

    /* loaded from: classes2.dex */
    public enum zza {
        Overwrite,
        Merge,
        AckUserWrite,
        ListenComplete
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public zzakn(zza zzaVar, zzako zzakoVar, zzajq zzajqVar) {
        this.bgi = zzaVar;
        this.bgj = zzakoVar;
        this.aZr = zzajqVar;
    }

    public abstract zzakn zzc(zzalz zzalzVar);

    public zzajq zzcrc() {
        return this.aZr;
    }

    public zzako zzcwp() {
        return this.bgj;
    }

    public zza zzcwq() {
        return this.bgi;
    }
}
