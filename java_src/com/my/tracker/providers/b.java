package com.my.tracker.providers;

import android.content.Context;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageInfo;
import android.os.Build;
import android.os.Looper;
import java.util.ArrayList;
import java.util.List;
/* compiled from: AppsDataProvider.java */
/* loaded from: classes2.dex */
public final class b extends com.my.tracker.providers.a {
    private ArrayList<a> b;
    private String c;
    private boolean a = true;
    private boolean d = false;

    public final void a(boolean z) {
        this.a = z;
    }

    public final void b(Context context) {
        if (Looper.myLooper() == Looper.getMainLooper()) {
            com.my.tracker.a.a("AppsDataProvider: You must not call collectData method from main thread");
        } else if (this.a) {
            try {
                com.my.tracker.utils.e a2 = com.my.tracker.utils.e.a().a(context);
                this.d = false;
                this.b = c(context);
                String a3 = com.my.tracker.utils.c.a(this.b);
                if (!a3.equals("")) {
                    String c = a2.c();
                    this.c = com.my.tracker.utils.a.a(a3);
                    if (c.equals(this.c)) {
                        com.my.tracker.a.a("Apps hash did not changed");
                        return;
                    }
                    this.d = true;
                    com.my.tracker.a.a("Apps hash changed");
                }
            } catch (Throwable th) {
                com.my.tracker.a.a("PreferencesManager error: " + th);
            }
        }
    }

    public final void a(com.my.tracker.builders.a aVar) {
        if (this.d) {
            aVar.b(this.b);
        }
    }

    @Override // com.my.tracker.providers.a
    public final void a(Context context) {
        super.a(context);
        if (this.d) {
            try {
                com.my.tracker.utils.e.a().a(context).d(this.c);
            } catch (Throwable th) {
                com.my.tracker.a.a("PreferencesManager error: " + th);
            }
            this.d = false;
        }
    }

    private static ArrayList<a> c(Context context) {
        List<PackageInfo> list = null;
        try {
            list = context.getPackageManager().getInstalledPackages(0);
        } catch (Throwable th) {
            com.my.tracker.a.a(th.toString());
        }
        ArrayList<a> arrayList = new ArrayList<>();
        if (list != null) {
            for (PackageInfo packageInfo : list) {
                ApplicationInfo applicationInfo = packageInfo.applicationInfo;
                if ((applicationInfo.flags & 1) == 0) {
                    arrayList.add(new a(applicationInfo.packageName, Build.VERSION.SDK_INT > 8 ? packageInfo.firstInstallTime / 1000 : 0L));
                }
            }
        }
        return arrayList;
    }

    /* compiled from: AppsDataProvider.java */
    /* loaded from: classes2.dex */
    public static class a {
        public final String a;
        public final long b;

        public a(String str, long j) {
            this.a = str;
            this.b = j;
        }
    }
}
