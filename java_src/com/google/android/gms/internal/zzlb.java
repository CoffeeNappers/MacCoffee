package com.google.android.gms.internal;

import android.annotation.TargetApi;
import android.app.Activity;
import android.app.ActivityManager;
import android.app.AlertDialog;
import android.app.KeyguardManager;
import android.content.ActivityNotFoundException;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageManager;
import android.content.pm.ResolveInfo;
import android.content.res.Configuration;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Rect;
import android.media.AudioManager;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.os.Debug;
import android.os.Handler;
import android.os.Looper;
import android.os.PowerManager;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.text.TextUtils;
import android.util.DisplayMetrics;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.view.ViewTreeObserver;
import android.view.Window;
import android.view.WindowManager;
import android.webkit.WebSettings;
import android.webkit.WebView;
import android.widget.AdapterView;
import android.widget.PopupWindow;
import com.fasterxml.jackson.core.util.MinimalPrettyPrinter;
import com.google.android.exoplayer2.util.MimeTypes;
import com.google.android.gms.ads.AdActivity;
import com.google.android.gms.ads.internal.ClientApi;
import com.google.android.gms.ads.internal.client.AdSizeParcel;
import com.google.android.gms.ads.internal.util.client.VersionInfoParcel;
import com.google.android.gms.ads.internal.util.client.zza;
import com.google.android.gms.internal.zzef;
import com.vkontakte.android.FragmentWrapperActivity;
import com.vkontakte.android.data.ServerKeys;
import com.vkontakte.android.data.orm.Product;
import io.fabric.sdk.android.services.common.AbstractSpiCall;
import io.fabric.sdk.android.services.common.CommonUtils;
import io.sentry.marshaller.json.JsonMarshaller;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.math.BigInteger;
import java.net.HttpURLConnection;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.UUID;
import java.util.concurrent.Future;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
@zzji
/* loaded from: classes.dex */
public class zzlb {
    public static final Handler zzcvl = new zzky(Looper.getMainLooper());
    private String zzbre;
    private zzgh zzcnn;
    private final Object zzako = new Object();
    private boolean zzcvm = true;
    private boolean zzcvn = false;

    /* loaded from: classes2.dex */
    private final class zza extends BroadcastReceiver {
        private zza() {
        }

        @Override // android.content.BroadcastReceiver
        public void onReceive(Context context, Intent intent) {
            if ("android.intent.action.USER_PRESENT".equals(intent.getAction())) {
                zzlb.this.zzcvm = true;
            } else if (!"android.intent.action.SCREEN_OFF".equals(intent.getAction())) {
            } else {
                zzlb.this.zzcvm = false;
            }
        }
    }

    private JSONArray zza(Collection<?> collection) throws JSONException {
        JSONArray jSONArray = new JSONArray();
        Iterator<?> it = collection.iterator();
        while (it.hasNext()) {
            zza(jSONArray, it.next());
        }
        return jSONArray;
    }

    private void zza(JSONArray jSONArray, Object obj) throws JSONException {
        if (obj instanceof Bundle) {
            jSONArray.put(zzi((Bundle) obj));
        } else if (obj instanceof Map) {
            jSONArray.put(zzap((Map) obj));
        } else if (obj instanceof Collection) {
            jSONArray.put(zza((Collection) obj));
        } else if (obj instanceof Object[]) {
            jSONArray.put(zza((Object[]) obj));
        } else {
            jSONArray.put(obj);
        }
    }

    private void zza(JSONObject jSONObject, String str, Object obj) throws JSONException {
        if (obj instanceof Bundle) {
            jSONObject.put(str, zzi((Bundle) obj));
        } else if (obj instanceof Map) {
            jSONObject.put(str, zzap((Map) obj));
        } else if (obj instanceof Collection) {
            if (str == null) {
                str = "null";
            }
            jSONObject.put(str, zza((Collection) obj));
        } else if (obj instanceof Object[]) {
            jSONObject.put(str, zza(Arrays.asList((Object[]) obj)));
        } else {
            jSONObject.put(str, obj);
        }
    }

    private boolean zza(KeyguardManager keyguardManager) {
        if (keyguardManager == null) {
            return false;
        }
        return keyguardManager.inKeyguardRestrictedInputMode();
    }

    private boolean zza(PowerManager powerManager) {
        return powerManager == null || powerManager.isScreenOn();
    }

    public static void zzb(Runnable runnable) {
        if (Looper.getMainLooper().getThread() != Thread.currentThread()) {
            runnable.run();
        } else {
            zzla.zza(runnable);
        }
    }

    private boolean zzh(Context context) {
        PowerManager powerManager = (PowerManager) context.getSystemService("power");
        if (powerManager == null) {
            return false;
        }
        return powerManager.isScreenOn();
    }

    private JSONObject zzi(Bundle bundle) throws JSONException {
        JSONObject jSONObject = new JSONObject();
        for (String str : bundle.keySet()) {
            zza(jSONObject, str, bundle.get(str));
        }
        return jSONObject;
    }

