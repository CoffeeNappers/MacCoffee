package com.google.android.gms.internal;

import android.annotation.TargetApi;
import android.content.Context;
import android.net.Uri;
import android.net.http.SslError;
import android.os.Bundle;
import android.support.annotation.Nullable;
import android.support.v4.media.TransportMediator;
import android.text.TextUtils;
import android.view.KeyEvent;
import android.view.ViewTreeObserver;
import android.webkit.SslErrorHandler;
import android.webkit.WebResourceResponse;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import com.facebook.common.util.UriUtil;
import com.google.android.exoplayer2.extractor.ts.TsExtractor;
import com.google.android.gms.ads.internal.cache.CacheEntryParcel;
import com.google.android.gms.ads.internal.cache.CacheOffering;
import com.google.android.gms.ads.internal.overlay.AdLauncherIntentInfoParcel;
import com.google.android.gms.ads.internal.overlay.AdOverlayInfoParcel;
import com.google.android.gms.iid.InstanceID;
import com.vkontakte.android.fragments.AuthCheckFragment;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.CopyOnWriteArrayList;
@zzji
/* loaded from: classes.dex */
public class zzme extends WebViewClient {
    private static final String[] zzcza = {"UNKNOWN", "HOST_LOOKUP", "UNSUPPORTED_AUTH_SCHEME", "AUTHENTICATION", "PROXY_AUTHENTICATION", "CONNECT", "IO", InstanceID.ERROR_TIMEOUT, "REDIRECT_LOOP", "UNSUPPORTED_SCHEME", "FAILED_SSL_HANDSHAKE", "BAD_URL", "FILE", "FILE_NOT_FOUND", "TOO_MANY_REQUESTS"};
    private static final String[] zzczb = {"NOT_YET_VALID", "EXPIRED", "ID_MISMATCH", "UNTRUSTED", "DATE_INVALID", "INVALID"};
    private final Object zzako;
    private boolean zzasy;
    private com.google.android.gms.ads.internal.client.zza zzayj;
    protected zzmd zzbnz;
    private zzfa zzbpi;
    private zzfi zzbqr;
    private com.google.android.gms.ads.internal.zze zzbqt;
    private zzhq zzbqu;
    private zzfg zzbqw;
    private zzhw zzbym;
    private zza zzcgo;
    private final HashMap<String, List<zzfe>> zzczc;
    private com.google.android.gms.ads.internal.overlay.zzg zzczd;
    private zzb zzcze;
    private zzc zzczf;
    private boolean zzczg;
    private boolean zzczh;
    private ViewTreeObserver.OnGlobalLayoutListener zzczi;
    private ViewTreeObserver.OnScrollChangedListener zzczj;
    private boolean zzczk;
    private com.google.android.gms.ads.internal.overlay.zzp zzczl;
    private final zzhu zzczm;
    private zze zzczn;
    @Nullable
    protected com.google.android.gms.ads.internal.safebrowsing.zzc zzczo;
    private boolean zzczp;
    private boolean zzczq;
    private boolean zzczr;
    private int zzczs;

    /* loaded from: classes2.dex */
    public interface zza {
        void zza(zzmd zzmdVar, boolean z);
    }

    /* loaded from: classes2.dex */
    public interface zzb {
        void zzk(zzmd zzmdVar);
    }

    /* loaded from: classes2.dex */
    public interface zzc {
        void zzfg();
    }

    /* loaded from: classes2.dex */
    private static class zzd implements com.google.android.gms.ads.internal.overlay.zzg {
        private com.google.android.gms.ads.internal.overlay.zzg zzczd;
        private zzmd zzczu;

        public zzd(zzmd zzmdVar, com.google.android.gms.ads.internal.overlay.zzg zzgVar) {
            this.zzczu = zzmdVar;
            this.zzczd = zzgVar;
        }

        @Override // com.google.android.gms.ads.internal.overlay.zzg
        public void onPause() {
        }

