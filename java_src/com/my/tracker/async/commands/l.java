package com.my.tracker.async.commands;

import android.content.Context;
/* compiled from: TrackReferrerCommand.java */
/* loaded from: classes2.dex */
public final class l extends c {
    private String e;
    private String f;
    private long g;

    public l(String str, String str2, String str3, Context context) {
        super(str, null, context);
        this.e = str2;
        this.f = str3;
        this.g = System.currentTimeMillis() / 1000;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.my.tracker.async.commands.a
    public final e c() {
        boolean z = false;
        e c = super.c();
        if (!c.a()) {
            return c;
        }
        try {
            com.my.tracker.utils.e a = com.my.tracker.utils.e.a().a(this.a);
            if (this.e != null && this.e.length() > 0) {
                a.g(this.e);
                if (this.f != null) {
                    String str = this.e;
                    if (!e()) {
                        com.my.tracker.a.a("no internet connection");
                    } else {
                        d();
                        com.my.tracker.a.a("track referrer: " + str);
                        com.my.tracker.models.events.c a2 = com.my.tracker.factories.b.a(str, a(this.a), 0L);
                        com.my.tracker.builders.a aVar = new com.my.tracker.builders.a();
                        if (this.f != null) {
                            aVar.a(this.f);
                        }
                        aVar.a(this.g);
                        aVar.b(System.currentTimeMillis() / 1000);
                        com.my.tracker.providers.e.a().a(aVar);
                        aVar.a(a2);
                        String aVar2 = aVar.toString();
                        com.my.tracker.a.a("send referrer");
                        z = a(aVar2);
                        a.a(z);
                        if (z) {
                            com.my.tracker.a.a("referrer sent successfully");
                            com.my.tracker.providers.e.a().a(this.a);
                        } else {
                            com.my.tracker.a.a("Send referrer failed");
                        }
                    }
                    c.a(z);
                }
            }
            return c;
        } catch (Throwable th) {
            com.my.tracker.a.a("PreferencesManager error: " + th);
            c.a(false);
            return c;
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
}