    private Bitmap zzr(@NonNull View view) {
        Bitmap bitmap;
        try {
            int width = view.getWidth();
            int height = view.getHeight();
            if (width == 0 || height == 0) {
                zzkx.zzdi("Width or height of view is zero");
                bitmap = null;
            } else {
                bitmap = Bitmap.createBitmap(view.getWidth(), view.getHeight(), Bitmap.Config.RGB_565);
                Canvas canvas = new Canvas(bitmap);
                view.layout(0, 0, width, height);
                view.draw(canvas);
            }
            return bitmap;
        } catch (RuntimeException e) {
            zzkx.zzb("Fail to capture the webview", e);
            return null;
        }
    }

    private Bitmap zzs(@NonNull View view) {
        Bitmap bitmap;
        RuntimeException e;
        boolean isDrawingCacheEnabled;
        try {
            isDrawingCacheEnabled = view.isDrawingCacheEnabled();
            view.setDrawingCacheEnabled(true);
            Bitmap drawingCache = view.getDrawingCache();
            bitmap = drawingCache != null ? Bitmap.createBitmap(drawingCache) : null;
        } catch (RuntimeException e2) {
            bitmap = null;
            e = e2;
        }
        try {
            view.setDrawingCacheEnabled(isDrawingCacheEnabled);
        } catch (RuntimeException e3) {
            e = e3;
            zzkx.zzb("Fail to capture the web view", e);
            return bitmap;
        }
        return bitmap;
    }

    public void runOnUiThread(Runnable runnable) {
        if (Looper.getMainLooper().getThread() == Thread.currentThread()) {
            runnable.run();
        } else {
            zzcvl.post(runnable);
        }
    }

    public Bundle zza(zzda zzdaVar) {
        String str;
        String zzuy;
        String zzuz;
        if (zzdaVar == null) {
            return null;
        }
        if (!zzdr.zzbfa.get().booleanValue() && !zzdr.zzbfc.get().booleanValue()) {
            return null;
        }
        if (com.google.android.gms.ads.internal.zzu.zzgq().zzuq() && com.google.android.gms.ads.internal.zzu.zzgq().zzur()) {
            return null;
        }
        if (zzdaVar.zzjl()) {
            zzdaVar.wakeup();
        }
        zzcx zzjj = zzdaVar.zzjj();
        if (zzjj != null) {
            String zziy = zzjj.zziy();
            String zziz = zzjj.zziz();
            String zzja = zzjj.zzja();
            if (zziy != null) {
                com.google.android.gms.ads.internal.zzu.zzgq().zzcw(zziy);
            }
            if (zzja != null) {
                com.google.android.gms.ads.internal.zzu.zzgq().zzcx(zzja);
                zzuy = zziy;
                str = zziz;
                zzuz = zzja;
            } else {
                zzuy = zziy;
                str = zziz;
                zzuz = zzja;
            }
        } else {
            str = null;
            zzuy = com.google.android.gms.ads.internal.zzu.zzgq().zzuy();
            zzuz = com.google.android.gms.ads.internal.zzu.zzgq().zzuz();
        }
        Bundle bundle = new Bundle(1);
        if (zzuz != null && zzdr.zzbfc.get().booleanValue() && !com.google.android.gms.ads.internal.zzu.zzgq().zzur()) {
            bundle.putString("v_fp_vertical", zzuz);
        }
        if (zzuy != null && zzdr.zzbfa.get().booleanValue() && !com.google.android.gms.ads.internal.zzu.zzgq().zzuq()) {
            bundle.putString(JsonMarshaller.FINGERPRINT, zzuy);
            if (!zzuy.equals(str)) {
                bundle.putString("v_fp", str);
            }
        }
        if (bundle.isEmpty()) {
            return null;
        }
        return bundle;
    }

    public DisplayMetrics zza(WindowManager windowManager) {
        DisplayMetrics displayMetrics = new DisplayMetrics();
        windowManager.getDefaultDisplay().getMetrics(displayMetrics);
        return displayMetrics;
    }

    public PopupWindow zza(View view, int i, int i2, boolean z) {
        return new PopupWindow(view, i, i2, z);
    }

