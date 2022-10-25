package com.google.android.gms.tagmanager;

import android.content.Context;
import com.google.android.gms.analytics.CampaignTrackingReceiver;
import com.google.android.gms.analytics.CampaignTrackingService;
/* loaded from: classes2.dex */
public final class InstallReferrerReceiver extends CampaignTrackingReceiver {
    @Override // com.google.android.gms.analytics.CampaignTrackingReceiver
    protected void zzp(Context context, String str) {
        zzbf.zzpl(str);
        zzbf.zzaf(context, str);
    }

    @Override // com.google.android.gms.analytics.CampaignTrackingReceiver
    protected Class<? extends CampaignTrackingService> zzyy() {
        return InstallReferrerService.class;
    }
}
