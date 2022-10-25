package com.google.android.gms.ads.internal.formats;

import android.content.Context;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.os.IBinder;
import android.os.RemoteException;
import android.support.annotation.Nullable;
import android.text.TextUtils;
import android.view.MotionEvent;
import android.view.View;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.TextView;
import com.facebook.appevents.AppEventsConstants;
import com.facebook.common.util.UriUtil;
import com.google.android.gms.ads.internal.client.AdSizeParcel;
import com.google.android.gms.ads.internal.client.zzm;
import com.google.android.gms.ads.internal.formats.zzi;
import com.google.android.gms.ads.internal.util.client.VersionInfoParcel;
import com.google.android.gms.ads.internal.zzq;
import com.google.android.gms.ads.internal.zzu;
import com.google.android.gms.common.internal.zzaa;
import com.google.android.gms.internal.zzav;
import com.google.android.gms.internal.zzdr;
import com.google.android.gms.internal.zzeg;
import com.google.android.gms.internal.zzfe;
import com.google.android.gms.internal.zzgi;
import com.google.android.gms.internal.zzja;
import com.google.android.gms.internal.zzji;
import com.google.android.gms.internal.zzkx;
import com.google.android.gms.internal.zzmd;
import com.google.android.gms.internal.zzme;
import com.vk.webapp.ReportAppInputData;
import java.lang.ref.WeakReference;
import java.util.Map;
import org.json.JSONException;
import org.json.JSONObject;
@zzji
/* loaded from: classes.dex */
public class zzj implements zzi {
    private final Context mContext;
    @Nullable
    private final VersionInfoParcel zzanu;
    private final zzq zzbnr;
    @Nullable
    private final JSONObject zzbnu;
    @Nullable
    private final zzja zzbnv;
    @Nullable
    private final zzi.zza zzbnw;
    private final zzav zzbnx;
    boolean zzbny;
    private zzmd zzbnz;
    private String zzboa;
    @Nullable
    private String zzbob;
    private final Object zzako = new Object();
    private WeakReference<View> zzboc = null;

    /* renamed from: com.google.android.gms.ads.internal.formats.zzj$3  reason: invalid class name */
    /* loaded from: classes.dex */
    class AnonymousClass3 extends zzja.zza {
        AnonymousClass3() {
        }

        @Override // com.google.android.gms.internal.zzja.zza
        public void zze(final zzgi zzgiVar) {
            zzgiVar.zza("/loadHtml", new zzfe() { // from class: com.google.android.gms.ads.internal.formats.zzj.3.1
                @Override // com.google.android.gms.internal.zzfe
                public void zza(zzmd zzmdVar, final Map<String, String> map) {
                    zzj.this.zzbnz.zzxc().zza(new zzme.zza() { // from class: com.google.android.gms.ads.internal.formats.zzj.3.1.1
                        @Override // com.google.android.gms.internal.zzme.zza
                        public void zza(zzmd zzmdVar2, boolean z) {
                            zzj.this.zzboa = (String) map.get("id");
                            JSONObject jSONObject = new JSONObject();
                            try {
                                jSONObject.put("messageType", "htmlLoaded");
                                jSONObject.put("id", zzj.this.zzboa);
                                zzgiVar.zzb("sendMessageToNativeJs", jSONObject);
                            } catch (JSONException e) {
                                zzkx.zzb("Unable to dispatch sendMessageToNativeJs event", e);
                            }
                        }
                    });
                    String str = map.get("overlayHtml");
                    String str2 = map.get("baseUrl");
                    if (TextUtils.isEmpty(str2)) {
                        zzj.this.zzbnz.loadData(str, "text/html", "UTF-8");
                    } else {
                        zzj.this.zzbnz.loadDataWithBaseURL(str2, str, "text/html", "UTF-8", null);
                    }
                }
            });
            zzgiVar.zza("/showOverlay", new zzfe() { // from class: com.google.android.gms.ads.internal.formats.zzj.3.2
                @Override // com.google.android.gms.internal.zzfe
                public void zza(zzmd zzmdVar, Map<String, String> map) {
                    zzj.this.zzbnz.getView().setVisibility(0);
                }
            });
            zzgiVar.zza("/hideOverlay", new zzfe() { // from class: com.google.android.gms.ads.internal.formats.zzj.3.3
                @Override // com.google.android.gms.internal.zzfe
                public void zza(zzmd zzmdVar, Map<String, String> map) {
                    zzj.this.zzbnz.getView().setVisibility(8);
                }
            });
            zzj.this.zzbnz.zzxc().zza("/hideOverlay", new zzfe() { // from class: com.google.android.gms.ads.internal.formats.zzj.3.4
                @Override // com.google.android.gms.internal.zzfe
                public void zza(zzmd zzmdVar, Map<String, String> map) {
                    zzj.this.zzbnz.getView().setVisibility(8);
                }
            });
            zzj.this.zzbnz.zzxc().zza("/sendMessageToSdk", new zzfe() { // from class: com.google.android.gms.ads.internal.formats.zzj.3.5
                @Override // com.google.android.gms.internal.zzfe
                public void zza(zzmd zzmdVar, Map<String, String> map) {
                    JSONObject jSONObject = new JSONObject();
                    try {
                        for (String str : map.keySet()) {
                            jSONObject.put(str, map.get(str));
                        }
                        jSONObject.put("id", zzj.this.zzboa);
                        zzgiVar.zzb("sendMessageToNativeJs", jSONObject);
                    } catch (JSONException e) {
                        zzkx.zzb("Unable to dispatch sendMessageToNativeJs event", e);
                    }
                }
            });
        }
    }