    public String zza(Context context, View view, AdSizeParcel adSizeParcel) {
        if (!zzdr.zzbfr.get().booleanValue()) {
            return null;
        }
        try {
            JSONObject jSONObject = new JSONObject();
            JSONObject jSONObject2 = new JSONObject();
            jSONObject2.put("width", adSizeParcel.width);
            jSONObject2.put("height", adSizeParcel.height);
            jSONObject.put("size", jSONObject2);
            jSONObject.put("activity", zzad(context));
            if (!adSizeParcel.zzazr) {
                JSONArray jSONArray = new JSONArray();
                while (view != null) {
                    ViewParent parent = view.getParent();
                    if (parent != null) {
                        int i = -1;
                        if (parent instanceof ViewGroup) {
                            i = ((ViewGroup) parent).indexOfChild(view);
                        }
                        JSONObject jSONObject3 = new JSONObject();
                        jSONObject3.put(ServerKeys.TYPE, parent.getClass().getName());
                        jSONObject3.put("index_of_child", i);
                        jSONArray.put(jSONObject3);
                    }
                    view = (parent == null || !(parent instanceof View)) ? null : (View) parent;
                }
                if (jSONArray.length() > 0) {
                    jSONObject.put("parents", jSONArray);
                }
            }
            return jSONObject.toString();
        } catch (JSONException e) {
            zzkx.zzc("Fail to get view hierarchy json", e);
            return null;
        }
    }

    public String zza(Context context, zzav zzavVar, String str, View view) {
        if (zzavVar == null) {
            return str;
        }
        try {
            Uri parse = Uri.parse(str);
            if (zzavVar.zzd(parse)) {
                parse = zzavVar.zza(parse, context, view);
            }
            return parse.toString();
        } catch (Exception e) {
            return str;
        }
    }

    public String zza(zzmd zzmdVar, String str) {
        return zza(zzmdVar.getContext(), zzmdVar.zzxe(), str, zzmdVar.getView());
    }

    public String zza(InputStreamReader inputStreamReader) throws IOException {
        StringBuilder sb = new StringBuilder(8192);
        char[] cArr = new char[2048];
        while (true) {
            int read = inputStreamReader.read(cArr);
            if (read != -1) {
                sb.append(cArr, 0, read);
            } else {
                return sb.toString();
            }
        }
    }

    public Map<String, Integer> zza(View view, WindowManager windowManager) {
        DisplayMetrics zza2 = zza(windowManager);
        int i = zza2.widthPixels;
        int i2 = zza2.heightPixels;
        int[] iArr = new int[2];
        HashMap hashMap = new HashMap();
        view.getLocationInWindow(iArr);
        hashMap.put("xInPixels", Integer.valueOf(iArr[0]));
        hashMap.put("yInPixels", Integer.valueOf(iArr[1]));
        hashMap.put("windowWidthInPixels", Integer.valueOf(i));
        hashMap.put("windowHeightInPixels", Integer.valueOf(i2));
        return hashMap;
    }

    JSONArray zza(Object[] objArr) throws JSONException {
        JSONArray jSONArray = new JSONArray();
        for (Object obj : objArr) {
            zza(jSONArray, obj);
        }
        return jSONArray;
    }

    public void zza(Activity activity, ViewTreeObserver.OnGlobalLayoutListener onGlobalLayoutListener) {
        Window window = activity.getWindow();
        if (window == null || window.getDecorView() == null || window.getDecorView().getViewTreeObserver() == null) {
            return;
        }
        window.getDecorView().getViewTreeObserver().addOnGlobalLayoutListener(onGlobalLayoutListener);
    }

    public void zza(Activity activity, ViewTreeObserver.OnScrollChangedListener onScrollChangedListener) {
        Window window = activity.getWindow();
        if (window == null || window.getDecorView() == null || window.getDecorView().getViewTreeObserver() == null) {
            return;
        }
        window.getDecorView().getViewTreeObserver().addOnScrollChangedListener(onScrollChangedListener);
    }

    @TargetApi(18)
    public void zza(Context context, Uri uri) {
        try {
            Bundle bundle = new Bundle();
            if (zzdr.zzbkv.get().booleanValue() && com.google.android.gms.common.util.zzs.zzayt()) {
                bundle.putBinder("android.support.customtabs.extra.SESSION", null);
            }
            bundle.putString("com.android.browser.application_id", context.getPackageName());
            context.startActivity(new Intent("android.intent.action.VIEW", uri).putExtras(bundle));
            String valueOf = String.valueOf(uri.toString());
            zzkx.zzdg(new StringBuilder(String.valueOf(valueOf).length() + 26).append("Opening ").append(valueOf).append(" in a new browser.").toString());
        } catch (ActivityNotFoundException e) {
            zzkx.zzb("No browser is found.", e);
        }
    }

    public void zza(Context context, String str, WebSettings webSettings) {
        webSettings.setUserAgentString(zzh(context, str));
    }

    public void zza(final Context context, @Nullable final String str, String str2, Bundle bundle, boolean z) {
        if (z) {
            bundle.putString("device", com.google.android.gms.ads.internal.zzu.zzgm().zzvt());
            bundle.putString("eids", TextUtils.join(",", zzdr.zzlq()));
        }
        com.google.android.gms.ads.internal.client.zzm.zzkr().zza(context, str, str2, bundle, z, new zza.InterfaceC0034zza() { // from class: com.google.android.gms.internal.zzlb.3
            @Override // com.google.android.gms.ads.internal.util.client.zza.InterfaceC0034zza
            public void zzv(String str3) {
                com.google.android.gms.ads.internal.zzu.zzgm().zzc(context, str, str3);
            }
        });
    }

