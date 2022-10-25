package com.vkontakte.android.api;

import android.content.Context;
import android.content.SharedPreferences;
import android.util.Log;
import com.facebook.common.util.UriUtil;
import com.vk.media.camera.CameraUtilsEffects;
import java.net.CookieStore;
import java.net.HttpCookie;
import java.net.URI;
import java.net.URISyntaxException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
/* loaded from: classes2.dex */
public class PersistentCookieStore implements CookieStore {
    private static final String SP_COOKIE_STORE = "cookieStore";
    private static final String SP_KEY_DELIMITER = "|";
    private static final String SP_KEY_DELIMITER_REGEX = "\\|";
    private static final String TAG = PersistentCookieStore.class.getSimpleName();
    private Map<URI, Set<HttpCookie>> allCookies;
    private SharedPreferences sharedPreferences;

    public PersistentCookieStore(Context context) {
        this.sharedPreferences = context.getSharedPreferences(SP_COOKIE_STORE, 0);
        loadAllFromPersistence();
    }

    private void loadAllFromPersistence() {
        this.allCookies = new HashMap();
        Map<String, ?> allPairs = this.sharedPreferences.getAll();
        for (Map.Entry<String, ?> entry : allPairs.entrySet()) {
            String[] uriAndName = entry.getKey().split(SP_KEY_DELIMITER_REGEX, 2);
            try {
                URI uri = new URI(uriAndName[0]);
                String encodedCookie = (String) entry.getValue();
                HttpCookie cookie = new SerializableHttpCookie().decode(encodedCookie);
                Set<HttpCookie> targetCookies = this.allCookies.get(uri);
                if (targetCookies == null) {
                    targetCookies = new HashSet<>();
                    this.allCookies.put(uri, targetCookies);
                }
                targetCookies.add(cookie);
            } catch (URISyntaxException e) {
                Log.w(TAG, e);
            }
        }
    }

    @Override // java.net.CookieStore
    public synchronized void add(URI uri, HttpCookie cookie) {
        URI uri2 = cookieUri(uri, cookie);
        Set<HttpCookie> targetCookies = this.allCookies.get(uri2);
        if (targetCookies == null) {
            targetCookies = new HashSet<>();
            this.allCookies.put(uri2, targetCookies);
        }
        targetCookies.remove(cookie);
        targetCookies.add(cookie);
        saveToPersistence(uri2, cookie);
    }

    private static URI cookieUri(URI uri, HttpCookie cookie) {
        URI cookieUri = uri;
        if (cookie.getDomain() != null) {
            try {
                String domain = cookie.getDomain();
                if (domain.startsWith(".")) {
                    domain = domain.substring(1);
                }
                cookieUri = new URI(uri.getScheme() == null ? UriUtil.HTTP_SCHEME : uri.getScheme(), domain, cookie.getPath() == null ? CameraUtilsEffects.FILE_DELIM : cookie.getPath(), null);
                return cookieUri;
            } catch (URISyntaxException e) {
                Log.w(TAG, e);
                return cookieUri;
            }
        }
        return cookieUri;
    }

    private void saveToPersistence(URI uri, HttpCookie cookie) {
        SharedPreferences.Editor editor = this.sharedPreferences.edit();
        editor.putString(uri.toString() + SP_KEY_DELIMITER + cookie.getName(), new SerializableHttpCookie().encode(cookie));
        editor.apply();
    }

    @Override // java.net.CookieStore
    public synchronized List<HttpCookie> get(URI uri) {
        return getValidCookies(uri);
    }

    @Override // java.net.CookieStore
    public synchronized List<HttpCookie> getCookies() {
        List<HttpCookie> allValidCookies;
        allValidCookies = new ArrayList<>();
        for (URI uri : this.allCookies.keySet()) {
            allValidCookies.addAll(getValidCookies(uri));
        }
        return allValidCookies;
    }

    private boolean domainMatch(String cookieHost, String targetHost) {
        if (cookieHost.startsWith(".")) {
            cookieHost = cookieHost.substring(1);
        }
        String[] cookieHostParts = cookieHost.split("\\.");
        String[] targetHostParts = targetHost.split("\\.");
        if (cookieHostParts.length > targetHostParts.length) {
            return false;
        }
        for (int i = 0; i < cookieHostParts.length; i++) {
            if (!cookieHostParts[(cookieHostParts.length - i) - 1].equals(targetHostParts[(targetHostParts.length - i) - 1])) {
                return false;
            }
        }
        return true;
    }

    private List<HttpCookie> getValidCookies(URI uri) {
        Set<HttpCookie> targetCookies = new HashSet<>();
        for (URI storedUri : this.allCookies.keySet()) {
            if (storedUri.getHost().equals(uri.getHost()) || domainMatch(storedUri.getHost(), uri.getHost())) {
                if (storedUri.getPath() == null || storedUri.getPath().equals(CameraUtilsEffects.FILE_DELIM) || storedUri.getPath().equals(uri.getPath())) {
                    targetCookies.addAll(this.allCookies.get(storedUri));
                }
            }
        }
        if (targetCookies != null) {
            List<HttpCookie> cookiesToRemoveFromPersistence = new ArrayList<>();
            Iterator<HttpCookie> it = targetCookies.iterator();
            while (it.hasNext()) {
                HttpCookie currentCookie = it.next();
                if (currentCookie.hasExpired()) {
                    cookiesToRemoveFromPersistence.add(currentCookie);
                    it.remove();
                }
            }
            if (!cookiesToRemoveFromPersistence.isEmpty()) {
                removeFromPersistence(uri, cookiesToRemoveFromPersistence);
            }
        }
        return new ArrayList(targetCookies);
    }

    private void removeFromPersistence(URI uri, List<HttpCookie> cookiesToRemove) {
        SharedPreferences.Editor editor = this.sharedPreferences.edit();
        for (HttpCookie cookieToRemove : cookiesToRemove) {
            editor.remove(uri.toString() + SP_KEY_DELIMITER + cookieToRemove.getName());
        }
        editor.apply();
    }

    @Override // java.net.CookieStore
    public synchronized List<URI> getURIs() {
        return new ArrayList(this.allCookies.keySet());
    }

    @Override // java.net.CookieStore
    public synchronized boolean remove(URI uri, HttpCookie cookie) {
        boolean cookieRemoved;
        Set<HttpCookie> targetCookies = this.allCookies.get(uri);
        cookieRemoved = targetCookies != null ? targetCookies.remove(cookie) : false;
        if (cookieRemoved) {
            removeFromPersistence(uri, cookie);
        }
        return cookieRemoved;
    }

    private void removeFromPersistence(URI uri, HttpCookie cookieToRemove) {
        SharedPreferences.Editor editor = this.sharedPreferences.edit();
        editor.remove(uri.toString() + SP_KEY_DELIMITER + cookieToRemove.getName());
        editor.apply();
    }

    @Override // java.net.CookieStore
    public synchronized boolean removeAll() {
        this.allCookies.clear();
        removeAllFromPersistence();
        return true;
    }

    private void removeAllFromPersistence() {
        this.sharedPreferences.edit().clear().apply();
    }
}
