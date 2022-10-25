package com.vk.analytics;

import android.content.Context;
import android.content.SharedPreferences;
import android.text.TextUtils;
/* loaded from: classes2.dex */
public class AnalyticsPreferences {
    private static final String APP_PREFERENCES = "analytics";
    public static final String DEFAULT = "";
    private SharedPreferences mPreferences;

    public AnalyticsPreferences(Context context) {
        this.mPreferences = context.getSharedPreferences("analytics", 0);
    }

    public boolean contains(String key) {
        return this.mPreferences.contains(key);
    }

    public void set(String key, String value) {
        if (!TextUtils.isEmpty(key)) {
            SharedPreferences.Editor editor = this.mPreferences.edit();
            editor.putString(key, value);
            editor.apply();
        }
    }

    public void set(String key, boolean value) {
        if (!TextUtils.isEmpty(key)) {
            SharedPreferences.Editor editor = this.mPreferences.edit();
            editor.putBoolean(key, value);
            editor.apply();
        }
    }

    public String getString(String key) {
        return !TextUtils.isEmpty(key) ? this.mPreferences.getString(key, "") : "";
    }

    public boolean getBoolean(String key) {
        if (!TextUtils.isEmpty(key)) {
            return this.mPreferences.getBoolean(key, false);
        }
        return false;
    }
}
