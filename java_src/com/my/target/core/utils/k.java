package com.my.target.core.utils;

import android.content.Context;
import android.content.SharedPreferences;
/* compiled from: PreferencesManager.java */
/* loaded from: classes2.dex */
public class k {
    private static k a;
    private static boolean b;
    private Context c;
    private SharedPreferences d;

    private k() {
    }

    public static k a() {
        k kVar;
        synchronized (k.class) {
            if (a == null) {
                a = new k();
            }
            kVar = a;
        }
        return kVar;
    }

    public final k a(Context context) {
        if (!b) {
            this.c = context;
            this.d = context.getSharedPreferences("mytarget_prefs", 0);
            b = true;
        }
        return this;
    }

    public final String b() {
        return this.d.getString("mrgsDeviceId", "");
    }

    public final void a(String str) {
        a("mrgsDeviceId", str);
    }

    private synchronized void a(String str, String str2) {
        SharedPreferences.Editor edit = this.d.edit();
        edit.putString(str, str2);
        edit.commit();
    }
}
