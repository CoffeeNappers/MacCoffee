package com.google.android.gms.internal;

import com.facebook.common.util.UriUtil;
/* loaded from: classes2.dex */
public class zzajt {
    public String EY;
    public String baV;
    public boolean baW;
    public String beQ;

    public String toString() {
        String str = this.baW ? "s" : "";
        String str2 = this.baV;
        return new StringBuilder(String.valueOf(str).length() + 7 + String.valueOf(str2).length()).append(UriUtil.HTTP_SCHEME).append(str).append("://").append(str2).toString();
    }
}
