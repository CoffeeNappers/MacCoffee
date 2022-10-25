package com.google.android.gms.internal;

import android.annotation.TargetApi;
import android.content.Context;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Color;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.net.Uri;
import android.os.RemoteException;
import android.text.TextUtils;
import com.facebook.appevents.AppEventsConstants;
import com.facebook.common.util.UriUtil;
import com.google.android.gms.ads.internal.formats.zzi;
import com.google.android.gms.internal.zzja;
import com.google.android.gms.internal.zzko;
import com.google.android.gms.internal.zzli;
import com.google.android.gms.internal.zzls;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import java.util.concurrent.Callable;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.Future;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.TimeoutException;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
@zzji
/* loaded from: classes.dex */
public class zzjb implements Callable<zzko> {
    static long zzchj = TimeUnit.SECONDS.toMillis(60);
    private final Context mContext;
    private final Object zzako = new Object();
    private final zzdz zzalt;
    private final zzja zzbnv;
    private final zzav zzbnx;
    private final zzko.zza zzcgf;
    private int zzcgw;
    private final zzli zzchs;
    private final com.google.android.gms.ads.internal.zzq zzcht;
    private boolean zzchu;
    private List<String> zzchv;
    private JSONObject zzchw;

    /* loaded from: classes2.dex */
    public interface zza<T extends zzi.zza> {
        T zza(zzjb zzjbVar, JSONObject jSONObject) throws JSONException, InterruptedException, ExecutionException;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes2.dex */
    public class zzb {
        public zzfe zzciq;

        zzb() {
        }
    }

    public zzjb(Context context, com.google.android.gms.ads.internal.zzq zzqVar, zzli zzliVar, zzav zzavVar, zzko.zza zzaVar, zzdz zzdzVar) {
        this.mContext = context;
        this.zzcht = zzqVar;
        this.zzchs = zzliVar;
        this.zzcgf = zzaVar;
        this.zzbnx = zzavVar;
        this.zzalt = zzdzVar;
        this.zzbnv = zza(context, zzaVar, zzqVar, zzavVar);
        this.zzbnv.zzsh();
        this.zzchu = false;
        this.zzcgw = -2;
        this.zzchv = null;
    }

    private zzi.zza zza(zza zzaVar, JSONObject jSONObject, String str) throws ExecutionException, InterruptedException, JSONException {
        if (zzst() || zzaVar == null || jSONObject == null) {
            return null;
        }
        JSONObject jSONObject2 = jSONObject.getJSONObject("tracking_urls_and_actions");
        String[] zzd = zzd(jSONObject2, "impression_tracking_urls");
        this.zzchv = zzd == null ? null : Arrays.asList(zzd);
        this.zzchw = jSONObject2.optJSONObject("active_view");
        zzi.zza zza2 = zzaVar.zza(this, jSONObject);
        if (zza2 == null) {
            zzkx.e("Failed to retrieve ad assets.");
            return null;
        }
        zza2.zzb(new com.google.android.gms.ads.internal.formats.zzj(this.mContext, this.zzcht, this.zzbnv, this.zzbnx, jSONObject, zza2, this.zzcgf.zzcmx.zzari, str));
        return zza2;
    }

    private zzlt<com.google.android.gms.ads.internal.formats.zzc> zza(JSONObject jSONObject, final boolean z, boolean z2) throws JSONException {
        final String string = z ? jSONObject.getString("url") : jSONObject.optString("url");
        final double optDouble = jSONObject.optDouble("scale", 1.0d);
        final boolean optBoolean = jSONObject.optBoolean("is_transparent", true);
        if (!TextUtils.isEmpty(string)) {
            return z2 ? new zzlr(new com.google.android.gms.ads.internal.formats.zzc(null, Uri.parse(string), optDouble)) : this.zzchs.zza(string, new zzli.zza<com.google.android.gms.ads.internal.formats.zzc>() { // from class: com.google.android.gms.internal.zzjb.6
                @Override // com.google.android.gms.internal.zzli.zza
                @TargetApi(19)
                /* renamed from: zzg */
                public com.google.android.gms.ads.internal.formats.zzc zzh(InputStream inputStream) {
                    Bitmap bitmap;
                    BitmapFactory.Options options = new BitmapFactory.Options();
                    options.inDensity = (int) (160.0d * optDouble);
                    if (!optBoolean) {
                        options.inPreferredConfig = Bitmap.Config.RGB_565;
                    }
                    try {
                        bitmap = BitmapFactory.decodeStream(inputStream, null, options);
                    } catch (Exception e) {
                        zzkx.zzb("Error grabbing image.", e);
                        bitmap = null;
                    }
                    if (bitmap == null) {
                        zzjb.this.zza(2, z);
                        return null;
                    }
                    if (com.google.android.gms.common.util.zzs.zzayu()) {
                        int width = bitmap.getWidth();
                        zzkx.v(new StringBuilder(61).append("Decoded image w: ").append(width).append(" h:").append(bitmap.getHeight()).append(" bytes: ").append(bitmap.getAllocationByteCount()).toString());
                    }
                    return new com.google.android.gms.ads.internal.formats.zzc(new BitmapDrawable(Resources.getSystem(), bitmap), Uri.parse(string), optDouble);
                }

                @Override // com.google.android.gms.internal.zzli.zza
                /* renamed from: zzsv */
                public com.google.android.gms.ads.internal.formats.zzc zzsw() {
                    zzjb.this.zza(2, z);
                    return null;
                }
            });
        }
        zza(0, z);
        return new zzlr(null);
    }

