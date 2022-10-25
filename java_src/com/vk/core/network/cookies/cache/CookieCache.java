package com.vk.core.network.cookies.cache;

import java.util.Collection;
import okhttp3.Cookie;
/* loaded from: classes2.dex */
public interface CookieCache extends Iterable<Cookie> {
    void addAll(Collection<Cookie> collection);

    void clear();
}
