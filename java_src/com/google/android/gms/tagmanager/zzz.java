package com.google.android.gms.tagmanager;

import android.util.Log;
/* loaded from: classes2.dex */
public class zzz implements zzbp {
    private int ee = 5;

    @Override // com.google.android.gms.tagmanager.zzbp
    public void e(String str) {
        if (this.ee <= 6) {
            Log.e("GoogleTagManager", str);
        }
    }

    @Override // com.google.android.gms.tagmanager.zzbp
    public void setLogLevel(int i) {
        this.ee = i;
    }

    @Override // com.google.android.gms.tagmanager.zzbp
    public void v(String str) {
        if (this.ee <= 2) {
            Log.v("GoogleTagManager", str);
        }
    }

    @Override // com.google.android.gms.tagmanager.zzbp
    public void zzb(String str, Throwable th) {
        if (this.ee <= 6) {
            Log.e("GoogleTagManager", str, th);
        }
    }

    @Override // com.google.android.gms.tagmanager.zzbp
    public void zzc(String str, Throwable th) {
        if (this.ee <= 5) {
            Log.w("GoogleTagManager", str, th);
        }
    }

    @Override // com.google.android.gms.tagmanager.zzbp
    public void zzdg(String str) {
        if (this.ee <= 3) {
            Log.d("GoogleTagManager", str);
        }
    }

    @Override // com.google.android.gms.tagmanager.zzbp
    public void zzdh(String str) {
        if (this.ee <= 4) {
            Log.i("GoogleTagManager", str);
        }
    }

    @Override // com.google.android.gms.tagmanager.zzbp
    public void zzdi(String str) {
        if (this.ee <= 5) {
            Log.w("GoogleTagManager", str);
        }
    }
}