    private void zza(zzi.zza zzaVar) {
        if (!(zzaVar instanceof com.google.android.gms.ads.internal.formats.zzf)) {
            return;
        }
        final com.google.android.gms.ads.internal.formats.zzf zzfVar = (com.google.android.gms.ads.internal.formats.zzf) zzaVar;
        zzb zzbVar = new zzb();
        final zzfe zzfeVar = new zzfe() { // from class: com.google.android.gms.internal.zzjb.3
            @Override // com.google.android.gms.internal.zzfe
            public void zza(zzmd zzmdVar, Map<String, String> map) {
                zzjb.this.zzb(zzfVar, map.get(UriUtil.LOCAL_ASSET_SCHEME));
            }
        };
        zzbVar.zzciq = zzfeVar;
        this.zzbnv.zza(new zzja.zza() { // from class: com.google.android.gms.internal.zzjb.4
            @Override // com.google.android.gms.internal.zzja.zza
            public void zze(zzgi zzgiVar) {
                zzgiVar.zza("/nativeAdCustomClick", zzfeVar);
            }
        });
    }

    private zzko zzb(zzi.zza zzaVar) {
        int i;
        synchronized (this.zzako) {
            i = this.zzcgw;
            if (zzaVar == null && this.zzcgw == -2) {
                i = 0;
            }
        }
        return new zzko(this.zzcgf.zzcmx.zzcju, null, this.zzcgf.zzcsu.zzbvk, i, this.zzcgf.zzcsu.zzbvl, this.zzchv, this.zzcgf.zzcsu.orientation, this.zzcgf.zzcsu.zzbvq, this.zzcgf.zzcmx.zzcjx, false, null, null, null, null, null, 0L, this.zzcgf.zzarm, this.zzcgf.zzcsu.zzcla, this.zzcgf.zzcso, this.zzcgf.zzcsp, this.zzcgf.zzcsu.zzclg, this.zzchw, i != -2 ? null : zzaVar, null, null, null, this.zzcgf.zzcsu.zzclt, this.zzcgf.zzcsu.zzclu, null, this.zzcgf.zzcsu.zzbvn, this.zzcgf.zzcsu.zzclx);
    }

