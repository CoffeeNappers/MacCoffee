package com.google.android.gms.internal;

import android.app.KeyguardManager;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.graphics.Rect;
import android.os.PowerManager;
import android.support.annotation.Nullable;
import android.text.TextUtils;
import android.util.DisplayMetrics;
import android.view.View;
import android.view.ViewTreeObserver;
import android.view.WindowManager;
import com.facebook.appevents.AppEventsConstants;
import com.google.android.gms.ads.internal.client.AdSizeParcel;
import com.google.android.gms.ads.internal.util.client.VersionInfoParcel;
import io.sentry.marshaller.json.JsonMarshaller;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Map;
import java.util.UUID;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
@zzji
/* loaded from: classes.dex */
public class zzcp implements ViewTreeObserver.OnGlobalLayoutListener, ViewTreeObserver.OnScrollChangedListener {
    private final Context zzatc;
    private final WeakReference<zzko> zzate;
    private final zzcw zzatg;
    protected final zzcn zzath;
    private final WindowManager zzati;
    private final PowerManager zzatj;
    private final KeyguardManager zzatk;
    @Nullable
    private zzcq zzatl;
    private boolean zzatm;
    private boolean zzatp;
    @Nullable
    BroadcastReceiver zzatr;
    protected final Object zzako = new Object();
    private boolean zzapl = false;
    private boolean zzatn = false;
    private final HashSet<zzcm> zzats = new HashSet<>();
    private final HashSet<zzct> zzatt = new HashSet<>();
    private WeakReference<ViewTreeObserver> zzatf = new WeakReference<>(null);
    private boolean zzato = true;
    private boolean zzatq = false;
    private zzlm zzasn = new zzlm(200);

    /* loaded from: classes2.dex */
    public static class zza implements zzcw {
        private WeakReference<com.google.android.gms.ads.internal.formats.zzi> zzatv;

        public zza(com.google.android.gms.ads.internal.formats.zzi zziVar) {
            this.zzatv = new WeakReference<>(zziVar);
        }

        @Override // com.google.android.gms.internal.zzcw
        @Nullable
        public View zzir() {
            com.google.android.gms.ads.internal.formats.zzi zziVar = this.zzatv.get();
            if (zziVar != null) {
                return zziVar.zzmy();
            }
            return null;
        }

        @Override // com.google.android.gms.internal.zzcw
        public boolean zzis() {
            return this.zzatv.get() == null;
        }

        @Override // com.google.android.gms.internal.zzcw
        public zzcw zzit() {
            return new zzb(this.zzatv.get());
        }
    }

    /* loaded from: classes2.dex */
    public static class zzb implements zzcw {
        private com.google.android.gms.ads.internal.formats.zzi zzatw;

        public zzb(com.google.android.gms.ads.internal.formats.zzi zziVar) {
            this.zzatw = zziVar;
        }

        @Override // com.google.android.gms.internal.zzcw
        public View zzir() {
            if (this.zzatw != null) {
                return this.zzatw.zzmy();
            }
            return null;
        }

        @Override // com.google.android.gms.internal.zzcw
        public boolean zzis() {
            return this.zzatw == null;
        }

        @Override // com.google.android.gms.internal.zzcw
        public zzcw zzit() {
            return this;
        }
    }

    /* loaded from: classes2.dex */
    public static class zzc implements zzcw {
        @Nullable
        private final View mView;
        @Nullable
        private final zzko zzatx;

        public zzc(View view, zzko zzkoVar) {
            this.mView = view;
            this.zzatx = zzkoVar;
        }

        @Override // com.google.android.gms.internal.zzcw
        public View zzir() {
            return this.mView;
        }

        @Override // com.google.android.gms.internal.zzcw
        public boolean zzis() {
            return this.zzatx == null || this.mView == null;
        }

        @Override // com.google.android.gms.internal.zzcw
        public zzcw zzit() {
            return this;
        }
    }

    /* loaded from: classes2.dex */
    public static class zzd implements zzcw {
        private final WeakReference<View> zzaty;
        private final WeakReference<zzko> zzatz;

        public zzd(View view, zzko zzkoVar) {
            this.zzaty = new WeakReference<>(view);
            this.zzatz = new WeakReference<>(zzkoVar);
        }

        @Override // com.google.android.gms.internal.zzcw
        public View zzir() {
            return this.zzaty.get();
        }

        @Override // com.google.android.gms.internal.zzcw
        public boolean zzis() {
            return this.zzaty.get() == null || this.zzatz.get() == null;
        }

