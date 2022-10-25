package com.google.android.gms.internal;

import android.app.Activity;
import android.content.Context;
import android.graphics.Color;
import android.support.annotation.Nullable;
import android.view.View;
import android.webkit.WebChromeClient;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import android.widget.FrameLayout;
import com.google.android.gms.ads.internal.client.AdSizeParcel;
import com.google.android.gms.ads.internal.util.client.VersionInfoParcel;
import com.google.android.gms.internal.zzcu;
import java.util.Map;
import org.json.JSONObject;
/* JADX INFO: Access modifiers changed from: package-private */
@zzji
/* loaded from: classes.dex */
public class zzmg extends FrameLayout implements zzmd {
    private static final int zzcak = Color.argb(0, 0, 0, 0);
    private final zzmd zzczv;
    private final zzmc zzczw;

    public zzmg(zzmd zzmdVar) {
        super(zzmdVar.getContext());
        this.zzczv = zzmdVar;
        this.zzczw = new zzmc(zzmdVar.zzwz(), this, this);
        zzme zzxc = this.zzczv.zzxc();
        if (zzxc != null) {
            zzxc.zzo(this);
        }
        addView(this.zzczv.getView());
    }

    @Override // com.google.android.gms.internal.zzmd
    public void destroy() {
        this.zzczv.destroy();
    }

    @Override // com.google.android.gms.internal.zzmd
    public String getRequestId() {
        return this.zzczv.getRequestId();
    }

    @Override // com.google.android.gms.internal.zzmd
    public int getRequestedOrientation() {
        return this.zzczv.getRequestedOrientation();
    }

    @Override // com.google.android.gms.internal.zzmd
    public View getView() {
        return this;
    }

    @Override // com.google.android.gms.internal.zzmd
    public WebView getWebView() {
        return this.zzczv.getWebView();
    }

    @Override // com.google.android.gms.internal.zzmd
    public boolean isDestroyed() {
        return this.zzczv.isDestroyed();
    }

    @Override // com.google.android.gms.internal.zzmd
    public void loadData(String str, String str2, String str3) {
        this.zzczv.loadData(str, str2, str3);
    }

    @Override // com.google.android.gms.internal.zzmd
    public void loadDataWithBaseURL(String str, String str2, String str3, String str4, String str5) {
        this.zzczv.loadDataWithBaseURL(str, str2, str3, str4, str5);
    }

    @Override // com.google.android.gms.internal.zzmd
    public void loadUrl(String str) {
        this.zzczv.loadUrl(str);
    }

    @Override // com.google.android.gms.internal.zzmd
    public void onPause() {
        this.zzczw.onPause();
        this.zzczv.onPause();
    }

    @Override // com.google.android.gms.internal.zzmd
    public void onResume() {
        this.zzczv.onResume();
    }

    @Override // com.google.android.gms.internal.zzmd
    public void setContext(Context context) {
        this.zzczv.setContext(context);
    }

    @Override // android.view.View, com.google.android.gms.internal.zzmd
    public void setOnClickListener(View.OnClickListener onClickListener) {
        this.zzczv.setOnClickListener(onClickListener);
    }

    @Override // android.view.View, com.google.android.gms.internal.zzmd
    public void setOnTouchListener(View.OnTouchListener onTouchListener) {
        this.zzczv.setOnTouchListener(onTouchListener);
    }

    @Override // com.google.android.gms.internal.zzmd
    public void setRequestedOrientation(int i) {
        this.zzczv.setRequestedOrientation(i);
    }

    @Override // com.google.android.gms.internal.zzmd
    public void setWebChromeClient(WebChromeClient webChromeClient) {
        this.zzczv.setWebChromeClient(webChromeClient);
    }

    @Override // com.google.android.gms.internal.zzmd
    public void setWebViewClient(WebViewClient webViewClient) {
        this.zzczv.setWebViewClient(webViewClient);
    }

    @Override // com.google.android.gms.internal.zzmd
    public void stopLoading() {
        this.zzczv.stopLoading();
    }

    @Override // com.google.android.gms.internal.zzmd
    public void zza(Context context, AdSizeParcel adSizeParcel, zzdz zzdzVar) {
        this.zzczw.onDestroy();
        this.zzczv.zza(context, adSizeParcel, zzdzVar);
    }

    @Override // com.google.android.gms.internal.zzmd
    public void zza(AdSizeParcel adSizeParcel) {
        this.zzczv.zza(adSizeParcel);
    }

    @Override // com.google.android.gms.internal.zzcu.zzb
    public void zza(zzcu.zza zzaVar) {
        this.zzczv.zza(zzaVar);
    }

    @Override // com.google.android.gms.internal.zzmd
    public void zza(zzmi zzmiVar) {
        this.zzczv.zza(zzmiVar);
    }

    @Override // com.google.android.gms.internal.zzgi
    public void zza(String str, zzfe zzfeVar) {
        this.zzczv.zza(str, zzfeVar);
    }

    @Override // com.google.android.gms.internal.zzmd
    public void zza(String str, Map<String, ?> map) {
        this.zzczv.zza(str, map);
    }

    @Override // com.google.android.gms.internal.zzmd, com.google.android.gms.internal.zzgi
    public void zza(String str, JSONObject jSONObject) {
        this.zzczv.zza(str, jSONObject);
    }

    @Override // com.google.android.gms.internal.zzmd
    public void zzak(int i) {
        this.zzczv.zzak(i);
    }

    @Override // com.google.android.gms.internal.zzmd
    public void zzak(boolean z) {
        this.zzczv.zzak(z);
    }

    @Override // com.google.android.gms.internal.zzmd
    public void zzal(boolean z) {
        this.zzczv.zzal(z);
    }

