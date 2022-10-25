package com.google.android.gms.gcm;

import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import android.os.Messenger;
import android.support.annotation.RequiresPermission;
import android.util.Log;
import com.google.android.c2dm.C2DMBaseReceiver;
import com.google.android.c2dm.C2DMessaging;
import com.google.android.gms.iid.InstanceID;
import java.io.IOException;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.BlockingQueue;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicInteger;
/* loaded from: classes.dex */
public class GoogleCloudMessaging {
    public static final String ERROR_MAIN_THREAD = "MAIN_THREAD";
    public static final String ERROR_SERVICE_NOT_AVAILABLE = "SERVICE_NOT_AVAILABLE";
    public static final String INSTANCE_ID_SCOPE = "GCM";
    @Deprecated
    public static final String MESSAGE_TYPE_DELETED = "deleted_messages";
    @Deprecated
    public static final String MESSAGE_TYPE_MESSAGE = "gcm";
    @Deprecated
    public static final String MESSAGE_TYPE_SEND_ERROR = "send_error";
    @Deprecated
    public static final String MESSAGE_TYPE_SEND_EVENT = "send_event";
    static GoogleCloudMessaging ahb;
    private PendingIntent ahc;
    private Context zzahs;
    public static int agY = 5000000;
    public static int agZ = 6500000;
    public static int aha = 7000000;
    private static final AtomicInteger ahe = new AtomicInteger(1);
    private final BlockingQueue<Intent> ahf = new LinkedBlockingQueue();
    private Map<String, Handler> ahd = Collections.synchronizedMap(new HashMap());
    final Messenger ahg = new Messenger(new Handler(Looper.getMainLooper()) { // from class: com.google.android.gms.gcm.GoogleCloudMessaging.1
        @Override // android.os.Handler
        public void handleMessage(Message message) {
            if (message == null || !(message.obj instanceof Intent)) {
                Log.w(GoogleCloudMessaging.INSTANCE_ID_SCOPE, "Dropping invalid message");
            }
            Intent intent = (Intent) message.obj;
            if (C2DMBaseReceiver.REGISTRATION_CALLBACK_INTENT.equals(intent.getAction())) {
                GoogleCloudMessaging.this.ahf.add(intent);
            } else if (GoogleCloudMessaging.this.zzq(intent)) {
            } else {
                intent.setPackage(GoogleCloudMessaging.this.zzahs.getPackageName());
                GoogleCloudMessaging.this.zzahs.sendBroadcast(intent);
            }
        }
    });

    public static synchronized GoogleCloudMessaging getInstance(Context context) {
        GoogleCloudMessaging googleCloudMessaging;
        synchronized (GoogleCloudMessaging.class) {
            if (ahb == null) {
                ahb = new GoogleCloudMessaging();
                ahb.zzahs = context.getApplicationContext();
            }
            googleCloudMessaging = ahb;
        }
        return googleCloudMessaging;
    }

    static String zza(Intent intent, String str) throws IOException {
        if (intent == null) {
            throw new IOException("SERVICE_NOT_AVAILABLE");
        }
        String stringExtra = intent.getStringExtra(str);
        if (stringExtra != null) {
            return stringExtra;
        }
        String stringExtra2 = intent.getStringExtra("error");
        if (stringExtra2 == null) {
            throw new IOException("SERVICE_NOT_AVAILABLE");
        }
        throw new IOException(stringExtra2);
    }

    private void zza(String str, String str2, long j, int i, Bundle bundle) throws IOException {
        if (str == null) {
            throw new IllegalArgumentException("Missing 'to'");
        }
        String zzdb = zzdb(this.zzahs);
        if (zzdb == null) {
            throw new IOException("SERVICE_NOT_AVAILABLE");
        }
        Intent intent = new Intent("com.google.android.gcm.intent.SEND");
        if (bundle != null) {
            intent.putExtras(bundle);
        }
        zzr(intent);
        intent.setPackage(zzdb);
        intent.putExtra("google.to", str);
        intent.putExtra("google.message_id", str2);
        intent.putExtra("google.ttl", Long.toString(j));
        intent.putExtra("google.delay", Integer.toString(i));
        intent.putExtra("google.from", zzko(str));
        if (!zzdb.contains(".gsf")) {
            this.zzahs.sendOrderedBroadcast(intent, "com.google.android.gtalkservice.permission.GTALK_SERVICE");
            return;
        }
        Bundle bundle2 = new Bundle();
        for (String str3 : bundle.keySet()) {
            Object obj = bundle.get(str3);
            if (obj instanceof String) {
                String valueOf = String.valueOf(str3);
                bundle2.putString(valueOf.length() != 0 ? "gcm.".concat(valueOf) : new String("gcm."), (String) obj);
            }
        }
        bundle2.putString("google.to", str);
        bundle2.putString("google.message_id", str2);
        InstanceID.getInstance(this.zzahs).zzc(INSTANCE_ID_SCOPE, "upstream", bundle2);
    }

    private String zzbnt() {
        String valueOf = String.valueOf("google.rpc");
        String valueOf2 = String.valueOf(String.valueOf(ahe.getAndIncrement()));
        return valueOf2.length() != 0 ? valueOf.concat(valueOf2) : new String(valueOf);
    }

