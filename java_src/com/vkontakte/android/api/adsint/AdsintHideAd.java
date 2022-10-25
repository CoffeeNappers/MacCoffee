package com.vkontakte.android.api.adsint;

import com.vkontakte.android.api.ResultlessAPIRequest;
/* loaded from: classes2.dex */
public class AdsintHideAd extends ResultlessAPIRequest {

    /* loaded from: classes2.dex */
    public enum ObjectType {
        ad,
        source
    }

    public AdsintHideAd(String data, ObjectType objectType) {
        super("adsint.hideAd");
        param("ad_data", data);
        param("object_type", objectType.name());
    }
}