    public void zza(Context context, String str, List<String> list) {
        for (String str2 : list) {
            Future future = (Future) new zzll(context, str, str2).zzrz();
        }
    }

    public void zza(Context context, String str, boolean z, HttpURLConnection httpURLConnection) {
        zza(context, str, z, httpURLConnection, false);
    }

    public void zza(Context context, String str, boolean z, HttpURLConnection httpURLConnection, boolean z2) {
        httpURLConnection.setConnectTimeout(60000);
        httpURLConnection.setInstanceFollowRedirects(z);
        httpURLConnection.setReadTimeout(60000);
        httpURLConnection.setRequestProperty("User-Agent", zzh(context, str));
        httpURLConnection.setUseCaches(z2);
    }

    public void zza(final Context context, final List<String> list) {
        if ((context instanceof Activity) && !TextUtils.isEmpty(zzasg.zzfa((Activity) context))) {
            if (list == null) {
                zzkx.v("Cannot ping urls: empty list.");
            } else if (!zzef.zzn(context)) {
                zzkx.v("Cannot ping url because custom tabs is not supported");
            } else {
                final zzef zzefVar = new zzef();
                zzefVar.zza(new zzef.zza() { // from class: com.google.android.gms.internal.zzlb.1
                    @Override // com.google.android.gms.internal.zzef.zza
                    public void zzmh() {
                        for (String str : list) {
                            String valueOf = String.valueOf(str);
                            zzkx.zzdh(valueOf.length() != 0 ? "Pinging url: ".concat(valueOf) : new String("Pinging url: "));
                            zzefVar.mayLaunchUrl(Uri.parse(str), null, null);
                        }
                        zzefVar.zzd((Activity) context);
                    }

                    @Override // com.google.android.gms.internal.zzef.zza
                    public void zzmi() {
                    }
                });
                zzefVar.zze((Activity) context);
            }
        }
    }

    public void zza(List<String> list, String str) {
        for (String str2 : list) {
            Future future = (Future) new zzll(str2, str).zzrz();
        }
    }

    @TargetApi(24)
    public boolean zza(Activity activity, Configuration configuration) {
        com.google.android.gms.ads.internal.util.client.zza zzkr = com.google.android.gms.ads.internal.client.zzm.zzkr();
        int zzb = zzkr.zzb(activity, configuration.screenHeightDp);
        int zzb2 = zzkr.zzb(activity, configuration.screenWidthDp);
        DisplayMetrics zza2 = zza((WindowManager) activity.getApplicationContext().getSystemService("window"));
        int i = zza2.heightPixels;
        int i2 = zza2.widthPixels;
        int identifier = activity.getResources().getIdentifier("status_bar_height", "dimen", AbstractSpiCall.ANDROID_CLIENT_TYPE);
        int dimensionPixelSize = identifier > 0 ? activity.getResources().getDimensionPixelSize(identifier) : 0;
        int intValue = zzdr.zzbld.get().intValue() * ((int) Math.round(activity.getResources().getDisplayMetrics().density + 0.5d));
        return zzb(i, dimensionPixelSize + zzb, intValue) && zzb(i2, zzb2, intValue);
    }

    public boolean zza(PackageManager packageManager, String str, String str2) {
        return packageManager.checkPermission(str2, str) == 0;
    }

    public boolean zza(View view, Context context) {
        KeyguardManager keyguardManager = null;
        Context applicationContext = context.getApplicationContext();
        PowerManager powerManager = applicationContext != null ? (PowerManager) applicationContext.getSystemService("power") : null;
        Object systemService = context.getSystemService("keyguard");
        if (systemService != null && (systemService instanceof KeyguardManager)) {
            keyguardManager = (KeyguardManager) systemService;
        }
        return zza(view, powerManager, keyguardManager);
    }

    public boolean zza(View view, PowerManager powerManager, KeyguardManager keyguardManager) {
        return view.getVisibility() == 0 && view.isShown() && zza(powerManager) && (com.google.android.gms.ads.internal.zzu.zzgm().zzvp() || !zza(keyguardManager)) && (!zzdr.zzbgs.get().booleanValue() || view.getLocalVisibleRect(new Rect()) || view.getGlobalVisibleRect(new Rect()));
    }

    public boolean zza(ClassLoader classLoader, Class<?> cls, String str) {
        try {
            return cls.isAssignableFrom(Class.forName(str, false, classLoader));
        } catch (Throwable th) {
            return false;
        }
    }

    protected String zzaa(Context context) {
        return new WebView(context).getSettings().getUserAgentString();
    }

    public AlertDialog.Builder zzab(Context context) {
        return new AlertDialog.Builder(context);
    }

    public zzdj zzac(Context context) {
        return new zzdj(context);
    }

