package com.google.android.gms.tagmanager;

import android.annotation.SuppressLint;
import android.content.Context;
import android.content.SharedPreferences;
import android.os.Build;
/* loaded from: classes2.dex */
class zzdd {
    /* JADX INFO: Access modifiers changed from: package-private */
    public static void zza(final SharedPreferences.Editor editor) {
        if (Build.VERSION.SDK_INT >= 9) {
            editor.apply();
        } else {
            new Thread(new Runnable() { // from class: com.google.android.gms.tagmanager.zzdd.1
                @Override // java.lang.Runnable
                public void run() {
                    editor.commit();
                }
            }).start();
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    @SuppressLint({"CommitPrefEdits"})
    public static void zzc(Context context, String str, String str2, String str3) {
        SharedPreferences.Editor edit = context.getSharedPreferences(str, 0).edit();
        edit.putString(str2, str3);
        zza(edit);
    }
}
