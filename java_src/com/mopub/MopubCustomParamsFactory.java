package com.mopub;

import android.text.TextUtils;
import com.my.target.Tracer;
import com.my.target.ads.CustomParams;
import java.util.Map;
/* loaded from: classes2.dex */
public class MopubCustomParamsFactory {
    private static final String EXTRA_AGE = "mytarget_age";
    private static final String EXTRA_GENDER = "mytarget_gender";
    private static final String EXTRA_OKID = "mytarget_ok_id";
    private static final String EXTRA_VKID = "mytarget_vk_id";

    public static CustomParams getCustomParams(Map<String, Object> map) {
        CustomParams customParams = new CustomParams();
        customParams.setCustomParam("mediation", "2");
        try {
            if (map.containsKey(EXTRA_GENDER)) {
                int intValue = ((Integer) map.get(EXTRA_GENDER)).intValue();
                if (intValue >= 0 && intValue < 3) {
                    customParams.setGender(intValue);
                } else {
                    Tracer.e("Wrong mopub extra value: mytarget_gender must be 0 (undefined) or 1 (male), or 2 (female)");
                }
            }
        } catch (ClassCastException e) {
            Tracer.e("Wrong mopub extra value: mytarget_gender must be integer");
            Tracer.d("message: " + e.getMessage());
        }
        try {
            if (map.containsKey(EXTRA_AGE)) {
                int intValue2 = ((Integer) map.get(EXTRA_AGE)).intValue();
                if (intValue2 > 0) {
                    customParams.setAge(intValue2);
                } else {
                    Tracer.e("Wrong mopub extra value: mytarget_age must be > 0");
                }
            }
        } catch (ClassCastException e2) {
            Tracer.e("Wrong mopub extra value: mytarget_age must be integer");
            Tracer.d("message: " + e2.getMessage());
        }
        try {
            if (map.containsKey(EXTRA_VKID)) {
                String str = (String) map.get(EXTRA_VKID);
                if (!TextUtils.isEmpty(str)) {
                    customParams.setVKId(str);
                } else {
                    Tracer.e("Wrong mopub extra value: mytarget_vk_id is empty");
                }
            }
        } catch (ClassCastException e3) {
            Tracer.e("Wrong mopub extra value: mytarget_vk_id must be String");
            Tracer.d("message: " + e3.getMessage());
        }
        try {
            if (map.containsKey(EXTRA_OKID)) {
                String str2 = (String) map.get(EXTRA_OKID);
                if (!TextUtils.isEmpty(str2)) {
                    customParams.setOkId(str2);
                } else {
                    Tracer.e("Wrong mopub extra value: mytarget_ok_id is empty");
                }
            }
        } catch (ClassCastException e4) {
            Tracer.e("Wrong mopub extra value: mytarget_ok_id must be String");
            Tracer.d("message: " + e4.getMessage());
        }
        return customParams;
    }
}
