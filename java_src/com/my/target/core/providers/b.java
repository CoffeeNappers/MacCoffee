package com.my.target.core.providers;

import android.accounts.Account;
import android.accounts.AccountManager;
import android.content.ContentResolver;
import android.content.Context;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.graphics.Point;
import android.os.Build;
import android.provider.Settings;
import android.telephony.TelephonyManager;
import android.text.TextUtils;
import android.util.DisplayMetrics;
import android.view.Display;
import android.view.WindowManager;
import com.fasterxml.jackson.core.util.MinimalPrettyPrinter;
import com.my.target.Tracer;
import com.vkontakte.android.fragments.SignupPhoneFragment;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;
import java.util.TimeZone;
/* compiled from: DeviceParamsDataProvider.java */
/* loaded from: classes2.dex */
public final class b extends a {
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
    private int m = 0;
    private int n = 0;
    private int o = 0;
    private float p = 0.0f;
    private String q = "";
    private String r = "";
    private String s = "";
    private String t = "";
    private String u = "";
    private Map<String, String> v = new HashMap();

    public final int a() {
        return this.m;
    }

    public final int b() {
        return this.n;
    }

    public final synchronized void a(Context context) {
        if (!this.a) {
            Tracer.d("collect application info...");
            this.b = Build.DEVICE;
            this.h = Build.MANUFACTURER;
            this.i = Build.MODEL;
            this.d = Build.VERSION.RELEASE;
            this.e = context.getPackageName();
            this.j = Locale.getDefault().getLanguage();
            try {
                PackageInfo packageInfo = context.getPackageManager().getPackageInfo(this.e, 0);
                this.f = packageInfo.versionName;
                this.g = Integer.toString(packageInfo.versionCode);
            } catch (PackageManager.NameNotFoundException e) {
            }
            ContentResolver contentResolver = context.getContentResolver();
            if (contentResolver != null) {
                this.c = Settings.Secure.getString(contentResolver, "android_id");
                if (this.c == null) {
                    this.c = "";
                }
            }
            this.k = context.getResources().getConfiguration().locale.getLanguage();
            TelephonyManager telephonyManager = (TelephonyManager) context.getSystemService(SignupPhoneFragment.KEY_PHONE);
            this.r = telephonyManager.getNetworkOperatorName();
            if (telephonyManager.getSimState() == 5) {
                this.s = telephonyManager.getSimOperator();
            }
            String networkOperator = telephonyManager.getNetworkOperator();
            if (!TextUtils.isEmpty(networkOperator) && networkOperator.length() > 3) {
                this.q = networkOperator.substring(3);
                this.l = networkOperator.substring(0, 3);
            } else {
                this.q = networkOperator;
            }
            b(context);
            DisplayMetrics displayMetrics = context.getResources().getDisplayMetrics();
            this.o = displayMetrics.densityDpi;
            this.p = displayMetrics.density;
            TimeZone timeZone = TimeZone.getDefault();
            this.t = timeZone.getDisplayName(false, 0) + MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR + timeZone.getID();
            this.u = c(context);
            addParam("android_id", this.c);
            addParam("device", this.b);
            addParam("os", "Android");
            addParam("manufacture", this.h);
            addParam("osver", this.d);
            addParam("app", this.e);
            addParam("appver", this.f);
            addParam("appbuild", this.g);
            addParam("lang", this.j);
            addParam("app_lang", this.k);
            addParam("sim_loc", this.l);
            addParam("euname", this.i);
            addParam("w", new StringBuilder().append(this.m).toString());
            addParam("h", new StringBuilder().append(this.n).toString());
            addParam("dpi", new StringBuilder().append(this.o).toString());
            addParam("density", new StringBuilder().append(this.p).toString());
            addParam("operator_id", this.q);
            addParam("operator_name", this.r);
            addParam("sim_operator_id", this.s);
            addParam("timezone", this.t);
            addParam("mrgs_device_id", this.u);
            this.v.put("android_id", this.c);
            this.v.put("euname", this.i);
            this.v.put("os", "Android");
            this.v.put("osver", this.d);
            this.v.put("manufacture", this.h);
            for (Map.Entry<String, String> entry : getMap().entrySet()) {
                Tracer.d(entry.getKey() + " = " + entry.getValue());
            }
            this.a = true;
            Tracer.d("collected");
        }
    }

    public final void b(Context context) {
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
            this.m = point.x;
            this.n = point.y;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private java.lang.String c(android.content.Context r6) {
        /*
            r5 = this;
            r1 = 0
            com.my.target.core.utils.k r0 = com.my.target.core.utils.k.a()     // Catch: java.lang.Throwable -> L49
            com.my.target.core.utils.k r0 = r0.a(r6)     // Catch: java.lang.Throwable -> L49
            java.lang.String r1 = r0.b()     // Catch: java.lang.Throwable -> L5a
        Ld:
            boolean r2 = android.text.TextUtils.isEmpty(r1)
            if (r2 == 0) goto L48
            int r1 = android.os.Build.VERSION.SDK_INT
            r2 = 9
            if (r1 < r2) goto L56
            java.lang.String r1 = android.os.Build.SERIAL
        L1b:
            java.lang.String r2 = ""
            boolean r3 = e(r6)
            if (r3 == 0) goto L28
            java.lang.String r2 = d(r6)
        L28:
            java.lang.StringBuilder r3 = new java.lang.StringBuilder
            r3.<init>()
            java.lang.String r4 = r5.c
            java.lang.StringBuilder r3 = r3.append(r4)
            java.lang.StringBuilder r1 = r3.append(r1)
            java.lang.StringBuilder r1 = r1.append(r2)
            java.lang.String r1 = r1.toString()
            java.lang.String r1 = com.my.target.core.utils.f.a(r1)
            if (r0 == 0) goto L48
            r0.a(r1)
        L48:
            return r1
        L49:
            r0 = move-exception
            r2 = r0
            r0 = r1
        L4c:
            java.lang.String r3 = "PreferencesManager error"
            com.my.target.Tracer.d(r3)
            r2.printStackTrace()
            goto Ld
        L56:
            java.lang.String r1 = "sdk < 9"
            goto L1b
        L5a:
            r2 = move-exception
            goto L4c
        */
        throw new UnsupportedOperationException("Method not decompiled: com.my.target.core.providers.b.c(android.content.Context):java.lang.String");
    }

    private static String d(Context context) {
        Account[] accountArr = null;
        try {
            accountArr = AccountManager.get(context).getAccountsByType("com.google");
        } catch (Throwable th) {
        }
        return (accountArr == null || accountArr.length <= 0) ? "" : accountArr[0].name;
    }

    private static boolean e(Context context) {
        int i;
        try {
            i = context.checkCallingOrSelfPermission("android.permission.GET_ACCOUNTS");
        } catch (Throwable th) {
            Tracer.d("unable to check android.permission.GET_ACCOUNTS permission! Unexpected throwable in Context.checkCallingOrSelfPermission() method: " + th.getMessage());
            i = -1;
        }
        return i == 0;
    }
}