        @Override // com.google.android.gms.ads.internal.overlay.zzg
        public void onResume() {
        }

        @Override // com.google.android.gms.ads.internal.overlay.zzg
        public void zzeq() {
            this.zzczd.zzeq();
            this.zzczu.zzww();
        }

        @Override // com.google.android.gms.ads.internal.overlay.zzg
        public void zzer() {
            this.zzczd.zzer();
            this.zzczu.zzps();
        }
    }

    /* loaded from: classes2.dex */
    public interface zze {
        void zzff();
    }

    public zzme(zzmd zzmdVar, boolean z) {
        this(zzmdVar, z, new zzhu(zzmdVar, zzmdVar.zzwz(), new zzdj(zzmdVar.getContext())), null);
    }

    zzme(zzmd zzmdVar, boolean z, zzhu zzhuVar, zzhq zzhqVar) {
        this.zzczc = new HashMap<>();
        this.zzako = new Object();
        this.zzczg = false;
        this.zzbnz = zzmdVar;
        this.zzasy = z;
        this.zzczm = zzhuVar;
        this.zzbqu = zzhqVar;
    }

    private void zzb(Context context, String str, String str2, String str3) {
        if (!zzdr.zzbgy.get().booleanValue()) {
            return;
        }
        Bundle bundle = new Bundle();
        bundle.putString("err", str);
        bundle.putString(AuthCheckFragment.KEY_CODE, str2);
        bundle.putString("host", zzdl(str3));
        com.google.android.gms.ads.internal.zzu.zzgm().zza(context, this.zzbnz.zzxf().zzda, "gmob-apps", bundle, true);
    }

    private String zzdl(String str) {
        if (TextUtils.isEmpty(str)) {
            return "";
        }
        Uri parse = Uri.parse(str);
        return parse.getHost() != null ? parse.getHost() : "";
    }

    private static boolean zzi(Uri uri) {
        String scheme = uri.getScheme();
        return UriUtil.HTTP_SCHEME.equalsIgnoreCase(scheme) || UriUtil.HTTPS_SCHEME.equalsIgnoreCase(scheme);
    }

    private void zzye() {
        if (this.zzcze != null) {
            this.zzcze.zzk(this.zzbnz);
            this.zzcze = null;
        }
    }

    @Override // android.webkit.WebViewClient
    public final void onLoadResource(WebView webView, String str) {
        String valueOf = String.valueOf(str);
        zzkx.v(valueOf.length() != 0 ? "Loading resource: ".concat(valueOf) : new String("Loading resource: "));
        Uri parse = Uri.parse(str);
        if (!"gmsg".equalsIgnoreCase(parse.getScheme()) || !"mobileads.google.com".equalsIgnoreCase(parse.getHost())) {
            return;
        }
        zzj(parse);
    }

    @Override // android.webkit.WebViewClient
    public final void onPageFinished(WebView webView, String str) {
        synchronized (this.zzako) {
            if (this.zzczp) {
                zzkx.v("Blank page loaded, 1...");
                this.zzbnz.zzxh();
                return;
            }
            this.zzczq = true;
            zzye();
            zzyf();
        }
    }

    @Override // android.webkit.WebViewClient
    public final void onReceivedError(WebView webView, int i, String str, String str2) {
        zzb(this.zzbnz.getContext(), "http_err", (i >= 0 || (-i) + (-1) >= zzcza.length) ? String.valueOf(i) : zzcza[(-i) - 1], str2);
        super.onReceivedError(webView, i, str, str2);
    }

    @Override // android.webkit.WebViewClient
    public final void onReceivedSslError(WebView webView, SslErrorHandler sslErrorHandler, SslError sslError) {
        if (sslError != null) {
            int primaryError = sslError.getPrimaryError();
            zzb(this.zzbnz.getContext(), "ssl_err", (primaryError < 0 || primaryError >= zzczb.length) ? String.valueOf(primaryError) : zzczb[primaryError], com.google.android.gms.ads.internal.zzu.zzgo().zza(sslError));
        }
        super.onReceivedSslError(webView, sslErrorHandler, sslError);
    }

