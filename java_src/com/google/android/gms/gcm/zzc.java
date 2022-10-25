package com.google.android.gms.gcm;

import android.os.Bundle;
/* loaded from: classes2.dex */
public class zzc {
    public static final zzc aho = new zzc(0, 30, 3600);
    public static final zzc ahp = new zzc(1, 30, 3600);
    private final int ahq;
    private final int ahr;
    private final int ahs;

    private zzc(int i, int i2, int i3) {
        this.ahq = i;
        this.ahr = i2;
        this.ahs = i3;
    }

    public boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (!(obj instanceof zzc)) {
            return false;
        }
        zzc zzcVar = (zzc) obj;
        return zzcVar.ahq == this.ahq && zzcVar.ahr == this.ahr && zzcVar.ahs == this.ahs;
    }

    public int hashCode() {
        return (((((this.ahq + 1) ^ 1000003) * 1000003) ^ this.ahr) * 1000003) ^ this.ahs;
    }

    public String toString() {
        int i = this.ahq;
        int i2 = this.ahr;
        return new StringBuilder(74).append("policy=").append(i).append(" initial_backoff=").append(i2).append(" maximum_backoff=").append(this.ahs).toString();
    }

    public Bundle zzaj(Bundle bundle) {
        bundle.putInt("retry_policy", this.ahq);
        bundle.putInt("initial_backoff_seconds", this.ahr);
        bundle.putInt("maximum_backoff_seconds", this.ahs);
        return bundle;
    }

    public int zzbnv() {
        return this.ahq;
    }

    public int zzbnw() {
        return this.ahr;
    }

    public int zzbnx() {
        return this.ahs;
    }
}