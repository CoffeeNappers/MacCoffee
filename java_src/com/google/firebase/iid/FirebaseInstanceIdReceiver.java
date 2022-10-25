package com.google.firebase.iid;

import android.content.Context;
import android.content.Intent;
import android.os.Build;
import android.support.v4.content.WakefulBroadcastReceiver;
import android.util.Base64;
import android.util.Log;
import com.google.android.c2dm.C2DMBaseReceiver;
import com.vkontakte.android.data.ServerKeys;
/* loaded from: classes2.dex */
public final class FirebaseInstanceIdReceiver extends WakefulBroadcastReceiver {
    @Override // android.content.BroadcastReceiver
    public void onReceive(Context context, Intent intent) {
        String str;
        if (isOrderedBroadcast()) {
            setResultCode(500);
        }
        intent.setComponent(null);
        intent.setPackage(context.getPackageName());
        if (Build.VERSION.SDK_INT <= 18) {
            intent.removeCategory(context.getPackageName());
        }
        String stringExtra = intent.getStringExtra("gcm.rawData64");
        if (stringExtra != null) {
            intent.putExtra("rawData", Base64.decode(stringExtra, 0));
            intent.removeExtra("gcm.rawData64");
        }
        String stringExtra2 = intent.getStringExtra(ServerKeys.FROM);
        if (C2DMBaseReceiver.REGISTRATION_CALLBACK_INTENT.equals(intent.getAction()) || "google.com/iid".equals(stringExtra2) || "gcm.googleapis.com/refresh".equals(stringExtra2)) {
            str = "com.google.firebase.INSTANCE_ID_EVENT";
        } else if ("com.google.android.c2dm.intent.RECEIVE".equals(intent.getAction())) {
            str = "com.google.firebase.MESSAGING_EVENT";
        } else {
            Log.d("FirebaseInstanceId", "Unexpected intent");
            str = null;
        }
        int i = -1;
        if (str != null) {
            i = FirebaseInstanceIdInternalReceiver.zzb(context, str, intent);
        }
        if (isOrderedBroadcast()) {
            setResultCode(i);
        }
    }
}