    public final void reset() {
        if (this.zzczo != null) {
            this.zzczo.zzuf();
            this.zzczo = null;
        }
        synchronized (this.zzako) {
            this.zzczc.clear();
            this.zzayj = null;
            this.zzczd = null;
            this.zzcgo = null;
            this.zzcze = null;
            this.zzbpi = null;
            this.zzczg = false;
            this.zzasy = false;
            this.zzczh = false;
            this.zzczk = false;
            this.zzbqw = null;
            this.zzczl = null;
            this.zzczf = null;
            if (this.zzbqu != null) {
                this.zzbqu.zzt(true);
                this.zzbqu = null;
            }
        }
    }

    @Override // android.webkit.WebViewClient
    @TargetApi(11)
    public WebResourceResponse shouldInterceptRequest(WebView webView, String str) {
        CacheEntryParcel zza2;
        try {
            CacheOffering zzak = CacheOffering.zzak(str);
            if (zzak != null && (zza2 = com.google.android.gms.ads.internal.zzu.zzgr().zza(zzak)) != null && zza2.zzju()) {
                return new WebResourceResponse("", "", zza2.zzjv());
            }
            return null;
        } catch (Throwable th) {
            return null;
        }
    }

    @Override // android.webkit.WebViewClient
    public boolean shouldOverrideKeyEvent(WebView webView, KeyEvent keyEvent) {
        switch (keyEvent.getKeyCode()) {
            case 79:
            case 85:
            case 86:
            case 87:
            case 88:
            case 89:
            case 90:
            case 91:
            case TransportMediator.KEYCODE_MEDIA_PLAY /* 126 */:
            case TransportMediator.KEYCODE_MEDIA_PAUSE /* 127 */:
            case 128:
            case TsExtractor.TS_STREAM_TYPE_AC3 /* 129 */:
            case 130:
            case 222:
                return true;
            default:
                return false;
        }
    }

    @Override // android.webkit.WebViewClient
    public final boolean shouldOverrideUrlLoading(WebView webView, String str) {
        Uri uri;
        String valueOf = String.valueOf(str);
        zzkx.v(valueOf.length() != 0 ? "AdWebView shouldOverrideUrlLoading: ".concat(valueOf) : new String("AdWebView shouldOverrideUrlLoading: "));
        Uri parse = Uri.parse(str);
        if ("gmsg".equalsIgnoreCase(parse.getScheme()) && "mobileads.google.com".equalsIgnoreCase(parse.getHost())) {
            zzj(parse);
        } else if (this.zzczg && webView == this.zzbnz.getWebView() && zzi(parse)) {
            if (this.zzayj != null && zzdr.zzbfo.get().booleanValue()) {
                this.zzayj.onAdClicked();
                if (this.zzczo != null) {
                    this.zzczo.zzcu(str);
                }
                this.zzayj = null;
            }
            return super.shouldOverrideUrlLoading(webView, str);
        } else if (!this.zzbnz.getWebView().willNotDraw()) {
            try {
                zzav zzxe = this.zzbnz.zzxe();
                if (zzxe != null && zzxe.zzc(parse)) {
                    parse = zzxe.zza(parse, this.zzbnz.getContext(), this.zzbnz.getView());
                }
                uri = parse;
            } catch (zzaw e) {
                String valueOf2 = String.valueOf(str);
                zzkx.zzdi(valueOf2.length() != 0 ? "Unable to append parameter to URL: ".concat(valueOf2) : new String("Unable to append parameter to URL: "));
                uri = parse;
            }
            if (this.zzbqt == null || this.zzbqt.zzfe()) {
                zza(new AdLauncherIntentInfoParcel("android.intent.action.VIEW", uri.toString(), null, null, null, null, null));
            } else {
                this.zzbqt.zzy(str);
            }
        } else {
            String valueOf3 = String.valueOf(str);
            zzkx.zzdi(valueOf3.length() != 0 ? "AdWebView unable to handle URL: ".concat(valueOf3) : new String("AdWebView unable to handle URL: "));
        }
        return true;
    }

