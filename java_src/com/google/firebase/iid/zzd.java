package com.google.firebase.iid;

import android.content.Context;
import android.os.Bundle;
import android.os.Looper;
import com.facebook.appevents.AppEventsConstants;
import com.google.android.c2dm.C2DMessaging;
import com.google.firebase.iid.zzg;
import com.vkontakte.android.data.ServerKeys;
import java.io.IOException;
import java.security.KeyPair;
import java.util.HashMap;
import java.util.Map;
/* loaded from: classes2.dex */
public class zzd {
    static Map<String, zzd> aic = new HashMap();
    static String aii;
    private static zzg bkM;
    private static zzf bkN;
    KeyPair aif;
    String aig;
    Context mContext;

    protected zzd(Context context, String str, Bundle bundle) {
        this.aig = "";
        this.mContext = context.getApplicationContext();
        this.aig = str;
    }

    public static synchronized zzd zzb(Context context, Bundle bundle) {
        zzd zzdVar;
        synchronized (zzd.class) {
            String string = bundle == null ? "" : bundle.getString("subtype");
            String str = string == null ? "" : string;
            Context applicationContext = context.getApplicationContext();
            if (bkM == null) {
                bkM = new zzg(applicationContext);
                bkN = new zzf(applicationContext);
            }
            aii = Integer.toString(FirebaseInstanceId.zzeq(applicationContext));
            zzdVar = aic.get(str);
            if (zzdVar == null) {
                zzdVar = new zzd(applicationContext, str, bundle);
                aic.put(str, zzdVar);
            }
        }
        return zzdVar;
    }

    public zzg J() {
        return bkM;
    }

    public zzf K() {
        return bkN;
    }

    public long getCreationTime() {
        return bkM.zztv(this.aig);
    }

    public String getToken(String str, String str2, Bundle bundle) throws IOException {
        if (Looper.getMainLooper() == Looper.myLooper()) {
            throw new IOException("MAIN_THREAD");
        }
        if (bundle == null) {
            bundle = new Bundle();
        }
        boolean z = true;
        if (bundle.getString("ttl") != null || "jwt".equals(bundle.getString(ServerKeys.TYPE))) {
            z = false;
        } else {
            zzg.zza zzq = bkM.zzq(this.aig, str, str2);
            if (zzq != null && !zzq.zzty(aii)) {
                return zzq.axH;
            }
        }
        String zzc = zzc(str, str2, bundle);
        if (zzc == null || !z) {
            return zzc;
        }
        bkM.zza(this.aig, str, str2, zzc, aii);
        return zzc;
    }

    public void zzb(String str, String str2, Bundle bundle) throws IOException {
        if (Looper.getMainLooper() == Looper.myLooper()) {
            throw new IOException("MAIN_THREAD");
        }
        bkM.zzi(this.aig, str, str2);
        if (bundle == null) {
            bundle = new Bundle();
        }
        bundle.putString(C2DMessaging.EXTRA_SENDER, str);
        if (str2 != null) {
            bundle.putString("scope", str2);
        }
        bundle.putString("subscription", str);
        bundle.putString("delete", AppEventsConstants.EVENT_PARAM_VALUE_YES);
        bundle.putString("X-delete", AppEventsConstants.EVENT_PARAM_VALUE_YES);
        bundle.putString("subtype", "".equals(this.aig) ? str : this.aig);
        if (!"".equals(this.aig)) {
            str = this.aig;
        }
        bundle.putString("X-subtype", str);
        bkN.zzt(bkN.zza(bundle, zzboi()));
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public KeyPair zzboi() {
        if (this.aif == null) {
            this.aif = bkM.zzks(this.aig);
        }
        if (this.aif == null) {
            this.aif = bkM.zztw(this.aig);
        }
        return this.aif;
    }

    public void zzboj() {
        bkM.zzkt(this.aig);
        this.aif = null;
    }

    public String zzc(String str, String str2, Bundle bundle) throws IOException {
        if (str2 != null) {
            bundle.putString("scope", str2);
        }
        bundle.putString(C2DMessaging.EXTRA_SENDER, str);
        String str3 = "".equals(this.aig) ? str : this.aig;
        if (!bundle.containsKey("legacy.register")) {
            bundle.putString("subscription", str);
            bundle.putString("subtype", str3);
            bundle.putString("X-subscription", str);
            bundle.putString("X-subtype", str3);
        }
        return bkN.zzt(bkN.zza(bundle, zzboi()));
    }
}