    public String zzad(Context context) {
        ActivityManager activityManager;
        ActivityManager.RunningTaskInfo runningTaskInfo;
        try {
            activityManager = (ActivityManager) context.getSystemService("activity");
        } catch (Exception e) {
        }
        if (activityManager == null) {
            return null;
        }
        List<ActivityManager.RunningTaskInfo> runningTasks = activityManager.getRunningTasks(1);
        if (runningTasks != null && !runningTasks.isEmpty() && (runningTaskInfo = runningTasks.get(0)) != null && runningTaskInfo.topActivity != null) {
            return runningTaskInfo.topActivity.getClassName();
        }
        return null;
    }

    /* JADX WARN: Code restructure failed: missing block: B:17:0x003d, code lost:
        if (r0.importance != 100) goto L25;
     */
    /* JADX WARN: Code restructure failed: missing block: B:19:0x0043, code lost:
        if (r1.inKeyguardRestrictedInputMode() != false) goto L25;
     */
    /* JADX WARN: Code restructure failed: missing block: B:21:0x0049, code lost:
        if (zzh(r7) == false) goto L25;
     */
    /* JADX WARN: Code restructure failed: missing block: B:22:0x004b, code lost:
        return true;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public boolean zzae(android.content.Context r7) {
        /*
            r6 = this;
            r2 = 0
            java.lang.String r0 = "activity"
            java.lang.Object r0 = r7.getSystemService(r0)     // Catch: java.lang.Throwable -> L4f
            android.app.ActivityManager r0 = (android.app.ActivityManager) r0     // Catch: java.lang.Throwable -> L4f
            java.lang.String r1 = "keyguard"
            java.lang.Object r1 = r7.getSystemService(r1)     // Catch: java.lang.Throwable -> L4f
            android.app.KeyguardManager r1 = (android.app.KeyguardManager) r1     // Catch: java.lang.Throwable -> L4f
            if (r0 == 0) goto L17
            if (r1 != 0) goto L19
        L17:
            r0 = r2
        L18:
            return r0
        L19:
            java.util.List r0 = r0.getRunningAppProcesses()     // Catch: java.lang.Throwable -> L4f
            if (r0 != 0) goto L21
            r0 = r2
            goto L18
        L21:
            java.util.Iterator r3 = r0.iterator()     // Catch: java.lang.Throwable -> L4f
        L25:
            boolean r0 = r3.hasNext()     // Catch: java.lang.Throwable -> L4f
            if (r0 == 0) goto L4d
            java.lang.Object r0 = r3.next()     // Catch: java.lang.Throwable -> L4f
            android.app.ActivityManager$RunningAppProcessInfo r0 = (android.app.ActivityManager.RunningAppProcessInfo) r0     // Catch: java.lang.Throwable -> L4f
            int r4 = android.os.Process.myPid()     // Catch: java.lang.Throwable -> L4f
            int r5 = r0.pid     // Catch: java.lang.Throwable -> L4f
            if (r4 != r5) goto L25
            int r0 = r0.importance     // Catch: java.lang.Throwable -> L4f
            r3 = 100
            if (r0 != r3) goto L4d
            boolean r0 = r1.inKeyguardRestrictedInputMode()     // Catch: java.lang.Throwable -> L4f
            if (r0 != 0) goto L4d
            boolean r0 = r6.zzh(r7)     // Catch: java.lang.Throwable -> L4f
            if (r0 == 0) goto L4d
            r0 = 1
            goto L18
        L4d:
            r0 = r2
            goto L18
        L4f:
            r0 = move-exception
            r0 = r2
            goto L18
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.android.gms.internal.zzlb.zzae(android.content.Context):boolean");
    }

    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:15:0x0040 -> B:10:0x0028). Please submit an issue!!! */
    public Bitmap zzaf(Context context) {
        Bitmap bitmap;
        Bitmap bitmap2 = null;
        if (!(context instanceof Activity)) {
            return null;
        }
        try {
        } catch (RuntimeException e) {
            zzkx.zzb("Fail to capture screen shot", e);
        }
        if (zzdr.zzbiq.get().booleanValue()) {
            Window window = ((Activity) context).getWindow();
            if (window != null) {
                bitmap = zzs(window.getDecorView().getRootView());
            }
            bitmap = bitmap2;
        } else {
            bitmap = zzr(((Activity) context).getWindow().getDecorView());
        }
        bitmap2 = bitmap;
        return bitmap2;
    }

    public AudioManager zzag(Context context) {
        return (AudioManager) context.getSystemService(MimeTypes.BASE_TYPE_AUDIO);
    }

    public float zzah(Context context) {
        AudioManager zzag = zzag(context);
        if (zzag == null) {
            return 0.0f;
        }
        int streamMaxVolume = zzag.getStreamMaxVolume(3);
        int streamVolume = zzag.getStreamVolume(3);
        if (streamMaxVolume == 0) {
            return 0.0f;
        }
        return streamVolume / streamMaxVolume;
    }