    public zzj(Context context, zzq zzqVar, @Nullable zzja zzjaVar, zzav zzavVar, @Nullable JSONObject jSONObject, @Nullable zzi.zza zzaVar, @Nullable VersionInfoParcel versionInfoParcel, @Nullable String str) {
        this.mContext = context;
        this.zzbnr = zzqVar;
        this.zzbnv = zzjaVar;
        this.zzbnx = zzavVar;
        this.zzbnu = jSONObject;
        this.zzbnw = zzaVar;
        this.zzanu = versionInfoParcel;
        this.zzbob = str;
    }

    private JSONObject zza(Map<String, WeakReference<View>> map, View view) {
        JSONObject jSONObject = new JSONObject();
        if (map == null || view == null) {
            return jSONObject;
        }
        try {
            int[] zzk = zzk(view);
            for (Map.Entry<String, WeakReference<View>> entry : map.entrySet()) {
                View view2 = entry.getValue().get();
                if (view2 != null) {
                    int[] zzk2 = zzk(view2);
                    JSONObject jSONObject2 = new JSONObject();
                    jSONObject2.put("width", zzab(zzl(view2)));
                    jSONObject2.put("height", zzab(zzm(view2)));
                    jSONObject2.put("x", zzab(zzk2[0] - zzk[0]));
                    jSONObject2.put("y", zzab(zzk2[1] - zzk[1]));
                    jSONObject.put(entry.getKey(), jSONObject2);
                }
            }
        } catch (JSONException e) {
            zzkx.zzdi("Unable to get all view rectangles");
        }
        return jSONObject;
    }

    private JSONObject zzb(Rect rect) throws JSONException {
        JSONObject jSONObject = new JSONObject();
        jSONObject.put("x", zzab(rect.left));
        jSONObject.put("y", zzab(rect.top));
        jSONObject.put("width", zzab(rect.right - rect.left));
        jSONObject.put("height", zzab(rect.bottom - rect.top));
        jSONObject.put("relative_to", "self");
        return jSONObject;
    }

