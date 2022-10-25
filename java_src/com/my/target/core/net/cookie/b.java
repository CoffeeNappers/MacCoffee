package com.my.target.core.net.cookie;

import android.annotation.TargetApi;
import android.content.Context;
import android.content.SharedPreferences;
import com.facebook.common.util.UriUtil;
import com.my.target.Tracer;
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
/* compiled from: MyTargetCookieStore.java */
@TargetApi(9)
/* loaded from: classes2.dex */
public final class b implements CookieStore {
    private SharedPreferences a;
    private Map<URI, Set<HttpCookie>> b;

    public b(Context context) {
        this.a = context.getSharedPreferences("mytarget_httpcookie_prefs", 0);
        a();
    }

    private void a() {
        this.b = new HashMap();
        for (Map.Entry<String, ?> entry : this.a.getAll().entrySet()) {
            try {
                URI uri = new URI(entry.getKey().split("\\|", 2)[0]);
                new c();
                HttpCookie a = c.a((String) entry.getValue());
                Set<HttpCookie> set = this.b.get(uri);
                if (set == null) {
                    set = new HashSet<>();
                    this.b.put(uri, set);
                }
                set.add(a);
            } catch (URISyntaxException e) {
                Tracer.d(e.getMessage());
            }
        }
    }

    @Override // java.net.CookieStore
    public final synchronized void add(URI uri, HttpCookie httpCookie) {
        URI a = a(uri, httpCookie);
        Set<HttpCookie> set = this.b.get(a);
        if (set == null) {
            set = new HashSet<>();
            this.b.put(a, set);
        }
        set.remove(httpCookie);
        set.add(httpCookie);
        SharedPreferences.Editor edit = this.a.edit();
        edit.putString(a.toString() + "|" + httpCookie.getName(), new c().a(httpCookie));
        edit.apply();
    }

    private static URI a(URI uri, HttpCookie httpCookie) {
        if (httpCookie.getDomain() != null) {
            String domain = httpCookie.getDomain();
            try {
                uri = new URI(uri.getScheme() == null ? UriUtil.HTTP_SCHEME : uri.getScheme(), domain.charAt(0) == '.' ? domain.substring(1) : domain, httpCookie.getPath() == null ? CameraUtilsEffects.FILE_DELIM : httpCookie.getPath(), null);
                return uri;
            } catch (URISyntaxException e) {
                Tracer.d(e.getMessage());
                return uri;
            }
        }
        return uri;
    }

    @Override // java.net.CookieStore
    public final synchronized List<HttpCookie> get(URI uri) {
        return a(uri);
    }

    @Override // java.net.CookieStore
    public final synchronized List<HttpCookie> getCookies() {
        ArrayList arrayList;
        arrayList = new ArrayList();
        for (URI uri : this.b.keySet()) {
            arrayList.addAll(a(uri));
        }
        return arrayList;
    }

    private List<HttpCookie> a(URI uri) {
        HashSet hashSet = new HashSet();
        for (URI uri2 : this.b.keySet()) {
            String host = uri2.getHost();
            String host2 = uri.getHost();
            if (host2.equals(host) || host2.endsWith(new StringBuilder(".").append(host).toString())) {
                String path = uri2.getPath();
                String path2 = uri.getPath();
                if (path2.equals(path) || (path2.startsWith(path) && path.charAt(path.length() + (-1)) == '/') || (path2.startsWith(path) && path2.substring(path.length()).charAt(0) == '/')) {
                    hashSet.addAll(this.b.get(uri2));
                }
            }
        }
        ArrayList arrayList = new ArrayList();
        Iterator it = hashSet.iterator();
        while (it.hasNext()) {
            HttpCookie httpCookie = (HttpCookie) it.next();
            if (httpCookie.hasExpired()) {
                arrayList.add(httpCookie);
                it.remove();
            }
        }
        if (!arrayList.isEmpty()) {
            a(uri, arrayList);
        }
        return new ArrayList(hashSet);
    }

    private void a(URI uri, List<HttpCookie> list) {
        SharedPreferences.Editor edit = this.a.edit();
        Iterator<HttpCookie> it = list.iterator();
        while (it.hasNext()) {
            edit.remove(uri.toString() + "|" + it.next().getName());
        }
        edit.apply();
    }

    @Override // java.net.CookieStore
    public final synchronized List<URI> getURIs() {
        return new ArrayList(this.b.keySet());
    }

    @Override // java.net.CookieStore
    public final synchronized boolean remove(URI uri, HttpCookie httpCookie) {
        boolean z;
        Set<HttpCookie> set = this.b.get(uri);
        z = set != null && set.remove(httpCookie);
        if (z) {
            SharedPreferences.Editor edit = this.a.edit();
            edit.remove(uri.toString() + "|" + httpCookie.getName());
            edit.apply();
        }
        return z;
    }

    @Override // java.net.CookieStore
    public final synchronized boolean removeAll() {
        this.b.clear();
        this.a.edit().clear().apply();
        return true;
    }
}
