package com.vk.core.network.cookies.cache;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import okhttp3.Cookie;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes2.dex */
public class IdentifiableCookie {
    private Cookie cookie;

    /* JADX INFO: Access modifiers changed from: package-private */
    public static List<IdentifiableCookie> decorateAll(Collection<Cookie> cookies) {
        List<IdentifiableCookie> identifiableCookies = new ArrayList<>(cookies.size());
        for (Cookie cookie : cookies) {
            identifiableCookies.add(new IdentifiableCookie(cookie));
        }
        return identifiableCookies;
    }

    IdentifiableCookie(Cookie cookie) {
        this.cookie = cookie;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public Cookie getCookie() {
        return this.cookie;
    }

    public boolean equals(Object other) {
        if (!(other instanceof IdentifiableCookie)) {
            return false;
        }
        IdentifiableCookie that = (IdentifiableCookie) other;
        return that.cookie.name().equals(this.cookie.name()) && that.cookie.domain().equals(this.cookie.domain()) && that.cookie.path().equals(this.cookie.path()) && that.cookie.secure() == this.cookie.secure() && that.cookie.hostOnly() == this.cookie.hostOnly();
    }

    public int hashCode() {
        int i = 0;
        int hash = this.cookie.name().hashCode() + 527;
        int hashCode = ((((((hash * 31) + this.cookie.domain().hashCode()) * 31) + this.cookie.path().hashCode()) * 31) + (this.cookie.secure() ? 0 : 1)) * 31;
        if (!this.cookie.hostOnly()) {
            i = 1;
        }
        int hash2 = hashCode + i;
        return hash2;
    }
}
