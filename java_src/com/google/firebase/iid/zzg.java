package com.google.firebase.iid;

import android.content.Context;
import android.content.SharedPreferences;
import android.text.TextUtils;
import android.util.Base64;
import android.util.Log;
import com.google.android.gms.common.util.zzw;
import com.vkontakte.android.fragments.AuthCheckFragment;
import io.sentry.marshaller.json.JsonMarshaller;
import java.io.File;
import java.io.IOException;
import java.security.KeyFactory;
import java.security.KeyPair;
import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;
import java.security.spec.PKCS8EncodedKeySpec;
import java.security.spec.X509EncodedKeySpec;
import java.util.concurrent.TimeUnit;
import org.json.JSONException;
import org.json.JSONObject;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes2.dex */
public class zzg {
    SharedPreferences aiG;
    Context zzahs;

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes2.dex */
    public static class zza {
        private static final long bkQ = TimeUnit.DAYS.toMillis(7);
        final String aii;
        final String axH;
        final long timestamp;

        private zza(String str, String str2, long j) {
            this.axH = str;
            this.aii = str2;
            this.timestamp = j;
        }

        static String zzc(String str, String str2, long j) {
            try {
                JSONObject jSONObject = new JSONObject();
                jSONObject.put(AuthCheckFragment.KEY_TOKEN, str);
                jSONObject.put("appVersion", str2);
                jSONObject.put(JsonMarshaller.TIMESTAMP, j);
                return jSONObject.toString();
            } catch (JSONException e) {
                String valueOf = String.valueOf(e);
                Log.w("InstanceID/Store", new StringBuilder(String.valueOf(valueOf).length() + 24).append("Failed to encode token: ").append(valueOf).toString());
                return null;
            }
        }

        static zza zztx(String str) {
            if (TextUtils.isEmpty(str)) {
                return null;
            }
            if (!str.startsWith("{")) {
                return new zza(str, null, 0L);
            }
            try {
                JSONObject jSONObject = new JSONObject(str);
                return new zza(jSONObject.getString(AuthCheckFragment.KEY_TOKEN), jSONObject.getString("appVersion"), jSONObject.getLong(JsonMarshaller.TIMESTAMP));
            } catch (JSONException e) {
                String valueOf = String.valueOf(e);
                Log.w("InstanceID/Store", new StringBuilder(String.valueOf(valueOf).length() + 23).append("Failed to parse token: ").append(valueOf).toString());
                return null;
            }
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public boolean zzty(String str) {
            return System.currentTimeMillis() > this.timestamp + bkQ || !str.equals(this.aii);
        }
    }

    public zzg(Context context) {
        this(context, "com.google.android.gms.appid");
    }

    public zzg(Context context, String str) {
        this.zzahs = context;
        this.aiG = context.getSharedPreferences(str, 4);
        String valueOf = String.valueOf(str);
        String valueOf2 = String.valueOf("-no-backup");
        zzkq(valueOf2.length() != 0 ? valueOf.concat(valueOf2) : new String(valueOf));
    }

    private String zzbu(String str, String str2) {
        String valueOf = String.valueOf("|S|");
        return new StringBuilder(String.valueOf(str).length() + 0 + String.valueOf(valueOf).length() + String.valueOf(str2).length()).append(str).append(valueOf).append(str2).toString();
    }

    private void zzkq(String str) {
        File file = new File(zzw.getNoBackupFilesDir(this.zzahs), str);
        if (file.exists()) {
            return;
        }
        try {
            if (!file.createNewFile() || isEmpty()) {
                return;
            }
            Log.i("InstanceID/Store", "App restored, clearing state");
            FirebaseInstanceId.zza(this.zzahs, this);
        } catch (IOException e) {
            if (!Log.isLoggable("InstanceID/Store", 3)) {
                return;
            }
            String valueOf = String.valueOf(e.getMessage());
            Log.d("InstanceID/Store", valueOf.length() != 0 ? "Error creating file in no backup dir: ".concat(valueOf) : new String("Error creating file in no backup dir: "));
        }
    }

