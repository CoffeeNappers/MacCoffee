package com.my.target.core.net;

import com.facebook.common.util.UriUtil;
import com.my.target.core.utils.g;
import io.sentry.connection.AbstractConnection;
/* compiled from: Hosts.java */
/* loaded from: classes2.dex */
public final class a {
    public static String a = null;
    public static String b = null;
    private static final String d = "https://r.my.com/mobile/";
    private static final String c = "https://ad.mail.ru/mobile/";
    private static final g e = new g(UriUtil.HTTPS_SCHEME, "8b2824c2cb184ce0ac78b82dba46b78a", "c4d6345aac3a40b58c75761ab14a9ce8", "r.my.com", AbstractConnection.SENTRY_PROTOCOL_VERSION);

    public static String a(String str) {
        return "appwall".equals(str) ? d : c;
    }

    public static g a() {
        return e;
    }
}
