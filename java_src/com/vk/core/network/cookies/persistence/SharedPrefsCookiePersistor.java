package com.vk.core.network.cookies.persistence;

import android.content.Context;
import android.content.SharedPreferences;
import com.facebook.common.util.UriUtil;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Map;
import okhttp3.Cookie;
/* loaded from: classes2.dex */
public class SharedPrefsCookiePersistor implements CookiePersistor {
    private final SharedPreferences sharedPreferences;

    public SharedPrefsCookiePersistor(Context context) {
        this(context.getSharedPreferences("CookiePersistence", 0));
    }

    public SharedPrefsCookiePersistor(SharedPreferences sharedPreferences) {
        this.sharedPreferences = sharedPreferences;
    }

    @Override // com.vk.core.network.cookies.persistence.CookiePersistor
    public List<Cookie> loadAll() {
        List<Cookie> cookies = new ArrayList<>(this.sharedPreferences.getAll().size());
        for (Map.Entry<String, ?> entry : this.sharedPreferences.getAll().entrySet()) {
            String serializedCookie = (String) entry.getValue();
            Cookie cookie = new SerializableCookie().decode(serializedCookie);
            cookies.add(cookie);
        }
        return cookies;
    }

    @Override // com.vk.core.network.cookies.persistence.CookiePersistor
    public void saveAll(Collection<Cookie> cookies) {
        SharedPreferences.Editor editor = this.sharedPreferences.edit();
        for (Cookie cookie : cookies) {
            if (cookie.persistent()) {
                editor.putString(createCookieKey(cookie), new SerializableCookie().encode(cookie));
            }
        }
        editor.apply();
    }

    @Override // com.vk.core.network.cookies.persistence.CookiePersistor
    public void removeAll(Collection<Cookie> cookies) {
        SharedPreferences.Editor editor = this.sharedPreferences.edit();
        for (Cookie cookie : cookies) {
            editor.remove(createCookieKey(cookie));
        }
        editor.apply();
    }

    private static String createCookieKey(Cookie cookie) {
        return (cookie.secure() ? UriUtil.HTTPS_SCHEME : UriUtil.HTTP_SCHEME) + "://" + cookie.domain() + cookie.path() + "|" + cookie.name();
    }

    @Override // com.vk.core.network.cookies.persistence.CookiePersistor
    public void clear() {
        this.sharedPreferences.edit().clear().apply();
    }
}
