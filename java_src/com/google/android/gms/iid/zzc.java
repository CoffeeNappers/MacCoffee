package com.google.android.gms.iid;

import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageManager;
import android.content.pm.ResolveInfo;
import android.os.Build;
import android.os.Bundle;
import android.os.ConditionVariable;
import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import android.os.Messenger;
import android.os.Parcelable;
import android.os.Process;
import android.os.RemoteException;
import android.os.SystemClock;
import android.text.TextUtils;
import android.util.Log;
import com.facebook.appevents.AppEventsConstants;
import com.google.android.c2dm.C2DMBaseReceiver;
import com.google.android.c2dm.C2DMessaging;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.security.GeneralSecurityException;
import java.security.KeyPair;
import java.security.PrivateKey;
import java.security.Signature;
import java.security.interfaces.RSAPrivateKey;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;
/* loaded from: classes2.dex */
public class zzc {
    static String ait = null;
    static int aiu = 0;
    static int aiv = 0;
    static int aiw = 0;
    PendingIntent ahc;
    Messenger ahg;
    long aiA;
    long aiB;
    int aiC;
    int aiD;
    long aiE;
    Map<String, Object> aix = new HashMap();
    Messenger aiy;
    MessengerCompat aiz;
    Context zzahs;

    public zzc(Context context) {
        this.zzahs = context;
    }

    static String zza(KeyPair keyPair, String... strArr) {
        try {
            byte[] bytes = TextUtils.join("\n", strArr).getBytes("UTF-8");
            try {
                PrivateKey privateKey = keyPair.getPrivate();
                Signature signature = Signature.getInstance(privateKey instanceof RSAPrivateKey ? "SHA256withRSA" : "SHA256withECDSA");
                signature.initSign(privateKey);
                signature.update(bytes);
                return InstanceID.zzv(signature.sign());
            } catch (GeneralSecurityException e) {
                Log.e("InstanceID/Rpc", "Unable to sign registration request", e);
                return null;
            }
        } catch (UnsupportedEncodingException e2) {
            Log.e("InstanceID/Rpc", "Unable to encode string", e2);
            return null;
        }
    }

    private void zzai(Object obj) {
        synchronized (getClass()) {
            for (String str : this.aix.keySet()) {
                Object obj2 = this.aix.get(str);
                this.aix.put(str, obj);
                zzh(obj2, obj);
            }
        }
    }

    private Intent zzb(Bundle bundle, KeyPair keyPair) throws IOException {
        Intent intent;
        ConditionVariable conditionVariable = new ConditionVariable();
        String zzboo = zzboo();
        synchronized (getClass()) {
            this.aix.put(zzboo, conditionVariable);
        }
        zza(bundle, keyPair, zzboo);
        conditionVariable.block(30000L);
        synchronized (getClass()) {
            Object remove = this.aix.remove(zzboo);
            if (!(remove instanceof Intent)) {
                if (remove instanceof String) {
                    throw new IOException((String) remove);
                }
                String valueOf = String.valueOf(remove);
                Log.w("InstanceID/Rpc", new StringBuilder(String.valueOf(valueOf).length() + 12).append("No response ").append(valueOf).toString());
                throw new IOException(InstanceID.ERROR_TIMEOUT);
            }
            intent = (Intent) remove;
        }
        return intent;
    }

    public static synchronized String zzboo() {
        String num;
        synchronized (zzc.class) {
            int i = aiw;
            aiw = i + 1;
            num = Integer.toString(i);
        }
        return num;
    }

    public static String zzdg(Context context) {
        if (ait != null) {
            return ait;
        }
        aiu = Process.myUid();
        PackageManager packageManager = context.getPackageManager();
        for (ResolveInfo resolveInfo : packageManager.queryIntentServices(new Intent(C2DMessaging.REQUEST_REGISTRATION_INTENT), 0)) {
            if (packageManager.checkPermission("com.google.android.c2dm.permission.RECEIVE", resolveInfo.serviceInfo.packageName) == 0) {
                try {
                    ApplicationInfo applicationInfo = packageManager.getApplicationInfo(resolveInfo.serviceInfo.packageName, 0);
                    Log.w("InstanceID/Rpc", new StringBuilder(17).append("Found ").append(applicationInfo.uid).toString());
                    aiv = applicationInfo.uid;
                    ait = resolveInfo.serviceInfo.packageName;
                    return ait;
                } catch (PackageManager.NameNotFoundException e) {
                }
            } else {
                String valueOf = String.valueOf(resolveInfo.serviceInfo.packageName);
                String valueOf2 = String.valueOf(C2DMessaging.REQUEST_REGISTRATION_INTENT);
                Log.w("InstanceID/Rpc", new StringBuilder(String.valueOf(valueOf).length() + 56 + String.valueOf(valueOf2).length()).append("Possible malicious package ").append(valueOf).append(" declares ").append(valueOf2).append(" without permission").toString());
            }
        }
        Log.w("InstanceID/Rpc", "Failed to resolve REGISTER intent, falling back");
        try {
            ApplicationInfo applicationInfo2 = packageManager.getApplicationInfo("com.google.android.gms", 0);
            ait = applicationInfo2.packageName;
            aiv = applicationInfo2.uid;
            return ait;
        } catch (PackageManager.NameNotFoundException e2) {
            try {
                ApplicationInfo applicationInfo3 = packageManager.getApplicationInfo(C2DMessaging.GSF_PACKAGE, 0);
                ait = applicationInfo3.packageName;
                aiv = applicationInfo3.uid;
                return ait;
            } catch (PackageManager.NameNotFoundException e3) {
                Log.w("InstanceID/Rpc", "Both Google Play Services and legacy GSF package are missing");
                return null;
            }
        }
    }

