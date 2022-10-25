package com.my.tracker.providers;

import android.accounts.Account;
import android.accounts.AccountManager;
import android.annotation.SuppressLint;
import android.content.ContentResolver;
import android.content.Context;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.graphics.Point;
import android.os.Build;
import android.os.Looper;
import android.provider.Settings;
import android.telephony.TelephonyManager;
import android.text.TextUtils;
import android.util.DisplayMetrics;
import android.view.Display;
import android.view.WindowManager;
import com.fasterxml.jackson.core.util.MinimalPrettyPrinter;
import com.vkontakte.android.fragments.SignupPhoneFragment;
import java.net.NetworkInterface;
import java.util.Collections;
import java.util.Locale;
import java.util.TimeZone;
/* compiled from: DeviceParamsDataProvider.java */
/* loaded from: classes2.dex */
public final class c extends a {
    private boolean a = false;
    private String b = "";
    private String c = "";
    private String d = "";
    private String e = "";
    private String f = "";
    private String g = "";
    private String h = "";
    private String i = "";
    private String j = "";
    private String k = "";
    private String l = "";
    private String m = "";
    private int n = 0;
    private int o = 0;
    private int p = 0;
    private float q = 0.0f;
    private String r = "";
    private String s = "";
    private String t = "";
    private String u = "";
    private String v = "";
    private String w = "";

    public final void b(Context context) {
        if (Looper.myLooper() == Looper.getMainLooper()) {
            com.my.tracker.a.a("DeviceParamsDataProvider: You must not call collectData method from main thread");
        } else if (!this.a) {
            com.my.tracker.a.a("collect application info...");
            this.b = Build.DEVICE;
            this.i = Build.MANUFACTURER;
            this.j = Build.MODEL;
            this.e = Build.VERSION.RELEASE;
            this.f = context.getPackageName();
            this.k = Locale.getDefault().getLanguage();
            this.w = e(context);
            try {
                PackageInfo packageInfo = context.getPackageManager().getPackageInfo(this.f, 0);
                this.h = packageInfo.versionName;
                this.g = Integer.toString(packageInfo.versionCode);
            } catch (PackageManager.NameNotFoundException e) {
            }
            ContentResolver contentResolver = context.getContentResolver();
            if (contentResolver != null) {
                this.d = Settings.Secure.getString(contentResolver, "android_id");
                if (this.d == null) {
                    this.d = "";
                }
            }
            this.l = context.getResources().getConfiguration().locale.getLanguage();
            TelephonyManager telephonyManager = (TelephonyManager) context.getSystemService(SignupPhoneFragment.KEY_PHONE);
            this.s = telephonyManager.getNetworkOperatorName();
            String networkOperator = telephonyManager.getNetworkOperator();
            if (!TextUtils.isEmpty(networkOperator) && networkOperator.length() > 3) {
                this.r = networkOperator.substring(3);
                this.m = networkOperator.substring(0, 3);
            } else {
                this.r = networkOperator;
            }
            try {
                this.c = telephonyManager.getDeviceId();
                if (this.c == null) {
                    this.c = "";
                }
            } catch (SecurityException e2) {
                com.my.tracker.a.a("No permissions for access to phone state");
            }
            if (telephonyManager.getSimState() == 5) {
                this.t = telephonyManager.getSimOperator();
            }
            if (!this.a) {
                Display defaultDisplay = ((WindowManager) context.getSystemService("window")).getDefaultDisplay();
                Point point = new Point();
                if (Build.VERSION.SDK_INT >= 17) {
                    defaultDisplay.getRealSize(point);
                } else if (Build.VERSION.SDK_INT >= 13) {
                    defaultDisplay.getSize(point);
                } else {
                    point.x = defaultDisplay.getWidth();
                    point.y = defaultDisplay.getHeight();
                }
                this.n = point.x;
                this.o = point.y;
            }
            DisplayMetrics displayMetrics = context.getResources().getDisplayMetrics();
            this.p = displayMetrics.densityDpi;
            this.q = displayMetrics.density;
            TimeZone timeZone = TimeZone.getDefault();
            this.u = timeZone.getDisplayName(false, 0) + MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR + timeZone.getID();
            this.v = c(context);
            this.a = true;
            com.my.tracker.a.a("collected");
        }
    }

    public final void a(com.my.tracker.builders.a aVar) {
        if (!TextUtils.isEmpty(this.c)) {
            aVar.b(this.c);
        }
        if (!TextUtils.isEmpty(this.d)) {
            aVar.c(this.d);
        }
        if (!TextUtils.isEmpty(this.v)) {
            aVar.d(this.v);
        }
        if (!TextUtils.isEmpty(this.b)) {
            aVar.e(this.b);
        }
        if (!TextUtils.isEmpty(this.i)) {
            aVar.g(this.i);
        }
        if (!TextUtils.isEmpty(this.e)) {
            aVar.i(this.e);
        }
        if (!TextUtils.isEmpty(this.k)) {
            aVar.j(this.k);
        }
        if (!TextUtils.isEmpty(this.m)) {
            aVar.m(this.m);
        }
        if (!TextUtils.isEmpty(this.j)) {
            aVar.l(this.j);
        }
        if (!TextUtils.isEmpty(this.r)) {
            aVar.n(this.r);
        }
        if (!TextUtils.isEmpty(this.s)) {
            aVar.o(this.s);
        }
        if (!TextUtils.isEmpty(this.t)) {
            aVar.p(this.t);
        }
        if (!TextUtils.isEmpty(this.u)) {
            aVar.k(this.u);
        }
        if (!TextUtils.isEmpty(this.f)) {
            aVar.q(this.f);
        }
        if (!TextUtils.isEmpty(this.h)) {
            aVar.r(this.h);
        }
        if (!TextUtils.isEmpty(this.g)) {
            aVar.s(this.g);
        }
        if (!TextUtils.isEmpty(this.l)) {
            aVar.t(this.l);
        }
        if (!TextUtils.isEmpty(this.w)) {
            aVar.h(this.w);
        }
        aVar.f("Android");
        aVar.a(this.n);
        aVar.b(this.o);
        aVar.c(this.p);
        aVar.a(this.q);
    }

