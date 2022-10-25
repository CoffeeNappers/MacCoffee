package com.my.tracker;

import android.app.Activity;
import java.util.Map;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public interface Tracker {
    b getParams();

    void init();

    boolean isEnabled();

    boolean isInitialized();

    void onStartActivity(Activity activity);

    void onStopActivity(Activity activity);

    void setEnabled(boolean z);

    void trackEvent(String str);

    void trackEvent(String str, Map<String, String> map);

    void trackInviteEvent();

    void trackInviteEvent(Map<String, String> map);

    void trackLevelEvent();

    void trackLevelEvent(int i, Map<String, String> map);

    void trackLevelEvent(Map<String, String> map);

    void trackLoginEvent();

    void trackLoginEvent(Map<String, String> map);

    void trackPurchaseEvent(JSONObject jSONObject, JSONObject jSONObject2, String str);

    void trackPurchaseEvent(JSONObject jSONObject, JSONObject jSONObject2, String str, Map<String, String> map);

    void trackRegistrationEvent();

    void trackRegistrationEvent(Map<String, String> map);
}
