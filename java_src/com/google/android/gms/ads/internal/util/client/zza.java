package com.google.android.gms.ads.internal.util.client;

import android.annotation.TargetApi;
import android.content.ContentResolver;
import android.content.Context;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.provider.Settings;
import android.support.annotation.Nullable;
import android.support.v4.internal.view.SupportMenu;
import android.support.v4.view.ViewCompat;
import android.util.DisplayMetrics;
import android.util.TypedValue;
import android.view.Display;
import android.view.ViewGroup;
import android.view.WindowManager;
import android.widget.FrameLayout;
import android.widget.TextView;
import com.facebook.common.util.UriUtil;
import com.google.android.gms.ads.AdLoader;
import com.google.android.gms.ads.AdView;
import com.google.android.gms.ads.InterstitialAd;
import com.google.android.gms.ads.doubleclick.PublisherAdView;
import com.google.android.gms.ads.doubleclick.PublisherInterstitialAd;
import com.google.android.gms.ads.internal.client.AdSizeParcel;
import com.google.android.gms.ads.search.SearchAdView;
import com.google.android.gms.common.util.zzs;
import com.google.android.gms.internal.zzji;
import io.fabric.sdk.android.services.common.AbstractSpiCall;
import io.fabric.sdk.android.services.common.CommonUtils;
import java.math.BigInteger;
import java.net.HttpURLConnection;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Locale;
import java.util.StringTokenizer;
@zzji
/* loaded from: classes.dex */
public class zza {
    public static final Handler zzcxr = new Handler(Looper.getMainLooper());
    private static final String zzcxs = AdView.class.getName();
    private static final String zzcxt = InterstitialAd.class.getName();
    private static final String zzcxu = PublisherAdView.class.getName();
    private static final String zzcxv = PublisherInterstitialAd.class.getName();
    private static final String zzcxw = SearchAdView.class.getName();
    private static final String zzcxx = AdLoader.class.getName();

    /* renamed from: com.google.android.gms.ads.internal.util.client.zza$zza  reason: collision with other inner class name */
    /* loaded from: classes.dex */
    public interface InterfaceC0034zza {
        void zzv(String str);
    }

    private void zza(ViewGroup viewGroup, AdSizeParcel adSizeParcel, String str, int i, int i2) {
        if (viewGroup.getChildCount() != 0) {
            return;
        }
        Context context = viewGroup.getContext();
        TextView textView = new TextView(context);
        textView.setGravity(17);
        textView.setText(str);
        textView.setTextColor(i);
        textView.setBackgroundColor(i2);
        FrameLayout frameLayout = new FrameLayout(context);
        frameLayout.setBackgroundColor(i);
        int zzb = zzb(context, 3);
        frameLayout.addView(textView, new FrameLayout.LayoutParams(adSizeParcel.widthPixels - zzb, adSizeParcel.heightPixels - zzb, 17));
        viewGroup.addView(frameLayout, adSizeParcel.widthPixels, adSizeParcel.heightPixels);
    }

    public int zza(DisplayMetrics displayMetrics, int i) {
        return (int) TypedValue.applyDimension(1, i, displayMetrics);
    }

    @Nullable
    public String zza(StackTraceElement[] stackTraceElementArr, String str) {
        String str2;
        for (int i = 0; i + 1 < stackTraceElementArr.length; i++) {
            StackTraceElement stackTraceElement = stackTraceElementArr[i];
            String className = stackTraceElement.getClassName();
            if ("loadAd".equalsIgnoreCase(stackTraceElement.getMethodName()) && (zzcxs.equalsIgnoreCase(className) || zzcxt.equalsIgnoreCase(className) || zzcxu.equalsIgnoreCase(className) || zzcxv.equalsIgnoreCase(className) || zzcxw.equalsIgnoreCase(className) || zzcxx.equalsIgnoreCase(className))) {
                str2 = stackTraceElementArr[i + 1].getClassName();
                break;
            }
        }
        str2 = null;
        if (str != null) {
            String zzb = zzb(str, ".", 3);
            if (str2 != null && !str2.contains(zzb)) {
                return str2;
            }
        }
        return null;
    }

    public void zza(Context context, @Nullable String str, String str2, Bundle bundle, boolean z) {
        zza(context, str, str2, bundle, z, new InterfaceC0034zza() { // from class: com.google.android.gms.ads.internal.util.client.zza.1
            /* JADX WARN: Type inference failed for: r0v0, types: [com.google.android.gms.ads.internal.util.client.zza$1$1] */
            @Override // com.google.android.gms.ads.internal.util.client.zza.InterfaceC0034zza
            public void zzv(final String str3) {
                new Thread() { // from class: com.google.android.gms.ads.internal.util.client.zza.1.1
                    @Override // java.lang.Thread, java.lang.Runnable
                    public void run() {
                        new zzc().zzv(str3);
                    }
                }.start();
            }
        });
    }

