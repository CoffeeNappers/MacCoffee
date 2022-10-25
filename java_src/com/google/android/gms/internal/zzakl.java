package com.google.android.gms.internal;

import com.google.android.gms.internal.zzakn;
/* loaded from: classes2.dex */
public class zzakl extends zzakn {
    static final /* synthetic */ boolean $assertionsDisabled;

    static {
        $assertionsDisabled = !zzakl.class.desiredAssertionStatus();
    }

    public zzakl(zzako zzakoVar, zzajq zzajqVar) {
        super(zzakn.zza.ListenComplete, zzakoVar, zzajqVar);
        if ($assertionsDisabled || !zzakoVar.zzcwr()) {
            return;
        }
        throw new AssertionError("Can't have a listen complete from a user source");
    }

    public String toString() {
        return String.format("ListenComplete { path=%s, source=%s }", zzcrc(), zzcwp());
    }

    @Override // com.google.android.gms.internal.zzakn
    public zzakn zzc(zzalz zzalzVar) {
        return this.aZr.isEmpty() ? new zzakl(this.bgj, zzajq.zzcvg()) : new zzakl(this.bgj, this.aZr.zzcvk());
    }
}
