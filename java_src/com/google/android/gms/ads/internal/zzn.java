package com.google.android.gms.ads.internal;

import android.graphics.Bitmap;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.net.Uri;
import android.os.Bundle;
import android.os.IBinder;
import android.os.RemoteException;
import android.support.annotation.Nullable;
import android.text.TextUtils;
import android.util.Base64;
import android.view.View;
import com.facebook.appevents.AppEventsConstants;
import com.google.android.exoplayer2.text.ttml.TtmlNode;
import com.google.android.gms.ads.internal.zzf;
import com.google.android.gms.internal.zzeg;
import com.google.android.gms.internal.zzfe;
import com.google.android.gms.internal.zzgu;
import com.google.android.gms.internal.zzhd;
import com.google.android.gms.internal.zzhe;
import com.google.android.gms.internal.zzji;
import com.google.android.gms.internal.zzko;
import com.google.android.gms.internal.zzkx;
import com.google.android.gms.internal.zzmd;
import com.google.android.gms.internal.zzme;
import io.fabric.sdk.android.services.settings.SettingsJsonConstants;
import java.io.ByteArrayOutputStream;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.concurrent.CountDownLatch;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
@zzji
/* loaded from: classes.dex */
public class zzn {
    private static com.google.android.gms.ads.internal.formats.zzd zza(zzhd zzhdVar) throws RemoteException {
        return new com.google.android.gms.ads.internal.formats.zzd(zzhdVar.getHeadline(), zzhdVar.getImages(), zzhdVar.getBody(), zzhdVar.zzmo(), zzhdVar.getCallToAction(), zzhdVar.getStarRating(), zzhdVar.getStore(), zzhdVar.getPrice(), null, zzhdVar.getExtras(), null, null);
    }

    private static com.google.android.gms.ads.internal.formats.zze zza(zzhe zzheVar) throws RemoteException {
        return new com.google.android.gms.ads.internal.formats.zze(zzheVar.getHeadline(), zzheVar.getImages(), zzheVar.getBody(), zzheVar.zzmt(), zzheVar.getCallToAction(), zzheVar.getAdvertiser(), null, zzheVar.getExtras());
    }

    static zzfe zza(@Nullable final zzhd zzhdVar, @Nullable final zzhe zzheVar, final zzf.zza zzaVar) {
        return new zzfe() { // from class: com.google.android.gms.ads.internal.zzn.5
            @Override // com.google.android.gms.internal.zzfe
            public void zza(zzmd zzmdVar, Map<String, String> map) {
                View view = zzmdVar.getView();
                if (view == null) {
                    return;
                }
                try {
                    if (zzhd.this != null) {
                        if (!zzhd.this.getOverrideClickHandling()) {
                            zzhd.this.zzk(com.google.android.gms.dynamic.zze.zzac(view));
                            zzaVar.onClick();
                        } else {
                            zzn.zza(zzmdVar);
                        }
                    } else if (zzheVar != null) {
                        if (!zzheVar.getOverrideClickHandling()) {
                            zzheVar.zzk(com.google.android.gms.dynamic.zze.zzac(view));
                            zzaVar.onClick();
                        } else {
                            zzn.zza(zzmdVar);
                        }
                    }
                } catch (RemoteException e) {
                    zzkx.zzc("Unable to call handleClick on mapper", e);
                }
            }
        };
    }

    static zzfe zza(final CountDownLatch countDownLatch) {
        return new zzfe() { // from class: com.google.android.gms.ads.internal.zzn.3
            @Override // com.google.android.gms.internal.zzfe
            public void zza(zzmd zzmdVar, Map<String, String> map) {
                countDownLatch.countDown();
                zzmdVar.getView().setVisibility(0);
            }
        };
    }

    private static String zza(@Nullable Bitmap bitmap) {
        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
        if (bitmap == null) {
            zzkx.zzdi("Bitmap is null. Returning empty string");
            return "";
        }
        bitmap.compress(Bitmap.CompressFormat.PNG, 100, byteArrayOutputStream);
        String encodeToString = Base64.encodeToString(byteArrayOutputStream.toByteArray(), 0);
        String valueOf = String.valueOf("data:image/png;base64,");
        String valueOf2 = String.valueOf(encodeToString);
        return valueOf2.length() != 0 ? valueOf.concat(valueOf2) : new String(valueOf);
    }

