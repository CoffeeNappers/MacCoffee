package com.my.target.ads.mediation;

import com.facebook.appevents.AppEventsConstants;
import com.my.target.ads.CustomParams;
/* loaded from: classes2.dex */
public class AdmobCustomParamsFactory {
    public static CustomParams getCustomParams() {
        CustomParams customParams = new CustomParams();
        customParams.setCustomParam("mediation", AppEventsConstants.EVENT_PARAM_VALUE_YES);
        return customParams;
    }
}
