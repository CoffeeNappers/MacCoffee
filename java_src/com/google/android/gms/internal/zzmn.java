package com.google.android.gms.internal;

import android.annotation.TargetApi;
import android.content.Context;
import android.support.annotation.Nullable;
import android.webkit.WebResourceResponse;
import android.webkit.WebView;
import io.fabric.sdk.android.services.network.HttpRequest;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.TimeoutException;
@zzji
@TargetApi(11)
/* loaded from: classes.dex */
public class zzmn extends zzme {
    public zzmn(zzmd zzmdVar, boolean z) {
        super(zzmdVar, z);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public WebResourceResponse zza(WebView webView, String str, @Nullable Map<String, String> map) {
        if (!(webView instanceof zzmd)) {
            zzkx.zzdi("Tried to intercept request from a WebView that wasn't an AdWebView.");
            return null;
        }
        zzmd zzmdVar = (zzmd) webView;
        if (this.zzczo != null) {
            this.zzczo.zzb(str, map);
        }
        if (!"mraid.js".equalsIgnoreCase(new File(str).getName())) {
            return super.shouldInterceptRequest(webView, str);
        }
        if (zzmdVar.zzxc() != null) {
            zzmdVar.zzxc().zzpo();
        }
        try {
            return zzf(zzmdVar.getContext(), zzmdVar.zzxf().zzda, zzmdVar.zzeg().zzazr ? zzdr.zzbep.get() : zzmdVar.zzxg() ? zzdr.zzbeo.get() : zzdr.zzben.get());
        } catch (IOException | InterruptedException | ExecutionException | TimeoutException e) {
            String valueOf = String.valueOf(e.getMessage());
            zzkx.zzdi(valueOf.length() != 0 ? "Could not fetch MRAID JS. ".concat(valueOf) : new String("Could not fetch MRAID JS. "));
            return null;
        }
    }

    protected WebResourceResponse zzf(Context context, String str, String str2) throws IOException, ExecutionException, InterruptedException, TimeoutException {
        HashMap hashMap = new HashMap();
        hashMap.put("User-Agent", com.google.android.gms.ads.internal.zzu.zzgm().zzh(context, str));
        hashMap.put(HttpRequest.HEADER_CACHE_CONTROL, "max-stale=3600");
        String str3 = new zzli(context).zzd(str2, hashMap).get(60L, TimeUnit.SECONDS);
        if (str3 == null) {
            return null;
        }
        return new WebResourceResponse("application/javascript", "UTF-8", new ByteArrayInputStream(str3.getBytes("UTF-8")));
    }
}
