package com.google.android.gms.ads.internal.overlay;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.content.res.Configuration;
import android.graphics.Bitmap;
import android.graphics.Color;
import android.graphics.drawable.Drawable;
import android.os.Bundle;
import android.support.v4.view.ViewCompat;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.view.Window;
import android.webkit.WebChromeClient;
import android.widget.FrameLayout;
import android.widget.RelativeLayout;
import com.google.android.gms.internal.zzdr;
import com.google.android.gms.internal.zzhy;
import com.google.android.gms.internal.zzji;
import com.google.android.gms.internal.zzkw;
import com.google.android.gms.internal.zzkx;
import com.google.android.gms.internal.zzlb;
import com.google.android.gms.internal.zzle;
import com.google.android.gms.internal.zzmd;
import com.google.android.gms.internal.zzme;
import java.util.Collections;
import java.util.Map;
import java.util.concurrent.Future;
@zzji
/* loaded from: classes.dex */
public class zzd extends zzhy.zza implements zzu {
    static final int zzcak = Color.argb(0, 0, 0, 0);
    private final Activity mActivity;
    zzmd zzbnz;
    AdOverlayInfoParcel zzcal;
    zzc zzcam;
    zzo zzcan;
    FrameLayout zzcap;
    WebChromeClient.CustomViewCallback zzcaq;
    zzb zzcat;
    private Runnable zzcay;
    private boolean zzcaz;
    private boolean zzcba;
    boolean zzcao = false;
    boolean zzcar = false;
    boolean zzcas = false;
    boolean zzcau = false;
    int zzcav = 0;
    private final Object zzcax = new Object();
    private boolean zzcbb = false;
    private boolean zzcbc = false;
    private boolean zzcbd = true;
    zzl zzcaw = new zzs();