    public void zza(Context context, @Nullable String str, String str2, Bundle bundle, boolean z, InterfaceC0034zza interfaceC0034zza) {
        if (z) {
            Context applicationContext = context.getApplicationContext();
            if (applicationContext == null) {
                applicationContext = context;
            }
            bundle.putString("os", Build.VERSION.RELEASE);
            bundle.putString("api", String.valueOf(Build.VERSION.SDK_INT));
            bundle.putString("appid", applicationContext.getPackageName());
            if (str == null) {
                str = new StringBuilder(23).append(com.google.android.gms.common.zzc.zzaql().zzbk(context)).append(".").append(9877000).toString();
            }
            bundle.putString("js", str);
        }
        Uri.Builder appendQueryParameter = new Uri.Builder().scheme(UriUtil.HTTPS_SCHEME).path("//pagead2.googlesyndication.com/pagead/gen_204").appendQueryParameter("id", str2);
        for (String str3 : bundle.keySet()) {
            appendQueryParameter.appendQueryParameter(str3, bundle.getString(str3));
        }
        interfaceC0034zza.zzv(appendQueryParameter.toString());
    }

    public void zza(ViewGroup viewGroup, AdSizeParcel adSizeParcel, String str) {
        zza(viewGroup, adSizeParcel, str, ViewCompat.MEASURED_STATE_MASK, -1);
    }

    public void zza(ViewGroup viewGroup, AdSizeParcel adSizeParcel, String str, String str2) {
        zzb.zzdi(str2);
        zza(viewGroup, adSizeParcel, str, SupportMenu.CATEGORY_MASK, ViewCompat.MEASURED_STATE_MASK);
    }

    public void zza(boolean z, HttpURLConnection httpURLConnection, @Nullable String str) {
        httpURLConnection.setConnectTimeout(60000);
        httpURLConnection.setInstanceFollowRedirects(z);
        httpURLConnection.setReadTimeout(60000);
        if (str != null) {
            httpURLConnection.setRequestProperty("User-Agent", str);
        }
        httpURLConnection.setUseCaches(false);
    }

    public String zzao(Context context) {
        ContentResolver contentResolver = context.getContentResolver();
        String string = contentResolver == null ? null : Settings.Secure.getString(contentResolver, "android_id");
        if (string == null || zzwp()) {
            string = "emulator";
        }
        return zzdf(string);
    }

    public boolean zzap(Context context) {
        return com.google.android.gms.common.zzc.zzaql().isGooglePlayServicesAvailable(context) == 0;
    }

    public boolean zzaq(Context context) {
        if (context.getResources().getConfiguration().orientation != 2) {
            return false;
        }
        DisplayMetrics displayMetrics = context.getResources().getDisplayMetrics();
        return ((int) (((float) displayMetrics.heightPixels) / displayMetrics.density)) < 600;
    }

    @TargetApi(17)
    public boolean zzar(Context context) {
        int intValue;
        int intValue2;
        DisplayMetrics displayMetrics = context.getResources().getDisplayMetrics();
        Display defaultDisplay = ((WindowManager) context.getSystemService("window")).getDefaultDisplay();
        if (zzs.zzays()) {
            defaultDisplay.getRealMetrics(displayMetrics);
            intValue = displayMetrics.heightPixels;
            intValue2 = displayMetrics.widthPixels;
        } else {
            try {
                intValue = ((Integer) Display.class.getMethod("getRawHeight", new Class[0]).invoke(defaultDisplay, new Object[0])).intValue();
                intValue2 = ((Integer) Display.class.getMethod("getRawWidth", new Class[0]).invoke(defaultDisplay, new Object[0])).intValue();
            } catch (Exception e) {
                return false;
            }
        }
        defaultDisplay.getMetrics(displayMetrics);
        return displayMetrics.heightPixels == intValue && displayMetrics.widthPixels == intValue2;
    }

    public int zzas(Context context) {
        int identifier = context.getResources().getIdentifier("navigation_bar_width", "dimen", AbstractSpiCall.ANDROID_CLIENT_TYPE);
        if (identifier > 0) {
            return context.getResources().getDimensionPixelSize(identifier);
        }
        return 0;
    }

    public int zzb(Context context, int i) {
        return zza(context.getResources().getDisplayMetrics(), i);
    }

    public int zzb(DisplayMetrics displayMetrics, int i) {
        return Math.round(i / displayMetrics.density);
    }

    String zzb(String str, String str2, int i) {
        StringTokenizer stringTokenizer = new StringTokenizer(str, str2);
        StringBuilder sb = new StringBuilder();
        int i2 = i - 1;
        if (i <= 0 || !stringTokenizer.hasMoreElements()) {
            return str;
        }
        sb.append(stringTokenizer.nextToken());
        while (true) {
            int i3 = i2 - 1;
            if (i2 <= 0 || !stringTokenizer.hasMoreElements()) {
                break;
            }
            sb.append(".").append(stringTokenizer.nextToken());
            i2 = i3;
        }
        return sb.toString();
    }

    public int zzc(Context context, int i) {
        Display defaultDisplay = ((WindowManager) context.getSystemService("window")).getDefaultDisplay();
        DisplayMetrics displayMetrics = new DisplayMetrics();
        defaultDisplay.getMetrics(displayMetrics);
        return zzb(displayMetrics, i);
    }

    public String zzdf(String str) {
        for (int i = 0; i < 2; i++) {
            try {
                MessageDigest messageDigest = MessageDigest.getInstance(CommonUtils.MD5_INSTANCE);
                messageDigest.update(str.getBytes());
                return String.format(Locale.US, "%032X", new BigInteger(1, messageDigest.digest()));
            } catch (NoSuchAlgorithmException e) {
            }
        }
        return null;
    }

    public boolean zzwp() {
        return Build.DEVICE.startsWith("generic");
    }

    public boolean zzwq() {
        return Looper.myLooper() == Looper.getMainLooper();
    }
}