    public int zzai(Context context) {
        ApplicationInfo applicationInfo = context.getApplicationInfo();
        if (applicationInfo == null) {
            return 0;
        }
        return applicationInfo.targetSdkVersion;
    }

    public boolean zzaj(Context context) {
        try {
            context.getClassLoader().loadClass(ClientApi.class.getName());
            return false;
        } catch (ClassNotFoundException e) {
            return true;
        }
    }

    public Bundle zzak(Context context) {
        zzda zzw = com.google.android.gms.ads.internal.zzu.zzgq().zzw(context);
        if (zzw == null) {
            return null;
        }
        return zza(zzw);
    }

    public JSONObject zzap(Map<String, ?> map) throws JSONException {
        try {
            JSONObject jSONObject = new JSONObject();
            for (String str : map.keySet()) {
                zza(jSONObject, str, map.get(str));
            }
            return jSONObject;
        } catch (ClassCastException e) {
            String valueOf = String.valueOf(e.getMessage());
            throw new JSONException(valueOf.length() != 0 ? "Could not convert map to JSON: ".concat(valueOf) : new String("Could not convert map to JSON: "));
        }
    }

    public void zzb(Activity activity, ViewTreeObserver.OnScrollChangedListener onScrollChangedListener) {
        Window window = activity.getWindow();
        if (window == null || window.getDecorView() == null || window.getDecorView().getViewTreeObserver() == null) {
            return;
        }
        window.getDecorView().getViewTreeObserver().removeOnScrollChangedListener(onScrollChangedListener);
    }

    public void zzb(Context context, Intent intent) {
        try {
            context.startActivity(intent);
        } catch (Throwable th) {
            intent.addFlags(268435456);
            context.startActivity(intent);
        }
    }

    public void zzb(Context context, String str, String str2, Bundle bundle, boolean z) {
        if (zzdr.zzbgx.get().booleanValue()) {
            zza(context, str, str2, bundle, z);
        }
    }

    boolean zzb(int i, int i2, int i3) {
        return Math.abs(i - i2) <= i3;
    }

    public String zzc(String str, Map<String, String> map) {
        for (String str2 : map.keySet()) {
            str = str.replaceAll(String.format("(?<!@)((?:@@)*)@%s(?<!@)((?:@@)*)@", str2), String.format("$1%s$2", Uri.encode(map.get(str2))));
        }
        return str.replaceAll(String.format("(?<!@)((?:@@)*)@%s(?<!@)((?:@@)*)@", "[^@]+"), String.format("$1%s$2", "")).replaceAll("@@", "@");
    }

    public void zzc(Context context, String str, String str2) {
        ArrayList arrayList = new ArrayList();
        arrayList.add(str2);
        zza(context, str, arrayList);
    }

    public String zzcz(String str) {
        return Uri.parse(str).buildUpon().query(null).build().toString();
    }

    public zzgh zzd(Context context, VersionInfoParcel versionInfoParcel) {
        zzgh zzghVar;
        synchronized (this.zzako) {
            if (this.zzcnn == null) {
                if (context.getApplicationContext() != null) {
                    context = context.getApplicationContext();
                }
                this.zzcnn = new zzgh(context, versionInfoParcel, zzdr.zzbcx.get());
            }
            zzghVar = this.zzcnn;
        }
        return zzghVar;
    }

    public void zzd(Context context, String str, String str2) {
        try {
            FileOutputStream openFileOutput = context.openFileOutput(str, 0);
            openFileOutput.write(str2.getBytes("UTF-8"));
            openFileOutput.close();
        } catch (Exception e) {
            zzkx.zzb("Error writing to file in internal storage.", e);
        }
    }

    public int zzda(String str) {
        try {
            return Integer.parseInt(str);
        } catch (NumberFormatException e) {
            String valueOf = String.valueOf(e);
            zzkx.zzdi(new StringBuilder(String.valueOf(valueOf).length() + 22).append("Could not parse value:").append(valueOf).toString());
            return 0;
        }
    }

    public boolean zzdb(String str) {
        if (TextUtils.isEmpty(str)) {
            return false;
        }
        return str.matches("([^\\s]+(\\.(?i)(jpg|png|gif|bmp|webp))$)");
    }

    public float zzfr() {
        com.google.android.gms.ads.internal.zzo zzfq = com.google.android.gms.ads.internal.zzu.zzhg().zzfq();
        if (zzfq == null || !zzfq.zzfs()) {
            return 1.0f;
        }
        return zzfq.zzfr();
    }

    public boolean zzft() {
        com.google.android.gms.ads.internal.zzo zzfq = com.google.android.gms.ads.internal.zzu.zzhg().zzfq();
        if (zzfq != null) {
            return zzfq.zzft();
        }
        return false;
    }

    public Map<String, String> zzg(Uri uri) {
        if (uri == null) {
            return null;
        }
        HashMap hashMap = new HashMap();
        for (String str : com.google.android.gms.ads.internal.zzu.zzgo().zzh(uri)) {
            hashMap.put(str, uri.getQueryParameter(str));
        }
        return hashMap;
    }