    private static int zzdh(Context context) {
        try {
            return context.getPackageManager().getPackageInfo(zzdg(context), 0).versionCode;
        } catch (PackageManager.NameNotFoundException e) {
            return -1;
        }
    }

    private void zzh(Object obj, Object obj2) {
        if (obj instanceof ConditionVariable) {
            ((ConditionVariable) obj).open();
        }
        if (obj instanceof Messenger) {
            Messenger messenger = (Messenger) obj;
            Message obtain = Message.obtain();
            obtain.obj = obj2;
            try {
                messenger.send(obtain);
            } catch (RemoteException e) {
                String valueOf = String.valueOf(e);
                Log.w("InstanceID/Rpc", new StringBuilder(String.valueOf(valueOf).length() + 24).append("Failed to send response ").append(valueOf).toString());
            }
        }
    }

    private void zzi(String str, Object obj) {
        synchronized (getClass()) {
            Object obj2 = this.aix.get(str);
            this.aix.put(str, obj);
            zzh(obj2, obj);
        }
    }

    private void zzkp(String str) {
        if (!C2DMessaging.GSF_PACKAGE.equals(ait)) {
            return;
        }
        this.aiC++;
        if (this.aiC < 3) {
            return;
        }
        if (this.aiC == 3) {
            this.aiD = new Random().nextInt(1000) + 1000;
        }
        this.aiD *= 2;
        this.aiE = SystemClock.elapsedRealtime() + this.aiD;
        Log.w("InstanceID/Rpc", new StringBuilder(String.valueOf(str).length() + 31).append("Backoff due to ").append(str).append(" for ").append(this.aiD).toString());
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public Intent zza(Bundle bundle, KeyPair keyPair) throws IOException {
        Intent zzb = zzb(bundle, keyPair);
        return (zzb == null || !zzb.hasExtra("google.messenger")) ? zzb : zzb(bundle, keyPair);
    }

    void zza(Bundle bundle, KeyPair keyPair, String str) throws IOException {
        long elapsedRealtime = SystemClock.elapsedRealtime();
        if (this.aiE != 0 && elapsedRealtime <= this.aiE) {
            Log.w("InstanceID/Rpc", new StringBuilder(78).append("Backoff mode, next request attempt: ").append(this.aiE - elapsedRealtime).append(" interval: ").append(this.aiD).toString());
            throw new IOException(InstanceID.ERROR_BACKOFF);
        }
        zzbon();
        if (ait == null) {
            throw new IOException(InstanceID.ERROR_MISSING_INSTANCEID_SERVICE);
        }
        this.aiA = SystemClock.elapsedRealtime();
        Intent intent = new Intent(C2DMessaging.REQUEST_REGISTRATION_INTENT);
        intent.setPackage(ait);
        bundle.putString("gmsv", Integer.toString(zzdh(this.zzahs)));
        bundle.putString("osv", Integer.toString(Build.VERSION.SDK_INT));
        bundle.putString("app_ver", Integer.toString(InstanceID.zzdd(this.zzahs)));
        bundle.putString("app_ver_name", InstanceID.zzde(this.zzahs));
        bundle.putString("cliv", "iid-9877000");
        bundle.putString("appid", InstanceID.zza(keyPair));
        String zzv = InstanceID.zzv(keyPair.getPublic().getEncoded());
        bundle.putString("pub2", zzv);
        bundle.putString("sig", zza(keyPair, this.zzahs.getPackageName(), zzv));
        intent.putExtras(bundle);
        zzs(intent);
        zzb(intent, str);
    }

    protected void zzb(Intent intent, String str) {
        this.aiA = SystemClock.elapsedRealtime();
        intent.putExtra("kid", new StringBuilder(String.valueOf(str).length() + 5).append("|ID|").append(str).append("|").toString());
        intent.putExtra("X-kid", new StringBuilder(String.valueOf(str).length() + 5).append("|ID|").append(str).append("|").toString());
        boolean equals = C2DMessaging.GSF_PACKAGE.equals(ait);
        String stringExtra = intent.getStringExtra("useGsf");
        if (stringExtra != null) {
            equals = AppEventsConstants.EVENT_PARAM_VALUE_YES.equals(stringExtra);
        }
        if (Log.isLoggable("InstanceID/Rpc", 3)) {
            String valueOf = String.valueOf(intent.getExtras());
            Log.d("InstanceID/Rpc", new StringBuilder(String.valueOf(valueOf).length() + 8).append("Sending ").append(valueOf).toString());
        }
        if (this.aiy != null) {
            intent.putExtra("google.messenger", this.ahg);
            Message obtain = Message.obtain();
            obtain.obj = intent;
            try {
                this.aiy.send(obtain);
                return;
            } catch (RemoteException e) {
                if (Log.isLoggable("InstanceID/Rpc", 3)) {
                    Log.d("InstanceID/Rpc", "Messenger failed, fallback to startService");
                }
            }
        }
        if (equals) {
            Intent intent2 = new Intent("com.google.android.gms.iid.InstanceID");
            intent2.setPackage(this.zzahs.getPackageName());
            intent2.putExtra("GSF", intent);
            this.zzahs.startService(intent2);
            return;
        }
        intent.putExtra("google.messenger", this.ahg);
        intent.putExtra("messenger2", AppEventsConstants.EVENT_PARAM_VALUE_YES);
        if (this.aiz != null) {
            Message obtain2 = Message.obtain();
            obtain2.obj = intent;
            try {
                this.aiz.send(obtain2);
                return;
            } catch (RemoteException e2) {
                if (Log.isLoggable("InstanceID/Rpc", 3)) {
                    Log.d("InstanceID/Rpc", "Messenger failed, fallback to startService");
                }
            }
        }
        this.zzahs.startService(intent);
    }

    void zzbon() {
        if (this.ahg != null) {
            return;
        }
        zzdg(this.zzahs);
        this.ahg = new Messenger(new Handler(Looper.getMainLooper()) { // from class: com.google.android.gms.iid.zzc.1
            @Override // android.os.Handler
            public void handleMessage(Message message) {
                zzc.this.zze(message);
            }
        });
    }

    public void zze(Message message) {
        if (message == null) {
            return;
        }
        if (!(message.obj instanceof Intent)) {
            Log.w("InstanceID/Rpc", "Dropping invalid message");
            return;
        }
        Intent intent = (Intent) message.obj;
        intent.setExtrasClassLoader(MessengerCompat.class.getClassLoader());
        if (intent.hasExtra("google.messenger")) {
            Parcelable parcelableExtra = intent.getParcelableExtra("google.messenger");
            if (parcelableExtra instanceof MessengerCompat) {
                this.aiz = (MessengerCompat) parcelableExtra;
            }
            if (parcelableExtra instanceof Messenger) {
                this.aiy = (Messenger) parcelableExtra;
            }
        }
        zzv((Intent) message.obj);
    }

    synchronized void zzs(Intent intent) {
        if (this.ahc == null) {
            Intent intent2 = new Intent();
            intent2.setPackage("com.google.example.invalidpackage");
            this.ahc = PendingIntent.getBroadcast(this.zzahs, 0, intent2, 0);
        }
        intent.putExtra("app", this.ahc);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public String zzt(Intent intent) throws IOException {
        if (intent == null) {
            throw new IOException("SERVICE_NOT_AVAILABLE");
        }
        String stringExtra = intent.getStringExtra(C2DMBaseReceiver.EXTRA_REGISTRATION_ID);
        if (stringExtra == null) {
            stringExtra = intent.getStringExtra(C2DMBaseReceiver.EXTRA_UNREGISTERED);
        }
        intent.getLongExtra("Retry-After", 0L);
        if (stringExtra != null) {
        }
        if (stringExtra != null) {
            return stringExtra;
        }
        String stringExtra2 = intent.getStringExtra("error");
        if (stringExtra2 != null) {
            throw new IOException(stringExtra2);
        }
        String valueOf = String.valueOf(intent.getExtras());
        Log.w("InstanceID/Rpc", new StringBuilder(String.valueOf(valueOf).length() + 29).append("Unexpected response from GCM ").append(valueOf).toString(), new Throwable());
        throw new IOException("SERVICE_NOT_AVAILABLE");
    }

    void zzu(Intent intent) {
        String str;
        String str2;
        String stringExtra = intent.getStringExtra("error");
        if (stringExtra == null) {
            String valueOf = String.valueOf(intent.getExtras());
            Log.w("InstanceID/Rpc", new StringBuilder(String.valueOf(valueOf).length() + 49).append("Unexpected response, no error or registration id ").append(valueOf).toString());
            return;
        }
        if (Log.isLoggable("InstanceID/Rpc", 3)) {
            String valueOf2 = String.valueOf(stringExtra);
            Log.d("InstanceID/Rpc", valueOf2.length() != 0 ? "Received InstanceID error ".concat(valueOf2) : new String("Received InstanceID error "));
        }
        if (stringExtra.startsWith("|")) {
            String[] split = stringExtra.split("\\|");
            if (!"ID".equals(split[1])) {
                String valueOf3 = String.valueOf(stringExtra);
                Log.w("InstanceID/Rpc", valueOf3.length() != 0 ? "Unexpected structured response ".concat(valueOf3) : new String("Unexpected structured response "));
            }
            if (split.length > 2) {
                str = split[2];
                str2 = split[3];
                if (str2.startsWith(":")) {
                    str2 = str2.substring(1);
                }
            } else {
                str2 = "UNKNOWN";
                str = null;
            }
            intent.putExtra("error", str2);
        } else {
            str = null;
            str2 = stringExtra;
        }
        if (str == null) {
            zzai(str2);
        } else {
            zzi(str, str2);
        }
        long longExtra = intent.getLongExtra("Retry-After", 0L);
        if (longExtra > 0) {
            this.aiB = SystemClock.elapsedRealtime();
            this.aiD = ((int) longExtra) * 1000;
            this.aiE = SystemClock.elapsedRealtime() + this.aiD;
            Log.w("InstanceID/Rpc", new StringBuilder(52).append("Explicit request from server to backoff: ").append(this.aiD).toString());
        } else if (!"SERVICE_NOT_AVAILABLE".equals(str2) && !C2DMBaseReceiver.ERR_AUTHENTICATION_FAILED.equals(str2)) {
        } else {
            zzkp(str2);
        }
    }

    public void zzv(Intent intent) {
        if (intent == null) {
            if (!Log.isLoggable("InstanceID/Rpc", 3)) {
                return;
            }
            Log.d("InstanceID/Rpc", "Unexpected response: null");
            return;
        }
        String action = intent.getAction();
        if (!C2DMBaseReceiver.REGISTRATION_CALLBACK_INTENT.equals(action) && !"com.google.android.gms.iid.InstanceID".equals(action)) {
            if (!Log.isLoggable("InstanceID/Rpc", 3)) {
                return;
            }
            String valueOf = String.valueOf(intent.getAction());
            Log.d("InstanceID/Rpc", valueOf.length() != 0 ? "Unexpected response ".concat(valueOf) : new String("Unexpected response "));
            return;
        }
        String stringExtra = intent.getStringExtra(C2DMBaseReceiver.EXTRA_REGISTRATION_ID);
        String stringExtra2 = stringExtra == null ? intent.getStringExtra(C2DMBaseReceiver.EXTRA_UNREGISTERED) : stringExtra;
        if (stringExtra2 == null) {
            zzu(intent);
            return;
        }
        this.aiA = SystemClock.elapsedRealtime();
        this.aiE = 0L;
        this.aiC = 0;
        this.aiD = 0;
        String str = null;
        if (stringExtra2.startsWith("|")) {
            String[] split = stringExtra2.split("\\|");
            if (!"ID".equals(split[1])) {
                String valueOf2 = String.valueOf(stringExtra2);
                Log.w("InstanceID/Rpc", valueOf2.length() != 0 ? "Unexpected structured response ".concat(valueOf2) : new String("Unexpected structured response "));
            }
            String str2 = split[2];
            if (split.length > 4) {
                if ("SYNC".equals(split[3])) {
                    InstanceIDListenerService.zzdf(this.zzahs);
                } else if ("RST".equals(split[3])) {
                    InstanceIDListenerService.zza(this.zzahs, InstanceID.getInstance(this.zzahs).zzbok());
                    intent.removeExtra(C2DMBaseReceiver.EXTRA_REGISTRATION_ID);
                    zzi(str2, intent);
                    return;
                }
            }
            String str3 = split[split.length - 1];
            if (str3.startsWith(":")) {
                str3 = str3.substring(1);
            }
            intent.putExtra(C2DMBaseReceiver.EXTRA_REGISTRATION_ID, str3);
            str = str2;
        }
        if (str == null) {
            zzai(intent);
        } else {
            zzi(str, intent);
        }
    }
}
