package com.my.tracker.providers;

import android.content.Context;
import android.os.Looper;
import com.google.android.gms.ads.identifier.AdvertisingIdClient;
/* compiled from: GoogleAIdDataProvider.java */
/* loaded from: classes2.dex */
public final class f extends a {
    private boolean a = false;
    private String b = "";
    private boolean c = true;

    public final void b(Context context) {
        if (Looper.myLooper() == Looper.getMainLooper()) {
            com.my.tracker.a.a("GoogleAIdDataProvider: You must not call collectData method from main thread");
        } else if (this.a) {
        } else {
            com.my.tracker.a.a("get google AId");
            try {
                this.b = AdvertisingIdClient.getAdvertisingIdInfo(context).getId();
                com.my.tracker.a.a("AId google advertising id: " + this.b);
                this.c = !AdvertisingIdClient.getAdvertisingIdInfo(context).isLimitAdTrackingEnabled();
                com.my.tracker.a.a("AId ad tracking enabled: " + this.c);
            } catch (Throwable th) {
                com.my.tracker.a.a(th.toString());
                com.my.tracker.a.a("failed to get google AId");
            }
            this.a = true;
        }
    }

    public final void a(com.my.tracker.builders.a aVar) {
        if (this.b != null && !this.b.equals("")) {
            aVar.a(this.b, this.c ? 1 : 0);
        }
    }
}