    public String zzh(final Context context, String str) {
        String str2;
        synchronized (this.zzako) {
            if (this.zzbre != null) {
                str2 = this.zzbre;
            } else if (str == null) {
                str2 = zzvq();
            } else {
                try {
                    this.zzbre = com.google.android.gms.ads.internal.zzu.zzgo().getDefaultUserAgent(context);
                } catch (Exception e) {
                }
                if (TextUtils.isEmpty(this.zzbre)) {
                    if (!com.google.android.gms.ads.internal.client.zzm.zzkr().zzwq()) {
                        this.zzbre = null;
                        zzcvl.post(new Runnable() { // from class: com.google.android.gms.internal.zzlb.2
                            @Override // java.lang.Runnable
                            public void run() {
                                synchronized (zzlb.this.zzako) {
                                    zzlb.this.zzbre = zzlb.this.zzaa(context);
                                    zzlb.this.zzako.notifyAll();
                                }
                            }
                        });
                        while (this.zzbre == null) {
                            try {
                                this.zzako.wait();
                            } catch (InterruptedException e2) {
                                this.zzbre = zzvq();
                                String valueOf = String.valueOf(this.zzbre);
                                zzkx.zzdi(valueOf.length() != 0 ? "Interrupted, use default user agent: ".concat(valueOf) : new String("Interrupted, use default user agent: "));
                            }
                        }
                    } else {
                        try {
                            this.zzbre = zzaa(context);
                        } catch (Exception e3) {
                            this.zzbre = zzvq();
                        }
                    }
                }
                String valueOf2 = String.valueOf(this.zzbre);
                this.zzbre = new StringBuilder(String.valueOf(valueOf2).length() + 11 + String.valueOf(str).length()).append(valueOf2).append(" (Mobile; ").append(str).append(")").toString();
                str2 = this.zzbre;
            }
        }
        return str2;
    }

    public int[] zzh(Activity activity) {
        View findViewById;
        Window window = activity.getWindow();
        return (window == null || (findViewById = window.findViewById(16908290)) == null) ? zzvu() : new int[]{findViewById.getWidth(), findViewById.getHeight()};
    }

    public String zzi(Context context, String str) {
        try {
            return new String(com.google.android.gms.common.util.zzo.zza((InputStream) context.openFileInput(str), true), "UTF-8");
        } catch (IOException e) {
            zzkx.zzb("Error reading from internal storage.", e);
            return "";
        }
    }

    public int[] zzi(Activity activity) {
        int[] zzh = zzh(activity);
        return new int[]{com.google.android.gms.ads.internal.client.zzm.zzkr().zzc(activity, zzh[0]), com.google.android.gms.ads.internal.client.zzm.zzkr().zzc(activity, zzh[1])};
    }

    public int[] zzj(Activity activity) {
        View findViewById;
        Window window = activity.getWindow();
        return (window == null || (findViewById = window.findViewById(16908290)) == null) ? zzvu() : new int[]{findViewById.getTop(), findViewById.getBottom()};
    }

    public int[] zzk(Activity activity) {
        int[] zzj = zzj(activity);
        return new int[]{com.google.android.gms.ads.internal.client.zzm.zzkr().zzc(activity, zzj[0]), com.google.android.gms.ads.internal.client.zzm.zzkr().zzc(activity, zzj[1])};
    }

    public Bitmap zzq(View view) {
        view.setDrawingCacheEnabled(true);
        Bitmap createBitmap = Bitmap.createBitmap(view.getDrawingCache());
        view.setDrawingCacheEnabled(false);
        return createBitmap;
    }

    public int zzt(@Nullable View view) {
        if (view == null) {
            return -1;
        }
        ViewParent parent = view.getParent();
        while (parent != null && !(parent instanceof AdapterView)) {
            parent = parent.getParent();
        }
        if (parent != null) {
            return ((AdapterView) parent).getPositionForView(view);
        }
        return -1;
    }

    public boolean zzvp() {
        return this.zzcvm;
    }

    String zzvq() {
        StringBuffer stringBuffer = new StringBuffer(256);
        stringBuffer.append("Mozilla/5.0 (Linux; U; Android");
        if (Build.VERSION.RELEASE != null) {
            stringBuffer.append(MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR).append(Build.VERSION.RELEASE);
        }
        stringBuffer.append("; ").append(Locale.getDefault());
        if (Build.DEVICE != null) {
            stringBuffer.append("; ").append(Build.DEVICE);
            if (Build.DISPLAY != null) {
                stringBuffer.append(" Build/").append(Build.DISPLAY);
            }
        }
        stringBuffer.append(") AppleWebKit/533 Version/4.0 Safari/533");
        return stringBuffer.toString();
    }

    public String zzvr() {
        return UUID.randomUUID().toString();
    }

