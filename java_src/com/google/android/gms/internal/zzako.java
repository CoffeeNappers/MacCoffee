package com.google.android.gms.internal;
/* loaded from: classes2.dex */
public class zzako {
    static final /* synthetic */ boolean $assertionsDisabled;
    public static final zzako bgp;
    public static final zzako bgq;
    private final zza bgr;
    private final zzalk bgs;
    private final boolean bgt;

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes2.dex */
    public enum zza {
        User,
        Server
    }

    static {
        $assertionsDisabled = !zzako.class.desiredAssertionStatus();
        bgp = new zzako(zza.User, null, false);
        bgq = new zzako(zza.Server, null, false);
    }

    public zzako(zza zzaVar, zzalk zzalkVar, boolean z) {
        this.bgr = zzaVar;
        this.bgs = zzalkVar;
        this.bgt = z;
        if ($assertionsDisabled || !z || zzcws()) {
            return;
        }
        throw new AssertionError();
    }

    public static zzako zzc(zzalk zzalkVar) {
        return new zzako(zza.Server, zzalkVar, true);
    }

    public String toString() {
        String valueOf = String.valueOf(this.bgr);
        String valueOf2 = String.valueOf(this.bgs);
        return new StringBuilder(String.valueOf(valueOf).length() + 52 + String.valueOf(valueOf2).length()).append("OperationSource{source=").append(valueOf).append(", queryParams=").append(valueOf2).append(", tagged=").append(this.bgt).append("}").toString();
    }

    public boolean zzcwr() {
        return this.bgr == zza.User;
    }

    public boolean zzcws() {
        return this.bgr == zza.Server;
    }

    public boolean zzcwt() {
        return this.bgt;
    }

    public zzalk zzcwu() {
        return this.bgs;
    }
}
