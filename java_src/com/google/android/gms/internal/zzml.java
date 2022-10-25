package com.google.android.gms.internal;

import android.annotation.TargetApi;
import android.webkit.WebResourceResponse;
import android.webkit.WebView;
import java.util.Map;
@zzji
@TargetApi(11)
/* loaded from: classes.dex */
public class zzml extends zzmn {
    public zzml(zzmd zzmdVar, boolean z) {
        super(zzmdVar, z);
    }

    @Override // com.google.android.gms.internal.zzme, android.webkit.WebViewClient
    public WebResourceResponse shouldInterceptRequest(WebView webView, String str) {
        return zza(webView, str, (Map<String, String>) null);
    }
}
