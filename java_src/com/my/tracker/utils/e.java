package com.my.tracker.utils;

import android.content.Context;
import android.content.SharedPreferences;
import com.vkontakte.android.navigation.ArgKeys;
/* compiled from: PreferencesManager.java */
/* loaded from: classes2.dex */
public class e {
    private static e a;
    private static boolean b;
    private SharedPreferences c;

    public static e a() {
        e eVar;
        synchronized (e.class) {
            if (a == null) {
                a = new e();
            }
            eVar = a;
        }
        return eVar;
    }

    public final String b() {
        return i("appVersion");
    }

    public final String c() {
        return i("appsHash");
    }

    public final long d() {
        return h("customEventsSkipped");
    }

    public final long e() {
        return h("eventTimestampBase");
    }

    private long h(String str) {
        return this.c.getLong(str, 0L);
    }

    public final String f() {
        return i("mrgsDeviceId");
    }

    public final String g() {
        return i("mac");
    }

    private String i(String str) {
        return this.c.getString(str, "");
    }

    public final String h() {
        return i(ArgKeys.REFERRER);
    }

    public final long i() {
        long h = h("lastStopTimeStampSec");
        a("lastStopTimeStampSec", 0L);
        return h;
    }

    public final boolean a(String str) {
        if (str == null || str.length() == 0) {
            return true;
        }
        String i = i(ArgKeys.APP_ID);
        return i.length() == 0 || !i.equals(str);
    }

    public final boolean j() {
        return j("preinstallRead");
    }

    public final boolean k() {
        return j("referrerSent");
    }

    private boolean j(String str) {
        return this.c.getBoolean(str, false);
    }

    public final void b(String str) {
        a("appVersion", str);
    }

    public final void c(String str) {
        a(ArgKeys.APP_ID, str);
    }

    public final void d(String str) {
        a("appsHash", str);
    }

    public final void a(long j) {
        a("customEventsSkipped", j);
    }

    public final void b(long j) {
        a("eventTimestampBase", j);
    }

    private synchronized void a(String str, long j) {
        SharedPreferences.Editor edit = this.c.edit();
        edit.putLong(str, j);
        edit.commit();
    }

    public final void e(String str) {
        a("mrgsDeviceId", str);
    }

    public final void f(String str) {
        a("mac", str);
    }

    private synchronized void a(String str, String str2) {
        SharedPreferences.Editor edit = this.c.edit();
        edit.putString(str, str2);
        edit.commit();
    }

    public final void l() {
        a("preinstallRead", true);
    }

    public final void g(String str) {
        a(ArgKeys.REFERRER, str);
    }

    public final void a(boolean z) {
        a("referrerSent", z);
    }

    private synchronized void a(String str, boolean z) {
        SharedPreferences.Editor edit = this.c.edit();
        edit.putBoolean(str, z);
        edit.commit();
    }

    public final void c(long j) {
        a("lastStopTimeStampSec", j);
    }

    private e() {
    }

    public final e a(Context context) {
        if (!b) {
            this.c = context.getSharedPreferences("mytracker_prefs", 0);
            b = true;
        }
        return this;
    }
}