    private JSONObject zzb(Map<String, WeakReference<View>> map, View view) {
        JSONObject jSONObject;
        JSONObject jSONObject2 = new JSONObject();
        if (map == null || view == null) {
            return jSONObject2;
        }
        int[] zzk = zzk(view);
        for (Map.Entry<String, WeakReference<View>> entry : map.entrySet()) {
            View view2 = entry.getValue().get();
            if (view2 != null) {
                int[] zzk2 = zzk(view2);
                JSONObject jSONObject3 = new JSONObject();
                JSONObject jSONObject4 = new JSONObject();
                try {
                    jSONObject4.put("width", zzab(zzl(view2)));
                    jSONObject4.put("height", zzab(zzm(view2)));
                    jSONObject4.put("x", zzab(zzk2[0] - zzk[0]));
                    jSONObject4.put("y", zzab(zzk2[1] - zzk[1]));
                    jSONObject4.put("relative_to", "ad_view");
                    jSONObject3.put("frame", jSONObject4);
                    Rect rect = new Rect();
                    if (view2.getLocalVisibleRect(rect)) {
                        jSONObject = zzb(rect);
                    } else {
                        jSONObject = new JSONObject();
                        jSONObject.put("x", zzab(zzk2[0] - zzk[0]));
                        jSONObject.put("y", zzab(zzk2[1] - zzk[1]));
                        jSONObject.put("width", 0);
                        jSONObject.put("height", 0);
                        jSONObject.put("relative_to", "ad_view");
                    }
                    jSONObject3.put("visible_bounds", jSONObject);
                    if (view2 instanceof TextView) {
                        TextView textView = (TextView) view2;
                        jSONObject3.put("text_color", textView.getCurrentTextColor());
                        jSONObject3.put("font_size", textView.getTextSize());
                        jSONObject3.put("text", textView.getText());
                    }
                    jSONObject2.put(entry.getKey(), jSONObject3);
                } catch (JSONException e) {
                    zzkx.zzdi("Unable to get asset views information");
                }
            }
        }
        return jSONObject2;
    }

    private JSONObject zzn(View view) {
        JSONObject jSONObject = new JSONObject();
        if (view != null) {
            try {
                jSONObject.put("width", zzab(zzl(view)));
                jSONObject.put("height", zzab(zzm(view)));
            } catch (Exception e) {
                zzkx.zzdi("Unable to get native ad view bounding box");
            }
        }
        return jSONObject;
    }

    private JSONObject zzo(View view) {
        JSONObject jSONObject;
        JSONObject jSONObject2 = new JSONObject();
        if (view != null) {
            try {
                int[] zzk = zzk(view);
                JSONObject jSONObject3 = new JSONObject();
                jSONObject3.put("width", zzab(zzl(view)));
                jSONObject3.put("height", zzab(zzm(view)));
                jSONObject3.put("x", zzab(zzk[0]));
                jSONObject3.put("y", zzab(zzk[1]));
                jSONObject3.put("relative_to", "window");
                jSONObject2.put("frame", jSONObject3);
                Rect rect = new Rect();
                if (view.getGlobalVisibleRect(rect)) {
                    jSONObject = zzb(rect);
                } else {
                    jSONObject = new JSONObject();
                    jSONObject.put("x", zzab(zzk[0]));
                    jSONObject.put("y", zzab(zzk[1]));
                    jSONObject.put("width", 0);
                    jSONObject.put("height", 0);
                    jSONObject.put("relative_to", "window");
                }
                jSONObject2.put("visible_bounds", jSONObject);
            } catch (Exception e) {
                zzkx.zzdi("Unable to get native ad view bounding box");
            }
        }
        return jSONObject2;
    }

    @Override // com.google.android.gms.ads.internal.formats.zzi
    public Context getContext() {
        return this.mContext;
    }

    public zzb zza(View.OnClickListener onClickListener) {
        zza zzmr = this.zzbnw.zzmr();
        if (zzmr == null) {
            return null;
        }
        zzb zzbVar = new zzb(this.mContext, zzmr);
        zzbVar.setLayoutParams(new FrameLayout.LayoutParams(-1, -1));
        zzbVar.zzmm().setOnClickListener(onClickListener);
        zzbVar.zzmm().setContentDescription(zzdr.zzbjg.get());
        return zzbVar;
    }

    public void zza(View view, zzg zzgVar) {
        zzeg zze;
        if (!(this.zzbnw instanceof zzd)) {
            return;
        }
        zzd zzdVar = (zzd) this.zzbnw;
        FrameLayout.LayoutParams layoutParams = new FrameLayout.LayoutParams(-1, -1);
        if (zzdVar.zzms() != null) {
            ((FrameLayout) view).addView(zzdVar.zzms(), layoutParams);
            this.zzbnr.zza(zzgVar);
        } else if (zzdVar.getImages() == null || zzdVar.getImages().size() <= 0 || (zze = zze(zzdVar.getImages().get(0))) == null) {
        } else {
            try {
                com.google.android.gms.dynamic.zzd zzmn = zze.zzmn();
                if (zzmn == null) {
                    return;
                }
                ImageView zznb = zznb();
                zznb.setImageDrawable((Drawable) com.google.android.gms.dynamic.zze.zzae(zzmn));
                zznb.setScaleType(ImageView.ScaleType.CENTER_INSIDE);
                ((FrameLayout) view).addView(zznb, layoutParams);
            } catch (RemoteException e) {
                zzkx.zzdi("Could not get drawable from image");
            }
        }
    }