    /* JADX INFO: Access modifiers changed from: private */
    @zzji
    /* loaded from: classes.dex */
    public static final class zza extends Exception {
        public zza(String str) {
            super(str);
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    @zzji
    /* loaded from: classes.dex */
    public static class zzb extends RelativeLayout {
        zzle zzasr;
        boolean zzcbf;

        public zzb(Context context, String str) {
            super(context);
            this.zzasr = new zzle(context, str);
        }

        void disable() {
            this.zzcbf = true;
        }

        @Override // android.view.ViewGroup
        public boolean onInterceptTouchEvent(MotionEvent motionEvent) {
            if (!this.zzcbf) {
                this.zzasr.zzg(motionEvent);
                return false;
            }
            return false;
        }
    }

    @zzji
    /* loaded from: classes.dex */
    public static class zzc {
        public final int index;
        public final ViewGroup parent;
        public final Context zzahs;
        public final ViewGroup.LayoutParams zzcbg;

        public zzc(zzmd zzmdVar) throws zza {
            this.zzcbg = zzmdVar.getLayoutParams();
            ViewParent parent = zzmdVar.getParent();
            this.zzahs = zzmdVar.zzwz();
            if (parent == null || !(parent instanceof ViewGroup)) {
                throw new zza("Could not get the parent of the WebView for an overlay.");
            }
            this.parent = (ViewGroup) parent;
            this.index = this.parent.indexOfChild(zzmdVar.getView());
            this.parent.removeView(zzmdVar.getView());
            zzmdVar.zzak(true);
        }
    }

    @zzji
    /* renamed from: com.google.android.gms.ads.internal.overlay.zzd$zzd  reason: collision with other inner class name */
    /* loaded from: classes.dex */
    private class C0021zzd extends zzkw {
        private C0021zzd() {
        }

        @Override // com.google.android.gms.internal.zzkw
        public void onStop() {
        }

        @Override // com.google.android.gms.internal.zzkw
        public void zzfp() {
            Bitmap zza = com.google.android.gms.ads.internal.zzu.zzhh().zza(Integer.valueOf(zzd.this.zzcal.zzcbv.zzaop));
            if (zza != null) {
                final Drawable zza2 = com.google.android.gms.ads.internal.zzu.zzgo().zza(zzd.this.mActivity, zza, zzd.this.zzcal.zzcbv.zzaon, zzd.this.zzcal.zzcbv.zzaoo);
                zzlb.zzcvl.post(new Runnable() { // from class: com.google.android.gms.ads.internal.overlay.zzd.zzd.1
                    @Override // java.lang.Runnable
                    public void run() {
                        zzd.this.mActivity.getWindow().setBackgroundDrawable(zza2);
                    }
                });
            }
        }
    }

    public zzd(Activity activity) {
        this.mActivity = activity;
    }

    public void close() {
        this.zzcav = 2;
        this.mActivity.finish();
    }

    @Override // com.google.android.gms.internal.zzhy
    public void onActivityResult(int i, int i2, Intent intent) {
    }

    @Override // com.google.android.gms.internal.zzhy
    public void onBackPressed() {
        this.zzcav = 0;
    }

    @Override // com.google.android.gms.internal.zzhy
    public void onCreate(Bundle bundle) {
        boolean z = false;
        this.mActivity.requestWindowFeature(1);
        if (bundle != null) {
            z = bundle.getBoolean("com.google.android.gms.ads.internal.overlay.hasResumed", false);
        }
        this.zzcar = z;
        try {
            this.zzcal = AdOverlayInfoParcel.zzb(this.mActivity.getIntent());
            if (this.zzcal == null) {
                throw new zza("Could not get info for ad overlay.");
            }
            if (this.zzcal.zzari.zzcyb > 7500000) {
                this.zzcav = 3;
            }
            if (this.mActivity.getIntent() != null) {
                this.zzcbd = this.mActivity.getIntent().getBooleanExtra("shouldCallOnOverlayOpened", true);
            }
            if (this.zzcal.zzcbv != null) {
                this.zzcas = this.zzcal.zzcbv.zzaok;
            } else {
                this.zzcas = false;
            }
            if (zzdr.zzbip.get().booleanValue() && this.zzcas && this.zzcal.zzcbv.zzaop != -1) {
                Future future = (Future) new C0021zzd().zzrz();
            }
            if (bundle == null) {
                if (this.zzcal.zzcbl != null && this.zzcbd) {
                    this.zzcal.zzcbl.zzer();
                }
                if (this.zzcal.zzcbs != 1 && this.zzcal.zzcbk != null) {
                    this.zzcal.zzcbk.onAdClicked();
                }
            }
            this.zzcat = new zzb(this.mActivity, this.zzcal.zzcbu);
            this.zzcat.setId(1000);
            switch (this.zzcal.zzcbs) {
                case 1:
                    zzab(false);
                    return;
                case 2:
                    this.zzcam = new zzc(this.zzcal.zzcbm);
                    zzab(false);
                    return;
                case 3:
                    zzab(true);
                    return;
                case 4:
                    if (this.zzcar) {
                        this.zzcav = 3;
                        this.mActivity.finish();
                        return;
                    } else if (com.google.android.gms.ads.internal.zzu.zzgj().zza(this.mActivity, this.zzcal.zzcbj, this.zzcal.zzcbr)) {
                        return;
                    } else {
                        this.zzcav = 3;
                        this.mActivity.finish();
                        return;
                    }
                default:
                    throw new zza("Could not determine ad overlay type.");
            }
        } catch (zza e) {
            zzkx.zzdi(e.getMessage());
            this.zzcav = 3;
            this.mActivity.finish();
        }
    }

    @Override // com.google.android.gms.internal.zzhy
    public void onDestroy() {
        if (this.zzbnz != null) {
            this.zzcat.removeView(this.zzbnz.getView());
        }
        zzpp();
    }

    @Override // com.google.android.gms.internal.zzhy
    public void onPause() {
        this.zzcaw.pause();
        zzpl();
        if (this.zzcal.zzcbl != null) {
            this.zzcal.zzcbl.onPause();
        }
        if (!zzdr.zzblf.get().booleanValue() && this.zzbnz != null && (!this.mActivity.isFinishing() || this.zzcam == null)) {
            com.google.android.gms.ads.internal.zzu.zzgo().zzl(this.zzbnz);
        }
        zzpp();
    }

    @Override // com.google.android.gms.internal.zzhy
    public void onRestart() {
    }

    @Override // com.google.android.gms.internal.zzhy
    public void onResume() {
        if (this.zzcal != null && this.zzcal.zzcbs == 4) {
            if (this.zzcar) {
                this.zzcav = 3;
                this.mActivity.finish();
            } else {
                this.zzcar = true;
            }
        }
        if (this.zzcal.zzcbl != null) {
            this.zzcal.zzcbl.onResume();
        }
        if (!zzdr.zzblf.get().booleanValue()) {
            if (this.zzbnz == null || this.zzbnz.isDestroyed()) {
                zzkx.zzdi("The webview does not exist. Ignoring action.");
            } else {
                com.google.android.gms.ads.internal.zzu.zzgo().zzm(this.zzbnz);
            }
        }
        this.zzcaw.resume();
    }

    @Override // com.google.android.gms.internal.zzhy
    public void onSaveInstanceState(Bundle bundle) {
        bundle.putBoolean("com.google.android.gms.ads.internal.overlay.hasResumed", this.zzcar);
    }

    @Override // com.google.android.gms.internal.zzhy
    public void onStart() {
        if (zzdr.zzblf.get().booleanValue()) {
            if (this.zzbnz == null || this.zzbnz.isDestroyed()) {
                zzkx.zzdi("The webview does not exist. Ignoring action.");
            } else {
                com.google.android.gms.ads.internal.zzu.zzgo().zzm(this.zzbnz);
            }
        }
    }

    @Override // com.google.android.gms.internal.zzhy
    public void onStop() {
        if (zzdr.zzblf.get().booleanValue() && this.zzbnz != null && (!this.mActivity.isFinishing() || this.zzcam == null)) {
            com.google.android.gms.ads.internal.zzu.zzgo().zzl(this.zzbnz);
        }
        zzpp();
    }

    public void setRequestedOrientation(int i) {
        this.mActivity.setRequestedOrientation(i);
    }

    public void zza(View view, WebChromeClient.CustomViewCallback customViewCallback) {
        this.zzcap = new FrameLayout(this.mActivity);
        this.zzcap.setBackgroundColor(ViewCompat.MEASURED_STATE_MASK);
        this.zzcap.addView(view, -1, -1);
        this.mActivity.setContentView(this.zzcap);
        zzds();
        this.zzcaq = customViewCallback;
        this.zzcao = true;
    }

    public void zza(boolean z, boolean z2) {
        if (this.zzcan != null) {
            this.zzcan.zza(z, z2);
        }
    }

    public void zzaa(boolean z) {
        this.zzcan = new zzo(this.mActivity, z ? 50 : 32, this);
        RelativeLayout.LayoutParams layoutParams = new RelativeLayout.LayoutParams(-2, -2);
        layoutParams.addRule(10);
        layoutParams.addRule(z ? 11 : 9);
        this.zzcan.zza(z, this.zzcal.zzcbp);
        this.zzcat.addView(this.zzcan, layoutParams);
    }

    protected void zzab(boolean z) throws zza {
        if (!this.zzcba) {
            this.mActivity.requestWindowFeature(1);
        }
        Window window = this.mActivity.getWindow();
        if (window == null) {
            throw new zza("Invalid activity, no window available.");
        }
        boolean zza2 = (!com.google.android.gms.common.util.zzs.isAtLeastN() || !zzdr.zzble.get().booleanValue()) ? true : com.google.android.gms.ads.internal.zzu.zzgm().zza(this.mActivity, this.mActivity.getResources().getConfiguration());
        boolean z2 = this.zzcal.zzcbv != null && this.zzcal.zzcbv.zzaol;
        if ((!this.zzcas || z2) && zza2) {
            window.setFlags(1024, 1024);
        }
        zzme zzxc = this.zzcal.zzcbm.zzxc();
        boolean zzic = zzxc != null ? zzxc.zzic() : false;
        this.zzcau = false;
        if (zzic) {
            if (this.zzcal.orientation == com.google.android.gms.ads.internal.zzu.zzgo().zzvw()) {
                this.zzcau = this.mActivity.getResources().getConfiguration().orientation == 1;
            } else if (this.zzcal.orientation == com.google.android.gms.ads.internal.zzu.zzgo().zzvx()) {
                this.zzcau = this.mActivity.getResources().getConfiguration().orientation == 2;
            }
        }
        zzkx.zzdg(new StringBuilder(46).append("Delay onShow to next orientation change: ").append(this.zzcau).toString());
        setRequestedOrientation(this.zzcal.orientation);
        if (com.google.android.gms.ads.internal.zzu.zzgo().zza(window)) {
            zzkx.zzdg("Hardware acceleration on the AdActivity window enabled.");
        }
        if (!this.zzcas) {
            this.zzcat.setBackgroundColor(ViewCompat.MEASURED_STATE_MASK);
        } else {
            this.zzcat.setBackgroundColor(zzcak);
        }
        this.mActivity.setContentView(this.zzcat);
        zzds();
        if (z) {
            this.zzbnz = com.google.android.gms.ads.internal.zzu.zzgn().zza(this.mActivity, this.zzcal.zzcbm.zzeg(), true, zzic, null, this.zzcal.zzari, null, null, this.zzcal.zzcbm.zzec());
            this.zzbnz.zzxc().zza(null, null, this.zzcal.zzcbn, this.zzcal.zzcbr, true, this.zzcal.zzcbt, null, this.zzcal.zzcbm.zzxc().zzxu(), null, null);
            this.zzbnz.zzxc().zza(new zzme.zza() { // from class: com.google.android.gms.ads.internal.overlay.zzd.1
                @Override // com.google.android.gms.internal.zzme.zza
                public void zza(zzmd zzmdVar, boolean z3) {
                    zzmdVar.zzps();
                }
            });
            if (this.zzcal.url != null) {
                this.zzbnz.loadUrl(this.zzcal.url);
            } else if (this.zzcal.zzcbq == null) {
                throw new zza("No URL or HTML to display in ad overlay.");
            } else {
                this.zzbnz.loadDataWithBaseURL(this.zzcal.zzcbo, this.zzcal.zzcbq, "text/html", "UTF-8", null);
            }
            if (this.zzcal.zzcbm != null) {
                this.zzcal.zzcbm.zzc(this);
            }
        } else {
            this.zzbnz = this.zzcal.zzcbm;
            this.zzbnz.setContext(this.mActivity);
        }
        this.zzbnz.zzb(this);
        ViewParent parent = this.zzbnz.getParent();
        if (parent != null && (parent instanceof ViewGroup)) {
            ((ViewGroup) parent).removeView(this.zzbnz.getView());
        }
        if (this.zzcas) {
            this.zzbnz.zzxt();
        }
        this.zzcat.addView(this.zzbnz.getView(), -1, -1);
        if (!z && !this.zzcau) {
            zzps();
        }
        zzaa(zzic);
        if (this.zzbnz.zzxd()) {
            zza(zzic, true);
        }
        com.google.android.gms.ads.internal.zzd zzec = this.zzbnz.zzec();
        zzm zzmVar = zzec != null ? zzec.zzamr : null;
        if (zzmVar != null) {
            this.zzcaw = zzmVar.zza(this.mActivity, this.zzbnz, this.zzcat);
        } else {
            zzkx.zzdi("Appstreaming controller is null.");
        }
    }

    protected void zzak(int i) {
        this.zzbnz.zzak(i);
    }

    @Override // com.google.android.gms.internal.zzhy
    public void zzds() {
        this.zzcba = true;
    }

    public void zzg(zzmd zzmdVar, Map<String, String> map) {
        this.zzcaw.zzg(zzmdVar, map);
    }

    @Override // com.google.android.gms.internal.zzhy
    public void zzn(com.google.android.gms.dynamic.zzd zzdVar) {
        if (!zzdr.zzble.get().booleanValue() || !com.google.android.gms.common.util.zzs.isAtLeastN()) {
            return;
        }
        if (com.google.android.gms.ads.internal.zzu.zzgm().zza(this.mActivity, (Configuration) com.google.android.gms.dynamic.zze.zzae(zzdVar))) {
            this.mActivity.getWindow().addFlags(1024);
            this.mActivity.getWindow().clearFlags(2048);
            return;
        }
        this.mActivity.getWindow().addFlags(2048);
        this.mActivity.getWindow().clearFlags(1024);
    }

    public void zzpl() {
        if (this.zzcal != null && this.zzcao) {
            setRequestedOrientation(this.zzcal.orientation);
        }
        if (this.zzcap != null) {
            this.mActivity.setContentView(this.zzcat);
            zzds();
            this.zzcap.removeAllViews();
            this.zzcap = null;
        }
        if (this.zzcaq != null) {
            this.zzcaq.onCustomViewHidden();
            this.zzcaq = null;
        }
        this.zzcao = false;
    }

    @Override // com.google.android.gms.ads.internal.overlay.zzu
    public void zzpm() {
        this.zzcav = 1;
        this.mActivity.finish();
    }

    @Override // com.google.android.gms.internal.zzhy
    public boolean zzpn() {
        boolean z = true;
        this.zzcav = 0;
        if (this.zzbnz != null) {
            if (this.zzbnz.zzxi()) {
                zzl zzlVar = this.zzcaw;
            } else {
                z = false;
            }
            if (!z) {
                this.zzbnz.zza("onbackblocked", Collections.emptyMap());
            }
        }
        return z;
    }

    public void zzpo() {
        this.zzcat.removeView(this.zzcan);
        zzaa(true);
    }

    protected void zzpp() {
        if (!this.mActivity.isFinishing() || this.zzcbb) {
            return;
        }
        this.zzcbb = true;
        if (this.zzbnz != null) {
            zzak(this.zzcav);
            synchronized (this.zzcax) {
                if (!this.zzcaz && this.zzbnz.zzxo()) {
                    this.zzcay = new Runnable() { // from class: com.google.android.gms.ads.internal.overlay.zzd.2
                        @Override // java.lang.Runnable
                        public void run() {
                            zzd.this.zzpq();
                        }
                    };
                    zzlb.zzcvl.postDelayed(this.zzcay, zzdr.zzbgf.get().longValue());
                    return;
                }
            }
        }
        zzpq();
    }

    void zzpq() {
        if (this.zzcbc) {
            return;
        }
        this.zzcbc = true;
        if (this.zzbnz != null) {
            this.zzcat.removeView(this.zzbnz.getView());
            if (this.zzcam != null) {
                this.zzbnz.setContext(this.zzcam.zzahs);
                this.zzbnz.zzak(false);
                this.zzcam.parent.addView(this.zzbnz.getView(), this.zzcam.index, this.zzcam.zzcbg);
                this.zzcam = null;
            } else if (this.mActivity.getApplicationContext() != null) {
                this.zzbnz.setContext(this.mActivity.getApplicationContext());
            }
            this.zzbnz = null;
        }
        if (this.zzcal != null && this.zzcal.zzcbl != null) {
            this.zzcal.zzcbl.zzeq();
        }
        this.zzcaw.destroy();
    }

    public void zzpr() {
        if (this.zzcau) {
            this.zzcau = false;
            zzps();
        }
    }

    protected void zzps() {
        this.zzbnz.zzps();
    }

    public void zzpt() {
        this.zzcat.disable();
    }

    public void zzpu() {
        synchronized (this.zzcax) {
            this.zzcaz = true;
            if (this.zzcay != null) {
                zzlb.zzcvl.removeCallbacks(this.zzcay);
                zzlb.zzcvl.post(this.zzcay);
            }
        }
    }
}