    private void zzkr(String str) {
        SharedPreferences.Editor edit = this.aiG.edit();
        for (String str2 : this.aiG.getAll().keySet()) {
            if (str2.startsWith(str)) {
                edit.remove(str2);
            }
        }
        edit.commit();
    }

    private String zzp(String str, String str2, String str3) {
        String valueOf = String.valueOf("|T|");
        return new StringBuilder(String.valueOf(str).length() + 1 + String.valueOf(valueOf).length() + String.valueOf(str2).length() + String.valueOf(str3).length()).append(str).append(valueOf).append(str2).append("|").append(str3).toString();
    }

    public SharedPreferences M() {
        return this.aiG;
    }

    public synchronized boolean isEmpty() {
        return this.aiG.getAll().isEmpty();
    }

    public synchronized void zza(String str, String str2, String str3, String str4, String str5) {
        String zzc = zza.zzc(str4, str5, System.currentTimeMillis());
        if (zzc != null) {
            SharedPreferences.Editor edit = this.aiG.edit();
            edit.putString(zzp(str, str2, str3), zzc);
            edit.commit();
        }
    }

    public synchronized void zzbop() {
        this.aiG.edit().clear().commit();
    }

    public synchronized void zzi(String str, String str2, String str3) {
        String zzp = zzp(str, str2, str3);
        SharedPreferences.Editor edit = this.aiG.edit();
        edit.remove(zzp);
        edit.commit();
    }

    public synchronized KeyPair zzks(String str) {
        KeyPair keyPair;
        String string = this.aiG.getString(zzbu(str, "|P|"), null);
        String string2 = this.aiG.getString(zzbu(str, "|K|"), null);
        if (string == null || string2 == null) {
            keyPair = null;
        } else {
            try {
                byte[] decode = Base64.decode(string, 8);
                byte[] decode2 = Base64.decode(string2, 8);
                KeyFactory keyFactory = KeyFactory.getInstance("RSA");
                keyPair = new KeyPair(keyFactory.generatePublic(new X509EncodedKeySpec(decode)), keyFactory.generatePrivate(new PKCS8EncodedKeySpec(decode2)));
            } catch (NoSuchAlgorithmException | InvalidKeySpecException e) {
                String valueOf = String.valueOf(e);
                Log.w("InstanceID/Store", new StringBuilder(String.valueOf(valueOf).length() + 19).append("Invalid key stored ").append(valueOf).toString());
                FirebaseInstanceId.zza(this.zzahs, this);
                keyPair = null;
            }
        }
        return keyPair;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public synchronized void zzkt(String str) {
        zzkr(String.valueOf(str).concat("|"));
    }

    public synchronized void zzku(String str) {
        zzkr(String.valueOf(str).concat("|T|"));
    }

    public synchronized zza zzq(String str, String str2, String str3) {
        return zza.zztx(this.aiG.getString(zzp(str, str2, str3), null));
    }

    public synchronized long zztv(String str) {
        long parseLong;
        String string = this.aiG.getString(zzbu(str, "cre"), null);
        if (string != null) {
            try {
                parseLong = Long.parseLong(string);
            } catch (NumberFormatException e) {
            }
        }
        parseLong = 0;
        return parseLong;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public synchronized KeyPair zztw(String str) {
        KeyPair zzboh;
        zzboh = com.google.firebase.iid.zza.zzboh();
        long currentTimeMillis = System.currentTimeMillis();
        SharedPreferences.Editor edit = this.aiG.edit();
        edit.putString(zzbu(str, "|P|"), FirebaseInstanceId.zzv(zzboh.getPublic().getEncoded()));
        edit.putString(zzbu(str, "|K|"), FirebaseInstanceId.zzv(zzboh.getPrivate().getEncoded()));
        edit.putString(zzbu(str, "cre"), Long.toString(currentTimeMillis));
        edit.commit();
        return zzboh;
    }
}