    @Override // com.google.android.gms.ads.internal.formats.zzi
    public void zza(View view, String str, @Nullable JSONObject jSONObject, Map<String, WeakReference<View>> map, View view2) {
        zzaa.zzhs("performClick must be called on the main UI thread.");
        try {
            JSONObject jSONObject2 = new JSONObject();
            jSONObject2.put(UriUtil.LOCAL_ASSET_SCHEME, str);
            jSONObject2.put("template", this.zzbnw.zzmq());
            final JSONObject jSONObject3 = new JSONObject();
            jSONObject3.put(ReportAppInputData.REPORT_TYPE_AD, this.zzbnu);
            jSONObject3.put("click", jSONObject2);
            jSONObject3.put("has_custom_click_handler", this.zzbnr.zzaa(this.zzbnw.getCustomTemplateId()) != null);
            if (zzdr.zzbji.get().booleanValue()) {
                if (zzdr.zzbjj.get().booleanValue()) {
                    jSONObject3.put("asset_view_signal", zzb(map, view2));
                    jSONObject3.put("ad_view_signal", zzo(view2));
                } else {
                    jSONObject3.put("view_rectangles", zza(map, view2));
                    jSONObject3.put("native_view_rectangle", zzn(view2));
                }
            }
            if (jSONObject != null) {
                jSONObject3.put("click_point", jSONObject);
            }
            try {
                JSONObject optJSONObject = this.zzbnu.optJSONObject("tracking_urls_and_actions");
                if (optJSONObject == null) {
                    optJSONObject = new JSONObject();
                }
                jSONObject2.put("click_signals", this.zzbnx.zzaz().zza(this.mContext, optJSONObject.optString("click_string"), view));
            } catch (Exception e) {
                zzkx.zzb("Exception obtaining click signals", e);
            }
            jSONObject3.put("ads_id", this.zzbob);
            this.zzbnv.zza(new zzja.zza() { // from class: com.google.android.gms.ads.internal.formats.zzj.1
                @Override // com.google.android.gms.internal.zzja.zza
                public void zze(zzgi zzgiVar) {
                    zzgiVar.zza("google.afma.nativeAds.handleClickGmsg", jSONObject3);
                }
            });
        } catch (JSONException e2) {
            zzkx.zzb("Unable to create click JSON.", e2);
        }
    }

    public void zza(View view, Map<String, WeakReference<View>> map, View.OnTouchListener onTouchListener, View.OnClickListener onClickListener) {
        if (!zzdr.zzbjd.get().booleanValue()) {
            return;
        }
        view.setOnTouchListener(onTouchListener);
        view.setClickable(true);
        view.setOnClickListener(onClickListener);
        for (Map.Entry<String, WeakReference<View>> entry : map.entrySet()) {
            View view2 = entry.getValue().get();
            if (view2 != null) {
                view2.setOnTouchListener(onTouchListener);
                view2.setClickable(true);
                view2.setOnClickListener(onClickListener);
            }
        }
    }

    @Override // com.google.android.gms.ads.internal.formats.zzi
    public void zza(View view, Map<String, WeakReference<View>> map, JSONObject jSONObject, View view2) {
        zzaa.zzhs("performClick must be called on the main UI thread.");
        for (Map.Entry<String, WeakReference<View>> entry : map.entrySet()) {
            if (view.equals(entry.getValue().get())) {
                zza(view, entry.getKey(), jSONObject, map, view2);
                return;
            }
        }
        if ("2".equals(this.zzbnw.zzmq())) {
            zza(view, "2099", jSONObject, map, view2);
        } else if (AppEventsConstants.EVENT_PARAM_VALUE_YES.equals(this.zzbnw.zzmq())) {
            zza(view, "1099", jSONObject, map, view2);
        }
    }