    public static String zzdb(Context context) {
        return com.google.android.gms.iid.zzc.zzdg(context);
    }

    public static int zzdc(Context context) {
        PackageManager packageManager = context.getPackageManager();
        String zzdb = zzdb(context);
        if (zzdb != null) {
            try {
                PackageInfo packageInfo = packageManager.getPackageInfo(zzdb, 0);
                if (packageInfo != null) {
                    return packageInfo.versionCode;
                }
            } catch (PackageManager.NameNotFoundException e) {
            }
        }
        return -1;
    }

    private String zzko(String str) {
        int indexOf = str.indexOf(64);
        if (indexOf > 0) {
            str = str.substring(0, indexOf);
        }
        return InstanceID.getInstance(this.zzahs).zzbok().zzh("", str, INSTANCE_ID_SCOPE);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public boolean zzq(Intent intent) {
        Handler remove;
        String stringExtra = intent.getStringExtra("In-Reply-To");
        if (stringExtra == null && intent.hasExtra("error")) {
            stringExtra = intent.getStringExtra("google.message_id");
        }
        if (stringExtra == null || (remove = this.ahd.remove(stringExtra)) == null) {
            return false;
        }
        Message obtain = Message.obtain();
        obtain.obj = intent;
        return remove.sendMessage(obtain);
    }

    public void close() {
        ahb = null;
        zza.agO = null;
        zzbnu();
    }

    public String getMessageType(Intent intent) {
        if (!"com.google.android.c2dm.intent.RECEIVE".equals(intent.getAction())) {
            return null;
        }
        String stringExtra = intent.getStringExtra("message_type");
        return stringExtra == null ? MESSAGE_TYPE_MESSAGE : stringExtra;
    }

    @RequiresPermission("com.google.android.c2dm.permission.RECEIVE")
    @Deprecated
    public synchronized String register(String... strArr) throws IOException {
        String zza;
        String zzdb = zzdb(this.zzahs);
        if (zzdb == null) {
            throw new IOException("SERVICE_NOT_AVAILABLE");
        }
        String zzf = zzf(strArr);
        Bundle bundle = new Bundle();
        if (zzdb.contains(".gsf")) {
            bundle.putString("legacy.sender", zzf);
            zza = InstanceID.getInstance(this.zzahs).getToken(zzf, INSTANCE_ID_SCOPE, bundle);
        } else {
            bundle.putString(C2DMessaging.EXTRA_SENDER, zzf);
            zza = zza(zzai(bundle), C2DMBaseReceiver.EXTRA_REGISTRATION_ID);
        }
        return zza;
    }

    @RequiresPermission("com.google.android.c2dm.permission.RECEIVE")
    public void send(String str, String str2, long j, Bundle bundle) throws IOException {
        zza(str, str2, j, -1, bundle);
    }

    @RequiresPermission("com.google.android.c2dm.permission.RECEIVE")
    public void send(String str, String str2, Bundle bundle) throws IOException {
        send(str, str2, -1L, bundle);
    }

    @RequiresPermission("com.google.android.c2dm.permission.RECEIVE")
    @Deprecated
    public synchronized void unregister() throws IOException {
        if (Looper.getMainLooper() == Looper.myLooper()) {
            throw new IOException("MAIN_THREAD");
        }
        InstanceID.getInstance(this.zzahs).deleteInstanceID();
    }

    @Deprecated
    Intent zzai(Bundle bundle) throws IOException {
        if (Looper.getMainLooper() == Looper.myLooper()) {
            throw new IOException("MAIN_THREAD");
        }
        if (zzdc(this.zzahs) < 0) {
            throw new IOException("Google Play Services missing");
        }
        if (bundle == null) {
            bundle = new Bundle();
        }
        Intent intent = new Intent(C2DMessaging.REQUEST_REGISTRATION_INTENT);
        intent.setPackage(zzdb(this.zzahs));
        zzr(intent);
        intent.putExtra("google.message_id", zzbnt());
        intent.putExtras(bundle);
        intent.putExtra("google.messenger", this.ahg);
        this.zzahs.startService(intent);
        try {
            return this.ahf.poll(30000L, TimeUnit.MILLISECONDS);
        } catch (InterruptedException e) {
            throw new IOException(e.getMessage());
        }
    }

    synchronized void zzbnu() {
        if (this.ahc != null) {
            this.ahc.cancel();
            this.ahc = null;
        }
    }

    String zzf(String... strArr) {
        if (strArr == null || strArr.length == 0) {
            throw new IllegalArgumentException("No senderIds");
        }
        StringBuilder sb = new StringBuilder(strArr[0]);
        for (int i = 1; i < strArr.length; i++) {
            sb.append(',').append(strArr[i]);
        }
        return sb.toString();
    }

    synchronized void zzr(Intent intent) {
        if (this.ahc == null) {
            Intent intent2 = new Intent();
            intent2.setPackage("com.google.example.invalidpackage");
            this.ahc = PendingIntent.getBroadcast(this.zzahs, 0, intent2, 0);
        }
        intent.putExtra("app", this.ahc);
    }
}
