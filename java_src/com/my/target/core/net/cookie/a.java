package com.my.target.core.net.cookie;

import android.annotation.SuppressLint;
import android.content.Context;
import android.os.Build;
import java.io.IOException;
import java.net.CookieHandler;
import java.net.CookieManager;
import java.net.URI;
import java.net.URLConnection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
/* compiled from: MyTargetCookieManager.java */
@SuppressLint({"NewApi"})
/* loaded from: classes2.dex */
public final class a {
    private static a b;
    private final CookieHandler a;

    public static synchronized a a(Context context) {
        a aVar;
        synchronized (a.class) {
            if (b == null && Build.VERSION.SDK_INT >= 9) {
                b = new a(context);
            }
            aVar = b;
        }
        return aVar;
    }

    private a(Context context) {
        this.a = new CookieManager(new b(context), null);
    }

    public final void a(URLConnection uRLConnection) throws IOException {
        Map<String, List<String>> headerFields = uRLConnection.getHeaderFields();
        this.a.put(URI.create(uRLConnection.getURL().toString()), headerFields);
    }

    public final void b(URLConnection uRLConnection) throws IOException {
        HashMap hashMap = new HashMap();
        Iterator<Map.Entry<String, List<String>>> it = this.a.get(URI.create(uRLConnection.getURL().toString()), hashMap).entrySet().iterator();
        for (boolean hasNext = it.hasNext(); hasNext; hasNext = it.hasNext()) {
            Map.Entry<String, List<String>> next = it.next();
            String key = next.getKey();
            Iterator<String> it2 = next.getValue().iterator();
            for (boolean hasNext2 = it2.hasNext(); hasNext2; hasNext2 = it2.hasNext()) {
                uRLConnection.addRequestProperty(key, it2.next());
            }
        }
    }
}
