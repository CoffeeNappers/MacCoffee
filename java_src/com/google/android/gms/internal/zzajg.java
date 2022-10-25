package com.google.android.gms.internal;

import com.google.android.gms.internal.zzalh;
import com.google.firebase.database.ChildEventListener;
import com.google.firebase.database.DatabaseError;
/* loaded from: classes2.dex */
public class zzajg extends zzajl {
    private final zzajs aZj;
    private final ChildEventListener bcX;
    private final zzall bcY;

    public zzajg(zzajs zzajsVar, ChildEventListener childEventListener, zzall zzallVar) {
        this.aZj = zzajsVar;
        this.bcX = childEventListener;
        this.bcY = zzallVar;
    }

    public boolean equals(Object obj) {
        return (obj instanceof zzajg) && ((zzajg) obj).bcX.equals(this.bcX) && ((zzajg) obj).aZj.equals(this.aZj) && ((zzajg) obj).bcY.equals(this.bcY);
    }

    public int hashCode() {
        return (((this.bcX.hashCode() * 31) + this.aZj.hashCode()) * 31) + this.bcY.hashCode();
    }

    public String toString() {
        return "ChildEventRegistration";
    }

    @Override // com.google.android.gms.internal.zzajl
    public zzajl zza(zzall zzallVar) {
        return new zzajg(this.aZj, this.bcX, zzallVar);
    }

    @Override // com.google.android.gms.internal.zzajl
    public zzalg zza(zzalf zzalfVar, zzall zzallVar) {
        return new zzalg(zzalfVar.zzcxm(), this, com.google.firebase.database.zza.zza(com.google.firebase.database.zza.zza(this.aZj, zzallVar.zzcrc().zza(zzalfVar.zzcxl())), zzalfVar.zzcxj()), zzalfVar.zzcxn() != null ? zzalfVar.zzcxn().asString() : null);
    }

    @Override // com.google.android.gms.internal.zzajl
    public void zza(zzalg zzalgVar) {
        if (zzcvc()) {
            return;
        }
        switch (zzalgVar.zzcxm()) {
            case CHILD_ADDED:
                this.bcX.onChildAdded(zzalgVar.zzcxp(), zzalgVar.zzcxq());
                return;
            case CHILD_CHANGED:
                this.bcX.onChildChanged(zzalgVar.zzcxp(), zzalgVar.zzcxq());
                return;
            case CHILD_MOVED:
                this.bcX.onChildMoved(zzalgVar.zzcxp(), zzalgVar.zzcxq());
                return;
            case CHILD_REMOVED:
                this.bcX.onChildRemoved(zzalgVar.zzcxp());
                return;
            default:
                return;
        }
    }

    @Override // com.google.android.gms.internal.zzajl
    public void zza(DatabaseError databaseError) {
        this.bcX.onCancelled(databaseError);
    }

    @Override // com.google.android.gms.internal.zzajl
    public boolean zza(zzalh.zza zzaVar) {
        return zzaVar != zzalh.zza.VALUE;
    }

    @Override // com.google.android.gms.internal.zzajl
    public boolean zzc(zzajl zzajlVar) {
        return (zzajlVar instanceof zzajg) && ((zzajg) zzajlVar).bcX.equals(this.bcX);
    }

    @Override // com.google.android.gms.internal.zzajl
    public zzall zzcud() {
        return this.bcY;
    }
}
