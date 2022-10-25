package com.my.tracker.campaign;

import android.app.IntentService;
import android.content.Intent;
import com.my.tracker.a;
import com.my.tracker.async.commands.l;
import com.vkontakte.android.navigation.ArgKeys;
/* loaded from: classes2.dex */
public class CampaignService extends IntentService {
    private static volatile String a;

    public static void a(String str) {
        a = str;
    }

    public CampaignService() {
        super("MyTrackerCampaignService");
    }

    @Override // android.app.IntentService, android.app.Service
    public void onCreate() {
        a.a("CampaignService created");
        super.onCreate();
    }

    @Override // android.app.IntentService, android.app.Service
    public void onDestroy() {
        a.a("CampaignService destroyed");
        super.onDestroy();
    }

    @Override // android.app.IntentService
    protected void onHandleIntent(Intent intent) {
        if (intent != null && intent.hasExtra(ArgKeys.REFERRER)) {
            String stringExtra = intent.getStringExtra(ArgKeys.REFERRER);
            if (stringExtra == null) {
                stringExtra = "";
            }
            try {
                new l(com.my.tracker.net.a.a(), stringExtra, a, this).b().get();
            } catch (Exception e) {
                a.a("Error executing track referrer: " + e);
            }
        }
    }
}
