package com.google.android.gms.ads.internal;

import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.os.AsyncTask;
import android.os.Bundle;
import android.os.RemoteException;
import android.support.annotation.Nullable;
import android.text.TextUtils;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.webkit.WebResourceError;
import android.webkit.WebResourceRequest;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import com.google.ads.mediation.admob.AdMobAdapter;
import com.google.android.gms.actions.SearchIntents;
import com.google.android.gms.ads.internal.client.AdRequestParcel;
import com.google.android.gms.ads.internal.client.AdSizeParcel;
import com.google.android.gms.ads.internal.client.VideoOptionsParcel;
import com.google.android.gms.ads.internal.client.zzab;
import com.google.android.gms.ads.internal.client.zzu;
import com.google.android.gms.ads.internal.client.zzw;
import com.google.android.gms.ads.internal.client.zzy;
import com.google.android.gms.ads.internal.util.client.VersionInfoParcel;
import com.google.android.gms.common.internal.zzaa;
import com.google.android.gms.internal.zzcf;
import com.google.android.gms.internal.zzcg;
import com.google.android.gms.internal.zzdr;
import com.google.android.gms.internal.zzed;
import com.google.android.gms.internal.zzig;
import com.google.android.gms.internal.zzik;
import com.google.android.gms.internal.zzji;
import com.google.android.gms.internal.zzkx;
import com.google.android.gms.internal.zzla;
import java.util.Map;
import java.util.TreeMap;
import java.util.concurrent.Callable;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.Future;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.TimeoutException;
@zzji
/* loaded from: classes.dex */
public class zzt extends zzu.zza {
    private final Context mContext;
    @Nullable
    private com.google.android.gms.ads.internal.client.zzq zzanl;
    private final VersionInfoParcel zzanu;
    private final AdSizeParcel zzapp;
    private final Future<zzcf> zzapq = zzgc();
    private final zzb zzapr;
    @Nullable
    private WebView zzaps;
    @Nullable
    private zzcf zzapt;
    private AsyncTask<Void, Void, String> zzapu;

