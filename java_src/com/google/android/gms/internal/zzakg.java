package com.google.android.gms.internal;

import com.google.android.gms.internal.zzalh;
import com.google.firebase.database.DatabaseError;
import com.google.firebase.database.ValueEventListener;
/* loaded from: classes2.dex */
public class zzakg extends zzajl {
    private final zzajs aZj;
    private final zzall bcY;
    private final ValueEventListener bfS;

    public zzakg(zzajs zzajsVar, ValueEventListener valueEventListener, zzall zzallVar) {
        this.aZj = zzajsVar;
        this.bfS = valueEventListener;
        this.bcY = zzallVar;
    }

    public boolean equals(Object obj) {
        return (obj instanceof zzakg) && ((zzakg) obj).bfS.equals(this.bfS) && ((zzakg) obj).aZj.equals(this.aZj) && ((zzakg) obj).bcY.equals(this.bcY);
    }

    public int hashCode() {
        return (((this.bfS.hashCode() * 31) + this.aZj.hashCode()) * 31) + this.bcY.hashCode();
    }

    public String toString() {
        return "ValueEventRegistration";
    }

    @Override // com.google.android.gms.internal.zzajl
    public zzajl zza(zzall zzallVar) {
        return new zzakg(this.aZj, this.bfS, zzallVar);
    }

    @Override // com.google.android.gms.internal.zzajl
    public zzalg zza(zzalf zzalfVar, zzall zzallVar) {
        return new zzalg(zzalh.zza.VALUE, this, com.google.firebase.database.zza.zza(com.google.firebase.database.zza.zza(this.aZj, zzallVar.zzcrc()), zzalfVar.zzcxj()), null);
    }

    @Override // com.google.android.gms.internal.zzajl
    public void zza(zzalg zzalgVar) {
        if (zzcvc()) {
            return;
        }
        this.bfS.onDataChange(zzalgVar.zzcxp());
    }

    @Override // com.google.android.gms.internal.zzajl
    public void zza(DatabaseError databaseError) {
        this.bfS.onCancelled(databaseError);
    }

    @Override // com.google.android.gms.internal.zzajl
    public boolean zza(zzalh.zza zzaVar) {
        return zzaVar == zzalh.zza.VALUE;
    }

    @Override // com.google.android.gms.internal.zzajl
    public boolean zzc(zzajl zzajlVar) {
        return (zzajlVar instanceof zzakg) && ((zzakg) zzajlVar).bfS.equals(this.bfS);
    }

    @Override // com.google.android.gms.internal.zzajl
    public zzall zzcud() {
        return this.bcY;
    }
}
