package com.google.android.gms.internal;

import com.google.android.gms.internal.zzalh;
import com.google.firebase.database.DataSnapshot;
/* loaded from: classes2.dex */
public class zzalg implements zzalh {
    private final zzajl bhn;
    private final zzalh.zza bhp;
    private final DataSnapshot bht;
    private final String bhu;

    public zzalg(zzalh.zza zzaVar, zzajl zzajlVar, DataSnapshot dataSnapshot, String str) {
        this.bhp = zzaVar;
        this.bhn = zzajlVar;
        this.bht = dataSnapshot;
        this.bhu = str;
    }

    @Override // com.google.android.gms.internal.zzalh
    public String toString() {
        if (this.bhp == zzalh.zza.VALUE) {
            String valueOf = String.valueOf(zzcrc());
            String valueOf2 = String.valueOf(this.bhp);
            String valueOf3 = String.valueOf(this.bht.getValue(true));
            return new StringBuilder(String.valueOf(valueOf).length() + 4 + String.valueOf(valueOf2).length() + String.valueOf(valueOf3).length()).append(valueOf).append(": ").append(valueOf2).append(": ").append(valueOf3).toString();
        }
        String valueOf4 = String.valueOf(zzcrc());
        String valueOf5 = String.valueOf(this.bhp);
        String valueOf6 = String.valueOf(this.bht.getKey());
        String valueOf7 = String.valueOf(this.bht.getValue(true));
        return new StringBuilder(String.valueOf(valueOf4).length() + 10 + String.valueOf(valueOf5).length() + String.valueOf(valueOf6).length() + String.valueOf(valueOf7).length()).append(valueOf4).append(": ").append(valueOf5).append(": { ").append(valueOf6).append(": ").append(valueOf7).append(" }").toString();
    }

    public zzajq zzcrc() {
        zzajq zzcrc = this.bht.getRef().zzcrc();
        return this.bhp == zzalh.zza.VALUE ? zzcrc : zzcrc.zzcvl();
    }

    @Override // com.google.android.gms.internal.zzalh
    public void zzcxk() {
        this.bhn.zza(this);
    }

    public zzalh.zza zzcxm() {
        return this.bhp;
    }

    public DataSnapshot zzcxp() {
        return this.bht;
    }

    public String zzcxq() {
        return this.bhu;
    }
}
