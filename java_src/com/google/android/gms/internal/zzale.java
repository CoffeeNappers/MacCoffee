package com.google.android.gms.internal;

import com.google.firebase.database.DatabaseError;
/* loaded from: classes2.dex */
public class zzale implements zzalh {
    private final zzajq aZr;
    private final zzajl bhn;
    private final DatabaseError bho;

    public zzale(zzajl zzajlVar, DatabaseError databaseError, zzajq zzajqVar) {
        this.bhn = zzajlVar;
        this.aZr = zzajqVar;
        this.bho = databaseError;
    }

    @Override // com.google.android.gms.internal.zzalh
    public String toString() {
        String valueOf = String.valueOf(zzcrc());
        return new StringBuilder(String.valueOf(valueOf).length() + 7).append(valueOf).append(":CANCEL").toString();
    }

    public zzajq zzcrc() {
        return this.aZr;
    }

    @Override // com.google.android.gms.internal.zzalh
    public void zzcxk() {
        this.bhn.zza(this.bho);
    }
}
