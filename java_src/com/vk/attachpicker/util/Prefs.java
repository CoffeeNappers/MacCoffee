package com.vk.attachpicker.util;

import android.content.SharedPreferences;
import com.vk.attachpicker.Picker;
/* loaded from: classes2.dex */
public class Prefs {
    private static volatile Prefs globalInstance;
    private static volatile Prefs storiesInstance;
    SharedPreferences preferences;

    public static Prefs pickerPrefs() {
        if (globalInstance == null) {
            synchronized (Prefs.class) {
                if (globalInstance == null) {
                    globalInstance = new Prefs("picker_default");
                }
            }
        }
        return globalInstance;
    }

    public static Prefs storiesPrefs() {
        if (storiesInstance == null) {
            synchronized (Prefs.class) {
                if (storiesInstance == null) {
                    storiesInstance = new Prefs("stories_default");
                }
            }
        }
        return storiesInstance;
    }

    public Prefs(String key) {
        this.preferences = Picker.getContext().getSharedPreferences(key, 0);
    }

    public String getString(String key) {
        return this.preferences.getString(key, null);
    }

    public String getString(String key, String defaultValue) {
        return this.preferences.getString(key, defaultValue);
    }

    public long getLong(String key) {
        return this.preferences.getLong(key, 0L);
    }

    public long getLong(String key, long defaultValue) {
        return this.preferences.getLong(key, defaultValue);
    }

    public boolean getBoolean(String key) {
        return this.preferences.getBoolean(key, false);
    }

    public boolean getBoolean(String key, boolean defaultValue) {
        return this.preferences.getBoolean(key, defaultValue);
    }

    public int getInt(String key) {
        return this.preferences.getInt(key, 0);
    }

    public int getInt(String key, int defaultValue) {
        return this.preferences.getInt(key, defaultValue);
    }

    public SharedPreferences.Editor edit() {
        return this.preferences.edit();
    }

    public void clear() {
        this.preferences.edit().clear().apply();
    }
}
