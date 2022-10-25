package com.google.android.gms.internal;

import android.annotation.SuppressLint;
import android.annotation.TargetApi;
import android.app.Activity;
import android.content.ActivityNotFoundException;
import android.content.Context;
import android.content.Intent;
import android.content.MutableContextWrapper;
import android.graphics.Canvas;
import android.net.Uri;
import android.os.Build;
import android.support.annotation.Nullable;
import android.text.TextUtils;
import android.util.DisplayMetrics;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewTreeObserver;
import android.view.WindowManager;
import android.webkit.DownloadListener;
import android.webkit.ValueCallback;
import android.webkit.WebSettings;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import com.facebook.appevents.AppEventsConstants;
import com.facebook.internal.ServerProtocol;
import com.google.android.gms.ads.internal.client.AdSizeParcel;
import com.google.android.gms.ads.internal.util.client.VersionInfoParcel;
import com.google.android.gms.internal.zzcu;
import java.lang.ref.WeakReference;
import java.util.HashMap;
import java.util.Map;
import org.json.JSONException;
import org.json.JSONObject;
/* JADX INFO: Access modifiers changed from: package-private */
@zzji
/* loaded from: classes.dex */
public class zzmh extends WebView implements ViewTreeObserver.OnGlobalLayoutListener, DownloadListener, zzmd {
    private com.google.android.gms.ads.internal.overlay.zzd a;
    private boolean b;
    private boolean c;
    private boolean d;
    private boolean e;
    private int f;
    private boolean g;
    boolean h;
    private zzmi i;
    private boolean j;
    private boolean k;
    private com.google.android.gms.ads.internal.formats.zzg l;
    private int m;
    private int n;
    private zzdx o;
    private zzdx p;
    private zzdy q;
    private WeakReference<View.OnClickListener> r;
    private com.google.android.gms.ads.internal.overlay.zzd s;
    private Map<String, zzfs> t;
    private final Object zzako;
    private final com.google.android.gms.ads.internal.zzd zzamb;
    private final VersionInfoParcel zzanu;
    private AdSizeParcel zzapp;
    private zzlp zzass;
    private final WindowManager zzati;
    @Nullable
    private final zzav zzbnx;
    private int zzbzd;
    private int zzbze;
    private int zzbzg;
    private int zzbzh;
    private String zzcec;
    private zzdx zzced;
    private Boolean zzcub;
    private final zza zzczx;
    private final com.google.android.gms.ads.internal.zzs zzczy;
    private zzme zzczz;

    @zzji
    /* loaded from: classes.dex */
    public static class zza extends MutableContextWrapper {
        private Context v;
        private Context zzatc;
        private Activity zzcxl;

        public zza(Context context) {
            super(context);
            setBaseContext(context);
        }

        @Override // android.content.ContextWrapper, android.content.Context
        public Object getSystemService(String str) {
            return this.v.getSystemService(str);
        }

        @Override // android.content.MutableContextWrapper
        public void setBaseContext(Context context) {
            this.zzatc = context.getApplicationContext();
            this.zzcxl = context instanceof Activity ? (Activity) context : null;
            this.v = context;
            super.setBaseContext(this.zzatc);
        }

        @Override // android.content.ContextWrapper, android.content.Context
        public void startActivity(Intent intent) {
            if (this.zzcxl != null) {
                this.zzcxl.startActivity(intent);
                return;
            }
            intent.setFlags(268435456);
            this.zzatc.startActivity(intent);
        }

        public Activity zzwy() {
            return this.zzcxl;
        }

        public Context zzwz() {
            return this.v;
        }
    }

    protected zzmh(zza zzaVar, AdSizeParcel adSizeParcel, boolean z, boolean z2, @Nullable zzav zzavVar, VersionInfoParcel versionInfoParcel, zzdz zzdzVar, com.google.android.gms.ads.internal.zzs zzsVar, com.google.android.gms.ads.internal.zzd zzdVar) {
        super(zzaVar);
        this.zzako = new Object();
        this.g = true;
        this.h = false;
        this.zzcec = "";
        this.zzbze = -1;
        this.zzbzd = -1;
        this.zzbzg = -1;
        this.zzbzh = -1;
        this.zzczx = zzaVar;
        this.zzapp = adSizeParcel;
        this.d = z;
        this.f = -1;
        this.zzbnx = zzavVar;
        this.zzanu = versionInfoParcel;
        this.zzczy = zzsVar;
        this.zzamb = zzdVar;
        this.zzati = (WindowManager) getContext().getSystemService("window");
        setBackgroundColor(0);
        WebSettings settings = getSettings();
        settings.setAllowFileAccess(false);
        settings.setJavaScriptEnabled(true);
        settings.setSavePassword(false);
        settings.setSupportMultipleWindows(true);
        settings.setJavaScriptCanOpenWindowsAutomatically(true);
        if (Build.VERSION.SDK_INT >= 21) {
            settings.setMixedContentMode(2);
        }
        com.google.android.gms.ads.internal.zzu.zzgm().zza(zzaVar, versionInfoParcel.zzda, settings);
        com.google.android.gms.ads.internal.zzu.zzgo().zza(getContext(), settings);
        setDownloadListener(this);
        zzym();
        if (com.google.android.gms.common.util.zzs.zzays()) {
            addJavascriptInterface(new zzmj(this), "googleAdsJsInterface");
        }
        if (com.google.android.gms.common.util.zzs.zzayn()) {
            removeJavascriptInterface("accessibility");
            removeJavascriptInterface("accessibilityTraversal");
        }
        this.zzass = new zzlp(this.zzczx.zzwy(), this, this, null);
        zzd(zzdzVar);
    }

