package com.vkontakte.android.api.adsint;

import com.vkontakte.android.api.ResultlessAPIRequest;
/* loaded from: classes2.dex */
public class AdsintReportAd extends ResultlessAPIRequest {
    public AdsintReportAd(String data, String reason) {
        super("adsint.reportAd");
        param("ad_data", data);
        param("reason", reason);
    }
}
