package com.vk.core.network.cookies;

import okhttp3.CookieJar;
/* loaded from: classes2.dex */
public interface ClearableCookieJar extends CookieJar {
    void clear();

    void clearSession();
}