    private Integer zzb(JSONObject jSONObject, String str) {
        try {
            JSONObject jSONObject2 = jSONObject.getJSONObject(str);
            return Integer.valueOf(Color.rgb(jSONObject2.getInt("r"), jSONObject2.getInt("g"), jSONObject2.getInt("b")));
        } catch (JSONException e) {
            return null;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void zzb(zzeo zzeoVar, String str) {
        try {
            zzes zzaa = this.zzcht.zzaa(zzeoVar.getCustomTemplateId());
            if (zzaa == null) {
                return;
            }
            zzaa.zza(zzeoVar, str);
        } catch (RemoteException e) {
            zzkx.zzc(new StringBuilder(String.valueOf(str).length() + 40).append("Failed to call onCustomClick for asset ").append(str).append(".").toString(), e);
        }
    }

    private JSONObject zzcj(final String str) throws ExecutionException, InterruptedException, TimeoutException, JSONException {
        if (zzst()) {
            return null;
        }
        final zzlq zzlqVar = new zzlq();
        final zzb zzbVar = new zzb();
        this.zzbnv.zza(new zzja.zza() { // from class: com.google.android.gms.internal.zzjb.1
            @Override // com.google.android.gms.internal.zzja.zza
            public void zze(final zzgi zzgiVar) {
                zzfe zzfeVar = new zzfe() { // from class: com.google.android.gms.internal.zzjb.1.1
                    @Override // com.google.android.gms.internal.zzfe
                    public void zza(zzmd zzmdVar, Map<String, String> map) {
                        try {
                            String str2 = map.get("success");
                            if (TextUtils.isEmpty(str2)) {
                                return;
                            }
                            if (!str.equals(new JSONObject(str2).optString("ads_id", ""))) {
                                return;
                            }
                            zzgiVar.zzb("/nativeAdPreProcess", zzbVar.zzciq);
                            zzlqVar.zzh(new JSONObject(str2).getJSONArray("ads").getJSONObject(0));
                        } catch (JSONException e) {
                            zzkx.zzb("Malformed native JSON response.", e);
                            zzjb.this.zzas(0);
                            com.google.android.gms.common.internal.zzaa.zza(zzjb.this.zzst(), "Unable to set the ad state error!");
                            zzlqVar.zzh(null);
                        }
                    }
                };
                zzbVar.zzciq = zzfeVar;
                zzgiVar.zza("/nativeAdPreProcess", zzfeVar);
                try {
                    JSONObject jSONObject = new JSONObject(zzjb.this.zzcgf.zzcsu.body);
                    jSONObject.put("ads_id", str);
                    zzgiVar.zza("google.afma.nativeAds.preProcessJsonGmsg", jSONObject);
                } catch (JSONException e) {
                    zzkx.zzc("Exception occurred while invoking javascript", e);
                    zzlqVar.zzh(null);
                }
            }

            @Override // com.google.android.gms.internal.zzja.zza
            public void zzsr() {
                zzlqVar.zzh(null);
            }
        });
        return (JSONObject) zzlqVar.get(zzchj, TimeUnit.MILLISECONDS);
    }

    private String[] zzd(JSONObject jSONObject, String str) throws JSONException {
        JSONArray optJSONArray = jSONObject.optJSONArray(str);
        if (optJSONArray == null) {
            return null;
        }
        String[] strArr = new String[optJSONArray.length()];
        for (int i = 0; i < optJSONArray.length(); i++) {
            strArr[i] = optJSONArray.getString(i);
        }
        return strArr;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static List<Drawable> zzh(List<com.google.android.gms.ads.internal.formats.zzc> list) throws RemoteException {
        ArrayList arrayList = new ArrayList();
        for (com.google.android.gms.ads.internal.formats.zzc zzcVar : list) {
            arrayList.add((Drawable) com.google.android.gms.dynamic.zze.zzae(zzcVar.zzmn()));
        }
        return arrayList;
    }

    zzja zza(Context context, zzko.zza zzaVar, com.google.android.gms.ads.internal.zzq zzqVar, zzav zzavVar) {
        return new zzja(context, zzaVar, zzqVar, zzavVar);
    }

    zzjc zza(Context context, zzav zzavVar, zzko.zza zzaVar, zzdz zzdzVar, com.google.android.gms.ads.internal.zzq zzqVar) {
        return new zzjc(context, zzavVar, zzaVar, zzdzVar, zzqVar);
    }

    public zzlt<com.google.android.gms.ads.internal.formats.zzc> zza(JSONObject jSONObject, String str, boolean z, boolean z2) throws JSONException {
        JSONObject jSONObject2 = z ? jSONObject.getJSONObject(str) : jSONObject.optJSONObject(str);
        if (jSONObject2 == null) {
            jSONObject2 = new JSONObject();
        }
        return zza(jSONObject2, z, z2);
    }

    public List<zzlt<com.google.android.gms.ads.internal.formats.zzc>> zza(JSONObject jSONObject, String str, boolean z, boolean z2, boolean z3) throws JSONException {
        JSONArray jSONArray = z ? jSONObject.getJSONArray(str) : jSONObject.optJSONArray(str);
        ArrayList arrayList = new ArrayList();
        if (jSONArray == null || jSONArray.length() == 0) {
            zza(0, z);
            return arrayList;
        }
        int length = z3 ? jSONArray.length() : 1;
        for (int i = 0; i < length; i++) {
            JSONObject jSONObject2 = jSONArray.getJSONObject(i);
            if (jSONObject2 == null) {
                jSONObject2 = new JSONObject();
            }
            arrayList.add(zza(jSONObject2, z, z2));
        }
        return arrayList;
    }

    public Future<com.google.android.gms.ads.internal.formats.zzc> zza(JSONObject jSONObject, String str, boolean z) throws JSONException {
        JSONObject jSONObject2 = jSONObject.getJSONObject(str);
        boolean optBoolean = jSONObject2.optBoolean("require", true);
        if (jSONObject2 == null) {
            jSONObject2 = new JSONObject();
        }
        return zza(jSONObject2, optBoolean, z);
    }

    public void zza(int i, boolean z) {
        if (z) {
            zzas(i);
        }
    }

    public void zzas(int i) {
        synchronized (this.zzako) {
            this.zzchu = true;
            this.zzcgw = i;
        }
    }

    public zzlt<zzmd> zzc(JSONObject jSONObject, String str) throws JSONException {
        JSONObject optJSONObject = jSONObject.optJSONObject(str);
        if (optJSONObject == null) {
            return new zzlr(null);
        }
        if (!TextUtils.isEmpty(optJSONObject.optString("vast_xml"))) {
            return zza(this.mContext, this.zzbnx, this.zzcgf, this.zzalt, this.zzcht).zzg(optJSONObject);
        }
        zzkx.zzdi("Required field 'vast_xml' is missing");
        return new zzlr(null);
    }

    protected zza zze(JSONObject jSONObject) throws ExecutionException, InterruptedException, JSONException, TimeoutException {
        if (zzst() || jSONObject == null) {
            return null;
        }
        String string = jSONObject.getString("template_id");
        boolean z = this.zzcgf.zzcmx.zzasa != null ? this.zzcgf.zzcmx.zzasa.zzboj : false;
        boolean z2 = this.zzcgf.zzcmx.zzasa != null ? this.zzcgf.zzcmx.zzasa.zzbol : false;
        if ("2".equals(string)) {
            return new zzjd(z, z2);
        }
        if (AppEventsConstants.EVENT_PARAM_VALUE_YES.equals(string)) {
            return new zzje(z, z2);
        }
        if ("3".equals(string)) {
            final String string2 = jSONObject.getString("custom_template_id");
            final zzlq zzlqVar = new zzlq();
            zzlb.zzcvl.post(new Runnable() { // from class: com.google.android.gms.internal.zzjb.2
                @Override // java.lang.Runnable
                public void run() {
                    zzlqVar.zzh(zzjb.this.zzcht.zzfv().get(string2));
                }
            });
            if (zzlqVar.get(zzchj, TimeUnit.MILLISECONDS) != null) {
                return new zzjf(z);
            }
            String valueOf = String.valueOf(jSONObject.getString("custom_template_id"));
            zzkx.e(valueOf.length() != 0 ? "No handler for custom template: ".concat(valueOf) : new String("No handler for custom template: "));
        } else {
            zzas(0);
        }
        return null;
    }

    public zzlt<com.google.android.gms.ads.internal.formats.zza> zzf(JSONObject jSONObject) throws JSONException {
        JSONObject optJSONObject = jSONObject.optJSONObject("attribution");
        if (optJSONObject == null) {
            return new zzlr(null);
        }
        final String optString = optJSONObject.optString("text");
        final int optInt = optJSONObject.optInt("text_size", -1);
        final Integer zzb2 = zzb(optJSONObject, "text_color");
        final Integer zzb3 = zzb(optJSONObject, "bg_color");
        final int optInt2 = optJSONObject.optInt("animation_ms", 1000);
        final int optInt3 = optJSONObject.optInt("presentation_ms", 4000);
        final int i = (this.zzcgf.zzcmx.zzasa == null || this.zzcgf.zzcmx.zzasa.versionCode < 2) ? 1 : this.zzcgf.zzcmx.zzasa.zzbom;
        List<zzlt<com.google.android.gms.ads.internal.formats.zzc>> arrayList = new ArrayList<>();
        if (optJSONObject.optJSONArray("images") != null) {
            arrayList = zza(optJSONObject, "images", false, false, true);
        } else {
            arrayList.add(zza(optJSONObject, "image", false, false));
        }
        return zzls.zza(zzls.zzo(arrayList), new zzls.zza<List<com.google.android.gms.ads.internal.formats.zzc>, com.google.android.gms.ads.internal.formats.zza>() { // from class: com.google.android.gms.internal.zzjb.5
            @Override // com.google.android.gms.internal.zzls.zza
            /* renamed from: zzj */
            public com.google.android.gms.ads.internal.formats.zza apply(List<com.google.android.gms.ads.internal.formats.zzc> list) {
                com.google.android.gms.ads.internal.formats.zza zzaVar;
                if (list != null) {
                    try {
                        if (!list.isEmpty()) {
                            zzaVar = new com.google.android.gms.ads.internal.formats.zza(optString, zzjb.zzh(list), zzb3, zzb2, optInt > 0 ? Integer.valueOf(optInt) : null, optInt3 + optInt2, i);
                            return zzaVar;
                        }
                    } catch (RemoteException e) {
                        zzkx.zzb("Could not get attribution icon", e);
                        return null;
                    }
                }
                zzaVar = null;
                return zzaVar;
            }
        });
    }

    /* JADX WARN: Removed duplicated region for block: B:8:0x0028  */
    @Override // java.util.concurrent.Callable
    /* renamed from: zzss */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public com.google.android.gms.internal.zzko call() {
        /*
            r3 = this;
            com.google.android.gms.internal.zzja r0 = r3.zzbnv     // Catch: org.json.JSONException -> L1d java.util.concurrent.TimeoutException -> L32 java.lang.InterruptedException -> L3a java.util.concurrent.ExecutionException -> L3c java.util.concurrent.CancellationException -> L3e
            r0.zzsi()     // Catch: org.json.JSONException -> L1d java.util.concurrent.TimeoutException -> L32 java.lang.InterruptedException -> L3a java.util.concurrent.ExecutionException -> L3c java.util.concurrent.CancellationException -> L3e
            java.lang.String r0 = r3.zzsu()     // Catch: org.json.JSONException -> L1d java.util.concurrent.TimeoutException -> L32 java.lang.InterruptedException -> L3a java.util.concurrent.ExecutionException -> L3c java.util.concurrent.CancellationException -> L3e
            org.json.JSONObject r1 = r3.zzcj(r0)     // Catch: org.json.JSONException -> L1d java.util.concurrent.TimeoutException -> L32 java.lang.InterruptedException -> L3a java.util.concurrent.ExecutionException -> L3c java.util.concurrent.CancellationException -> L3e
            com.google.android.gms.internal.zzjb$zza r2 = r3.zze(r1)     // Catch: org.json.JSONException -> L1d java.util.concurrent.TimeoutException -> L32 java.lang.InterruptedException -> L3a java.util.concurrent.ExecutionException -> L3c java.util.concurrent.CancellationException -> L3e
            com.google.android.gms.ads.internal.formats.zzi$zza r0 = r3.zza(r2, r1, r0)     // Catch: org.json.JSONException -> L1d java.util.concurrent.TimeoutException -> L32 java.lang.InterruptedException -> L3a java.util.concurrent.ExecutionException -> L3c java.util.concurrent.CancellationException -> L3e
            r3.zza(r0)     // Catch: org.json.JSONException -> L1d java.util.concurrent.TimeoutException -> L32 java.lang.InterruptedException -> L3a java.util.concurrent.ExecutionException -> L3c java.util.concurrent.CancellationException -> L3e
            com.google.android.gms.internal.zzko r0 = r3.zzb(r0)     // Catch: org.json.JSONException -> L1d java.util.concurrent.TimeoutException -> L32 java.lang.InterruptedException -> L3a java.util.concurrent.ExecutionException -> L3c java.util.concurrent.CancellationException -> L3e
        L1c:
            return r0
        L1d:
            r0 = move-exception
            java.lang.String r1 = "Malformed native JSON response."
            com.google.android.gms.internal.zzkx.zzc(r1, r0)
        L24:
            boolean r0 = r3.zzchu
            if (r0 != 0) goto L2c
            r0 = 0
            r3.zzas(r0)
        L2c:
            r0 = 0
            com.google.android.gms.internal.zzko r0 = r3.zzb(r0)
            goto L1c
        L32:
            r0 = move-exception
            java.lang.String r1 = "Timeout when loading native ad."
            com.google.android.gms.internal.zzkx.zzc(r1, r0)
            goto L24
        L3a:
            r0 = move-exception
            goto L24
        L3c:
            r0 = move-exception
            goto L24
        L3e:
            r0 = move-exception
            goto L24
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.android.gms.internal.zzjb.call():com.google.android.gms.internal.zzko");
    }

    public boolean zzst() {
        boolean z;
        synchronized (this.zzako) {
            z = this.zzchu;
        }
        return z;
    }

    String zzsu() {
        return UUID.randomUUID().toString();
    }
}