    /* JADX WARN: Removed duplicated region for block: B:20:0x004b  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private java.lang.String c(android.content.Context r7) {
        /*
            r6 = this;
            r3 = 0
            java.lang.String r0 = ""
            java.lang.String r1 = "android.permission.GET_ACCOUNTS"
            int r1 = r7.checkCallingOrSelfPermission(r1)
            if (r1 != 0) goto L2c
            r1 = 1
        Le:
            if (r1 == 0) goto L14
            java.lang.String r0 = d(r7)
        L14:
            boolean r1 = android.text.TextUtils.isEmpty(r0)
            if (r1 != 0) goto L8e
            java.lang.String r1 = a(r0, r7)
        L1e:
            if (r1 == 0) goto L39
            com.my.tracker.utils.e r0 = com.my.tracker.utils.e.a()     // Catch: java.lang.Throwable -> L2e
            com.my.tracker.utils.e r0 = r0.a(r7)     // Catch: java.lang.Throwable -> L2e
            r0.e(r1)     // Catch: java.lang.Throwable -> L2e
        L2b:
            return r1
        L2c:
            r1 = 0
            goto Le
        L2e:
            r0 = move-exception
            java.lang.String r2 = "PreferencesManager error"
            com.my.tracker.a.a(r2)
            r0.printStackTrace()
            goto L2b
        L39:
            com.my.tracker.utils.e r2 = com.my.tracker.utils.e.a()     // Catch: java.lang.Throwable -> L7a
            com.my.tracker.utils.e r2 = r2.a(r7)     // Catch: java.lang.Throwable -> L7a
            java.lang.String r1 = r2.f()     // Catch: java.lang.Throwable -> L8c
        L45:
            boolean r3 = android.text.TextUtils.isEmpty(r1)
            if (r3 == 0) goto L2b
            int r1 = android.os.Build.VERSION.SDK_INT
            r3 = 9
            if (r1 < r3) goto L88
            java.lang.String r1 = android.os.Build.SERIAL
        L53:
            java.lang.StringBuilder r3 = new java.lang.StringBuilder
            r3.<init>()
            java.lang.String r4 = r6.d
            java.lang.StringBuilder r3 = r3.append(r4)
            java.lang.String r4 = r6.c
            java.lang.StringBuilder r3 = r3.append(r4)
            java.lang.StringBuilder r1 = r3.append(r1)
            java.lang.StringBuilder r0 = r1.append(r0)
            java.lang.String r0 = r0.toString()
            java.lang.String r1 = com.my.tracker.utils.a.a(r0)
            if (r2 == 0) goto L2b
            r2.e(r1)
            goto L2b
        L7a:
            r2 = move-exception
            r5 = r2
            r2 = r3
            r3 = r5
        L7e:
            java.lang.String r4 = "PreferencesManager error"
            com.my.tracker.a.a(r4)
            r3.printStackTrace()
            goto L45
        L88:
            java.lang.String r1 = "sdk < 9"
            goto L53
        L8c:
            r3 = move-exception
            goto L7e
        L8e:
            r1 = r3
            goto L1e
        */
        throw new UnsupportedOperationException("Method not decompiled: com.my.tracker.providers.c.c(android.content.Context):java.lang.String");
    }

    private static String d(Context context) {
        Account[] accountArr = null;
        try {
            accountArr = AccountManager.get(context).getAccountsByType("com.google");
        } catch (Throwable th) {
        }
        return (accountArr == null || accountArr.length <= 0) ? "" : accountArr[0].name;
    }

    @SuppressLint({"HardwareIds"})
    private static String e(Context context) {
        try {
            com.my.tracker.utils.e a = com.my.tracker.utils.e.a().a(context);
            String g = a.g();
            if (!TextUtils.isEmpty(g)) {
                com.my.tracker.a.a("retrieving mac " + g + " from cache");
                return g;
            }
            for (NetworkInterface networkInterface : Collections.list(NetworkInterface.getNetworkInterfaces())) {
                if (networkInterface.getName().equalsIgnoreCase("wlan0")) {
                    byte[] hardwareAddress = networkInterface.getHardwareAddress();
                    if (hardwareAddress == null) {
                        com.my.tracker.a.a("unable to retrieve mac: getHardwareAddress is null");
                        return "";
                    }
                    StringBuilder sb = new StringBuilder();
                    int length = hardwareAddress.length;
                    for (int i = 0; i < length; i++) {
                        sb.append(String.format("%02X:", Byte.valueOf(hardwareAddress[i])));
                    }
                    if (sb.length() > 0) {
                        sb.deleteCharAt(sb.length() - 1);
                    }
                    String sb2 = sb.toString();
                    if (!TextUtils.isEmpty(sb2)) {
                        com.my.tracker.a.a("succesfully retreived mac " + sb2);
                        a.f(sb2);
                        return sb2;
                    }
                    return sb2;
                }
            }
            com.my.tracker.a.a("unable to retrieve mac: network interfaces does not contain wlan0");
            return "";
        } catch (Exception e) {
            com.my.tracker.a.a("unable to retreive mac: exception " + e.getMessage());
            return "";
        }
    }

    private static String a(String str, Context context) {
        try {
            return context.getSharedPreferences("open_udid_cache", 0).getString(str, null);
        } catch (Throwable th) {
            return null;
        }
    }
}
