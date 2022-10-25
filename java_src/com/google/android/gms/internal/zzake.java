package com.google.android.gms.internal;
/* loaded from: classes2.dex */
public class zzake {
    private final zzajq aZr;
    private final long bfM;
    private final zzaml bfN;
    private final zzajh bfO;
    private final boolean bfP;

    public zzake(long j, zzajq zzajqVar, zzajh zzajhVar) {
        this.bfM = j;
        this.aZr = zzajqVar;
        this.bfN = null;
        this.bfO = zzajhVar;
        this.bfP = true;
    }

    public zzake(long j, zzajq zzajqVar, zzaml zzamlVar, boolean z) {
        this.bfM = j;
        this.aZr = zzajqVar;
        this.bfN = zzamlVar;
        this.bfO = null;
        this.bfP = z;
    }

    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || getClass() != obj.getClass()) {
            return false;
        }
        zzake zzakeVar = (zzake) obj;
        if (this.bfM == zzakeVar.bfM && this.aZr.equals(zzakeVar.aZr) && this.bfP == zzakeVar.bfP) {
            if (this.bfN == null ? zzakeVar.bfN != null : !this.bfN.equals(zzakeVar.bfN)) {
                return false;
            }
            if (this.bfO != null) {
                if (this.bfO.equals(zzakeVar.bfO)) {
                    return true;
                }
            } else if (zzakeVar.bfO == null) {
                return true;
            }
            return false;
        }
        return false;
    }

    public int hashCode() {
        int i = 0;
        int hashCode = ((this.bfN != null ? this.bfN.hashCode() : 0) + (((((Long.valueOf(this.bfM).hashCode() * 31) + Boolean.valueOf(this.bfP).hashCode()) * 31) + this.aZr.hashCode()) * 31)) * 31;
        if (this.bfO != null) {
            i = this.bfO.hashCode();
        }
        return hashCode + i;
    }

    public boolean isVisible() {
        return this.bfP;
    }

    public String toString() {
        long j = this.bfM;
        String valueOf = String.valueOf(this.aZr);
        boolean z = this.bfP;
        String valueOf2 = String.valueOf(this.bfN);
        String valueOf3 = String.valueOf(this.bfO);
        return new StringBuilder(String.valueOf(valueOf).length() + 78 + String.valueOf(valueOf2).length() + String.valueOf(valueOf3).length()).append("UserWriteRecord{id=").append(j).append(" path=").append(valueOf).append(" visible=").append(z).append(" overwrite=").append(valueOf2).append(" merge=").append(valueOf3).append("}").toString();
    }

    public zzajq zzcrc() {
        return this.aZr;
    }

    public long zzcwd() {
        return this.bfM;
    }

    public zzaml zzcwe() {
        if (this.bfN == null) {
            throw new IllegalArgumentException("Can't access overwrite when write is a merge!");
        }
        return this.bfN;
    }

    public zzajh zzcwf() {
        if (this.bfO == null) {
            throw new IllegalArgumentException("Can't access merge when write is an overwrite!");
        }
        return this.bfO;
    }

    public boolean zzcwg() {
        return this.bfN != null;
    }
}
