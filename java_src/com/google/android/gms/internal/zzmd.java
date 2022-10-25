package com.google.android.gms.internal;

import android.app.Activity;
import android.content.Context;
import android.support.annotation.Nullable;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.webkit.WebChromeClient;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import com.google.android.gms.ads.internal.client.AdSizeParcel;
import com.google.android.gms.ads.internal.util.client.VersionInfoParcel;
import com.google.android.gms.internal.zzcu;
import java.util.Map;
import org.json.JSONObject;
@zzji
/* loaded from: classes.dex */
public interface zzmd extends com.google.android.gms.ads.internal.zzs, zzcu.zzb, zzgi {
    void destroy();

    Context getContext();

    ViewGroup.LayoutParams getLayoutParams();

    void getLocationOnScreen(int[] iArr);

    int getMeasuredHeight();

    int getMeasuredWidth();

    ViewParent getParent();

    String getRequestId();

    int getRequestedOrientation();

    View getView();

    WebView getWebView();

    boolean isDestroyed();

    void loadData(String str, String str2, String str3);

    void loadDataWithBaseURL(String str, String str2, String str3, String str4, @Nullable String str5);

    void loadUrl(String str);

    void measure(int i, int i2);

    void onPause();

    void onResume();

    void setBackgroundColor(int i);

    void setContext(Context context);

    void setOnClickListener(View.OnClickListener onClickListener);

    void setOnTouchListener(View.OnTouchListener onTouchListener);

    void setRequestedOrientation(int i);

    void setWebChromeClient(WebChromeClient webChromeClient);

    void setWebViewClient(WebViewClient webViewClient);

    void stopLoading();

    void zza(Context context, AdSizeParcel adSizeParcel, zzdz zzdzVar);

    void zza(AdSizeParcel adSizeParcel);

    void zza(zzmi zzmiVar);

    void zza(String str, Map<String, ?> map);

    @Override // com.google.android.gms.internal.zzgi
    void zza(String str, JSONObject jSONObject);

    void zzak(int i);

    void zzak(boolean z);

    void zzal(boolean z);

    void zzam(boolean z);

    void zzan(boolean z);

    void zzb(com.google.android.gms.ads.internal.formats.zzg zzgVar);

    void zzb(com.google.android.gms.ads.internal.overlay.zzd zzdVar);

    void zzc(com.google.android.gms.ads.internal.overlay.zzd zzdVar);

    void zzdj(String str);

    void zzdk(String str);

    com.google.android.gms.ads.internal.zzd zzec();

    AdSizeParcel zzeg();

    @Override // com.google.android.gms.internal.zzgi
    void zzi(String str, String str2);

    void zzps();

    void zzww();

    void zzwx();

    Activity zzwy();

    Context zzwz();

    com.google.android.gms.ads.internal.overlay.zzd zzxa();

    com.google.android.gms.ads.internal.overlay.zzd zzxb();

    @Nullable
    zzme zzxc();

    boolean zzxd();

    zzav zzxe();

    VersionInfoParcel zzxf();

    boolean zzxg();

    void zzxh();

    boolean zzxi();

    boolean zzxj();

    @Nullable
    zzmc zzxk();

    @Nullable
    zzdx zzxl();

    zzdy zzxm();

    @Nullable
    zzmi zzxn();

    boolean zzxo();

    void zzxp();

    void zzxq();

    @Nullable
    View.OnClickListener zzxr();

    com.google.android.gms.ads.internal.formats.zzg zzxs();

    void zzxt();
}