    static String zza(@Nullable zzeg zzegVar) {
        if (zzegVar == null) {
            zzkx.zzdi("Image is null. Returning empty string");
            return "";
        }
        try {
            Uri uri = zzegVar.getUri();
            if (uri != null) {
                return uri.toString();
            }
        } catch (RemoteException e) {
            zzkx.zzdi("Unable to get image uri. Trying data uri next");
        }
        return zzb(zzegVar);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static JSONObject zza(@Nullable Bundle bundle, String str) throws JSONException {
        JSONObject jSONObject = new JSONObject();
        if (bundle == null || TextUtils.isEmpty(str)) {
            return jSONObject;
        }
        JSONObject jSONObject2 = new JSONObject(str);
        Iterator<String> keys = jSONObject2.keys();
        while (keys.hasNext()) {
            String next = keys.next();
            if (bundle.containsKey(next)) {
                if ("image".equals(jSONObject2.getString(next))) {
                    Object obj = bundle.get(next);
                    if (obj instanceof Bitmap) {
                        jSONObject.put(next, zza((Bitmap) obj));
                    } else {
                        zzkx.zzdi("Invalid type. An image type extra should return a bitmap");
                    }
                } else if (bundle.get(next) instanceof Bitmap) {
                    zzkx.zzdi("Invalid asset type. Bitmap should be returned only for image type");
                } else {
                    jSONObject.put(next, String.valueOf(bundle.get(next)));
                }
            }
        }
        return jSONObject;
    }

    public static void zza(@Nullable zzko zzkoVar, zzf.zza zzaVar) {
        zzhe zzheVar = null;
        if (zzkoVar == null || !zzh(zzkoVar)) {
            return;
        }
        zzmd zzmdVar = zzkoVar.zzcbm;
        View view = zzmdVar != null ? zzmdVar.getView() : null;
        if (view == null) {
            zzkx.zzdi("AdWebView is null");
            return;
        }
        try {
            List<String> list = zzkoVar.zzbwm != null ? zzkoVar.zzbwm.zzbvg : null;
            if (list == null || list.isEmpty()) {
                zzkx.zzdi("No template ids present in mediation response");
                return;
            }
            zzhd zzom = zzkoVar.zzbwn != null ? zzkoVar.zzbwn.zzom() : null;
            if (zzkoVar.zzbwn != null) {
                zzheVar = zzkoVar.zzbwn.zzon();
            }
            if (list.contains("2") && zzom != null) {
                zzom.zzl(com.google.android.gms.dynamic.zze.zzac(view));
                if (!zzom.getOverrideImpressionRecording()) {
                    zzom.recordImpression();
                }
                zzmdVar.zzxc().zza("/nativeExpressViewClicked", zza(zzom, (zzhe) null, zzaVar));
            } else if (!list.contains(AppEventsConstants.EVENT_PARAM_VALUE_YES) || zzheVar == null) {
                zzkx.zzdi("No matching template id and mapper");
            } else {
                zzheVar.zzl(com.google.android.gms.dynamic.zze.zzac(view));
                if (!zzheVar.getOverrideImpressionRecording()) {
                    zzheVar.recordImpression();
                }
                zzmdVar.zzxc().zza("/nativeExpressViewClicked", zza((zzhd) null, zzheVar, zzaVar));
            }
        } catch (RemoteException e) {
            zzkx.zzc("Error occurred while recording impression and registering for clicks", e);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static void zza(zzmd zzmdVar) {
        View.OnClickListener zzxr = zzmdVar.zzxr();
        if (zzxr != null) {
            zzxr.onClick(zzmdVar.getView());
        }
    }

    private static void zza(final zzmd zzmdVar, final com.google.android.gms.ads.internal.formats.zzd zzdVar, final String str) {
        zzmdVar.zzxc().zza(new zzme.zza() { // from class: com.google.android.gms.ads.internal.zzn.1
            @Override // com.google.android.gms.internal.zzme.zza
            public void zza(zzmd zzmdVar2, boolean z) {
                try {
                    JSONObject jSONObject = new JSONObject();
                    jSONObject.put("headline", com.google.android.gms.ads.internal.formats.zzd.this.getHeadline());
                    jSONObject.put(TtmlNode.TAG_BODY, com.google.android.gms.ads.internal.formats.zzd.this.getBody());
                    jSONObject.put("call_to_action", com.google.android.gms.ads.internal.formats.zzd.this.getCallToAction());
                    jSONObject.put("price", com.google.android.gms.ads.internal.formats.zzd.this.getPrice());
                    jSONObject.put("star_rating", String.valueOf(com.google.android.gms.ads.internal.formats.zzd.this.getStarRating()));
                    jSONObject.put("store", com.google.android.gms.ads.internal.formats.zzd.this.getStore());
                    jSONObject.put(SettingsJsonConstants.APP_ICON_KEY, zzn.zza(com.google.android.gms.ads.internal.formats.zzd.this.zzmo()));
                    JSONArray jSONArray = new JSONArray();
                    List<Object> images = com.google.android.gms.ads.internal.formats.zzd.this.getImages();
                    if (images != null) {
                        for (Object obj : images) {
                            jSONArray.put(zzn.zza(zzn.zze(obj)));
                        }
                    }
                    jSONObject.put("images", jSONArray);
                    jSONObject.put("extras", zzn.zza(com.google.android.gms.ads.internal.formats.zzd.this.getExtras(), str));
                    JSONObject jSONObject2 = new JSONObject();
                    jSONObject2.put("assets", jSONObject);
                    jSONObject2.put("template_id", "2");
                    zzmdVar.zza("google.afma.nativeExpressAds.loadAssets", jSONObject2);
                } catch (JSONException e) {
                    zzkx.zzc("Exception occurred when loading assets", e);
                }
            }
        });
    }

    private static void zza(final zzmd zzmdVar, final com.google.android.gms.ads.internal.formats.zze zzeVar, final String str) {
        zzmdVar.zzxc().zza(new zzme.zza() { // from class: com.google.android.gms.ads.internal.zzn.2
            @Override // com.google.android.gms.internal.zzme.zza
            public void zza(zzmd zzmdVar2, boolean z) {
                try {
                    JSONObject jSONObject = new JSONObject();
                    jSONObject.put("headline", com.google.android.gms.ads.internal.formats.zze.this.getHeadline());
                    jSONObject.put(TtmlNode.TAG_BODY, com.google.android.gms.ads.internal.formats.zze.this.getBody());
                    jSONObject.put("call_to_action", com.google.android.gms.ads.internal.formats.zze.this.getCallToAction());
                    jSONObject.put("advertiser", com.google.android.gms.ads.internal.formats.zze.this.getAdvertiser());
                    jSONObject.put("logo", zzn.zza(com.google.android.gms.ads.internal.formats.zze.this.zzmt()));
                    JSONArray jSONArray = new JSONArray();
                    List<Object> images = com.google.android.gms.ads.internal.formats.zze.this.getImages();
                    if (images != null) {
                        for (Object obj : images) {
                            jSONArray.put(zzn.zza(zzn.zze(obj)));
                        }
                    }
                    jSONObject.put("images", jSONArray);
                    jSONObject.put("extras", zzn.zza(com.google.android.gms.ads.internal.formats.zze.this.getExtras(), str));
                    JSONObject jSONObject2 = new JSONObject();
                    jSONObject2.put("assets", jSONObject);
                    jSONObject2.put("template_id", AppEventsConstants.EVENT_PARAM_VALUE_YES);
                    zzmdVar.zza("google.afma.nativeExpressAds.loadAssets", jSONObject2);
                } catch (JSONException e) {
                    zzkx.zzc("Exception occurred when loading assets", e);
                }
            }
        });
    }

    private static void zza(zzmd zzmdVar, CountDownLatch countDownLatch) {
        zzmdVar.zzxc().zza("/nativeExpressAssetsLoaded", zza(countDownLatch));
        zzmdVar.zzxc().zza("/nativeExpressAssetsLoadingFailed", zzb(countDownLatch));
    }

    public static boolean zza(zzmd zzmdVar, zzgu zzguVar, CountDownLatch countDownLatch) {
        boolean z = false;
        try {
            z = zzb(zzmdVar, zzguVar, countDownLatch);
        } catch (RemoteException e) {
            zzkx.zzc("Unable to invoke load assets", e);
        } catch (RuntimeException e2) {
            countDownLatch.countDown();
            throw e2;
        }
        if (!z) {
            countDownLatch.countDown();
        }
        return z;
    }

    static zzfe zzb(final CountDownLatch countDownLatch) {
        return new zzfe() { // from class: com.google.android.gms.ads.internal.zzn.4
            @Override // com.google.android.gms.internal.zzfe
            public void zza(zzmd zzmdVar, Map<String, String> map) {
                zzkx.zzdi("Adapter returned an ad, but assets substitution failed");
                countDownLatch.countDown();
                zzmdVar.destroy();
            }
        };
    }

    private static String zzb(zzeg zzegVar) {
        String zza;
        try {
            com.google.android.gms.dynamic.zzd zzmn = zzegVar.zzmn();
            if (zzmn == null) {
                zzkx.zzdi("Drawable is null. Returning empty string");
                zza = "";
            } else {
                Drawable drawable = (Drawable) com.google.android.gms.dynamic.zze.zzae(zzmn);
                if (!(drawable instanceof BitmapDrawable)) {
                    zzkx.zzdi("Drawable is not an instance of BitmapDrawable. Returning empty string");
                    zza = "";
                } else {
                    zza = zza(((BitmapDrawable) drawable).getBitmap());
                }
            }
            return zza;
        } catch (RemoteException e) {
            zzkx.zzdi("Unable to get drawable. Returning empty string");
            return "";
        }
    }

    private static boolean zzb(zzmd zzmdVar, zzgu zzguVar, CountDownLatch countDownLatch) throws RemoteException {
        View view = zzmdVar.getView();
        if (view == null) {
            zzkx.zzdi("AdWebView is null");
            return false;
        }
        view.setVisibility(4);
        List<String> list = zzguVar.zzbwm.zzbvg;
        if (list == null || list.isEmpty()) {
            zzkx.zzdi("No template ids present in mediation response");
            return false;
        }
        zza(zzmdVar, countDownLatch);
        zzhd zzom = zzguVar.zzbwn.zzom();
        zzhe zzon = zzguVar.zzbwn.zzon();
        if (list.contains("2") && zzom != null) {
            zza(zzmdVar, zza(zzom), zzguVar.zzbwm.zzbvf);
        } else if (!list.contains(AppEventsConstants.EVENT_PARAM_VALUE_YES) || zzon == null) {
            zzkx.zzdi("No matching template id and mapper");
            return false;
        } else {
            zza(zzmdVar, zza(zzon), zzguVar.zzbwm.zzbvf);
        }
        String str = zzguVar.zzbwm.zzbvd;
        String str2 = zzguVar.zzbwm.zzbve;
        if (str2 != null) {
            zzmdVar.loadDataWithBaseURL(str2, str, "text/html", "UTF-8", null);
        } else {
            zzmdVar.loadData(str, "text/html", "UTF-8");
        }
        return true;
    }

    /* JADX INFO: Access modifiers changed from: private */
    @Nullable
    public static zzeg zze(Object obj) {
        if (obj instanceof IBinder) {
            return zzeg.zza.zzab((IBinder) obj);
        }
        return null;
    }

    @Nullable
    public static View zzg(@Nullable zzko zzkoVar) {
        if (zzkoVar == null) {
            zzkx.e("AdState is null");
            return null;
        } else if (zzh(zzkoVar) && zzkoVar.zzcbm != null) {
            return zzkoVar.zzcbm.getView();
        } else {
            try {
                com.google.android.gms.dynamic.zzd view = zzkoVar.zzbwn != null ? zzkoVar.zzbwn.getView() : null;
                if (view != null) {
                    return (View) com.google.android.gms.dynamic.zze.zzae(view);
                }
                zzkx.zzdi("View in mediation adapter is null.");
                return null;
            } catch (RemoteException e) {
                zzkx.zzc("Could not get View from mediation adapter.", e);
                return null;
            }
        }
    }

    public static boolean zzh(@Nullable zzko zzkoVar) {
        return (zzkoVar == null || !zzkoVar.zzclb || zzkoVar.zzbwm == null || zzkoVar.zzbwm.zzbvd == null) ? false : true;
    }
}
