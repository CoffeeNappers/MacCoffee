package com.vk.core.network.cookies.cache;

import java.util.Collection;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;
import okhttp3.Cookie;
/* loaded from: classes2.dex */
public class SetCookieCache implements CookieCache {
    private Set<IdentifiableCookie> cookies = new HashSet();

    @Override // com.vk.core.network.cookies.cache.CookieCache
    public void addAll(Collection<Cookie> newCookies) {
        for (IdentifiableCookie cookie : IdentifiableCookie.decorateAll(newCookies)) {
            this.cookies.remove(cookie);
            this.cookies.add(cookie);
        }
    }

    @Override // com.vk.core.network.cookies.cache.CookieCache
    public void clear() {
        this.cookies.clear();
    }

    @Override // java.lang.Iterable
    public Iterator<Cookie> iterator() {
        return new SetCookieCacheIterator();
    }

    /* loaded from: classes2.dex */
    private class SetCookieCacheIterator implements Iterator<Cookie> {
        private Iterator<IdentifiableCookie> iterator;

        public SetCookieCacheIterator() {
            this.iterator = SetCookieCache.this.cookies.iterator();
        }

        @Override // java.util.Iterator
        public boolean hasNext() {
            return this.iterator.hasNext();
        }

        @Override // java.util.Iterator
        public Cookie next() {
            return this.iterator.next().getCookie();
        }

        @Override // java.util.Iterator
        public void remove() {
            this.iterator.remove();
        }
    }
}