    public void zza(int i, int i2, boolean z) {
        this.zzczm.zze(i, i2);
        if (this.zzbqu != null) {
            this.zzbqu.zza(i, i2, z);
        }
    }

    public final void zza(ViewTreeObserver.OnGlobalLayoutListener onGlobalLayoutListener, ViewTreeObserver.OnScrollChangedListener onScrollChangedListener) {
        synchronized (this.zzako) {
            this.zzczh = true;
            this.zzbnz.zzxp();
            this.zzczi = onGlobalLayoutListener;
            this.zzczj = onScrollChangedListener;
        }
    }

    public void zza(com.google.android.gms.ads.internal.client.zza zzaVar, com.google.android.gms.ads.internal.overlay.zzg zzgVar, zzfa zzfaVar, com.google.android.gms.ads.internal.overlay.zzp zzpVar, boolean z, zzfg zzfgVar, @Nullable zzfi zzfiVar, com.google.android.gms.ads.internal.zze zzeVar, zzhw zzhwVar, @Nullable com.google.android.gms.ads.internal.safebrowsing.zzc zzcVar) {
        if (zzeVar == null) {
            zzeVar = new com.google.android.gms.ads.internal.zze(this.zzbnz.getContext());
        }
        this.zzbqu = new zzhq(this.zzbnz, zzhwVar);
        this.zzczo = zzcVar;
        zza("/appEvent", new zzez(zzfaVar));
        zza("/backButton", zzfd.zzbpu);
        zza("/refresh", zzfd.zzbpv);
        zza("/canOpenURLs", zzfd.zzbpk);
        zza("/canOpenIntents", zzfd.zzbpl);
        zza("/click", zzfd.zzbpm);
        zza("/close", zzfd.zzbpn);
        zza("/customClose", zzfd.zzbpp);
        zza("/instrument", zzfd.zzbpz);
        zza("/delayPageLoaded", zzfd.zzbqb);
        zza("/delayPageClosed", zzfd.zzbqc);
        zza("/getLocationInfo", zzfd.zzbqd);
        zza("/httpTrack", zzfd.zzbpq);
        zza("/log", zzfd.zzbpr);
        zza("/mraid", new zzfk(zzeVar, this.zzbqu));
        zza("/mraidLoaded", this.zzczm);
        zza("/open", new zzfl(zzfgVar, zzeVar, this.zzbqu));
        zza("/precache", zzfd.zzbpy);
        zza("/touch", zzfd.zzbpt);
        zza("/video", zzfd.zzbpw);
        zza("/videoMeta", zzfd.zzbpx);
        zza("/appStreaming", zzfd.zzbpo);
        if (zzfiVar != null) {
            zza("/setInterstitialProperties", new zzfh(zzfiVar));
        }
        this.zzayj = zzaVar;
        this.zzczd = zzgVar;
        this.zzbpi = zzfaVar;
        this.zzbqw = zzfgVar;
        this.zzczl = zzpVar;
        this.zzbqt = zzeVar;
        this.zzbym = zzhwVar;
        this.zzbqr = zzfiVar;
        zzao(z);
    }

    public final void zza(AdLauncherIntentInfoParcel adLauncherIntentInfoParcel) {
        com.google.android.gms.ads.internal.overlay.zzg zzgVar = null;
        boolean zzxg = this.zzbnz.zzxg();
        com.google.android.gms.ads.internal.client.zza zzaVar = (!zzxg || this.zzbnz.zzeg().zzazr) ? this.zzayj : null;
        if (!zzxg) {
            zzgVar = this.zzczd;
        }
        zza(new AdOverlayInfoParcel(adLauncherIntentInfoParcel, zzaVar, zzgVar, this.zzczl, this.zzbnz.zzxf()));
    }

