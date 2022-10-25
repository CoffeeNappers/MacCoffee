package com.google.firebase.iid;

import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.os.Bundle;
import android.support.annotation.Keep;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.annotation.WorkerThread;
import android.support.v4.util.ArrayMap;
import android.util.Base64;
import android.util.Log;
import com.google.firebase.FirebaseApp;
import com.google.firebase.iid.zzg;
import java.io.IOException;
import java.security.KeyPair;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Map;
import org.slf4j.Marker;
/* loaded from: classes2.dex */
public class FirebaseInstanceId {
    private static Map<String, FirebaseInstanceId> aic = new ArrayMap();
    private static zze bkA;
    private final FirebaseApp bkB;
    private final zzd bkC;
    private final String bkD = D();

    private FirebaseInstanceId(FirebaseApp firebaseApp, zzd zzdVar) {
        this.bkB = firebaseApp;
        this.bkC = zzdVar;
        if (this.bkD == null) {
            throw new IllegalStateException("IID failing to initialize, FirebaseApp is missing project ID");
        }
        FirebaseInstanceIdService.zza(this.bkB.getApplicationContext(), this);
    }

    public static FirebaseInstanceId getInstance() {
        return getInstance(FirebaseApp.getInstance());
    }

    @Keep
    public static synchronized FirebaseInstanceId getInstance(@NonNull FirebaseApp firebaseApp) {
        FirebaseInstanceId firebaseInstanceId;
        synchronized (FirebaseInstanceId.class) {
            firebaseInstanceId = aic.get(firebaseApp.getOptions().getApplicationId());
            if (firebaseInstanceId == null) {
                zzd zzb = zzd.zzb(firebaseApp.getApplicationContext(), null);
                if (bkA == null) {
                    bkA = new zze(zzb.J());
                }
                firebaseInstanceId = new FirebaseInstanceId(firebaseApp, zzb);
                aic.put(firebaseApp.getOptions().getApplicationId(), firebaseInstanceId);
            }
        }
        return firebaseInstanceId;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static String zza(KeyPair keyPair) {
        try {
            byte[] digest = MessageDigest.getInstance("SHA1").digest(keyPair.getPublic().getEncoded());
            digest[0] = (byte) (((digest[0] & 15) + 112) & 255);
            return Base64.encodeToString(digest, 0, 8, 11);
        } catch (NoSuchAlgorithmException e) {
            Log.w("FirebaseInstanceId", "Unexpected error, device missing required alghorithms");
            return null;
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static void zza(Context context, zzg zzgVar) {
        zzgVar.zzbop();
        Intent intent = new Intent();
        intent.putExtra("CMD", "RST");
        context.sendBroadcast(FirebaseInstanceIdInternalReceiver.zzf(context, intent));
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static int zzaj(Context context, String str) {
        try {
            return context.getPackageManager().getPackageInfo(str, 0).versionCode;
        } catch (PackageManager.NameNotFoundException e) {
            String valueOf = String.valueOf(e);
            Log.w("FirebaseInstanceId", new StringBuilder(String.valueOf(valueOf).length() + 23).append("Failed to find package ").append(valueOf).toString());
            return 0;
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static String zzde(Context context) {
        try {
            return context.getPackageManager().getPackageInfo(context.getPackageName(), 0).versionName;
        } catch (PackageManager.NameNotFoundException e) {
            String valueOf = String.valueOf(e);
            Log.w("FirebaseInstanceId", new StringBuilder(String.valueOf(valueOf).length() + 38).append("Never happens: can't find own package ").append(valueOf).toString());
            return null;
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static void zzdf(Context context) {
        Intent intent = new Intent();
        intent.setPackage(context.getPackageName());
        intent.putExtra("CMD", "SYNC");
        context.sendBroadcast(FirebaseInstanceIdInternalReceiver.zzf(context, intent));
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static String zzep(Context context) {
        return getInstance().bkB.getOptions().getApplicationId();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static int zzeq(Context context) {
        return zzaj(context, context.getPackageName());
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static String zzv(byte[] bArr) {
        return Base64.encodeToString(bArr, 11);
    }

    String D() {
        String gcmSenderId = this.bkB.getOptions().getGcmSenderId();
        if (gcmSenderId != null) {
            return gcmSenderId;
        }
        String applicationId = this.bkB.getOptions().getApplicationId();
        if (!applicationId.startsWith("1:")) {
            return applicationId;
        }
        String[] split = applicationId.split(":");
        if (split.length < 2) {
            return null;
        }
        String str = split[1];
        if (!str.isEmpty()) {
            return str;
        }
        return null;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    @Nullable
    public zzg.zza E() {
        return this.bkC.J().zzq("", this.bkD, Marker.ANY_MARKER);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public String F() throws IOException {
        return getToken(this.bkD, Marker.ANY_MARKER);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public zze G() {
        return bkA;
    }

    public void deleteInstanceId() throws IOException {
        this.bkC.zzb(Marker.ANY_MARKER, Marker.ANY_MARKER, null);
        this.bkC.zzboj();
    }

    @WorkerThread
    public void deleteToken(String str, String str2) throws IOException {
        this.bkC.zzb(str, str2, null);
    }

    public long getCreationTime() {
        return this.bkC.getCreationTime();
    }

    public String getId() {
        return zza(this.bkC.zzboi());
    }

    @Nullable
    public String getToken() {
        zzg.zza E = E();
        if (E == null || E.zzty(zzd.aii)) {
            FirebaseInstanceIdService.zzer(this.bkB.getApplicationContext());
        }
        if (E != null) {
            return E.axH;
        }
        return null;
    }

    @WorkerThread
    public String getToken(String str, String str2) throws IOException {
        return this.bkC.getToken(str, str2, null);
    }

    public void zztq(String str) {
        bkA.zztq(str);
        FirebaseInstanceIdService.zzer(this.bkB.getApplicationContext());
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void zztr(String str) throws IOException {
        if (getToken() == null) {
            throw new IOException("token not available");
        }
        Bundle bundle = new Bundle();
        String valueOf = String.valueOf("/topics/");
        String valueOf2 = String.valueOf(str);
        bundle.putString("gcm.topic", valueOf2.length() != 0 ? valueOf.concat(valueOf2) : new String(valueOf));
        zzd zzdVar = this.bkC;
        String token = getToken();
        String valueOf3 = String.valueOf("/topics/");
        String valueOf4 = String.valueOf(str);
        zzdVar.getToken(token, valueOf4.length() != 0 ? valueOf3.concat(valueOf4) : new String(valueOf3), bundle);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void zzts(String str) throws IOException {
        if (getToken() == null) {
            throw new IOException("token not available");
        }
        Bundle bundle = new Bundle();
        String valueOf = String.valueOf("/topics/");
        String valueOf2 = String.valueOf(str);
        bundle.putString("gcm.topic", valueOf2.length() != 0 ? valueOf.concat(valueOf2) : new String(valueOf));
        zzd zzdVar = this.bkC;
        String token = getToken();
        String valueOf3 = String.valueOf("/topics/");
        String valueOf4 = String.valueOf(str);
        zzdVar.zzb(token, valueOf4.length() != 0 ? valueOf3.concat(valueOf4) : new String(valueOf3), bundle);
    }
}