        @Override // com.google.android.gms.internal.zzcw
        public zzcw zzit() {
            return new zzc(this.zzaty.get(), this.zzatz.get());
        }
    }

    public zzcp(Context context, AdSizeParcel adSizeParcel, zzko zzkoVar, VersionInfoParcel versionInfoParcel, zzcw zzcwVar) {
        this.zzate = new WeakReference<>(zzkoVar);
        this.zzatg = zzcwVar;
        this.zzath = new zzcn(UUID.randomUUID().toString(), versionInfoParcel, adSizeParcel.zzazq, zzkoVar.zzcsi, zzkoVar.zzic(), adSizeParcel.zzazt);
        this.zzati = (WindowManager) context.getSystemService("window");
        this.zzatj = (PowerManager) context.getApplicationContext().getSystemService("power");
        this.zzatk = (KeyguardManager) context.getSystemService("keyguard");
        this.zzatc = context;
    }

    protected void destroy() {
        synchronized (this.zzako) {
            zzik();
            zzif();
            this.zzato = false;
            zzih();
            zzim();
        }
    }

    boolean isScreenOn() {
        return this.zzatj.isScreenOn();
    }

    @Override // android.view.ViewTreeObserver.OnGlobalLayoutListener
    public void onGlobalLayout() {
        zzk(2);
    }

    @Override // android.view.ViewTreeObserver.OnScrollChangedListener
    public void onScrollChanged() {
        zzk(1);
    }

    public void pause() {
        synchronized (this.zzako) {
            this.zzapl = true;
            zzk(3);
        }
    }

    public void resume() {
        synchronized (this.zzako) {
            this.zzapl = false;
            zzk(3);
        }
    }

    public void stop() {
        synchronized (this.zzako) {
            this.zzatn = true;
            zzk(3);
        }
    }

    protected int zza(int i, DisplayMetrics displayMetrics) {
        return (int) (i / displayMetrics.density);
    }

    JSONObject zza(JSONObject jSONObject) throws JSONException {
        JSONArray jSONArray = new JSONArray();
        JSONObject jSONObject2 = new JSONObject();
        jSONArray.put(jSONObject);
        jSONObject2.put("units", jSONArray);
        return jSONObject2;
    }

    protected void zza(View view, Map<String, String> map) {
        zzk(3);
    }

    public void zza(zzcq zzcqVar) {
        synchronized (this.zzako) {
            this.zzatl = zzcqVar;
        }
    }