    public void zza(AdOverlayInfoParcel adOverlayInfoParcel) {
        boolean z = false;
        boolean zzou = this.zzbqu != null ? this.zzbqu.zzou() : false;
        com.google.android.gms.ads.internal.overlay.zze zzgk = com.google.android.gms.ads.internal.zzu.zzgk();
        Context context = this.zzbnz.getContext();
        if (!zzou) {
            z = true;
        }
        zzgk.zza(context, adOverlayInfoParcel, z);
        if (this.zzczo != null) {
            String str = adOverlayInfoParcel.url;
            if (str == null && adOverlayInfoParcel.zzcbj != null) {
                str = adOverlayInfoParcel.zzcbj.url;
            }
            this.zzczo.zzcu(str);
        }
    }

    public void zza(zza zzaVar) {
        this.zzcgo = zzaVar;
    }

    public void zza(zzb zzbVar) {
        this.zzcze = zzbVar;
    }

    public void zza(zzc zzcVar) {
        this.zzczf = zzcVar;
    }

    public void zza(zze zzeVar) {
        this.zzczn = zzeVar;
    }

    public void zza(String str, zzfe zzfeVar) {
        synchronized (this.zzako) {
            List<zzfe> list = this.zzczc.get(str);
            if (list == null) {
                list = new CopyOnWriteArrayList<>();
                this.zzczc.put(str, list);
            }
            list.add(zzfeVar);
        }
    }

    public final void zza(boolean z, int i) {
        zza(new AdOverlayInfoParcel((!this.zzbnz.zzxg() || this.zzbnz.zzeg().zzazr) ? this.zzayj : null, this.zzczd, this.zzczl, this.zzbnz, z, i, this.zzbnz.zzxf()));
    }

    public final void zza(boolean z, int i, String str) {
        zzd zzdVar = null;
        boolean zzxg = this.zzbnz.zzxg();
        com.google.android.gms.ads.internal.client.zza zzaVar = (!zzxg || this.zzbnz.zzeg().zzazr) ? this.zzayj : null;
        if (!zzxg) {
            zzdVar = new zzd(this.zzbnz, this.zzczd);
        }
        zza(new AdOverlayInfoParcel(zzaVar, zzdVar, this.zzbpi, this.zzczl, this.zzbnz, z, i, str, this.zzbnz.zzxf(), this.zzbqw));
    }

    public final void zza(boolean z, int i, String str, String str2) {
        boolean zzxg = this.zzbnz.zzxg();
        zza(new AdOverlayInfoParcel((!zzxg || this.zzbnz.zzeg().zzazr) ? this.zzayj : null, zzxg ? null : new zzd(this.zzbnz, this.zzczd), this.zzbpi, this.zzczl, this.zzbnz, z, i, str, str2, this.zzbnz.zzxf(), this.zzbqw));
    }

    public void zzao(boolean z) {
        this.zzczg = z;
    }

    public void zzb(String str, zzfe zzfeVar) {
        synchronized (this.zzako) {
            List<zzfe> list = this.zzczc.get(str);
            if (list == null) {
                return;
            }
            list.remove(zzfeVar);
        }
    }

    public void zzd(int i, int i2) {
        if (this.zzbqu != null) {
            this.zzbqu.zzd(i, i2);
        }
    }

    public boolean zzic() {
        boolean z;
        synchronized (this.zzako) {
            z = this.zzasy;
        }
        return z;
    }

