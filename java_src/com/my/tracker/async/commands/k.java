package com.my.tracker.async.commands;

import android.content.Context;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.res.Resources;
import android.os.Build;
import android.util.Pair;
import io.fabric.sdk.android.services.events.EventsFilesManager;
import java.util.ArrayList;
/* compiled from: TrackMajorEventsCommand.java */
/* loaded from: classes2.dex */
public final class k extends f {
    private long e;

    public k(String str, com.my.tracker.database.a aVar, com.my.tracker.b bVar, Context context) {
        super(str, aVar, bVar, context);
        this.e = System.currentTimeMillis() / 1000;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.my.tracker.async.commands.a
    public final e c() {
        String str;
        boolean z;
        boolean a;
        e eVar;
        Resources resources;
        e eVar2 = new e();
        try {
            com.my.tracker.utils.e a2 = com.my.tracker.utils.e.a().a(this.a);
            String s = this.c.s();
            if (s == null || s.length() <= 0 || a2.j()) {
                str = null;
            } else {
                com.my.tracker.a.a("check preinstall");
                PackageManager packageManager = this.a.getPackageManager();
                String packageName = this.a.getPackageName();
                try {
                    resources = packageManager.getResourcesForApplication(s);
                } catch (PackageManager.NameNotFoundException e) {
                    com.my.tracker.a.a("unable to locate vendor app: " + s);
                    resources = null;
                }
                if (resources == null) {
                    str = null;
                } else {
                    int identifier = resources.getIdentifier(packageName + EventsFilesManager.ROLL_OVER_FILE_NAME_SEPARATOR + "mytracker", "string", s);
                    str = identifier == 0 ? null : resources.getString(identifier);
                }
                a2.l();
                if (str != null) {
                    com.my.tracker.a.a("preinstall referrer: " + str);
                }
            }
            if (str == null && !a2.k()) {
                str = a2.h();
            }
            if (str != null && str.length() > 0) {
                a2.g(str);
                boolean a3 = a(com.my.tracker.factories.b.a(str, a(this.a), this.e));
                a2.a(a3);
                if (a3) {
                    com.my.tracker.a.a("referrer inserted successfully");
                } else {
                    com.my.tracker.a.a("insert referrer failed");
                }
            }
            Pair<String, String> g = g();
            String str2 = "";
            String str3 = "";
            if (g != null) {
                str2 = (String) g.first;
                str3 = (String) g.second;
            }
            String b = a2.b();
            String i = this.c.i();
            if (a2.a(i)) {
                com.my.tracker.a.a("event install: no install flag");
                long f = f();
                String a4 = a(this.a);
                long j = this.e;
                ArrayList arrayList = new ArrayList();
                arrayList.add(Long.valueOf(j));
                a = a(new com.my.tracker.models.events.d(f, a4, null, arrayList));
                if (a) {
                    a2.c(i);
                    a2.b(str2);
                    z = a;
                }
                z = a;
            } else if (!b.equals(str2)) {
                if (b.length() == 0) {
                    com.my.tracker.a.a("event update: no old version");
                } else {
                    com.my.tracker.a.a("event update: version changed");
                }
                String a5 = a(this.a);
                long j2 = this.e;
                ArrayList arrayList2 = new ArrayList();
                arrayList2.add(Long.valueOf(j2));
                a = a(new com.my.tracker.models.events.j(str2, str3, a5, null, arrayList2));
                if (a) {
                    a2.b(str2);
                    z = a;
                }
                z = a;
            } else {
                com.my.tracker.a.a("no install/update");
                z = true;
            }
            if (z) {
                eVar = super.c();
                if (eVar.a()) {
                    z = a(com.my.tracker.enums.a.MAJOR_EVENT);
                } else {
                    return eVar;
                }
            } else {
                eVar = eVar2;
            }
            eVar.a(z);
            return eVar;
        } catch (Throwable th) {
            com.my.tracker.a.a("PreferencesManager error: " + th);
            eVar2.a(false);
            return eVar2;
        }
    }

    private static String a(Context context) {
        if (context == null) {
            return "";
        }
        try {
            return context.getPackageManager().getInstallerPackageName(context.getPackageName());
        } catch (Exception e) {
            com.my.tracker.a.a("cannot retrieve \"installer\", packageManager exception");
            return "";
        }
    }

    private long f() {
        try {
            if (Build.VERSION.SDK_INT <= 8) {
                return 0L;
            }
            return this.a.getPackageManager().getPackageInfo(this.a.getPackageName(), 0).firstInstallTime / 1000;
        } catch (PackageManager.NameNotFoundException e) {
            com.my.tracker.a.c("Exception while trying to get app install time: " + e);
            return 0L;
        }
    }

    private Pair<String, String> g() {
        try {
            PackageInfo packageInfo = this.a.getPackageManager().getPackageInfo(this.a.getPackageName(), 0);
            return new Pair<>(Integer.toString(packageInfo.versionCode), packageInfo.versionName);
        } catch (PackageManager.NameNotFoundException e) {
            com.my.tracker.a.c("Unable to read app version from package manager: " + e);
            return null;
        }
    }
}
