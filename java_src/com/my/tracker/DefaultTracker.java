package com.my.tracker;

import android.app.Activity;
import android.content.Context;
import android.os.Handler;
import android.os.Looper;
import com.google.android.gms.analytics.ecommerce.ProductAction;
import com.google.firebase.analytics.FirebaseAnalytics;
import com.my.tracker.async.commands.h;
import com.my.tracker.async.commands.j;
import com.my.tracker.async.commands.k;
import com.my.tracker.campaign.CampaignService;
import com.my.tracker.providers.e;
import io.reactivex.annotations.SchedulerSupport;
import java.util.Map;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public final class DefaultTracker implements Tracker {
    private static boolean a = false;
    private final b b;
    private final Context c;
    private final com.my.tracker.database.a d;
    private volatile boolean f;
    private volatile boolean g;
    private int h;
    private boolean i;
    private long j = 0;
    private long k = 0;
    private long l = 0;
    private final Runnable m = new Runnable() { // from class: com.my.tracker.DefaultTracker.1
        @Override // java.lang.Runnable
        public final void run() {
            if (DefaultTracker.this.i) {
                DefaultTracker.this.a();
            }
        }
    };
    private final Handler e = new Handler(Looper.getMainLooper());

    @Override // com.my.tracker.Tracker
    public final boolean isInitialized() {
        return this.f;
    }

    @Override // com.my.tracker.Tracker
    public final b getParams() {
        return this.b;
    }

    @Override // com.my.tracker.Tracker
    public final boolean isEnabled() {
        return this.g;
    }

    @Override // com.my.tracker.Tracker
    public final void setEnabled(boolean z) {
        this.g = z;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public DefaultTracker(String str, Context context) {
        this.b = new b(str);
        this.c = context.getApplicationContext();
        this.d = new com.my.tracker.database.a(str, this.c);
    }

    @Override // com.my.tracker.Tracker
    public final synchronized void init() {
        if (!this.f) {
            this.f = true;
            a.b("Tracker initialized. Version: 1.3.8. ID: " + this.b.i());
            this.j = this.b.k() * 1000;
            e.a().d().a(this.b.t());
            CampaignService.a(this.b.i());
            if (this.g) {
                new k(com.my.tracker.net.a.a(), this.d, this.b, this.c).a();
            }
        } else {
            a.a("Tracker with id " + this.b.i() + "already initialized");
        }
    }

    @Override // com.my.tracker.Tracker
    public final synchronized void onStartActivity(Activity activity) {
        if (a || (this.g && this.h <= 0)) {
            long currentTimeMillis = System.currentTimeMillis();
            if (a || (this.b.v() && currentTimeMillis - this.k >= this.j)) {
                new j(com.my.tracker.net.a.a(), this.d, this.b, this.k / 1000, this.c).a();
                if (!a) {
                    a(900000L);
                }
            } else {
                long j = this.l - currentTimeMillis;
                if (j > 0) {
                    a(j);
                } else {
                    a();
                }
                com.my.tracker.factories.a.a(0L, this.c).a();
            }
        }
        this.h++;
    }

    @Override // com.my.tracker.Tracker
    public final synchronized void onStopActivity(Activity activity) {
        this.h--;
        if (this.h <= 0) {
            this.i = false;
            this.e.removeCallbacks(this.m);
            this.k = System.currentTimeMillis();
            com.my.tracker.factories.a.a(this.k / 1000, this.c).a();
        }
    }

    @Override // com.my.tracker.Tracker
    public final void trackEvent(String str) {
        trackEvent(str, null);
    }

    @Override // com.my.tracker.Tracker
    public final void trackEvent(String str, Map<String, String> map) {
        if (str == null || str.equals("")) {
            a.a("Event name should be not null and not empty");
        } else if (com.my.tracker.factories.b.a(SchedulerSupport.CUSTOM, str)) {
            if ((map == null || com.my.tracker.factories.b.c(SchedulerSupport.CUSTOM, map)) && this.g) {
                com.my.tracker.factories.a.a(com.my.tracker.factories.b.a(str, map), this.d, this.b, this.c).a();
            }
        }
    }

    @Override // com.my.tracker.Tracker
    public final void trackLoginEvent() {
        trackLoginEvent(null);
    }

    @Override // com.my.tracker.Tracker
    public final void trackLoginEvent(Map<String, String> map) {
        if ((map == null || com.my.tracker.factories.b.c(FirebaseAnalytics.Event.LOGIN, map)) && this.g) {
            com.my.tracker.factories.a.a(com.my.tracker.factories.b.b(FirebaseAnalytics.Event.LOGIN, map), this.d, this.b, this.c).a();
        }
    }

    @Override // com.my.tracker.Tracker
    public final void trackRegistrationEvent() {
        trackRegistrationEvent(null);
    }

    @Override // com.my.tracker.Tracker
    public final void trackRegistrationEvent(Map<String, String> map) {
        if ((map == null || com.my.tracker.factories.b.c("registration", map)) && this.g) {
            com.my.tracker.factories.a.a(com.my.tracker.factories.b.b("registration", map), this.d, this.b, this.c).a();
        }
    }

    @Override // com.my.tracker.Tracker
    public final void trackInviteEvent() {
        trackInviteEvent(null);
    }

    @Override // com.my.tracker.Tracker
    public final void trackInviteEvent(Map<String, String> map) {
        if ((map == null || com.my.tracker.factories.b.c("invite", map)) && this.g) {
            com.my.tracker.factories.a.a(com.my.tracker.factories.b.b("invite", map), this.d, this.b, this.c).a();
        }
    }

    @Override // com.my.tracker.Tracker
    public final void trackPurchaseEvent(JSONObject jSONObject, JSONObject jSONObject2, String str, Map<String, String> map) {
        if ((map == null || com.my.tracker.factories.b.c(ProductAction.ACTION_PURCHASE, map)) && this.g) {
            com.my.tracker.factories.a.a(com.my.tracker.factories.b.a(jSONObject, jSONObject2, str, map), this.d, this.b, this.c).a();
        }
    }

    @Override // com.my.tracker.Tracker
    public final void trackPurchaseEvent(JSONObject jSONObject, JSONObject jSONObject2, String str) {
        trackPurchaseEvent(jSONObject, jSONObject2, str, null);
    }

    @Override // com.my.tracker.Tracker
    public final void trackLevelEvent(int i, Map<String, String> map) {
        if ((map == null || com.my.tracker.factories.b.c("level_achieved", map)) && this.g) {
            com.my.tracker.factories.a.a(com.my.tracker.factories.b.a(i, map), this.d, this.b, this.c).a();
        }
    }

    @Override // com.my.tracker.Tracker
    public final void trackLevelEvent(Map<String, String> map) {
        trackLevelEvent(-1, map);
    }

    @Override // com.my.tracker.Tracker
    public final void trackLevelEvent() {
        trackLevelEvent(-1, null);
    }

    private void a(long j) {
        this.e.removeCallbacks(this.m);
        this.i = true;
        this.l = System.currentTimeMillis() + j;
        this.e.postDelayed(this.m, j);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void a() {
        a.a("Send events by timer");
        new h(com.my.tracker.net.a.a(), com.my.tracker.enums.a.TIME_INTERVAL, this.d, this.b, this.c).a();
        a(900000L);
    }
}