    public void zzj(Uri uri) {
        String path = uri.getPath();
        List<zzfe> list = this.zzczc.get(path);
        if (list == null) {
            String valueOf = String.valueOf(uri);
            zzkx.v(new StringBuilder(String.valueOf(valueOf).length() + 32).append("No GMSG handler found for GMSG: ").append(valueOf).toString());
            return;
        }
        Map<String, String> zzg = com.google.android.gms.ads.internal.zzu.zzgm().zzg(uri);
        if (zzkx.zzbi(2)) {
            String valueOf2 = String.valueOf(path);
            zzkx.v(valueOf2.length() != 0 ? "Received GMSG: ".concat(valueOf2) : new String("Received GMSG: "));
            for (String str : zzg.keySet()) {
                String str2 = zzg.get(str);
                zzkx.v(new StringBuilder(String.valueOf(str).length() + 4 + String.valueOf(str2).length()).append("  ").append(str).append(": ").append(str2).toString());
            }
        }
        for (zzfe zzfeVar : list) {
            zzfeVar.zza(this.zzbnz, zzg);
        }
    }

    public void zzo(zzmd zzmdVar) {
        this.zzbnz = zzmdVar;
    }

    public final void zzpo() {
        synchronized (this.zzako) {
            this.zzczg = false;
            this.zzasy = true;
            com.google.android.gms.ads.internal.zzu.zzgm().runOnUiThread(new Runnable() { // from class: com.google.android.gms.internal.zzme.2
                @Override // java.lang.Runnable
                public void run() {
                    zzme.this.zzbnz.zzxp();
                    com.google.android.gms.ads.internal.overlay.zzd zzxa = zzme.this.zzbnz.zzxa();
                    if (zzxa != null) {
                        zzxa.zzpo();
                    }
                    if (zzme.this.zzczf != null) {
                        zzme.this.zzczf.zzfg();
                        zzme.this.zzczf = null;
                    }
                }
            });
        }
    }

    public com.google.android.gms.ads.internal.zze zzxu() {
        return this.zzbqt;
    }

    public boolean zzxv() {
        boolean z;
        synchronized (this.zzako) {
            z = this.zzczh;
        }
        return z;
    }

    public ViewTreeObserver.OnGlobalLayoutListener zzxw() {
        ViewTreeObserver.OnGlobalLayoutListener onGlobalLayoutListener;
        synchronized (this.zzako) {
            onGlobalLayoutListener = this.zzczi;
        }
        return onGlobalLayoutListener;
    }

    public ViewTreeObserver.OnScrollChangedListener zzxx() {
        ViewTreeObserver.OnScrollChangedListener onScrollChangedListener;
        synchronized (this.zzako) {
            onScrollChangedListener = this.zzczj;
        }
        return onScrollChangedListener;
    }

    public boolean zzxy() {
        boolean z;
        synchronized (this.zzako) {
            z = this.zzczk;
        }
        return z;
    }

    public void zzxz() {
        synchronized (this.zzako) {
            zzkx.v("Loading blank page in WebView, 2...");
            this.zzczp = true;
            this.zzbnz.zzdj("about:blank");
        }
    }

    public void zzya() {
        if (this.zzczo != null) {
            zzlb.zzcvl.post(new Runnable() { // from class: com.google.android.gms.internal.zzme.1
                @Override // java.lang.Runnable
                public void run() {
                    if (zzme.this.zzczo != null) {
                        zzme.this.zzczo.zzp(zzme.this.zzbnz.getView());
                    }
                }
            });
        }
    }

    public void zzyb() {
        synchronized (this.zzako) {
            this.zzczk = true;
        }
        this.zzczs++;
        zzyf();
    }

    public void zzyc() {
        this.zzczs--;
        zzyf();
    }

    public void zzyd() {
        this.zzczr = true;
        zzyf();
    }

    public final void zzyf() {
        if (this.zzcgo != null && ((this.zzczq && this.zzczs <= 0) || this.zzczr)) {
            this.zzcgo.zza(this.zzbnz, !this.zzczr);
            this.zzcgo = null;
        }
        this.zzbnz.zzxq();
    }

    public zze zzyg() {
        return this.zzczn;
    }
}
