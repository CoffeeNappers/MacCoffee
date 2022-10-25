package com.google.android.gms.internal;

import android.annotation.TargetApi;
import android.app.Activity;
import android.app.DownloadManager;
import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.net.Uri;
import android.net.http.SslError;
import android.renderscript.Allocation;
import android.renderscript.Element;
import android.renderscript.RenderScript;
import android.renderscript.ScriptIntrinsicBlur;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.view.Window;
import android.webkit.CookieManager;
import android.webkit.CookieSyncManager;
import android.webkit.WebChromeClient;
import android.webkit.WebSettings;
import java.util.Collections;
import java.util.LinkedHashSet;
import java.util.Set;
import java.util.concurrent.Callable;
@zzji
@TargetApi(8)
/* loaded from: classes.dex */
public class zzlc {

    @TargetApi(9)
    /* loaded from: classes2.dex */
    public static class zza extends zzlc {
        public zza() {
            super();
        }

        @Override // com.google.android.gms.internal.zzlc
        public boolean zza(DownloadManager.Request request) {
            request.setShowRunningNotification(true);
            return true;
        }

        @Override // com.google.android.gms.internal.zzlc
        public int zzvw() {
            return 6;
        }

        @Override // com.google.android.gms.internal.zzlc
        public int zzvx() {
            return 7;
        }
    }

    @TargetApi(11)
    /* loaded from: classes2.dex */
    public static class zzb extends zza {
        @Override // com.google.android.gms.internal.zzlc.zza, com.google.android.gms.internal.zzlc
        public boolean zza(DownloadManager.Request request) {
            request.allowScanningByMediaScanner();
            request.setNotificationVisibility(1);
            return true;
        }

        @Override // com.google.android.gms.internal.zzlc
        public boolean zza(final Context context, final WebSettings webSettings) {
            super.zza(context, webSettings);
            return ((Boolean) zzlo.zzb(new Callable<Boolean>() { // from class: com.google.android.gms.internal.zzlc.zzb.1
                @Override // java.util.concurrent.Callable
                /* renamed from: zzwa */
                public Boolean call() {
                    if (context.getCacheDir() != null) {
                        webSettings.setAppCachePath(context.getCacheDir().getAbsolutePath());
                        webSettings.setAppCacheMaxSize(0L);
                        webSettings.setAppCacheEnabled(true);
                    }
                    webSettings.setDatabasePath(context.getDatabasePath("com.google.android.gms.ads.db").getAbsolutePath());
                    webSettings.setDatabaseEnabled(true);
                    webSettings.setDomStorageEnabled(true);
                    webSettings.setDisplayZoomControls(false);
                    webSettings.setBuiltInZoomControls(true);
                    webSettings.setSupportZoom(true);
                    webSettings.setAllowContentAccess(false);
                    return true;
                }
            })).booleanValue();
        }

        @Override // com.google.android.gms.internal.zzlc
        public boolean zza(Window window) {
            window.setFlags(16777216, 16777216);
            return true;
        }

        @Override // com.google.android.gms.internal.zzlc
        public zzme zzb(zzmd zzmdVar, boolean z) {
            return new zzml(zzmdVar, z);
        }

        @Override // com.google.android.gms.internal.zzlc
        public Set<String> zzh(Uri uri) {
            return uri.getQueryParameterNames();
        }

        @Override // com.google.android.gms.internal.zzlc
        public WebChromeClient zzn(zzmd zzmdVar) {
            return new zzmk(zzmdVar);
        }

        @Override // com.google.android.gms.internal.zzlc
        public boolean zzu(View view) {
            view.setLayerType(0, null);
            return true;
        }

        @Override // com.google.android.gms.internal.zzlc
        public boolean zzv(View view) {
            view.setLayerType(1, null);
            return true;
        }
    }

    @TargetApi(14)
    /* loaded from: classes2.dex */
    public static class zzc extends zzb {
        @Override // com.google.android.gms.internal.zzlc
        public String zza(SslError sslError) {
            return sslError.getUrl();
        }

        @Override // com.google.android.gms.internal.zzlc.zzb, com.google.android.gms.internal.zzlc
        public WebChromeClient zzn(zzmd zzmdVar) {
            return new zzmm(zzmdVar);
        }
    }