    int zzab(int i) {
        return zzm.zzkr().zzc(this.mContext, i);
    }

    @Override // com.google.android.gms.ads.internal.formats.zzi
    public void zzb(View view, Map<String, WeakReference<View>> map) {
        zzaa.zzhs("recordImpression must be called on the main UI thread.");
        zzr(true);
        try {
            final JSONObject jSONObject = new JSONObject();
            jSONObject.put(ReportAppInputData.REPORT_TYPE_AD, this.zzbnu);
            jSONObject.put("ads_id", this.zzbob);
            if (zzdr.zzbji.get().booleanValue()) {
                if (zzdr.zzbjj.get().booleanValue()) {
                    jSONObject.put("asset_view_signal", zzb(map, view));
                    jSONObject.put("ad_view_signal", zzo(view));
                } else {
                    jSONObject.put("view_rectangles", zza(map, view));
                    jSONObject.put("native_view_rectangle", zzn(view));
                }
            }
            this.zzbnv.zza(new zzja.zza() { // from class: com.google.android.gms.ads.internal.formats.zzj.2
                @Override // com.google.android.gms.internal.zzja.zza
                public void zze(zzgi zzgiVar) {
                    zzgiVar.zza("google.afma.nativeAds.handleImpressionPing", jSONObject);
                }
            });
        } catch (JSONException e) {
            zzkx.zzb("Unable to create impression JSON.", e);
        }
        this.zzbnr.zza(this);
    }

    @Override // com.google.android.gms.ads.internal.formats.zzi
    public void zzc(View view, Map<String, WeakReference<View>> map) {
        if (zzdr.zzbjc.get().booleanValue()) {
            return;
        }
        view.setOnTouchListener(null);
        view.setClickable(false);
        view.setOnClickListener(null);
        for (Map.Entry<String, WeakReference<View>> entry : map.entrySet()) {
            View view2 = entry.getValue().get();
            if (view2 != null) {
                view2.setOnTouchListener(null);
                view2.setClickable(false);
                view2.setOnClickListener(null);
            }
        }
    }

    @Override // com.google.android.gms.ads.internal.formats.zzi
    public void zzd(MotionEvent motionEvent) {
        this.zzbnx.zza(motionEvent);
    }

    @Override // com.google.android.gms.ads.internal.formats.zzi
    public void zzd(View view, Map<String, WeakReference<View>> map) {
        synchronized (this.zzako) {
            if (this.zzbny) {
                return;
            }
            if (!view.isShown()) {
                return;
            }
            if (!view.getGlobalVisibleRect(new Rect(), null)) {
                return;
            }
            zzb(view, map);
        }
    }

    @Nullable
    zzeg zze(Object obj) {
        if (obj instanceof IBinder) {
            return zzeg.zza.zzab((IBinder) obj);
        }
        return null;
    }

    @Override // com.google.android.gms.ads.internal.formats.zzi
    public void zzj(View view) {
        this.zzboc = new WeakReference<>(view);
    }

    int[] zzk(View view) {
        int[] iArr = new int[2];
        view.getLocationOnScreen(iArr);
        return iArr;
    }

    int zzl(View view) {
        return view.getMeasuredWidth();
    }

    int zzm(View view) {
        return view.getMeasuredHeight();
    }

    public zzmd zzmx() {
        this.zzbnz = zzna();
        this.zzbnz.getView().setVisibility(8);
        this.zzbnv.zza(new AnonymousClass3());
        return this.zzbnz;
    }

    @Override // com.google.android.gms.ads.internal.formats.zzi
    public View zzmy() {
        if (this.zzboc != null) {
            return this.zzboc.get();
        }
        return null;
    }

    public void zzmz() {
        if (!(this.zzbnw instanceof zzd)) {
            return;
        }
        this.zzbnr.zzfw();
    }

    zzmd zzna() {
        return zzu.zzgn().zza(this.mContext, AdSizeParcel.zzj(this.mContext), false, false, this.zzbnx, this.zzanu);
    }

    ImageView zznb() {
        return new ImageView(this.mContext);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void zzr(boolean z) {
        this.zzbny = z;
    }
}
