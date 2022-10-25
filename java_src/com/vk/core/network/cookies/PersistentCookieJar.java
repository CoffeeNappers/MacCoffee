package com.vk.core.network.cookies;

import com.vk.core.network.cookies.cache.CookieCache;
import com.vk.core.network.cookies.persistence.CookiePersistor;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import okhttp3.Cookie;
import okhttp3.HttpUrl;
/* loaded from: classes2.dex */
public class PersistentCookieJar implements ClearableCookieJar {
    private CookieCache cache;
    private boolean debug;
    private CookiePersistor persistor;

    public PersistentCookieJar(CookieCache cache, CookiePersistor persistor, boolean debug) {
        this.cache = cache;
        this.persistor = persistor;
        this.debug = debug;
        this.cache.addAll(persistor.loadAll());
    }

    @Override // okhttp3.CookieJar
    public synchronized void saveFromResponse(HttpUrl url, List<Cookie> cookies) {
        this.cache.addAll(cookies);
        this.persistor.saveAll(cookies);
    }

    @Override // okhttp3.CookieJar
    public synchronized List<Cookie> loadForRequest(HttpUrl url) {
        List<Cookie> validCookies;
        List<Cookie> removedCookies = new ArrayList<>();
        validCookies = new ArrayList<>();
        Iterator<Cookie> it = this.cache.iterator();
        while (it.hasNext()) {
            Cookie currentCookie = it.next();
            if (isCookieExpired(currentCookie)) {
                removedCookies.add(currentCookie);
                it.remove();
            } else if (currentCookie.matches(url)) {
                validCookies.add(currentCookie);
            }
        }
        this.persistor.removeAll(removedCookies);
        if (this.debug) {
            validCookies.add(new Cookie.Builder().domain(url.host()).name("XDEBUG_SESSION").value("PHPSTORM").build());
        }
        return validCookies;
    }

    private static boolean isCookieExpired(Cookie cookie) {
        return cookie.expiresAt() < System.currentTimeMillis();
    }

    @Override // com.vk.core.network.cookies.ClearableCookieJar
    public void clearSession() {
        this.cache.clear();
        this.cache.addAll(this.persistor.loadAll());
    }

    @Override // com.vk.core.network.cookies.ClearableCookieJar
    public synchronized void clear() {
        this.cache.clear();
        this.persistor.clear();
    }
}
