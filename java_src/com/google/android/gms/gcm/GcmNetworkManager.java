package com.google.android.gms.gcm;

import android.app.PendingIntent;
import android.app.Service;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.pm.ResolveInfo;
import android.os.Bundle;
import android.text.TextUtils;
import android.util.Log;
import com.google.android.gms.common.internal.zzaa;
import java.util.Iterator;
import java.util.List;
/* loaded from: classes2.dex */
public class GcmNetworkManager {
    public static final int RESULT_FAILURE = 2;
    public static final int RESULT_RESCHEDULE = 1;
    public static final int RESULT_SUCCESS = 0;
    private static GcmNetworkManager agN;
    private Context mContext;
    private final PendingIntent mPendingIntent;

    private GcmNetworkManager(Context context) {
        this.mContext = context;
        this.mPendingIntent = PendingIntent.getBroadcast(this.mContext, 0, new Intent().setPackage("com.google.example.invalidpackage"), 0);
    }

    public static GcmNetworkManager getInstance(Context context) {
        GcmNetworkManager gcmNetworkManager;
        synchronized (GcmNetworkManager.class) {
            if (agN == null) {
                agN = new GcmNetworkManager(context.getApplicationContext());
            }
            gcmNetworkManager = agN;
        }
        return gcmNetworkManager;
    }

    private void zza(ComponentName componentName) {
        zzkj(componentName.getClassName());
        Intent zzbnq = zzbnq();
        if (zzbnq == null) {
            return;
        }
        zzbnq.putExtra("scheduler_action", "CANCEL_ALL");
        zzbnq.putExtra("component", componentName);
        this.mContext.sendBroadcast(zzbnq);
    }

    private void zza(String str, ComponentName componentName) {
        zzki(str);
        zzkj(componentName.getClassName());
        Intent zzbnq = zzbnq();
        if (zzbnq == null) {
            return;
        }
        zzbnq.putExtra("scheduler_action", "CANCEL_TASK");
        zzbnq.putExtra("tag", str);
        zzbnq.putExtra("component", componentName);
        this.mContext.sendBroadcast(zzbnq);
    }

    private Intent zzbnq() {
        String zzdb = GoogleCloudMessaging.zzdb(this.mContext);
        int i = -1;
        if (zzdb != null) {
            i = GoogleCloudMessaging.zzdc(this.mContext);
        }
        if (zzdb == null || i < GoogleCloudMessaging.agY) {
            Log.e("GcmNetworkManager", new StringBuilder(91).append("Google Play Services is not available, dropping GcmNetworkManager request. code=").append(i).toString());
            return null;
        }
        Intent intent = new Intent("com.google.android.gms.gcm.ACTION_SCHEDULE");
        intent.setPackage(zzdb);
        intent.putExtra("app", this.mPendingIntent);
        return intent;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static void zzki(String str) {
        if (TextUtils.isEmpty(str)) {
            throw new IllegalArgumentException("Must provide a valid tag.");
        }
        if (100 >= str.length()) {
            return;
        }
        throw new IllegalArgumentException("Tag is larger than max permissible tag length (100)");
    }

    private void zzkj(String str) {
        boolean z = true;
        zzaa.zzb(str, "GcmTaskService must not be null.");
        Intent intent = new Intent(GcmTaskService.SERVICE_ACTION_EXECUTE_TASK);
        intent.setPackage(this.mContext.getPackageName());
        List<ResolveInfo> queryIntentServices = this.mContext.getPackageManager().queryIntentServices(intent, 0);
        zzaa.zzb((queryIntentServices == null || queryIntentServices.size() == 0) ? false : true, "There is no GcmTaskService component registered within this package. Have you extended GcmTaskService correctly?");
        Iterator<ResolveInfo> it = queryIntentServices.iterator();
        while (true) {
            if (!it.hasNext()) {
                z = false;
                break;
            } else if (it.next().serviceInfo.name.equals(str)) {
                break;
            }
        }
        zzaa.zzb(z, new StringBuilder(String.valueOf(str).length() + 119).append("The GcmTaskService class you provided ").append(str).append(" does not seem to support receiving com.google.android.gms.gcm.ACTION_TASK_READY.").toString());
    }

    public void cancelAllTasks(Class<? extends GcmTaskService> cls) {
        zze(cls);
    }

    public void cancelTask(String str, Class<? extends GcmTaskService> cls) {
        zzb(str, cls);
    }

    public void schedule(Task task) {
        zzkj(task.getServiceName());
        Intent zzbnq = zzbnq();
        if (zzbnq == null) {
            return;
        }
        Bundle extras = zzbnq.getExtras();
        extras.putString("scheduler_action", "SCHEDULE_TASK");
        task.toBundle(extras);
        zzbnq.putExtras(extras);
        this.mContext.sendBroadcast(zzbnq);
    }

    public void zzb(String str, Class<? extends Service> cls) {
        zza(str, new ComponentName(this.mContext, cls));
    }

    public void zze(Class<? extends Service> cls) {
        zza(new ComponentName(this.mContext, cls));
    }
}