    @TargetApi(17)
    /* loaded from: classes2.dex */
    public static class zzd extends zzf {
        @Override // com.google.android.gms.internal.zzlc
        public String getDefaultUserAgent(Context context) {
            return WebSettings.getDefaultUserAgent(context);
        }

        @Override // com.google.android.gms.internal.zzlc
        public Drawable zza(Context context, Bitmap bitmap, boolean z, float f) {
            if (!z || f <= 0.0f || f > 25.0f) {
                return new BitmapDrawable(context.getResources(), bitmap);
            }
            try {
                Bitmap createScaledBitmap = Bitmap.createScaledBitmap(bitmap, bitmap.getWidth(), bitmap.getHeight(), false);
                Bitmap createBitmap = Bitmap.createBitmap(createScaledBitmap);
                RenderScript create = RenderScript.create(context);
                ScriptIntrinsicBlur create2 = ScriptIntrinsicBlur.create(create, Element.U8_4(create));
                Allocation createFromBitmap = Allocation.createFromBitmap(create, createScaledBitmap);
                Allocation createFromBitmap2 = Allocation.createFromBitmap(create, createBitmap);
                create2.setRadius(f);
                create2.setInput(createFromBitmap);
                create2.forEach(createFromBitmap2);
                createFromBitmap2.copyTo(createBitmap);
                return new BitmapDrawable(context.getResources(), createBitmap);
            } catch (RuntimeException e) {
                return new BitmapDrawable(context.getResources(), bitmap);
            }
        }

        @Override // com.google.android.gms.internal.zzlc.zzf, com.google.android.gms.internal.zzlc.zzb, com.google.android.gms.internal.zzlc
        public boolean zza(Context context, WebSettings webSettings) {
            super.zza(context, webSettings);
            webSettings.setMediaPlaybackRequiresUserGesture(false);
            return true;
        }
    }

    @TargetApi(18)
    /* loaded from: classes2.dex */
    public static class zze extends zzd {
        @Override // com.google.android.gms.internal.zzlc
        public boolean isAttachedToWindow(View view) {
            return super.isAttachedToWindow(view) || view.getWindowId() != null;
        }

        @Override // com.google.android.gms.internal.zzlc
        public int zzvy() {
            return 14;
        }
    }

    @TargetApi(16)
    /* loaded from: classes2.dex */
    public static class zzf extends zzc {
        @Override // com.google.android.gms.internal.zzlc
        public void zza(View view, Drawable drawable) {
            view.setBackground(drawable);
        }

        @Override // com.google.android.gms.internal.zzlc
        public void zza(ViewTreeObserver viewTreeObserver, ViewTreeObserver.OnGlobalLayoutListener onGlobalLayoutListener) {
            viewTreeObserver.removeOnGlobalLayoutListener(onGlobalLayoutListener);
        }

        @Override // com.google.android.gms.internal.zzlc.zzb, com.google.android.gms.internal.zzlc
        public boolean zza(Context context, WebSettings webSettings) {
            super.zza(context, webSettings);
            webSettings.setAllowFileAccessFromFileURLs(false);
            webSettings.setAllowUniversalAccessFromFileURLs(false);
            return true;
        }

        @Override // com.google.android.gms.internal.zzlc
        public void zzb(Activity activity, ViewTreeObserver.OnGlobalLayoutListener onGlobalLayoutListener) {
            Window window = activity.getWindow();
            if (window == null || window.getDecorView() == null || window.getDecorView().getViewTreeObserver() == null) {
                return;
            }
            zza(window.getDecorView().getViewTreeObserver(), onGlobalLayoutListener);
        }
    }

    @TargetApi(19)
    /* loaded from: classes2.dex */
    public static class zzg extends zze {
        @Override // com.google.android.gms.internal.zzlc.zze, com.google.android.gms.internal.zzlc
        public boolean isAttachedToWindow(View view) {
            return view.isAttachedToWindow();
        }

        @Override // com.google.android.gms.internal.zzlc
        public ViewGroup.LayoutParams zzvz() {
            return new ViewGroup.LayoutParams(-1, -1);
        }
    }

    @TargetApi(21)
    /* loaded from: classes2.dex */
    public static class zzh extends zzg {
        @Override // com.google.android.gms.internal.zzlc
        public CookieManager zzal(Context context) {
            return CookieManager.getInstance();
        }