    public void zza(zzct zzctVar) {
        if (this.zzatt.isEmpty()) {
            zzie();
            zzk(3);
        }
        this.zzatt.add(zzctVar);
        try {
            zzctVar.zzc(zza(zzd(this.zzatg.zzir())), false);
        } catch (JSONException e) {
            zzkx.zzb("Skipping measurement update for new client.", e);
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void zza(zzct zzctVar, Map<String, String> map) {
        String valueOf = String.valueOf(this.zzath.zzib());
        zzkx.zzdg(valueOf.length() != 0 ? "Received request to untrack: ".concat(valueOf) : new String("Received request to untrack: "));
        zzb(zzctVar);
    }

    protected void zza(JSONObject jSONObject, boolean z) {
        try {
            zzb(zza(jSONObject), z);
        } catch (Throwable th) {
            zzkx.zzb("Skipping active view message.", th);
        }
    }

    public void zzb(zzct zzctVar) {
        this.zzatt.remove(zzctVar);
        zzctVar.zziv();
        if (this.zzatt.isEmpty()) {
            destroy();
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void zzb(zzmd zzmdVar, Map<String, String> map) {
        zza(zzmdVar.getView(), map);
    }

    protected void zzb(JSONObject jSONObject, boolean z) {
        Iterator it = new ArrayList(this.zzatt).iterator();
        while (it.hasNext()) {
            ((zzct) it.next()).zzc(jSONObject, z);
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public boolean zzb(@Nullable Map<String, String> map) {
        if (map == null) {
            return false;
        }
        String str = map.get("hashCode");
        return !TextUtils.isEmpty(str) && str.equals(this.zzath.zzib());
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void zzc(Map<String, String> map) {
        if (!map.containsKey("isVisible")) {
            return;
        }
        zzj(AppEventsConstants.EVENT_PARAM_VALUE_YES.equals(map.get("isVisible")) || "true".equals(map.get("isVisible")));
    }

    protected JSONObject zzd(@Nullable View view) throws JSONException {
        if (view == null) {
            return zzio();
        }
        boolean isAttachedToWindow = com.google.android.gms.ads.internal.zzu.zzgo().isAttachedToWindow(view);
        int[] iArr = new int[2];
        int[] iArr2 = new int[2];
        try {
            view.getLocationOnScreen(iArr);
            view.getLocationInWindow(iArr2);
        } catch (Exception e) {
            zzkx.zzb("Failure getting view location.", e);
        }
        DisplayMetrics displayMetrics = view.getContext().getResources().getDisplayMetrics();
        Rect rect = new Rect();
        rect.left = iArr[0];
        rect.top = iArr[1];
        rect.right = rect.left + view.getWidth();
        rect.bottom = rect.top + view.getHeight();
        Rect rect2 = new Rect();
        rect2.right = this.zzati.getDefaultDisplay().getWidth();
        rect2.bottom = this.zzati.getDefaultDisplay().getHeight();
        Rect rect3 = new Rect();
        boolean globalVisibleRect = view.getGlobalVisibleRect(rect3, null);
        Rect rect4 = new Rect();
        boolean localVisibleRect = view.getLocalVisibleRect(rect4);
        Rect rect5 = new Rect();
        view.getHitRect(rect5);
        JSONObject zzil = zzil();
        zzil.put("windowVisibility", view.getWindowVisibility()).put("isAttachedToWindow", isAttachedToWindow).put("viewBox", new JSONObject().put("top", zza(rect2.top, displayMetrics)).put("bottom", zza(rect2.bottom, displayMetrics)).put("left", zza(rect2.left, displayMetrics)).put("right", zza(rect2.right, displayMetrics))).put("adBox", new JSONObject().put("top", zza(rect.top, displayMetrics)).put("bottom", zza(rect.bottom, displayMetrics)).put("left", zza(rect.left, displayMetrics)).put("right", zza(rect.right, displayMetrics))).put("globalVisibleBox", new JSONObject().put("top", zza(rect3.top, displayMetrics)).put("bottom", zza(rect3.bottom, displayMetrics)).put("left", zza(rect3.left, displayMetrics)).put("right", zza(rect3.right, displayMetrics))).put("globalVisibleBoxVisible", globalVisibleRect).put("localVisibleBox", new JSONObject().put("top", zza(rect4.top, displayMetrics)).put("bottom", zza(rect4.bottom, displayMetrics)).put("left", zza(rect4.left, displayMetrics)).put("right", zza(rect4.right, displayMetrics))).put("localVisibleBoxVisible", localVisibleRect).put("hitBox", new JSONObject().put("top", zza(rect5.top, displayMetrics)).put("bottom", zza(rect5.bottom, displayMetrics)).put("left", zza(rect5.left, displayMetrics)).put("right", zza(rect5.right, displayMetrics))).put("screenDensity", displayMetrics.density).put("isVisible", com.google.android.gms.ads.internal.zzu.zzgm().zza(view, this.zzatj, this.zzatk));
        return zzil;
    }

    protected void zzie() {
        synchronized (this.zzako) {
            if (this.zzatr != null) {
                return;
            }
            IntentFilter intentFilter = new IntentFilter();
            intentFilter.addAction("android.intent.action.SCREEN_ON");
            intentFilter.addAction("android.intent.action.SCREEN_OFF");
            this.zzatr = new BroadcastReceiver() { // from class: com.google.android.gms.internal.zzcp.1
                @Override // android.content.BroadcastReceiver
                public void onReceive(Context context, Intent intent) {
                    zzcp.this.zzk(3);
                }
            };
            this.zzatc.registerReceiver(this.zzatr, intentFilter);
        }
    }

    protected void zzif() {
        synchronized (this.zzako) {
            if (this.zzatr != null) {
                try {
                    this.zzatc.unregisterReceiver(this.zzatr);
                } catch (IllegalStateException e) {
                    zzkx.zzb("Failed trying to unregister the receiver", e);
                } catch (Exception e2) {
                    com.google.android.gms.ads.internal.zzu.zzgq().zza(e2, "ActiveViewUnit.stopScreenStatusMonitoring");
                }
                this.zzatr = null;
            }
        }
    }

    public void zzig() {
        synchronized (this.zzako) {
            if (this.zzato) {
                this.zzatp = true;
                try {
                    try {
                        zza(zzip(), true);
                    } catch (RuntimeException e) {
                        zzkx.zzb("Failure while processing active view data.", e);
                    }
                } catch (JSONException e2) {
                    zzkx.zzb("JSON failure while processing active view data.", e2);
                }
                String valueOf = String.valueOf(this.zzath.zzib());
                zzkx.zzdg(valueOf.length() != 0 ? "Untracking ad unit: ".concat(valueOf) : new String("Untracking ad unit: "));
            }
        }
    }

    protected void zzih() {
        if (this.zzatl != null) {
            this.zzatl.zza(this);
        }
    }

    public boolean zzii() {
        boolean z;
        synchronized (this.zzako) {
            z = this.zzato;
        }
        return z;
    }

    protected void zzij() {
        ViewTreeObserver viewTreeObserver;
        ViewTreeObserver viewTreeObserver2;
        View zzir = this.zzatg.zzit().zzir();
        if (zzir == null || (viewTreeObserver2 = zzir.getViewTreeObserver()) == (viewTreeObserver = this.zzatf.get())) {
            return;
        }
        zzik();
        if (!this.zzatm || (viewTreeObserver != null && viewTreeObserver.isAlive())) {
            this.zzatm = true;
            viewTreeObserver2.addOnScrollChangedListener(this);
            viewTreeObserver2.addOnGlobalLayoutListener(this);
        }
        this.zzatf = new WeakReference<>(viewTreeObserver2);
    }

    protected void zzik() {
        ViewTreeObserver viewTreeObserver = this.zzatf.get();
        if (viewTreeObserver == null || !viewTreeObserver.isAlive()) {
            return;
        }
        viewTreeObserver.removeOnScrollChangedListener(this);
        viewTreeObserver.removeGlobalOnLayoutListener(this);
    }

    protected JSONObject zzil() throws JSONException {
        JSONObject jSONObject = new JSONObject();
        jSONObject.put("afmaVersion", this.zzath.zzhz()).put("activeViewJSON", this.zzath.zzia()).put(JsonMarshaller.TIMESTAMP, com.google.android.gms.ads.internal.zzu.zzgs().elapsedRealtime()).put("adFormat", this.zzath.zzhy()).put("hashCode", this.zzath.zzib()).put("isMraid", this.zzath.zzic()).put("isStopped", this.zzatn).put("isPaused", this.zzapl).put("isScreenOn", isScreenOn()).put("isNative", this.zzath.zzid()).put("appMuted", com.google.android.gms.ads.internal.zzu.zzgm().zzft()).put("appVolume", com.google.android.gms.ads.internal.zzu.zzgm().zzfr()).put("deviceVolume", com.google.android.gms.ads.internal.zzu.zzgm().zzah(this.zzatc));
        return jSONObject;
    }

    protected void zzim() {
        Iterator it = new ArrayList(this.zzatt).iterator();
        while (it.hasNext()) {
            zzb((zzct) it.next());
        }
    }

    protected boolean zzin() {
        Iterator<zzct> it = this.zzatt.iterator();
        while (it.hasNext()) {
            if (it.next().zziu()) {
                return true;
            }
        }
        return false;
    }

    protected JSONObject zzio() throws JSONException {
        return zzil().put("isAttachedToWindow", false).put("isScreenOn", isScreenOn()).put("isVisible", false);
    }

    protected JSONObject zzip() throws JSONException {
        JSONObject zzil = zzil();
        zzil.put("doneReasonCode", "u");
        return zzil;
    }

    public zzcn zziq() {
        return this.zzath;
    }

    protected void zzj(boolean z) {
        Iterator<zzcm> it = this.zzats.iterator();
        while (it.hasNext()) {
            it.next().zza(this, z);
        }
    }

    protected void zzk(int i) {
        boolean z = false;
        synchronized (this.zzako) {
            if (!zzin() || !this.zzato) {
                return;
            }
            View zzir = this.zzatg.zzir();
            boolean z2 = zzir != null && com.google.android.gms.ads.internal.zzu.zzgm().zza(zzir, this.zzatj, this.zzatk) && zzir.getGlobalVisibleRect(new Rect(), null);
            if (this.zzatg.zzis()) {
                zzig();
                return;
            }
            if (i == 1) {
                z = true;
            }
            if (z && !this.zzasn.tryAcquire() && z2 == this.zzatq) {
                return;
            }
            if (!z2 && !this.zzatq && i == 1) {
                return;
            }
            try {
                zza(zzd(zzir), false);
                this.zzatq = z2;
            } catch (RuntimeException | JSONException e) {
                zzkx.zza("Active view update failed.", e);
            }
            zzij();
            zzih();
        }
    }
}
