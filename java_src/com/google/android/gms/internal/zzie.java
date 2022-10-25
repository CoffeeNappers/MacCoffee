package com.google.android.gms.internal;

import android.content.Context;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;
@zzji
/* loaded from: classes.dex */
public class zzie implements zzic {
    private final Context mContext;
    final Set<WebView> zzcev = Collections.synchronizedSet(new HashSet());

    public zzie(Context context) {
        this.mContext = context;
    }

    @Override // com.google.android.gms.internal.zzic
    public void zza(String str, final String str2, final String str3) {
        zzkx.zzdg("Fetching assets for the given html");
        zzlb.zzcvl.post(new Runnable() { // from class: com.google.android.gms.internal.zzie.1
            @Override // java.lang.Runnable
            public void run() {
                final WebView zzrm = zzie.this.zzrm();
                zzrm.setWebViewClient(new WebViewClient() { // from class: com.google.android.gms.internal.zzie.1.1
                    @Override // android.webkit.WebViewClient
                    public void onPageFinished(WebView webView, String str4) {
                        zzkx.zzdg("Loading assets have finished");
                        zzie.this.zzcev.remove(zzrm);
                    }

                    @Override // android.webkit.WebViewClient
                    public void onReceivedError(WebView webView, int i, String str4, String str5) {
                        zzkx.zzdi("Loading assets have failed.");
                        zzie.this.zzcev.remove(zzrm);
                    }
                });
                zzie.this.zzcev.add(zzrm);
                zzrm.loadDataWithBaseURL(str2, str3, "text/html", "UTF-8", null);
                zzkx.zzdg("Fetching assets finished.");
            }
        });
    }

    public WebView zzrm() {
        WebView webView = new WebView(this.mContext);
        webView.getSettings().setJavaScriptEnabled(true);
        return webView;
    }
}