        @Override // com.google.android.gms.internal.zzlc.zzb, com.google.android.gms.internal.zzlc
        public zzme zzb(zzmd zzmdVar, boolean z) {
            return new zzmp(zzmdVar, z);
        }
    }

    private zzlc() {
    }

    public static zzlc zzbh(int i) {
        return i >= 21 ? new zzh() : i >= 19 ? new zzg() : i >= 18 ? new zze() : i >= 17 ? new zzd() : i >= 16 ? new zzf() : i >= 14 ? new zzc() : i >= 11 ? new zzb() : i >= 9 ? new zza() : new zzlc();
    }

    public String getDefaultUserAgent(Context context) {
        return "";
    }

    public boolean isAttachedToWindow(View view) {
        return (view.getWindowToken() == null && view.getWindowVisibility() == 8) ? false : true;
    }

    public Drawable zza(Context context, Bitmap bitmap, boolean z, float f) {
        return new BitmapDrawable(context.getResources(), bitmap);
    }

    public String zza(SslError sslError) {
        return "";
    }

    public void zza(View view, Drawable drawable) {
        view.setBackgroundDrawable(drawable);
    }

    public void zza(ViewTreeObserver viewTreeObserver, ViewTreeObserver.OnGlobalLayoutListener onGlobalLayoutListener) {
        viewTreeObserver.removeGlobalOnLayoutListener(onGlobalLayoutListener);
    }

    public boolean zza(DownloadManager.Request request) {
        return false;
    }

    public boolean zza(Context context, WebSettings webSettings) {
        return false;
    }

    public boolean zza(Window window) {
        return false;
    }

    public CookieManager zzal(Context context) {
        try {
            CookieSyncManager.createInstance(context);
            return CookieManager.getInstance();
        } catch (Exception e) {
            zzkx.zzb("Failed to obtain CookieManager.", e);
            com.google.android.gms.ads.internal.zzu.zzgq().zza(e, "ApiLevelUtil.getCookieManager");
            return null;
        }
    }

    public zzme zzb(zzmd zzmdVar, boolean z) {
        return new zzme(zzmdVar, z);
    }

    public void zzb(Activity activity, ViewTreeObserver.OnGlobalLayoutListener onGlobalLayoutListener) {
        Window window = activity.getWindow();
        if (window == null || window.getDecorView() == null || window.getDecorView().getViewTreeObserver() == null) {
            return;
        }
        zza(window.getDecorView().getViewTreeObserver(), onGlobalLayoutListener);
    }

    public Set<String> zzh(Uri uri) {
        String encodedQuery;
        if (!uri.isOpaque() && (encodedQuery = uri.getEncodedQuery()) != null) {
            LinkedHashSet linkedHashSet = new LinkedHashSet();
            int i = 0;
            do {
                int indexOf = encodedQuery.indexOf(38, i);
                if (indexOf == -1) {
                    indexOf = encodedQuery.length();
                }
                int indexOf2 = encodedQuery.indexOf(61, i);
                if (indexOf2 > indexOf || indexOf2 == -1) {
                    indexOf2 = indexOf;
                }
                linkedHashSet.add(Uri.decode(encodedQuery.substring(i, indexOf2)));
                i = indexOf + 1;
            } while (i < encodedQuery.length());
            return Collections.unmodifiableSet(linkedHashSet);
        }
        return Collections.emptySet();
    }

    public boolean zzl(zzmd zzmdVar) {
        if (zzmdVar == null) {
            return false;
        }
        zzmdVar.onPause();
        return true;
    }

    public boolean zzm(zzmd zzmdVar) {
        if (zzmdVar == null) {
            return false;
        }
        zzmdVar.onResume();
        return true;
    }

    public WebChromeClient zzn(zzmd zzmdVar) {
        return null;
    }

    public boolean zzu(View view) {
        return false;
    }

    public boolean zzv(View view) {
        return false;
    }

    public int zzvw() {
        return 0;
    }

    public int zzvx() {
        return 1;
    }

    public int zzvy() {
        return 5;
    }

    public ViewGroup.LayoutParams zzvz() {
        return new ViewGroup.LayoutParams(-2, -2);
    }
}
