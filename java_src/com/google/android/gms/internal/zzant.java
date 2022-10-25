package com.google.android.gms.internal;

import android.support.annotation.Nullable;
import com.vkontakte.android.fragments.AuthCheckFragment;
/* loaded from: classes2.dex */
public class zzant {
    private String hN;

    public zzant(@Nullable String str) {
        this.hN = str;
    }

    public boolean equals(Object obj) {
        if (!(obj instanceof zzant)) {
            return false;
        }
        return com.google.android.gms.common.internal.zzz.equal(this.hN, ((zzant) obj).hN);
    }

    @Nullable
    public String getToken() {
        return this.hN;
    }

    public int hashCode() {
        return com.google.android.gms.common.internal.zzz.hashCode(this.hN);
    }

    public String toString() {
        return com.google.android.gms.common.internal.zzz.zzx(this).zzg(AuthCheckFragment.KEY_TOKEN, this.hN).toString();
    }
}
