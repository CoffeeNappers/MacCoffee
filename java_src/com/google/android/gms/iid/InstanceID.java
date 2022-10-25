package com.google.android.gms.iid;

import android.content.Context;
import android.content.pm.PackageManager;
import android.os.Bundle;
import android.os.Looper;
import android.util.Base64;
import android.util.Log;
import com.facebook.appevents.AppEventsConstants;
import com.google.android.c2dm.C2DMessaging;
import com.vkontakte.android.data.ServerKeys;
import java.io.IOException;
import java.security.KeyPair;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
import java.util.Map;
import org.slf4j.Marker;
/* loaded from: classes2.dex */
public class InstanceID {
    public static final String ERROR_BACKOFF = "RETRY_LATER";
    public static final String ERROR_MAIN_THREAD = "MAIN_THREAD";
    public static final String ERROR_MISSING_INSTANCEID_SERVICE = "MISSING_INSTANCEID_SERVICE";
    public static final String ERROR_SERVICE_NOT_AVAILABLE = "SERVICE_NOT_AVAILABLE";
    public static final String ERROR_TIMEOUT = "TIMEOUT";
    static Map<String, InstanceID> aic = new HashMap();
    private static zzd aid;
    private static zzc aie;
    static String aii;
    KeyPair aif;
    String aig;
    long aih;
    Context mContext;

    protected InstanceID(Context context, String str, Bundle bundle) {
        this.aig = "";
        this.mContext = context.getApplicationContext();
        this.aig = str;
    }

    public static InstanceID getInstance(Context context) {
        return zza(context, null);
    }

    public static synchronized InstanceID zza(Context context, Bundle bundle) {
        InstanceID instanceID;
        synchronized (InstanceID.class) {
            String string = bundle == null ? "" : bundle.getString("subtype");
            String str = string == null ? "" : string;
            Context applicationContext = context.getApplicationContext();
            if (aid == null) {
                aid = new zzd(applicationContext);
                aie = new zzc(applicationContext);
            }
            aii = Integer.toString(zzdd(applicationContext));
            instanceID = aic.get(str);
            if (instanceID == null) {
                instanceID = new InstanceID(applicationContext, str, bundle);
                aic.put(str, instanceID);
            }
        }
        return instanceID;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static String zza(KeyPair keyPair) {
        try {
            byte[] digest = MessageDigest.getInstance("SHA1").digest(keyPair.getPublic().getEncoded());
            digest[0] = (byte) (((digest[0] & 15) + 112) & 255);
            return Base64.encodeToString(digest, 0, 8, 11);
        } catch (NoSuchAlgorithmException e) {
            Log.w("InstanceID", "Unexpected error, device missing required alghorithms");
            return null;
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static int zzdd(Context context) {
        try {
            return context.getPackageManager().getPackageInfo(context.getPackageName(), 0).versionCode;
        } catch (PackageManager.NameNotFoundException e) {
            String valueOf = String.valueOf(e);
            Log.w("InstanceID", new StringBuilder(String.valueOf(valueOf).length() + 38).append("Never happens: can't find own package ").append(valueOf).toString());
            return 0;
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static String zzde(Context context) {
        try {
            return context.getPackageManager().getPackageInfo(context.getPackageName(), 0).versionName;
        } catch (PackageManager.NameNotFoundException e) {
            String valueOf = String.valueOf(e);
            Log.w("InstanceID", new StringBuilder(String.valueOf(valueOf).length() + 38).append("Never happens: can't find own package ").append(valueOf).toString());
            return null;
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static String zzv(byte[] bArr) {
        return Base64.encodeToString(bArr, 11);
    }

    public void deleteInstanceID() throws IOException {
        zzb(Marker.ANY_MARKER, Marker.ANY_MARKER, null);
        zzboj();
    }

    public void deleteToken(String str, String str2) throws IOException {
        zzb(str, str2, null);
    }

    public long getCreationTime() {
        String str;
        if (this.aih == 0 && (str = aid.get(this.aig, "cre")) != null) {
            this.aih = Long.parseLong(str);
        }
        return this.aih;
    }

    public String getId() {
        return zza(zzboi());
    }

    public String getToken(String str, String str2) throws IOException {
        return getToken(str, str2, null);
    }

    public String getToken(String str, String str2, Bundle bundle) throws IOException {
        boolean z = false;
        if (Looper.getMainLooper() == Looper.myLooper()) {
            throw new IOException("MAIN_THREAD");
        }
        boolean z2 = true;
        String zzh = zzbom() ? null : aid.zzh(this.aig, str, str2);
        if (zzh == null) {
            if (bundle == null) {
                bundle = new Bundle();
            }
            if (bundle.getString("ttl") != null) {
                z2 = false;
            }
            if (!"jwt".equals(bundle.getString(ServerKeys.TYPE))) {
                z = z2;
            }
            zzh = zzc(str, str2, bundle);
            if (zzh != null && z) {
                aid.zza(this.aig, str, str2, zzh, aii);
            }
        }
        return zzh;
    }

    public void zzb(String str, String str2, Bundle bundle) throws IOException {
        if (Looper.getMainLooper() == Looper.myLooper()) {
            throw new IOException("MAIN_THREAD");
        }
        aid.zzi(this.aig, str, str2);
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
        aie.zzt(aie.zza(bundle, zzboi()));
    }

    KeyPair zzboi() {
        if (this.aif == null) {
            this.aif = aid.zzks(this.aig);
        }
        if (this.aif == null) {
            this.aih = System.currentTimeMillis();
            this.aif = aid.zze(this.aig, this.aih);
        }
        return this.aif;
    }

    public void zzboj() {
        this.aih = 0L;
        aid.zzkt(this.aig);
        this.aif = null;
    }

    public zzd zzbok() {
        return aid;
    }

    public zzc zzbol() {
        return aie;
    }

    boolean zzbom() {
        String str;
        String str2 = aid.get("appVersion");
        if (str2 == null || !str2.equals(aii) || (str = aid.get("lastToken")) == null) {
            return true;
        }
        return (System.currentTimeMillis() / 1000) - Long.valueOf(Long.parseLong(str)).longValue() > 604800;
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
        return aie.zzt(aie.zza(bundle, zzboi()));
    }
}
