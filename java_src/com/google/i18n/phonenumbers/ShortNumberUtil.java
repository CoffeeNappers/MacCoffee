package com.google.i18n.phonenumbers;

import java.util.Set;
@Deprecated
/* loaded from: classes.dex */
public class ShortNumberUtil {

    /* loaded from: classes2.dex */
    public enum ShortNumberCost {
        TOLL_FREE,
        STANDARD_RATE,
        PREMIUM_RATE,
        UNKNOWN_COST
    }

    public Set<String> getSupportedRegions() {
        return ShortNumberInfo.getInstance().getSupportedRegions();
    }

    public boolean connectsToEmergencyNumber(String number, String regionCode) {
        return ShortNumberInfo.getInstance().connectsToEmergencyNumber(number, regionCode);
    }

    public boolean isEmergencyNumber(String number, String regionCode) {
        return ShortNumberInfo.getInstance().isEmergencyNumber(number, regionCode);
    }
}
