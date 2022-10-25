package com.google.android.gms.internal;

import com.facebook.common.util.UriUtil;
import java.net.URI;
/* loaded from: classes2.dex */
public class zzaiw {
    private final String EY;
    private final String baV;
    private final boolean baW;

    public zzaiw(String str, String str2, boolean z) {
        this.baV = str;
        this.EY = str2;
        this.baW = z;
    }

    public static URI zza(String str, boolean z, String str2, String str3) {
        String str4 = z ? "wss" : "ws";
        String valueOf = String.valueOf("v");
        String valueOf2 = String.valueOf("5");
        String sb = new StringBuilder(String.valueOf(str4).length() + 13 + String.valueOf(str).length() + String.valueOf(str2).length() + String.valueOf(valueOf).length() + String.valueOf(valueOf2).length()).append(str4).append("://").append(str).append("/.ws?ns=").append(str2).append("&").append(valueOf).append("=").append(valueOf2).toString();
        if (str3 != null) {
            String valueOf3 = String.valueOf(sb);
            String valueOf4 = String.valueOf("&ls=");
            sb = new StringBuilder(String.valueOf(valueOf3).length() + 0 + String.valueOf(valueOf4).length() + String.valueOf(str3).length()).append(valueOf3).append(valueOf4).append(str3).toString();
        }
        return URI.create(sb);
    }

    public String getHost() {
        return this.baV;
    }

    public String getNamespace() {
        return this.EY;
    }

    public boolean isSecure() {
        return this.baW;
    }

    public String toString() {
        String str = this.baW ? "s" : "";
        String str2 = this.baV;
        return new StringBuilder(String.valueOf(str).length() + 7 + String.valueOf(str2).length()).append(UriUtil.HTTP_SCHEME).append(str).append("://").append(str2).toString();
    }
}
