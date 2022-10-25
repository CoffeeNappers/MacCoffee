package com.google.android.gms.internal;

import android.text.TextUtils;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import com.vk.media.camera.CameraUtilsEffects;
import java.net.URI;
import java.net.URISyntaxException;
@zzji
/* loaded from: classes.dex */
public class zzmo extends WebViewClient {
    private final String N;
    private boolean O = false;
    private final zzmd zzbnz;
    private final zzir zzcgu;

    public zzmo(zzir zzirVar, zzmd zzmdVar, String str) {
        this.N = zzdq(str);
        this.zzbnz = zzmdVar;
        this.zzcgu = zzirVar;
    }

    private String zzdq(String str) {
        if (TextUtils.isEmpty(str)) {
            return str;
        }
        try {
            return str.endsWith(CameraUtilsEffects.FILE_DELIM) ? str.substring(0, str.length() - 1) : str;
        } catch (IndexOutOfBoundsException e) {
            zzkx.e(e.getMessage());
            return str;
        }
    }

    @Override // android.webkit.WebViewClient
    public void onLoadResource(WebView webView, String str) {
        String valueOf = String.valueOf(str);
        zzkx.zzdg(valueOf.length() != 0 ? "JavascriptAdWebViewClient::onLoadResource: ".concat(valueOf) : new String("JavascriptAdWebViewClient::onLoadResource: "));
        if (!zzdp(str)) {
            this.zzbnz.zzxc().onLoadResource(this.zzbnz.getWebView(), str);
        }
    }

    @Override // android.webkit.WebViewClient
    public void onPageFinished(WebView webView, String str) {
        String valueOf = String.valueOf(str);
        zzkx.zzdg(valueOf.length() != 0 ? "JavascriptAdWebViewClient::onPageFinished: ".concat(valueOf) : new String("JavascriptAdWebViewClient::onPageFinished: "));
        if (!this.O) {
            this.zzcgu.zzsa();
            this.O = true;
        }
    }

    @Override // android.webkit.WebViewClient
    public boolean shouldOverrideUrlLoading(WebView webView, String str) {
        String valueOf = String.valueOf(str);
        zzkx.zzdg(valueOf.length() != 0 ? "JavascriptAdWebViewClient::shouldOverrideUrlLoading: ".concat(valueOf) : new String("JavascriptAdWebViewClient::shouldOverrideUrlLoading: "));
        if (zzdp(str)) {
            zzkx.zzdg("shouldOverrideUrlLoading: received passback url");
            return true;
        }
        return this.zzbnz.zzxc().shouldOverrideUrlLoading(this.zzbnz.getWebView(), str);
    }

    protected boolean zzdp(String str) {
        boolean z = false;
        String zzdq = zzdq(str);
        if (!TextUtils.isEmpty(zzdq)) {
            try {
                URI uri = new URI(zzdq);
                if ("passback".equals(uri.getScheme())) {
                    zzkx.zzdg("Passback received");
                    this.zzcgu.zzsb();
                    z = true;
                } else if (!TextUtils.isEmpty(this.N)) {
                    URI uri2 = new URI(this.N);
                    String host = uri2.getHost();
                    String host2 = uri.getHost();
                    String path = uri2.getPath();
                    String path2 = uri.getPath();
                    if (com.google.android.gms.common.internal.zzz.equal(host, host2) && com.google.android.gms.common.internal.zzz.equal(path, path2)) {
                        zzkx.zzdg("Passback received");
                        this.zzcgu.zzsb();
                        z = true;
                    }
                }
            } catch (URISyntaxException e) {
                zzkx.e(e.getMessage());
            }
        }
        return z;
    }
}
