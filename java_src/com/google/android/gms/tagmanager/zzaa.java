package com.google.android.gms.tagmanager;

import android.content.Context;
/* loaded from: classes2.dex */
public class zzaa implements zzat {
    private static final Object aDL = new Object();
    private static zzaa aFa;
    private zzcl aEo;
    private zzau aFb;

    private zzaa(Context context) {
        this(zzav.zzee(context), new zzda());
    }

    zzaa(zzau zzauVar, zzcl zzclVar) {
        this.aFb = zzauVar;
        this.aEo = zzclVar;
    }

    public static zzat zzdx(Context context) {
        zzaa zzaaVar;
        synchronized (aDL) {
            if (aFa == null) {
                aFa = new zzaa(context);
            }
            zzaaVar = aFa;
        }
        return zzaaVar;
    }

    @Override // com.google.android.gms.tagmanager.zzat
    public boolean zzpg(String str) {
        if (!this.aEo.zzagf()) {
            zzbo.zzdi("Too many urls sent too quickly with the TagManagerSender, rate limiting invoked.");
            return false;
        }
        this.aFb.zzpk(str);
        return true;
    }
}