    private void zzap(boolean z) {
        HashMap hashMap = new HashMap();
        hashMap.put("isVisible", z ? AppEventsConstants.EVENT_PARAM_VALUE_YES : AppEventsConstants.EVENT_PARAM_VALUE_NO);
        zza("onAdVisibilityChanged", hashMap);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static zzmh zzb(Context context, AdSizeParcel adSizeParcel, boolean z, boolean z2, @Nullable zzav zzavVar, VersionInfoParcel versionInfoParcel, zzdz zzdzVar, com.google.android.gms.ads.internal.zzs zzsVar, com.google.android.gms.ads.internal.zzd zzdVar) {
        return new zzmh(new zza(context), adSizeParcel, z, z2, zzavVar, versionInfoParcel, zzdzVar, zzsVar, zzdVar);
    }

    private void zzd(zzdz zzdzVar) {
        zzyq();
        this.q = new zzdy(new zzdz(true, "make_wv", this.zzapp.zzazq));
        this.q.zzly().zzc(zzdzVar);
        this.zzced = zzdv.zzb(this.q.zzly());
        this.q.zza("native:view_create", this.zzced);
        this.p = null;
        this.o = null;
    }

    private void zzyi() {
        synchronized (this.zzako) {
            this.zzcub = com.google.android.gms.ads.internal.zzu.zzgq().zzva();
            if (this.zzcub == null) {
                try {
                    evaluateJavascript("(function(){})()", null);
                    zzb((Boolean) true);
                } catch (IllegalStateException e) {
                    zzb((Boolean) false);
                }
            }
        }
    }

    private void zzyj() {
        zzdv.zza(this.q.zzly(), this.zzced, "aeh2");
    }

    private void zzyk() {
        zzdv.zza(this.q.zzly(), this.zzced, "aebb2");
    }

    private void zzym() {
        synchronized (this.zzako) {
            if (this.d || this.zzapp.zzazr) {
                if (Build.VERSION.SDK_INT < 14) {
                    zzkx.zzdg("Disabling hardware acceleration on an overlay.");
                    zzyn();
                } else {
                    zzkx.zzdg("Enabling hardware acceleration on an overlay.");
                    zzyo();
                }
            } else if (Build.VERSION.SDK_INT < 18) {
                zzkx.zzdg("Disabling hardware acceleration on an AdView.");
                zzyn();
            } else {
                zzkx.zzdg("Enabling hardware acceleration on an AdView.");
                zzyo();
            }
        }
    }

    private void zzyn() {
        synchronized (this.zzako) {
            if (!this.e) {
                com.google.android.gms.ads.internal.zzu.zzgo().zzv(this);
            }
            this.e = true;
        }
    }

    private void zzyo() {
        synchronized (this.zzako) {
            if (this.e) {
                com.google.android.gms.ads.internal.zzu.zzgo().zzu(this);
            }
            this.e = false;
        }
    }

    private void zzyp() {
        synchronized (this.zzako) {
            this.t = null;
        }
    }

    private void zzyq() {
        zzdz zzly;
        if (this.q == null || (zzly = this.q.zzly()) == null || com.google.android.gms.ads.internal.zzu.zzgq().zzuu() == null) {
            return;
        }
        com.google.android.gms.ads.internal.zzu.zzgq().zzuu().zza(zzly);
    }

    @Override // android.webkit.WebView, com.google.android.gms.internal.zzmd
    public void destroy() {
        synchronized (this.zzako) {
            zzyq();
            this.zzass.zzwm();
            if (this.a != null) {
                this.a.close();
                this.a.onDestroy();
                this.a = null;
            }
            this.zzczz.reset();
            if (this.c) {
                return;
            }
            com.google.android.gms.ads.internal.zzu.zzhj().zze(this);
            zzyp();
            this.c = true;
            zzkx.v("Initiating WebView self destruct sequence in 3...");
            this.zzczz.zzxz();
        }
    }

    @Override // android.webkit.WebView
    @TargetApi(19)
    public void evaluateJavascript(String str, ValueCallback<String> valueCallback) {
        synchronized (this.zzako) {
            if (!isDestroyed()) {
                super.evaluateJavascript(str, valueCallback);
                return;
            }
            zzkx.zzdi("The webview is destroyed. Ignoring action.");
            if (valueCallback != null) {
                valueCallback.onReceiveValue(null);
            }
        }
    }

    protected void finalize() throws Throwable {
        synchronized (this.zzako) {
            if (!this.c) {
                this.zzczz.reset();
                com.google.android.gms.ads.internal.zzu.zzhj().zze(this);
                zzyp();
            }
        }
        super.finalize();
    }

    @Override // com.google.android.gms.internal.zzmd
    public String getRequestId() {
        String str;
        synchronized (this.zzako) {
            str = this.zzcec;
        }
        return str;
    }

    @Override // com.google.android.gms.internal.zzmd
    public int getRequestedOrientation() {
        int i;
        synchronized (this.zzako) {
            i = this.f;
        }
        return i;
    }

    @Override // com.google.android.gms.internal.zzmd
    public View getView() {
        return this;
    }

    @Override // com.google.android.gms.internal.zzmd
    public WebView getWebView() {
        return this;
    }

    @Override // com.google.android.gms.internal.zzmd
    public boolean isDestroyed() {
        boolean z;
        synchronized (this.zzako) {
            z = this.c;
        }
        return z;
    }

    @Override // android.webkit.WebView, com.google.android.gms.internal.zzmd
    public void loadData(String str, String str2, String str3) {
        synchronized (this.zzako) {
            if (!isDestroyed()) {
                super.loadData(str, str2, str3);
            } else {
                zzkx.zzdi("The webview is destroyed. Ignoring action.");
            }
        }
    }

    @Override // android.webkit.WebView, com.google.android.gms.internal.zzmd
    public void loadDataWithBaseURL(String str, String str2, String str3, String str4, String str5) {
        synchronized (this.zzako) {
            if (!isDestroyed()) {
                super.loadDataWithBaseURL(str, str2, str3, str4, str5);
            } else {
                zzkx.zzdi("The webview is destroyed. Ignoring action.");
            }
        }
    }

    @Override // android.webkit.WebView, com.google.android.gms.internal.zzmd
    public void loadUrl(String str) {
        synchronized (this.zzako) {
            if (!isDestroyed()) {
                super.loadUrl(str);
            } else {
                zzkx.zzdi("The webview is destroyed. Ignoring action.");
            }
        }
    }

    @Override // android.webkit.WebView, android.view.ViewGroup, android.view.View
    protected void onAttachedToWindow() {
        boolean z = true;
        synchronized (this.zzako) {
            super.onAttachedToWindow();
            if (!isDestroyed()) {
                this.zzass.onAttachedToWindow();
            }
            boolean z2 = this.j;
            if (zzxc() == null || !zzxc().zzxv()) {
                z = z2;
            } else if (!this.k) {
                ViewTreeObserver.OnGlobalLayoutListener zzxw = zzxc().zzxw();
                if (zzxw != null) {
                    com.google.android.gms.ads.internal.zzu.zzhk().zza(getView(), zzxw);
                }
                ViewTreeObserver.OnScrollChangedListener zzxx = zzxc().zzxx();
                if (zzxx != null) {
                    com.google.android.gms.ads.internal.zzu.zzhk().zza(getView(), zzxx);
                }
                this.k = true;
            }
            zzap(z);
        }
    }

    @Override // android.view.ViewGroup, android.view.View
    protected void onDetachedFromWindow() {
        synchronized (this.zzako) {
            if (!isDestroyed()) {
                this.zzass.onDetachedFromWindow();
            }
            super.onDetachedFromWindow();
            if (this.k && zzxc() != null && zzxc().zzxv() && getViewTreeObserver() != null && getViewTreeObserver().isAlive()) {
                ViewTreeObserver.OnGlobalLayoutListener zzxw = zzxc().zzxw();
                if (zzxw != null) {
                    com.google.android.gms.ads.internal.zzu.zzgo().zza(getViewTreeObserver(), zzxw);
                }
                ViewTreeObserver.OnScrollChangedListener zzxx = zzxc().zzxx();
                if (zzxx != null) {
                    getViewTreeObserver().removeOnScrollChangedListener(zzxx);
                }
                this.k = false;
            }
        }
        zzap(false);
    }

    @Override // android.webkit.DownloadListener
    public void onDownloadStart(String str, String str2, String str3, String str4, long j) {
        try {
            Intent intent = new Intent("android.intent.action.VIEW");
            intent.setDataAndType(Uri.parse(str), str4);
            com.google.android.gms.ads.internal.zzu.zzgm().zzb(getContext(), intent);
        } catch (ActivityNotFoundException e) {
            zzkx.zzdg(new StringBuilder(String.valueOf(str).length() + 51 + String.valueOf(str4).length()).append("Couldn't find an Activity to view url/mimetype: ").append(str).append(" / ").append(str4).toString());
        }
    }

    @Override // android.webkit.WebView, android.view.View
    @TargetApi(21)
    protected void onDraw(Canvas canvas) {
        if (isDestroyed()) {
            return;
        }
        if (Build.VERSION.SDK_INT == 21 && canvas.isHardwareAccelerated() && !isAttachedToWindow()) {
            return;
        }
        super.onDraw(canvas);
        if (zzxc() == null || zzxc().zzyg() == null) {
            return;
        }
        zzxc().zzyg().zzff();
    }

    @Override // android.webkit.WebView, android.view.View
    public boolean onGenericMotionEvent(MotionEvent motionEvent) {
        if (zzdr.zzbfv.get().booleanValue()) {
            float axisValue = motionEvent.getAxisValue(9);
            float axisValue2 = motionEvent.getAxisValue(10);
            if ((motionEvent.getActionMasked() == 8) && ((axisValue > 0.0f && !canScrollVertically(-1)) || ((axisValue < 0.0f && !canScrollVertically(1)) || ((axisValue2 > 0.0f && !canScrollHorizontally(-1)) || (axisValue2 < 0.0f && !canScrollHorizontally(1)))))) {
                return false;
            }
        }
        return super.onGenericMotionEvent(motionEvent);
    }

    @Override // android.view.ViewTreeObserver.OnGlobalLayoutListener
    public void onGlobalLayout() {
        boolean zzyh = zzyh();
        com.google.android.gms.ads.internal.overlay.zzd zzxa = zzxa();
        if (zzxa == null || !zzyh) {
            return;
        }
        zzxa.zzpr();
    }

    @Override // android.webkit.WebView, android.widget.AbsoluteLayout, android.view.View
    @SuppressLint({"DrawAllocation"})
    protected void onMeasure(int i, int i2) {
        int size;
        int i3 = Integer.MAX_VALUE;
        synchronized (this.zzako) {
            if (isDestroyed()) {
                setMeasuredDimension(0, 0);
            } else if (isInEditMode() || this.d || this.zzapp.zzazt) {
                super.onMeasure(i, i2);
            } else if (this.zzapp.zzazu) {
                if (zzdr.zzbjk.get().booleanValue() || !com.google.android.gms.common.util.zzs.zzays()) {
                    super.onMeasure(i, i2);
                    return;
                }
                zza("/contentHeight", zzyl());
                zzdn("(function() {  var height = -1;  if (document.body) { height = document.body.offsetHeight;}  else if (document.documentElement) {      height = document.documentElement.offsetHeight;  }  var url = 'gmsg://mobileads.google.com/contentHeight?';  url += 'height=' + height;  window.googleAdsJsInterface.notify(url);  })();");
                float f = this.zzczx.getResources().getDisplayMetrics().density;
                int size2 = View.MeasureSpec.getSize(i);
                switch (this.n) {
                    case -1:
                        size = View.MeasureSpec.getSize(i2);
                        break;
                    default:
                        size = (int) (f * this.n);
                        break;
                }
                setMeasuredDimension(size2, size);
            } else if (this.zzapp.zzazr) {
                DisplayMetrics displayMetrics = new DisplayMetrics();
                this.zzati.getDefaultDisplay().getMetrics(displayMetrics);
                setMeasuredDimension(displayMetrics.widthPixels, displayMetrics.heightPixels);
            } else {
                int mode = View.MeasureSpec.getMode(i);
                int size3 = View.MeasureSpec.getSize(i);
                int mode2 = View.MeasureSpec.getMode(i2);
                int size4 = View.MeasureSpec.getSize(i2);
                int i4 = (mode == Integer.MIN_VALUE || mode == 1073741824) ? size3 : Integer.MAX_VALUE;
                if (mode2 == Integer.MIN_VALUE || mode2 == 1073741824) {
                    i3 = size4;
                }
                if (this.zzapp.widthPixels > i4 || this.zzapp.heightPixels > i3) {
                    float f2 = this.zzczx.getResources().getDisplayMetrics().density;
                    zzkx.zzdi(new StringBuilder(103).append("Not enough space to show ad. Needs ").append((int) (this.zzapp.widthPixels / f2)).append("x").append((int) (this.zzapp.heightPixels / f2)).append(" dp, but only has ").append((int) (size3 / f2)).append("x").append((int) (size4 / f2)).append(" dp.").toString());
                    if (getVisibility() != 8) {
                        setVisibility(4);
                    }
                    setMeasuredDimension(0, 0);
                } else {
                    if (getVisibility() != 8) {
                        setVisibility(0);
                    }
                    setMeasuredDimension(this.zzapp.widthPixels, this.zzapp.heightPixels);
                }
            }
        }
    }

    @Override // android.webkit.WebView, com.google.android.gms.internal.zzmd
    public void onPause() {
        if (isDestroyed()) {
            return;
        }
        try {
            if (!com.google.android.gms.common.util.zzs.zzayn()) {
                return;
            }
            super.onPause();
        } catch (Exception e) {
            zzkx.zzb("Could not pause webview.", e);
        }
    }

    @Override // android.webkit.WebView, com.google.android.gms.internal.zzmd
    public void onResume() {
        if (isDestroyed()) {
            return;
        }
        try {
            if (!com.google.android.gms.common.util.zzs.zzayn()) {
                return;
            }
            super.onResume();
        } catch (Exception e) {
            zzkx.zzb("Could not resume webview.", e);
        }
    }

    @Override // android.webkit.WebView, android.view.View
    public boolean onTouchEvent(MotionEvent motionEvent) {
        if (zzxc().zzxv()) {
            synchronized (this.zzako) {
                if (this.l != null) {
                    this.l.zzc(motionEvent);
                }
            }
        } else if (this.zzbnx != null) {
            this.zzbnx.zza(motionEvent);
        }
        if (isDestroyed()) {
            return false;
        }
        return super.onTouchEvent(motionEvent);
    }

    @Override // com.google.android.gms.internal.zzmd
    public void setContext(Context context) {
        this.zzczx.setBaseContext(context);
        this.zzass.zzl(this.zzczx.zzwy());
    }

    @Override // android.view.View, com.google.android.gms.internal.zzmd
    public void setOnClickListener(View.OnClickListener onClickListener) {
        this.r = new WeakReference<>(onClickListener);
        super.setOnClickListener(onClickListener);
    }

    @Override // com.google.android.gms.internal.zzmd
    public void setRequestedOrientation(int i) {
        synchronized (this.zzako) {
            this.f = i;
            if (this.a != null) {
                this.a.setRequestedOrientation(this.f);
            }
        }
    }

    @Override // android.webkit.WebView, com.google.android.gms.internal.zzmd
    public void setWebViewClient(WebViewClient webViewClient) {
        super.setWebViewClient(webViewClient);
        if (webViewClient instanceof zzme) {
            this.zzczz = (zzme) webViewClient;
        }
    }

    @Override // android.webkit.WebView, com.google.android.gms.internal.zzmd
    public void stopLoading() {
        if (isDestroyed()) {
            return;
        }
        try {
            super.stopLoading();
        } catch (Exception e) {
            zzkx.zzb("Could not stop loading webview.", e);
        }
    }

    @Override // com.google.android.gms.internal.zzmd
    public void zza(Context context, AdSizeParcel adSizeParcel, zzdz zzdzVar) {
        synchronized (this.zzako) {
            this.zzass.zzwm();
            setContext(context);
            this.a = null;
            this.zzapp = adSizeParcel;
            this.d = false;
            this.b = false;
            this.zzcec = "";
            this.f = -1;
            com.google.android.gms.ads.internal.zzu.zzgo().zzm(this);
            loadUrl("about:blank");
            this.zzczz.reset();
            setOnTouchListener(null);
            setOnClickListener(null);
            this.g = true;
            this.h = false;
            this.i = null;
            zzd(zzdzVar);
            this.j = false;
            this.m = 0;
            com.google.android.gms.ads.internal.zzu.zzhj().zze(this);
            zzyp();
        }
    }

    @Override // com.google.android.gms.internal.zzmd
    public void zza(AdSizeParcel adSizeParcel) {
        synchronized (this.zzako) {
            this.zzapp = adSizeParcel;
            requestLayout();
        }
    }

    @Override // com.google.android.gms.internal.zzcu.zzb
    public void zza(zzcu.zza zzaVar) {
        synchronized (this.zzako) {
            this.j = zzaVar.zzave;
        }
        zzap(zzaVar.zzave);
    }

    @Override // com.google.android.gms.internal.zzmd
    public void zza(zzmi zzmiVar) {
        synchronized (this.zzako) {
            if (this.i != null) {
                zzkx.e("Attempt to create multiple AdWebViewVideoControllers.");
            } else {
                this.i = zzmiVar;
            }
        }
    }

    @TargetApi(19)
    protected void zza(String str, ValueCallback<String> valueCallback) {
        synchronized (this.zzako) {
            if (!isDestroyed()) {
                evaluateJavascript(str, valueCallback);
            } else {
                zzkx.zzdi("The webview is destroyed. Ignoring action.");
                if (valueCallback != null) {
                    valueCallback.onReceiveValue(null);
                }
            }
        }
    }

    @Override // com.google.android.gms.internal.zzgi
    public void zza(String str, zzfe zzfeVar) {
        if (this.zzczz != null) {
            this.zzczz.zza(str, zzfeVar);
        }
    }

    @Override // com.google.android.gms.internal.zzmd
    public void zza(String str, Map<String, ?> map) {
        try {
            zzb(str, com.google.android.gms.ads.internal.zzu.zzgm().zzap(map));
        } catch (JSONException e) {
            zzkx.zzdi("Could not convert parameters to JSON.");
        }
    }

    @Override // com.google.android.gms.internal.zzmd, com.google.android.gms.internal.zzgi
    public void zza(String str, JSONObject jSONObject) {
        if (jSONObject == null) {
            jSONObject = new JSONObject();
        }
        zzi(str, jSONObject.toString());
    }

    @Override // com.google.android.gms.internal.zzmd
    public void zzak(int i) {
        if (i == 0) {
            zzyk();
        }
        zzyj();
        if (this.q.zzly() != null) {
            this.q.zzly().zzg("close_type", String.valueOf(i));
        }
        HashMap hashMap = new HashMap(2);
        hashMap.put("closetype", String.valueOf(i));
        hashMap.put(ServerProtocol.FALLBACK_DIALOG_PARAM_VERSION, this.zzanu.zzda);
        zza("onhide", hashMap);
    }

    @Override // com.google.android.gms.internal.zzmd
    public void zzak(boolean z) {
        synchronized (this.zzako) {
            this.d = z;
            zzym();
        }
    }

    @Override // com.google.android.gms.internal.zzmd
    public void zzal(boolean z) {
        synchronized (this.zzako) {
            if (this.a != null) {
                this.a.zza(this.zzczz.zzic(), z);
            } else {
                this.b = z;
            }
        }
    }

    @Override // com.google.android.gms.internal.zzmd
    public void zzam(boolean z) {
        synchronized (this.zzako) {
            this.g = z;
        }
    }

    @Override // com.google.android.gms.internal.zzmd
    public void zzan(boolean z) {
        synchronized (this.zzako) {
            this.m = (z ? 1 : -1) + this.m;
            if (this.m <= 0 && this.a != null) {
                this.a.zzpu();
            }
        }
    }

    @Override // com.google.android.gms.internal.zzmd
    public void zzb(com.google.android.gms.ads.internal.formats.zzg zzgVar) {
        synchronized (this.zzako) {
            this.l = zzgVar;
        }
    }

    @Override // com.google.android.gms.internal.zzmd
    public void zzb(com.google.android.gms.ads.internal.overlay.zzd zzdVar) {
        synchronized (this.zzako) {
            this.a = zzdVar;
        }
    }

    void zzb(Boolean bool) {
        synchronized (this.zzako) {
            this.zzcub = bool;
        }
        com.google.android.gms.ads.internal.zzu.zzgq().zzb(bool);
    }

    @Override // com.google.android.gms.internal.zzgi
    public void zzb(String str, zzfe zzfeVar) {
        if (this.zzczz != null) {
            this.zzczz.zzb(str, zzfeVar);
        }
    }

    @Override // com.google.android.gms.internal.zzgi
    public void zzb(String str, JSONObject jSONObject) {
        if (jSONObject == null) {
            jSONObject = new JSONObject();
        }
        String jSONObject2 = jSONObject.toString();
        StringBuilder sb = new StringBuilder();
        sb.append("(window.AFMA_ReceiveMessage || function() {})('");
        sb.append(str);
        sb.append("'");
        sb.append(",");
        sb.append(jSONObject2);
        sb.append(");");
        String valueOf = String.valueOf(sb.toString());
        zzkx.zzdg(valueOf.length() != 0 ? "Dispatching AFMA event: ".concat(valueOf) : new String("Dispatching AFMA event: "));
        zzdn(sb.toString());
    }

    @Override // com.google.android.gms.internal.zzmd
    public void zzc(com.google.android.gms.ads.internal.overlay.zzd zzdVar) {
        synchronized (this.zzako) {
            this.s = zzdVar;
        }
    }

    @Override // com.google.android.gms.internal.zzmd
    public void zzdj(String str) {
        synchronized (this.zzako) {
            super.loadUrl(str);
        }
    }

    @Override // com.google.android.gms.internal.zzmd
    public void zzdk(String str) {
        synchronized (this.zzako) {
            if (str == null) {
                str = "";
            }
            this.zzcec = str;
        }
    }

    protected void zzdm(String str) {
        synchronized (this.zzako) {
            if (!isDestroyed()) {
                loadUrl(str);
            } else {
                zzkx.zzdi("The webview is destroyed. Ignoring action.");
            }
        }
    }

    protected void zzdn(String str) {
        if (!com.google.android.gms.common.util.zzs.zzayu()) {
            String valueOf = String.valueOf(str);
            zzdm(valueOf.length() != 0 ? "javascript:".concat(valueOf) : new String("javascript:"));
            return;
        }
        if (zzva() == null) {
            zzyi();
        }
        if (zzva().booleanValue()) {
            zza(str, (ValueCallback<String>) null);
            return;
        }
        String valueOf2 = String.valueOf(str);
        zzdm(valueOf2.length() != 0 ? "javascript:".concat(valueOf2) : new String("javascript:"));
    }

    @Override // com.google.android.gms.internal.zzmd
    public com.google.android.gms.ads.internal.zzd zzec() {
        return this.zzamb;
    }

    @Override // com.google.android.gms.internal.zzmd
    public AdSizeParcel zzeg() {
        AdSizeParcel adSizeParcel;
        synchronized (this.zzako) {
            adSizeParcel = this.zzapp;
        }
        return adSizeParcel;
    }

    @Override // com.google.android.gms.ads.internal.zzs
    public void zzey() {
        synchronized (this.zzako) {
            this.h = true;
            if (this.zzczy != null) {
                this.zzczy.zzey();
            }
        }
    }

    @Override // com.google.android.gms.ads.internal.zzs
    public void zzez() {
        synchronized (this.zzako) {
            this.h = false;
            if (this.zzczy != null) {
                this.zzczy.zzez();
            }
        }
    }

    @Override // com.google.android.gms.internal.zzmd, com.google.android.gms.internal.zzgi
    public void zzi(String str, String str2) {
        zzdn(new StringBuilder(String.valueOf(str).length() + 3 + String.valueOf(str2).length()).append(str).append("(").append(str2).append(");").toString());
    }

    @Override // com.google.android.gms.internal.zzmd
    public void zzps() {
        if (this.o == null) {
            zzdv.zza(this.q.zzly(), this.zzced, "aes2");
            this.o = zzdv.zzb(this.q.zzly());
            this.q.zza("native:view_show", this.o);
        }
        HashMap hashMap = new HashMap(1);
        hashMap.put(ServerProtocol.FALLBACK_DIALOG_PARAM_VERSION, this.zzanu.zzda);
        zza("onshow", hashMap);
    }

    Boolean zzva() {
        Boolean bool;
        synchronized (this.zzako) {
            bool = this.zzcub;
        }
        return bool;
    }

    @Override // com.google.android.gms.internal.zzmd
    public void zzww() {
        zzyj();
        HashMap hashMap = new HashMap(1);
        hashMap.put(ServerProtocol.FALLBACK_DIALOG_PARAM_VERSION, this.zzanu.zzda);
        zza("onhide", hashMap);
    }

    @Override // com.google.android.gms.internal.zzmd
    public void zzwx() {
        HashMap hashMap = new HashMap(3);
        hashMap.put("app_muted", String.valueOf(com.google.android.gms.ads.internal.zzu.zzgm().zzft()));
        hashMap.put("app_volume", String.valueOf(com.google.android.gms.ads.internal.zzu.zzgm().zzfr()));
        hashMap.put("device_volume", String.valueOf(com.google.android.gms.ads.internal.zzu.zzgm().zzah(getContext())));
        zza("volume", hashMap);
    }

    @Override // com.google.android.gms.internal.zzmd
    public Activity zzwy() {
        return this.zzczx.zzwy();
    }

    @Override // com.google.android.gms.internal.zzmd
    public Context zzwz() {
        return this.zzczx.zzwz();
    }

    @Override // com.google.android.gms.internal.zzmd
    public com.google.android.gms.ads.internal.overlay.zzd zzxa() {
        com.google.android.gms.ads.internal.overlay.zzd zzdVar;
        synchronized (this.zzako) {
            zzdVar = this.a;
        }
        return zzdVar;
    }

    @Override // com.google.android.gms.internal.zzmd
    public com.google.android.gms.ads.internal.overlay.zzd zzxb() {
        com.google.android.gms.ads.internal.overlay.zzd zzdVar;
        synchronized (this.zzako) {
            zzdVar = this.s;
        }
        return zzdVar;
    }

    @Override // com.google.android.gms.internal.zzmd
    public zzme zzxc() {
        return this.zzczz;
    }

    @Override // com.google.android.gms.internal.zzmd
    public boolean zzxd() {
        boolean z;
        synchronized (this.zzako) {
            z = this.b;
        }
        return z;
    }

    @Override // com.google.android.gms.internal.zzmd
    public zzav zzxe() {
        return this.zzbnx;
    }

    @Override // com.google.android.gms.internal.zzmd
    public VersionInfoParcel zzxf() {
        return this.zzanu;
    }

    @Override // com.google.android.gms.internal.zzmd
    public boolean zzxg() {
        boolean z;
        synchronized (this.zzako) {
            z = this.d;
        }
        return z;
    }

    @Override // com.google.android.gms.internal.zzmd
    public void zzxh() {
        synchronized (this.zzako) {
            zzkx.v("Destroying WebView!");
            zzlb.zzcvl.post(new Runnable() { // from class: com.google.android.gms.internal.zzmh.2
                @Override // java.lang.Runnable
                public void run() {
                    zzmh.super.destroy();
                }
            });
        }
    }

    @Override // com.google.android.gms.internal.zzmd
    public boolean zzxi() {
        boolean z;
        synchronized (this.zzako) {
            z = this.g;
        }
        return z;
    }

    @Override // com.google.android.gms.internal.zzmd
    public boolean zzxj() {
        boolean z;
        synchronized (this.zzako) {
            z = this.h;
        }
        return z;
    }

    @Override // com.google.android.gms.internal.zzmd
    public zzmc zzxk() {
        return null;
    }

    @Override // com.google.android.gms.internal.zzmd
    public zzdx zzxl() {
        return this.zzced;
    }

    @Override // com.google.android.gms.internal.zzmd
    public zzdy zzxm() {
        return this.q;
    }

    @Override // com.google.android.gms.internal.zzmd
    public zzmi zzxn() {
        zzmi zzmiVar;
        synchronized (this.zzako) {
            zzmiVar = this.i;
        }
        return zzmiVar;
    }

    @Override // com.google.android.gms.internal.zzmd
    public boolean zzxo() {
        boolean z;
        synchronized (this.zzako) {
            z = this.m > 0;
        }
        return z;
    }

    @Override // com.google.android.gms.internal.zzmd
    public void zzxp() {
        this.zzass.zzwl();
    }

    @Override // com.google.android.gms.internal.zzmd
    public void zzxq() {
        if (this.p == null) {
            this.p = zzdv.zzb(this.q.zzly());
            this.q.zza("native:view_load", this.p);
        }
    }

    @Override // com.google.android.gms.internal.zzmd
    public View.OnClickListener zzxr() {
        return this.r.get();
    }

    @Override // com.google.android.gms.internal.zzmd
    public com.google.android.gms.ads.internal.formats.zzg zzxs() {
        com.google.android.gms.ads.internal.formats.zzg zzgVar;
        synchronized (this.zzako) {
            zzgVar = this.l;
        }
        return zzgVar;
    }

    @Override // com.google.android.gms.internal.zzmd
    public void zzxt() {
        setBackgroundColor(0);
    }

    public boolean zzyh() {
        int i;
        int i2;
        if (zzxc().zzic() || zzxc().zzxv()) {
            DisplayMetrics zza2 = com.google.android.gms.ads.internal.zzu.zzgm().zza(this.zzati);
            int zzb = com.google.android.gms.ads.internal.client.zzm.zzkr().zzb(zza2, zza2.widthPixels);
            int zzb2 = com.google.android.gms.ads.internal.client.zzm.zzkr().zzb(zza2, zza2.heightPixels);
            Activity zzwy = zzwy();
            if (zzwy == null || zzwy.getWindow() == null) {
                i = zzb2;
                i2 = zzb;
            } else {
                int[] zzh = com.google.android.gms.ads.internal.zzu.zzgm().zzh(zzwy);
                i2 = com.google.android.gms.ads.internal.client.zzm.zzkr().zzb(zza2, zzh[0]);
                i = com.google.android.gms.ads.internal.client.zzm.zzkr().zzb(zza2, zzh[1]);
            }
            if (this.zzbzd == zzb && this.zzbze == zzb2 && this.zzbzg == i2 && this.zzbzh == i) {
                return false;
            }
            boolean z = (this.zzbzd == zzb && this.zzbze == zzb2) ? false : true;
            this.zzbzd = zzb;
            this.zzbze = zzb2;
            this.zzbzg = i2;
            this.zzbzh = i;
            new zzhv(this).zza(zzb, zzb2, i2, i, zza2.density, this.zzati.getDefaultDisplay().getRotation());
            return z;
        }
        return false;
    }

    zzfe zzyl() {
        return new zzfe() { // from class: com.google.android.gms.internal.zzmh.1
            @Override // com.google.android.gms.internal.zzfe
            public void zza(zzmd zzmdVar, Map<String, String> map) {
                if (map != null) {
                    String str = map.get("height");
                    if (TextUtils.isEmpty(str)) {
                        return;
                    }
                    try {
                        int parseInt = Integer.parseInt(str);
                        synchronized (zzmh.this.zzako) {
                            if (zzmh.this.n != parseInt) {
                                zzmh.this.n = parseInt;
                                zzmh.this.requestLayout();
                            }
                        }
                    } catch (Exception e) {
                        zzkx.zzc("Exception occurred while getting webview content height", e);
                    }
                }
            }
        };
    }
}
