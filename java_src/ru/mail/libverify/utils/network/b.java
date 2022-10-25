package ru.mail.libverify.utils.network;

import android.content.Context;
import android.net.wifi.WifiInfo;
import android.net.wifi.WifiManager;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.text.TextUtils;
import android.util.LruCache;
import ru.mail.libverify.utils.c;
import ru.mail.libverify.utils.m;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes3.dex */
public final class b {
    private static final b c = new b(a.NONE);
    private static final b d = new b(a.CELLULAR);
    private static final b e = new b(a.ROAMING);
    private static final b f = new b(a.CONNECTING);
    private static final LruCache<String, b> g = new LruCache<>(256);
    final a a;
    final String b;

    private b(@NonNull a aVar) {
        this.a = aVar;
        this.b = null;
    }

    private b(@NonNull a aVar, @Nullable String str) {
        this.a = aVar;
        this.b = str;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    @NonNull
    public static b a(@NonNull Context context, a aVar) {
        b bVar;
        switch (aVar) {
            case NONE:
                return c;
            case WIFI:
                String b = b(context, a.WIFI);
                synchronized (g) {
                    bVar = g.get(b);
                    if (bVar == null) {
                        bVar = new b(a.WIFI, b);
                        g.put(b, bVar);
                    }
                }
                return bVar;
            case CELLULAR:
                return d;
            case ROAMING:
                return e;
            case CONNECTING:
                return f;
            default:
                c.a("DebugUtils", "failed to get connection type", new IllegalArgumentException("unknown connection type"));
                return c;
        }
    }

    @NonNull
    private static String b(@NonNull Context context, a aVar) {
        WifiInfo connectionInfo;
        switch (aVar) {
            case NONE:
                return "No network";
            case WIFI:
                if (!m.b(context, "android.permission.ACCESS_WIFI_STATE")) {
                    return "Unknown Wi-Fi network";
                }
                try {
                    WifiManager wifiManager = (WifiManager) context.getSystemService("wifi");
                    if (wifiManager == null || (connectionInfo = wifiManager.getConnectionInfo()) == null) {
                        return "Unknown Wi-Fi network";
                    }
                    String ssid = connectionInfo.getSSID();
                    return TextUtils.isEmpty(ssid) ? "Unknown Wi-Fi network" : ssid;
                } catch (Throwable th) {
                    return "Unknown Wi-Fi network";
                }
            case CELLULAR:
                return "Cellular network";
            case ROAMING:
                return "In roaming";
            case CONNECTING:
                return "Connecting";
            default:
                c.a("DebugUtils", "failed to get connection name", new IllegalArgumentException("unknown connection type"));
                return "No network";
        }
    }

    public final String toString() {
        return "NetworkStateDescriptor{state=" + this.a + ", name='" + this.b + "'}";
    }
}