    /* loaded from: classes.dex */
    private class zza extends AsyncTask<Void, Void, String> {
        private zza() {
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // android.os.AsyncTask
        /* renamed from: zza */
        public String doInBackground(Void... voidArr) {
            try {
                zzt.this.zzapt = (zzcf) zzt.this.zzapq.get(zzdr.zzbkf.get().longValue(), TimeUnit.MILLISECONDS);
            } catch (InterruptedException e) {
                e = e;
                zzkx.zzc("Failed to load ad data", e);
            } catch (ExecutionException e2) {
                e = e2;
                zzkx.zzc("Failed to load ad data", e);
            } catch (TimeoutException e3) {
                zzkx.zzdi("Timed out waiting for ad data");
            }
            return zzt.this.zzga();
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // android.os.AsyncTask
        /* renamed from: zzae */
        public void onPostExecute(String str) {
            if (zzt.this.zzaps == null || str == null) {
                return;
            }
            zzt.this.zzaps.loadUrl(str);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes.dex */
    public static class zzb {
        private final String zzapw;
        private final Map<String, String> zzapx = new TreeMap();
        private String zzapy;
        private String zzapz;

        public zzb(String str) {
            this.zzapw = str;
        }

        public String getQuery() {
            return this.zzapy;
        }

        public String zzge() {
            return this.zzapz;
        }

        public String zzgf() {
            return this.zzapw;
        }

        public Map<String, String> zzgg() {
            return this.zzapx;
        }

        public void zzi(AdRequestParcel adRequestParcel) {
            this.zzapy = adRequestParcel.zzays.zzbcj;
            Bundle bundle = adRequestParcel.zzayv != null ? adRequestParcel.zzayv.getBundle(AdMobAdapter.class.getName()) : null;
            if (bundle == null) {
                return;
            }
            String str = zzdr.zzbke.get();
            for (String str2 : bundle.keySet()) {
                if (str.equals(str2)) {
                    this.zzapz = bundle.getString(str2);
                } else if (str2.startsWith("csa_")) {
                    this.zzapx.put(str2.substring("csa_".length()), bundle.getString(str2));
                }
            }
        }
    }

    public zzt(Context context, AdSizeParcel adSizeParcel, String str, VersionInfoParcel versionInfoParcel) {
        this.mContext = context;
        this.zzanu = versionInfoParcel;
        this.zzapp = adSizeParcel;
        this.zzaps = new WebView(this.mContext);
        this.zzapr = new zzb(str);
        zzfz();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public String zzac(String str) {
        if (this.zzapt == null) {
            return str;
        }
        Uri parse = Uri.parse(str);
        try {
            parse = this.zzapt.zzd(parse, this.mContext);
        } catch (RemoteException e) {
            zzkx.zzc("Unable to process ad data", e);
        } catch (zzcg e2) {
            zzkx.zzc("Unable to parse ad click url", e2);
        }
        return parse.toString();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void zzad(String str) {
        Intent intent = new Intent("android.intent.action.VIEW");
        intent.setData(Uri.parse(str));
        this.mContext.startActivity(intent);
    }

    private void zzfz() {
        zzj(0);
        this.zzaps.setVerticalScrollBarEnabled(false);
        this.zzaps.getSettings().setJavaScriptEnabled(true);
        this.zzaps.setWebViewClient(new WebViewClient() { // from class: com.google.android.gms.ads.internal.zzt.1
            @Override // android.webkit.WebViewClient
            public void onReceivedError(WebView webView, WebResourceRequest webResourceRequest, WebResourceError webResourceError) {
                if (zzt.this.zzanl != null) {
                    try {
                        zzt.this.zzanl.onAdFailedToLoad(0);
                    } catch (RemoteException e) {
                        zzkx.zzc("Could not call AdListener.onAdFailedToLoad().", e);
                    }
                }
            }

            @Override // android.webkit.WebViewClient
            public boolean shouldOverrideUrlLoading(WebView webView, String str) {
                if (str.startsWith(zzt.this.zzgb())) {
                    return false;
                }
                if (str.startsWith(zzdr.zzbka.get())) {
                    if (zzt.this.zzanl != null) {
                        try {
                            zzt.this.zzanl.onAdFailedToLoad(3);
                        } catch (RemoteException e) {
                            zzkx.zzc("Could not call AdListener.onAdFailedToLoad().", e);
                        }
                    }
                    zzt.this.zzj(0);
                    return true;
                } else if (str.startsWith(zzdr.zzbkb.get())) {
                    if (zzt.this.zzanl != null) {
                        try {
                            zzt.this.zzanl.onAdFailedToLoad(0);
                        } catch (RemoteException e2) {
                            zzkx.zzc("Could not call AdListener.onAdFailedToLoad().", e2);
                        }
                    }
                    zzt.this.zzj(0);
                    return true;
                } else if (str.startsWith(zzdr.zzbkc.get())) {
                    if (zzt.this.zzanl != null) {
                        try {
                            zzt.this.zzanl.onAdLoaded();
                        } catch (RemoteException e3) {
                            zzkx.zzc("Could not call AdListener.onAdLoaded().", e3);
                        }
                    }
                    zzt.this.zzj(zzt.this.zzab(str));
                    return true;
                } else if (str.startsWith("gmsg://")) {
                    return true;
                } else {
                    if (zzt.this.zzanl != null) {
                        try {
                            zzt.this.zzanl.onAdLeftApplication();
                        } catch (RemoteException e4) {
                            zzkx.zzc("Could not call AdListener.onAdLeftApplication().", e4);
                        }
                    }
                    zzt.this.zzad(zzt.this.zzac(str));
                    return true;
                }
            }
        });
        this.zzaps.setOnTouchListener(new View.OnTouchListener() { // from class: com.google.android.gms.ads.internal.zzt.2
            @Override // android.view.View.OnTouchListener
            public boolean onTouch(View view, MotionEvent motionEvent) {
                if (zzt.this.zzapt != null) {
                    try {
                        zzt.this.zzapt.zza(motionEvent);
                        return false;
                    } catch (RemoteException e) {
                        zzkx.zzc("Unable to process ad data", e);
                        return false;
                    }
                }
                return false;
            }
        });
    }

    private Future<zzcf> zzgc() {
        return zzla.zza(new Callable<zzcf>() { // from class: com.google.android.gms.ads.internal.zzt.3
            @Override // java.util.concurrent.Callable
            /* renamed from: zzgd */
            public zzcf call() throws Exception {
                return new zzcf(zzt.this.zzanu.zzda, zzt.this.mContext, false);
            }
        });
    }

    @Override // com.google.android.gms.ads.internal.client.zzu
    public void destroy() throws RemoteException {
        zzaa.zzhs("destroy must be called on the main UI thread.");
        this.zzapu.cancel(true);
        this.zzapq.cancel(true);
        this.zzaps.destroy();
        this.zzaps = null;
    }

    @Override // com.google.android.gms.ads.internal.client.zzu
    @Nullable
    public String getMediationAdapterClassName() throws RemoteException {
        return null;
    }

    @Override // com.google.android.gms.ads.internal.client.zzu
    public boolean isLoading() throws RemoteException {
        return false;
    }

    @Override // com.google.android.gms.ads.internal.client.zzu
    public boolean isReady() throws RemoteException {
        return false;
    }

    @Override // com.google.android.gms.ads.internal.client.zzu
    public void pause() throws RemoteException {
        zzaa.zzhs("pause must be called on the main UI thread.");
    }

    @Override // com.google.android.gms.ads.internal.client.zzu
    public void resume() throws RemoteException {
        zzaa.zzhs("resume must be called on the main UI thread.");
    }

    @Override // com.google.android.gms.ads.internal.client.zzu
    public void setManualImpressionsEnabled(boolean z) throws RemoteException {
    }

    @Override // com.google.android.gms.ads.internal.client.zzu
    public void setUserId(String str) throws RemoteException {
        throw new IllegalStateException("Unused method");
    }

    @Override // com.google.android.gms.ads.internal.client.zzu
    public void showInterstitial() throws RemoteException {
        throw new IllegalStateException("Unused method");
    }

    @Override // com.google.android.gms.ads.internal.client.zzu
    public void stopLoading() throws RemoteException {
    }

    @Override // com.google.android.gms.ads.internal.client.zzu
    public void zza(AdSizeParcel adSizeParcel) throws RemoteException {
        throw new IllegalStateException("AdSize must be set before initialization");
    }

    @Override // com.google.android.gms.ads.internal.client.zzu
    public void zza(VideoOptionsParcel videoOptionsParcel) {
        throw new IllegalStateException("Unused method");
    }

    @Override // com.google.android.gms.ads.internal.client.zzu
    public void zza(com.google.android.gms.ads.internal.client.zzp zzpVar) throws RemoteException {
        throw new IllegalStateException("Unused method");
    }

    @Override // com.google.android.gms.ads.internal.client.zzu
    public void zza(com.google.android.gms.ads.internal.client.zzq zzqVar) throws RemoteException {
        this.zzanl = zzqVar;
    }

    @Override // com.google.android.gms.ads.internal.client.zzu
    public void zza(zzw zzwVar) throws RemoteException {
        throw new IllegalStateException("Unused method");
    }

    @Override // com.google.android.gms.ads.internal.client.zzu
    public void zza(zzy zzyVar) throws RemoteException {
        throw new IllegalStateException("Unused method");
    }

    @Override // com.google.android.gms.ads.internal.client.zzu
    public void zza(com.google.android.gms.ads.internal.reward.client.zzd zzdVar) throws RemoteException {
        throw new IllegalStateException("Unused method");
    }

    @Override // com.google.android.gms.ads.internal.client.zzu
    public void zza(zzed zzedVar) throws RemoteException {
        throw new IllegalStateException("Unused method");
    }

    @Override // com.google.android.gms.ads.internal.client.zzu
    public void zza(zzig zzigVar) throws RemoteException {
        throw new IllegalStateException("Unused method");
    }

    @Override // com.google.android.gms.ads.internal.client.zzu
    public void zza(zzik zzikVar, String str) throws RemoteException {
        throw new IllegalStateException("Unused method");
    }

    int zzab(String str) {
        String queryParameter = Uri.parse(str).getQueryParameter("height");
        if (TextUtils.isEmpty(queryParameter)) {
            return 0;
        }
        try {
            return com.google.android.gms.ads.internal.client.zzm.zzkr().zzb(this.mContext, Integer.parseInt(queryParameter));
        } catch (NumberFormatException e) {
            return 0;
        }
    }

    @Override // com.google.android.gms.ads.internal.client.zzu
    public boolean zzb(AdRequestParcel adRequestParcel) throws RemoteException {
        zzaa.zzb(this.zzaps, "This Search Ad has already been torn down");
        this.zzapr.zzi(adRequestParcel);
        this.zzapu = new zza().execute(new Void[0]);
        return true;
    }

    @Override // com.google.android.gms.ads.internal.client.zzu
    public com.google.android.gms.dynamic.zzd zzef() throws RemoteException {
        zzaa.zzhs("getAdFrame must be called on the main UI thread.");
        return com.google.android.gms.dynamic.zze.zzac(this.zzaps);
    }

    @Override // com.google.android.gms.ads.internal.client.zzu
    public AdSizeParcel zzeg() throws RemoteException {
        return this.zzapp;
    }

    @Override // com.google.android.gms.ads.internal.client.zzu
    public void zzei() throws RemoteException {
        throw new IllegalStateException("Unused method");
    }

    @Override // com.google.android.gms.ads.internal.client.zzu
    @Nullable
    public zzab zzej() {
        return null;
    }

    String zzga() {
        Uri zzc;
        Uri.Builder builder = new Uri.Builder();
        builder.scheme("https://").appendEncodedPath(zzdr.zzbkd.get());
        builder.appendQueryParameter(SearchIntents.EXTRA_QUERY, this.zzapr.getQuery());
        builder.appendQueryParameter("pubId", this.zzapr.zzgf());
        Map<String, String> zzgg = this.zzapr.zzgg();
        for (String str : zzgg.keySet()) {
            builder.appendQueryParameter(str, zzgg.get(str));
        }
        Uri build = builder.build();
        if (this.zzapt != null) {
            try {
                zzc = this.zzapt.zzc(build, this.mContext);
            } catch (RemoteException | zzcg e) {
                zzkx.zzc("Unable to process ad data", e);
            }
            String valueOf = String.valueOf(zzgb());
            String valueOf2 = String.valueOf(zzc.getEncodedQuery());
            return new StringBuilder(String.valueOf(valueOf).length() + 1 + String.valueOf(valueOf2).length()).append(valueOf).append("#").append(valueOf2).toString();
        }
        zzc = build;
        String valueOf3 = String.valueOf(zzgb());
        String valueOf22 = String.valueOf(zzc.getEncodedQuery());
        return new StringBuilder(String.valueOf(valueOf3).length() + 1 + String.valueOf(valueOf22).length()).append(valueOf3).append("#").append(valueOf22).toString();
    }

    String zzgb() {
        String zzge = this.zzapr.zzge();
        String str = TextUtils.isEmpty(zzge) ? "www.google.com" : zzge;
        String valueOf = String.valueOf("https://");
        String str2 = zzdr.zzbkd.get();
        return new StringBuilder(String.valueOf(valueOf).length() + 0 + String.valueOf(str).length() + String.valueOf(str2).length()).append(valueOf).append(str).append(str2).toString();
    }

    void zzj(int i) {
        if (this.zzaps == null) {
            return;
        }
        this.zzaps.setLayoutParams(new ViewGroup.LayoutParams(-1, i));
    }
}
