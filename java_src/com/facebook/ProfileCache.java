package com.facebook;

import android.content.SharedPreferences;
import com.facebook.internal.Validate;
import org.json.JSONException;
import org.json.JSONObject;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final class ProfileCache {
    static final String CACHED_PROFILE_KEY = "com.facebook.ProfileManager.CachedProfile";
    static final String SHARED_PREFERENCES_NAME = "com.facebook.AccessTokenManager.SharedPreferences";
    private final SharedPreferences sharedPreferences = FacebookSdk.getApplicationContext().getSharedPreferences(SHARED_PREFERENCES_NAME, 0);

    /* JADX INFO: Access modifiers changed from: package-private */
    public Profile load() {
        String jsonString = this.sharedPreferences.getString(CACHED_PROFILE_KEY, null);
        if (jsonString != null) {
            try {
                JSONObject jsonObject = new JSONObject(jsonString);
                return new Profile(jsonObject);
            } catch (JSONException e) {
            }
        }
        return null;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void save(Profile profile) {
        Validate.notNull(profile, "profile");
        JSONObject jsonObject = profile.toJSONObject();
        if (jsonObject != null) {
            this.sharedPreferences.edit().putString(CACHED_PROFILE_KEY, jsonObject.toString()).apply();
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void clear() {
        this.sharedPreferences.edit().remove(CACHED_PROFILE_KEY).apply();
    }
}
