package com.my.tracker;

import android.app.Activity;
import android.content.Context;
import java.util.Map;
import org.json.JSONObject;
/* loaded from: classes.dex */
public final class MyTracker {
    public static final String VERSION = "1.3.8";
    private static volatile Tracker a;
    private static volatile MyTrackerParams b;
    private static volatile boolean c = true;

    public static boolean isDebugMode() {
        return a.a;
    }

    public static void setDebugMode(boolean z) {
        a.a = z;
    }

    public static boolean isEnabled() {
        return c;
    }

    public static void setEnabled(boolean z) {
        c = z;
        if (a != null) {
            a.setEnabled(z);
        }
    }

    public static void setLogHandler(LogHandler logHandler) {
        a.b = logHandler;
    }

    public static MyTrackerParams getTrackerParams() {
        return b;
    }

    public static synchronized void createTracker(String str, Context context) {
        synchronized (MyTracker.class) {
            if (a == null) {
                a = new DefaultTracker(str, context);
                b = new MyTrackerParams(a.getParams());
                a.setEnabled(c);
            }
        }
    }

    public static synchronized void initTracker() {
        synchronized (MyTracker.class) {
            if (a == null) {
                a.a("You should call MyTracker.createTracker method first");
            } else {
                a.init();
            }
        }
    }

    public static void onStartActivity(Activity activity) {
        if (a()) {
            a.onStartActivity(activity);
        }
    }

    public static void onStopActivity(Activity activity) {
        if (a()) {
            a.onStopActivity(activity);
        }
    }

    public static void trackEvent(String str) {
        trackEvent(str, null);
    }

    public static void trackEvent(String str, Map<String, String> map) {
        if (a()) {
            a.trackEvent(str, map);
        }
    }

    public static void trackLoginEvent() {
        trackLoginEvent(null);
    }

    public static void trackLoginEvent(Map<String, String> map) {
        if (a()) {
            a.trackLoginEvent(map);
        }
    }

    public static void trackRegistrationEvent() {
        trackRegistrationEvent(null);
    }

    public static void trackRegistrationEvent(Map<String, String> map) {
        if (a()) {
            a.trackRegistrationEvent(map);
        }
    }

    public static void trackInviteEvent() {
        trackInviteEvent(null);
    }

    public static void trackInviteEvent(Map<String, String> map) {
        if (a()) {
            a.trackInviteEvent(map);
        }
    }

    public static void trackLevelEvent() {
        if (a()) {
            a.trackLevelEvent();
        }
    }

    public static void trackLevelEvent(Map<String, String> map) {
        if (a()) {
            a.trackLevelEvent(map);
        }
    }

    public static void trackLevelEvent(int i, Map<String, String> map) {
        if (a()) {
            a.trackLevelEvent(i, map);
        }
    }

    public static void trackPurchaseEvent(JSONObject jSONObject, JSONObject jSONObject2, String str, Map<String, String> map) {
        if (a()) {
            a.trackPurchaseEvent(jSONObject, jSONObject2, str, map);
        }
    }

    public static void trackPurchaseEvent(JSONObject jSONObject, JSONObject jSONObject2, String str) {
        if (a()) {
            a.trackPurchaseEvent(jSONObject, jSONObject2, str);
        }
    }

    private static boolean a() {
        if (a == null || !a.isInitialized()) {
            a.a("You should call MyTracker.initTracker method first");
            return false;
        }
        return true;
    }

    private MyTracker() {
    }
}
