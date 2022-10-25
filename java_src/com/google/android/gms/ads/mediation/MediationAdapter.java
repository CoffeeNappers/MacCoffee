package com.google.android.gms.ads.mediation;

import android.os.Bundle;
/* loaded from: classes.dex */
public interface MediationAdapter {

    /* loaded from: classes.dex */
    public static class zza {
        private int P;

        public zza zzbk(int i) {
            this.P = i;
            return this;
        }

        public Bundle zzys() {
            Bundle bundle = new Bundle();
            bundle.putInt("capabilities", this.P);
            return bundle;
        }
    }

    void onDestroy();

    void onPause();

    void onResume();
}
