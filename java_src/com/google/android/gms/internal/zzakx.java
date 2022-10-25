package com.google.android.gms.internal;
/* loaded from: classes2.dex */
public class zzakx {
    public final zzall bgL;
    public final long bgM;
    public final boolean bgN;
    public final boolean bgO;
    public final long id;

    public zzakx(long j, zzall zzallVar, long j2, boolean z, boolean z2) {
        this.id = j;
        if (!zzallVar.zzcye() || zzallVar.isDefault()) {
            this.bgL = zzallVar;
            this.bgM = j2;
            this.bgN = z;
            this.bgO = z2;
            return;
        }
        throw new IllegalArgumentException("Can't create TrackedQuery for a non-default query that loads all data");
    }

    public boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (obj == null || obj.getClass() != getClass()) {
            return false;
        }
        zzakx zzakxVar = (zzakx) obj;
        return this.id == zzakxVar.id && this.bgL.equals(zzakxVar.bgL) && this.bgM == zzakxVar.bgM && this.bgN == zzakxVar.bgN && this.bgO == zzakxVar.bgO;
    }

    public int hashCode() {
        return (((((((Long.valueOf(this.id).hashCode() * 31) + this.bgL.hashCode()) * 31) + Long.valueOf(this.bgM).hashCode()) * 31) + Boolean.valueOf(this.bgN).hashCode()) * 31) + Boolean.valueOf(this.bgO).hashCode();
    }

    public String toString() {
        long j = this.id;
        String valueOf = String.valueOf(this.bgL);
        long j2 = this.bgM;
        boolean z = this.bgN;
        return new StringBuilder(String.valueOf(valueOf).length() + 109).append("TrackedQuery{id=").append(j).append(", querySpec=").append(valueOf).append(", lastUse=").append(j2).append(", complete=").append(z).append(", active=").append(this.bgO).append("}").toString();
    }

    public zzakx zzcm(long j) {
        return new zzakx(this.id, this.bgL, j, this.bgN, this.bgO);
    }

    public zzakx zzcxa() {
        return new zzakx(this.id, this.bgL, this.bgM, true, this.bgO);
    }

    public zzakx zzdc(boolean z) {
        return new zzakx(this.id, this.bgL, this.bgM, this.bgN, z);
    }
}
