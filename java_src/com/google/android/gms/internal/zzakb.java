package com.google.android.gms.internal;
/* loaded from: classes2.dex */
public class zzakb {
    private final long bfG;

    public zzakb(long j) {
        this.bfG = j;
    }

    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || getClass() != obj.getClass()) {
            return false;
        }
        return this.bfG == ((zzakb) obj).bfG;
    }

    public int hashCode() {
        return (int) (this.bfG ^ (this.bfG >>> 32));
    }

    public String toString() {
        return new StringBuilder(35).append("Tag{tagNumber=").append(this.bfG).append("}").toString();
    }

    public long zzcwc() {
        return this.bfG;
    }
}