    @Override // com.google.android.gms.internal.zzmd
    public void zzam(boolean z) {
        this.zzczv.zzam(z);
    }

    @Override // com.google.android.gms.internal.zzmd
    public void zzan(boolean z) {
        this.zzczv.zzan(z);
    }

    @Override // com.google.android.gms.internal.zzmd
    public void zzb(@Nullable com.google.android.gms.ads.internal.formats.zzg zzgVar) {
        this.zzczv.zzb(zzgVar);
    }

    @Override // com.google.android.gms.internal.zzmd
    public void zzb(com.google.android.gms.ads.internal.overlay.zzd zzdVar) {
        this.zzczv.zzb(zzdVar);
    }

    @Override // com.google.android.gms.internal.zzgi
    public void zzb(String str, zzfe zzfeVar) {
        this.zzczv.zzb(str, zzfeVar);
    }

    @Override // com.google.android.gms.internal.zzgi
    public void zzb(String str, JSONObject jSONObject) {
        this.zzczv.zzb(str, jSONObject);
    }

    @Override // com.google.android.gms.internal.zzmd
    public void zzc(com.google.android.gms.ads.internal.overlay.zzd zzdVar) {
        this.zzczv.zzc(zzdVar);
    }

    @Override // com.google.android.gms.internal.zzmd
    public void zzdj(String str) {
        this.zzczv.zzdj(str);
    }

    @Override // com.google.android.gms.internal.zzmd
    public void zzdk(String str) {
        this.zzczv.zzdk(str);
    }

    @Override // com.google.android.gms.internal.zzmd
    public com.google.android.gms.ads.internal.zzd zzec() {
        return this.zzczv.zzec();
    }

    @Override // com.google.android.gms.internal.zzmd
    public AdSizeParcel zzeg() {
        return this.zzczv.zzeg();
    }

    @Override // com.google.android.gms.ads.internal.zzs
    public void zzey() {
        this.zzczv.zzey();
    }

    @Override // com.google.android.gms.ads.internal.zzs
    public void zzez() {
        this.zzczv.zzez();
    }

    @Override // com.google.android.gms.internal.zzmd, com.google.android.gms.internal.zzgi
    public void zzi(String str, String str2) {
        this.zzczv.zzi(str, str2);
    }

    @Override // com.google.android.gms.internal.zzmd
    public void zzps() {
        this.zzczv.zzps();
    }

    @Override // com.google.android.gms.internal.zzmd
    public void zzww() {
        this.zzczv.zzww();
    }

    @Override // com.google.android.gms.internal.zzmd
    public void zzwx() {
        this.zzczv.zzwx();
    }

    @Override // com.google.android.gms.internal.zzmd
    public Activity zzwy() {
        return this.zzczv.zzwy();
    }

    @Override // com.google.android.gms.internal.zzmd
    public Context zzwz() {
        return this.zzczv.zzwz();
    }

    @Override // com.google.android.gms.internal.zzmd
    public com.google.android.gms.ads.internal.overlay.zzd zzxa() {
        return this.zzczv.zzxa();
    }

    @Override // com.google.android.gms.internal.zzmd
    public com.google.android.gms.ads.internal.overlay.zzd zzxb() {
        return this.zzczv.zzxb();
    }

    @Override // com.google.android.gms.internal.zzmd
    public zzme zzxc() {
        return this.zzczv.zzxc();
    }

    @Override // com.google.android.gms.internal.zzmd
    public boolean zzxd() {
        return this.zzczv.zzxd();
    }

    @Override // com.google.android.gms.internal.zzmd
    public zzav zzxe() {
        return this.zzczv.zzxe();
    }

    @Override // com.google.android.gms.internal.zzmd
    public VersionInfoParcel zzxf() {
        return this.zzczv.zzxf();
    }

    @Override // com.google.android.gms.internal.zzmd
    public boolean zzxg() {
        return this.zzczv.zzxg();
    }

    @Override // com.google.android.gms.internal.zzmd
    public void zzxh() {
        this.zzczw.onDestroy();
        this.zzczv.zzxh();
    }

    @Override // com.google.android.gms.internal.zzmd
    public boolean zzxi() {
        return this.zzczv.zzxi();
    }

    @Override // com.google.android.gms.internal.zzmd
    public boolean zzxj() {
        return this.zzczv.zzxj();
    }

    @Override // com.google.android.gms.internal.zzmd
    public zzmc zzxk() {
        return this.zzczw;
    }

    @Override // com.google.android.gms.internal.zzmd
    public zzdx zzxl() {
        return this.zzczv.zzxl();
    }

    @Override // com.google.android.gms.internal.zzmd
    public zzdy zzxm() {
        return this.zzczv.zzxm();
    }

    @Override // com.google.android.gms.internal.zzmd
    public zzmi zzxn() {
        return this.zzczv.zzxn();
    }

    @Override // com.google.android.gms.internal.zzmd
    public boolean zzxo() {
        return this.zzczv.zzxo();
    }

    @Override // com.google.android.gms.internal.zzmd
    public void zzxp() {
        this.zzczv.zzxp();
    }

    @Override // com.google.android.gms.internal.zzmd
    public void zzxq() {
        this.zzczv.zzxq();
    }

    @Override // com.google.android.gms.internal.zzmd
    public View.OnClickListener zzxr() {
        return this.zzczv.zzxr();
    }

    @Override // com.google.android.gms.internal.zzmd
    @Nullable
    public com.google.android.gms.ads.internal.formats.zzg zzxs() {
        return this.zzczv.zzxs();
    }

    @Override // com.google.android.gms.internal.zzmd
    public void zzxt() {
        setBackgroundColor(zzcak);
        this.zzczv.setBackgroundColor(zzcak);
    }
}