    public String zzvs() {
        UUID randomUUID = UUID.randomUUID();
        byte[] byteArray = BigInteger.valueOf(randomUUID.getLeastSignificantBits()).toByteArray();
        byte[] byteArray2 = BigInteger.valueOf(randomUUID.getMostSignificantBits()).toByteArray();
        String bigInteger = new BigInteger(1, byteArray).toString();
        for (int i = 0; i < 2; i++) {
            try {
                MessageDigest messageDigest = MessageDigest.getInstance(CommonUtils.MD5_INSTANCE);
                messageDigest.update(byteArray);
                messageDigest.update(byteArray2);
                byte[] bArr = new byte[8];
                System.arraycopy(messageDigest.digest(), 0, bArr, 0, 8);
                bigInteger = new BigInteger(1, bArr).toString();
            } catch (NoSuchAlgorithmException e) {
            }
        }
        return bigInteger;
    }

    public String zzvt() {
        String str = Build.MANUFACTURER;
        String str2 = Build.MODEL;
        return str2.startsWith(str) ? str2 : new StringBuilder(String.valueOf(str).length() + 1 + String.valueOf(str2).length()).append(str).append(MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR).append(str2).toString();
    }

    protected int[] zzvu() {
        return new int[]{0, 0};
    }

    public Bundle zzvv() {
        Bundle bundle = new Bundle();
        try {
            if (zzdr.zzbec.get().booleanValue()) {
                Debug.MemoryInfo memoryInfo = new Debug.MemoryInfo();
                Debug.getMemoryInfo(memoryInfo);
                bundle.putParcelable("debug_memory_info", memoryInfo);
            }
            if (zzdr.zzbed.get().booleanValue()) {
                Runtime runtime = Runtime.getRuntime();
                bundle.putLong("runtime_free_memory", runtime.freeMemory());
                bundle.putLong("runtime_max_memory", runtime.maxMemory());
                bundle.putLong("runtime_total_memory", runtime.totalMemory());
            }
        } catch (Exception e) {
            zzkx.zzc("Unable to gather memory stats", e);
        }
        return bundle;
    }

    public boolean zzy(Context context) {
        boolean z;
        Intent intent = new Intent();
        intent.setClassName(context, AdActivity.CLASS_NAME);
        ResolveInfo resolveActivity = context.getPackageManager().resolveActivity(intent, 65536);
        if (resolveActivity == null || resolveActivity.activityInfo == null) {
            zzkx.zzdi("Could not find com.google.android.gms.ads.AdActivity, please make sure it is declared in AndroidManifest.xml.");
            return false;
        }
        if ((resolveActivity.activityInfo.configChanges & 16) == 0) {
            zzkx.zzdi(String.format("com.google.android.gms.ads.AdActivity requires the android:configChanges value to contain \"%s\".", Product.REFERRER_KEYBOARD));
            z = false;
        } else {
            z = true;
        }
        if ((resolveActivity.activityInfo.configChanges & 32) == 0) {
            zzkx.zzdi(String.format("com.google.android.gms.ads.AdActivity requires the android:configChanges value to contain \"%s\".", "keyboardHidden"));
            z = false;
        }
        if ((resolveActivity.activityInfo.configChanges & 128) == 0) {
            zzkx.zzdi(String.format("com.google.android.gms.ads.AdActivity requires the android:configChanges value to contain \"%s\".", FragmentWrapperActivity.ORIENTATION_KEY));
            z = false;
        }
        if ((resolveActivity.activityInfo.configChanges & 256) == 0) {
            zzkx.zzdi(String.format("com.google.android.gms.ads.AdActivity requires the android:configChanges value to contain \"%s\".", "screenLayout"));
            z = false;
        }
        if ((resolveActivity.activityInfo.configChanges & 512) == 0) {
            zzkx.zzdi(String.format("com.google.android.gms.ads.AdActivity requires the android:configChanges value to contain \"%s\".", "uiMode"));
            z = false;
        }
        if ((resolveActivity.activityInfo.configChanges & 1024) == 0) {
            zzkx.zzdi(String.format("com.google.android.gms.ads.AdActivity requires the android:configChanges value to contain \"%s\".", "screenSize"));
            z = false;
        }
        if ((resolveActivity.activityInfo.configChanges & 2048) != 0) {
            return z;
        }
        zzkx.zzdi(String.format("com.google.android.gms.ads.AdActivity requires the android:configChanges value to contain \"%s\".", "smallestScreenSize"));
        return false;
    }

    public boolean zzz(Context context) {
        if (this.zzcvn) {
            return false;
        }
        IntentFilter intentFilter = new IntentFilter();
        intentFilter.addAction("android.intent.action.USER_PRESENT");
        intentFilter.addAction("android.intent.action.SCREEN_OFF");
        context.getApplicationContext().registerReceiver(new zza(), intentFilter);
        this.zzcvn = true;
        return true;
    }
}
