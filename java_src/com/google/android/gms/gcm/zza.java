package com.google.android.gms.gcm;

import android.app.ActivityManager;
import android.app.KeyguardManager;
import android.app.Notification;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;
import android.content.res.Resources;
import android.graphics.Color;
import android.media.RingtoneManager;
import android.net.Uri;
import android.os.Bundle;
import android.os.Process;
import android.os.SystemClock;
import android.support.v4.app.NotificationCompat;
import android.text.TextUtils;
import android.util.Log;
import com.facebook.appevents.AppEventsConstants;
import java.util.Iterator;
import java.util.List;
import java.util.MissingFormatArgumentException;
import org.json.JSONArray;
import org.json.JSONException;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes2.dex */
public class zza {
    static zza agO;
    private final Context mContext;

    /* renamed from: com.google.android.gms.gcm.zza$zza  reason: collision with other inner class name */
    /* loaded from: classes2.dex */
    private class C0068zza extends IllegalArgumentException {
    }

    private zza(Context context) {
        this.mContext = context.getApplicationContext();
    }

    private void zza(String str, Notification notification) {
        if (Log.isLoggable("GcmNotification", 3)) {
            Log.d("GcmNotification", "Showing notification");
        }
        NotificationManager notificationManager = (NotificationManager) this.mContext.getSystemService("notification");
        if (TextUtils.isEmpty(str)) {
            str = new StringBuilder(37).append("GCM-Notification:").append(SystemClock.uptimeMillis()).toString();
        }
        notificationManager.notify(str, 0, notification);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static boolean zzad(Bundle bundle) {
        return AppEventsConstants.EVENT_PARAM_VALUE_YES.equals(zzf(bundle, "gcm.n.e")) || zzf(bundle, "gcm.n.icon") != null;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static void zzae(Bundle bundle) {
        Bundle bundle2 = new Bundle();
        Iterator<String> it = bundle.keySet().iterator();
        while (it.hasNext()) {
            String next = it.next();
            String string = bundle.getString(next);
            if (next.startsWith("gcm.notification.")) {
                next = next.replace("gcm.notification.", "gcm.n.");
            }
            if (next.startsWith("gcm.n.")) {
                if (!"gcm.n.e".equals(next)) {
                    bundle2.putString(next.substring("gcm.n.".length()), string);
                }
                it.remove();
            }
        }
        String string2 = bundle2.getString("sound2");
        if (string2 != null) {
            bundle2.remove("sound2");
            bundle2.putString("sound", string2);
        }
        if (!bundle2.isEmpty()) {
            bundle.putBundle("notification", bundle2);
        }
    }

    private Notification zzag(Bundle bundle) {
        String zzg = zzg(bundle, "gcm.n.title");
        String zzg2 = zzg(bundle, "gcm.n.body");
        int zzkl = zzkl(zzf(bundle, "gcm.n.icon"));
        String zzf = zzf(bundle, "gcm.n.color");
        Uri zzkm = zzkm(zzf(bundle, "gcm.n.sound2"));
        PendingIntent zzah = zzah(bundle);
        NotificationCompat.Builder smallIcon = new NotificationCompat.Builder(this.mContext).setAutoCancel(true).setSmallIcon(zzkl);
        if (!TextUtils.isEmpty(zzg)) {
            smallIcon.setContentTitle(zzg);
        } else {
            smallIcon.setContentTitle(this.mContext.getApplicationInfo().loadLabel(this.mContext.getPackageManager()));
        }
        if (!TextUtils.isEmpty(zzg2)) {
            smallIcon.setContentText(zzg2);
        }
        if (!TextUtils.isEmpty(zzf)) {
            smallIcon.setColor(Color.parseColor(zzf));
        }
        if (zzkm != null) {
            smallIcon.setSound(zzkm);
        }
        if (zzah != null) {
            smallIcon.setContentIntent(zzah);
        }
        return smallIcon.build();
    }

    private PendingIntent zzah(Bundle bundle) {
        Intent intent;
        String zzf = zzf(bundle, "gcm.n.click_action");
        if (!TextUtils.isEmpty(zzf)) {
            Intent intent2 = new Intent(zzf);
            intent2.setPackage(this.mContext.getPackageName());
            intent2.setFlags(268435456);
            intent = intent2;
        } else {
            Intent launchIntentForPackage = this.mContext.getPackageManager().getLaunchIntentForPackage(this.mContext.getPackageName());
            if (launchIntentForPackage == null) {
                Log.w("GcmNotification", "No activity found to launch app");
                return null;
            }
            intent = launchIntentForPackage;
        }
        Bundle bundle2 = new Bundle(bundle);
        GcmListenerService.zzac(bundle2);
        intent.putExtras(bundle2);
        for (String str : bundle2.keySet()) {
            if (str.startsWith("gcm.n.") || str.startsWith("gcm.notification.")) {
                intent.removeExtra(str);
            }
        }
        return PendingIntent.getActivity(this.mContext, zzbnr(), intent, 1073741824);
    }

    private int zzbnr() {
        return (int) SystemClock.uptimeMillis();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static synchronized zza zzcz(Context context) {
        zza zzaVar;
        synchronized (zza.class) {
            if (agO == null) {
                agO = new zza(context);
            }
            zzaVar = agO;
        }
        return zzaVar;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static boolean zzda(Context context) {
        if (((KeyguardManager) context.getSystemService("keyguard")).inKeyguardRestrictedInputMode()) {
            return false;
        }
        int myPid = Process.myPid();
        List<ActivityManager.RunningAppProcessInfo> runningAppProcesses = ((ActivityManager) context.getSystemService("activity")).getRunningAppProcesses();
        if (runningAppProcesses == null) {
            return false;
        }
        for (ActivityManager.RunningAppProcessInfo runningAppProcessInfo : runningAppProcesses) {
            if (runningAppProcessInfo.pid == myPid) {
                return runningAppProcessInfo.importance == 100;
            }
        }
        return false;
    }

    static String zzf(Bundle bundle, String str) {
        String string = bundle.getString(str);
        return string == null ? bundle.getString(str.replace("gcm.n.", "gcm.notification.")) : string;
    }

    private String zzg(Bundle bundle, String str) {
        String zzf = zzf(bundle, str);
        if (!TextUtils.isEmpty(zzf)) {
            return zzf;
        }
        String valueOf = String.valueOf(str);
        String valueOf2 = String.valueOf("_loc_key");
        String zzf2 = zzf(bundle, valueOf2.length() != 0 ? valueOf.concat(valueOf2) : new String(valueOf));
        if (TextUtils.isEmpty(zzf2)) {
            return null;
        }
        Resources resources = this.mContext.getResources();
        int identifier = resources.getIdentifier(zzf2, "string", this.mContext.getPackageName());
        if (identifier == 0) {
            String valueOf3 = String.valueOf(str);
            String valueOf4 = String.valueOf("_loc_key");
            String valueOf5 = String.valueOf(zzkk(valueOf4.length() != 0 ? valueOf3.concat(valueOf4) : new String(valueOf3)));
            Log.w("GcmNotification", new StringBuilder(String.valueOf(valueOf5).length() + 49 + String.valueOf(zzf2).length()).append(valueOf5).append(" resource not found: ").append(zzf2).append(" Default value will be used.").toString());
            return null;
        }
        String valueOf6 = String.valueOf(str);
        String valueOf7 = String.valueOf("_loc_args");
        String zzf3 = zzf(bundle, valueOf7.length() != 0 ? valueOf6.concat(valueOf7) : new String(valueOf6));
        if (TextUtils.isEmpty(zzf3)) {
            return resources.getString(identifier);
        }
        try {
            JSONArray jSONArray = new JSONArray(zzf3);
            Object[] objArr = new String[jSONArray.length()];
            for (int i = 0; i < objArr.length; i++) {
                objArr[i] = jSONArray.opt(i);
            }
            return resources.getString(identifier, objArr);
        } catch (MissingFormatArgumentException e) {
            Log.w("GcmNotification", new StringBuilder(String.valueOf(zzf2).length() + 58 + String.valueOf(zzf3).length()).append("Missing format argument for ").append(zzf2).append(": ").append(zzf3).append(" Default value will be used.").toString(), e);
            return null;
        } catch (JSONException e2) {
            String valueOf8 = String.valueOf(str);
            String valueOf9 = String.valueOf("_loc_args");
            String valueOf10 = String.valueOf(zzkk(valueOf9.length() != 0 ? valueOf8.concat(valueOf9) : new String(valueOf8)));
            Log.w("GcmNotification", new StringBuilder(String.valueOf(valueOf10).length() + 41 + String.valueOf(zzf3).length()).append("Malformed ").append(valueOf10).append(": ").append(zzf3).append("  Default value will be used.").toString());
            return null;
        }
    }

    private String zzkk(String str) {
        return str.substring("gcm.n.".length());
    }

    private int zzkl(String str) {
        if (!TextUtils.isEmpty(str)) {
            Resources resources = this.mContext.getResources();
            int identifier = resources.getIdentifier(str, "drawable", this.mContext.getPackageName());
            if (identifier != 0) {
                return identifier;
            }
            int identifier2 = resources.getIdentifier(str, "mipmap", this.mContext.getPackageName());
            if (identifier2 != 0) {
                return identifier2;
            }
            Log.w("GcmNotification", new StringBuilder(String.valueOf(str).length() + 57).append("Icon resource ").append(str).append(" not found. Notification will use app icon.").toString());
        }
        int i = this.mContext.getApplicationInfo().icon;
        if (i == 0) {
            return 17301651;
        }
        return i;
    }

    private Uri zzkm(String str) {
        if (TextUtils.isEmpty(str)) {
            return null;
        }
        if ("default".equals(str) || this.mContext.getResources().getIdentifier(str, "raw", this.mContext.getPackageName()) == 0) {
            return RingtoneManager.getDefaultUri(2);
        }
        String valueOf = String.valueOf("android.resource://");
        String valueOf2 = String.valueOf(this.mContext.getPackageName());
        return Uri.parse(new StringBuilder(String.valueOf(valueOf).length() + 5 + String.valueOf(valueOf2).length() + String.valueOf(str).length()).append(valueOf).append(valueOf2).append("/raw/").append(str).toString());
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public boolean zzaf(Bundle bundle) {
        try {
            zza(zzf(bundle, "gcm.n.tag"), zzag(bundle));
            return true;
        } catch (C0068zza e) {
            String valueOf = String.valueOf(e.getMessage());
            Log.e("GcmNotification", valueOf.length() != 0 ? "Failed to show notification: ".concat(valueOf) : new String("Failed to show notification: "));
            return false;
        }
    }
}
