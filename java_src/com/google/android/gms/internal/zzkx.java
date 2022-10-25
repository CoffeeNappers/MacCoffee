package com.google.android.gms.internal;

import android.util.Log;
import com.google.ads.AdRequest;
@zzji
/* loaded from: classes.dex */
public final class zzkx extends com.google.android.gms.ads.internal.util.client.zzb {
    public static void v(String str) {
        if (zzvo()) {
            Log.v(AdRequest.LOGTAG, str);
        }
    }

    public static boolean zzvn() {
        return zzdr.zzbgr.get().booleanValue();
    }

    public static boolean zzvo() {
        return zzbi(2) && zzvn();
    }
}
