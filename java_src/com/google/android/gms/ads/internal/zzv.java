package com.google.android.gms.ads.internal;

import android.app.Activity;
import android.content.Context;
import android.graphics.Rect;
import android.os.RemoteException;
import android.support.annotation.Nullable;
import android.support.v4.util.SimpleArrayMap;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewTreeObserver;
import android.widget.ViewSwitcher;
import com.google.android.gms.ads.internal.client.AdSizeParcel;
import com.google.android.gms.ads.internal.client.VideoOptionsParcel;
import com.google.android.gms.ads.internal.client.zzw;
import com.google.android.gms.ads.internal.client.zzy;
import com.google.android.gms.ads.internal.formats.NativeAdOptionsParcel;
import com.google.android.gms.ads.internal.util.client.VersionInfoParcel;
import com.google.android.gms.internal.zzav;
import com.google.android.gms.internal.zzdr;
import com.google.android.gms.internal.zzed;
import com.google.android.gms.internal.zzeq;
import com.google.android.gms.internal.zzer;
import com.google.android.gms.internal.zzes;
import com.google.android.gms.internal.zzet;
import com.google.android.gms.internal.zzig;
import com.google.android.gms.internal.zzik;
import com.google.android.gms.internal.zzji;
import com.google.android.gms.internal.zzko;
import com.google.android.gms.internal.zzkp;
import com.google.android.gms.internal.zzku;
import com.google.android.gms.internal.zzkw;
import com.google.android.gms.internal.zzkx;
import com.google.android.gms.internal.zzld;
import com.google.android.gms.internal.zzle;
import com.google.android.gms.internal.zzlm;
import com.google.android.gms.internal.zzlp;
import com.google.android.gms.internal.zzmd;
import com.google.android.gms.internal.zzme;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.UUID;
@zzji
/* loaded from: classes.dex */
public final class zzv implements ViewTreeObserver.OnGlobalLayoutListener, ViewTreeObserver.OnScrollChangedListener {
    public final Context zzahs;
    boolean zzaok;
    final String zzarf;
    public String zzarg;
    final zzav zzarh;
    public final VersionInfoParcel zzari;
    @Nullable
    zza zzarj;
    @Nullable
    public zzkw zzark;
    @Nullable
    public zzld zzarl;
    public AdSizeParcel zzarm;
    @Nullable
    public zzko zzarn;
    public zzko.zza zzaro;
    @Nullable
    public zzkp zzarp;
    @Nullable
    com.google.android.gms.ads.internal.client.zzp zzarq;
    @Nullable
    com.google.android.gms.ads.internal.client.zzq zzarr;
    @Nullable
    zzw zzars;
    @Nullable
    zzy zzart;
    @Nullable
    zzig zzaru;
    @Nullable
    zzik zzarv;
    @Nullable
    zzeq zzarw;
    @Nullable
    zzer zzarx;
    SimpleArrayMap<String, zzes> zzary;
    SimpleArrayMap<String, zzet> zzarz;
    NativeAdOptionsParcel zzasa;
    @Nullable
    VideoOptionsParcel zzasb;
    @Nullable
    zzed zzasc;
    @Nullable
    com.google.android.gms.ads.internal.reward.client.zzd zzasd;
    @Nullable
    List<String> zzase;
    @Nullable
    com.google.android.gms.ads.internal.purchase.zzk zzasf;
    @Nullable
    public zzku zzasg;
    @Nullable
    View zzash;
    public int zzasi;
    boolean zzasj;
    private HashSet<zzkp> zzask;
    private int zzasl;
    private int zzasm;
    private zzlm zzasn;
    private boolean zzaso;
    private boolean zzasp;
    private boolean zzasq;

    /* loaded from: classes.dex */
    public static class zza extends ViewSwitcher {
        private final zzle zzasr;
        @Nullable
        private final zzlp zzass;
        private boolean zzast;

        public zza(Context context, String str, ViewTreeObserver.OnGlobalLayoutListener onGlobalLayoutListener, ViewTreeObserver.OnScrollChangedListener onScrollChangedListener) {
            super(context);
            this.zzasr = new zzle(context);
            this.zzasr.setAdUnitId(str);
            this.zzast = true;
            if (context instanceof Activity) {
                this.zzass = new zzlp((Activity) context, this, onGlobalLayoutListener, onScrollChangedListener);
            } else {
                this.zzass = new zzlp(null, this, onGlobalLayoutListener, onScrollChangedListener);
            }
            this.zzass.zzwl();
        }

        @Override // android.view.ViewGroup, android.view.View
        protected void onAttachedToWindow() {
            super.onAttachedToWindow();
            if (this.zzass != null) {
                this.zzass.onAttachedToWindow();
            }
        }

        @Override // android.view.ViewGroup, android.view.View
        protected void onDetachedFromWindow() {
            super.onDetachedFromWindow();
            if (this.zzass != null) {
                this.zzass.onDetachedFromWindow();
            }
        }

        @Override // android.view.ViewGroup
        public boolean onInterceptTouchEvent(MotionEvent motionEvent) {
            if (this.zzast) {
                this.zzasr.zzg(motionEvent);
                return false;
            }
            return false;
        }

        @Override // android.widget.ViewAnimator, android.view.ViewGroup
        public void removeAllViews() {
            ArrayList<zzmd> arrayList = new ArrayList();
            int i = 0;
            while (true) {
                int i2 = i;
                if (i2 >= getChildCount()) {
                    break;
                }
                View childAt = getChildAt(i2);
                if (childAt != null && (childAt instanceof zzmd)) {
                    arrayList.add((zzmd) childAt);
                }
                i = i2 + 1;
            }
            super.removeAllViews();
            for (zzmd zzmdVar : arrayList) {
                zzmdVar.destroy();
            }
        }

        public void zzhr() {
            zzkx.v("Disable position monitoring on adFrame.");
            if (this.zzass != null) {
                this.zzass.zzwm();
            }
        }

        public zzle zzhv() {
            return this.zzasr;
        }

        public void zzhw() {
            zzkx.v("Enable debug gesture detector on adFrame.");
            this.zzast = true;
        }

        public void zzhx() {
            zzkx.v("Disable debug gesture detector on adFrame.");
            this.zzast = false;
        }
    }

    public zzv(Context context, AdSizeParcel adSizeParcel, String str, VersionInfoParcel versionInfoParcel) {
        this(context, adSizeParcel, str, versionInfoParcel, null);
    }

    zzv(Context context, AdSizeParcel adSizeParcel, String str, VersionInfoParcel versionInfoParcel, zzav zzavVar) {
        this.zzasg = null;
        this.zzash = null;
        this.zzasi = 0;
        this.zzasj = false;
        this.zzaok = false;
        this.zzask = null;
        this.zzasl = -1;
        this.zzasm = -1;
        this.zzaso = true;
        this.zzasp = true;
        this.zzasq = false;
        zzdr.initialize(context);
        if (zzu.zzgq().zzuu() != null) {
            List<String> zzlr = zzdr.zzlr();
            if (versionInfoParcel.zzcya != 0) {
                zzlr.add(Integer.toString(versionInfoParcel.zzcya));
            }
            zzu.zzgq().zzuu().zzc(zzlr);
        }
        this.zzarf = UUID.randomUUID().toString();
        if (adSizeParcel.zzazr || adSizeParcel.zzazt) {
            this.zzarj = null;
        } else {
            this.zzarj = new zza(context, str, this, this);
            this.zzarj.setMinimumWidth(adSizeParcel.widthPixels);
            this.zzarj.setMinimumHeight(adSizeParcel.heightPixels);
            this.zzarj.setVisibility(4);
        }
        this.zzarm = adSizeParcel;
        this.zzarg = str;
        this.zzahs = context;
        this.zzari = versionInfoParcel;
        this.zzarh = zzavVar == null ? new zzav(new zzi(this)) : zzavVar;
        this.zzasn = new zzlm(200L);
        this.zzarz = new SimpleArrayMap<>();
    }

    private void zzh(boolean z) {
        boolean z2 = true;
        if (this.zzarj == null || this.zzarn == null || this.zzarn.zzcbm == null || this.zzarn.zzcbm.zzxc() == null) {
            return;
        }
        if (z && !this.zzasn.tryAcquire()) {
            return;
        }
        if (this.zzarn.zzcbm.zzxc().zzic()) {
            int[] iArr = new int[2];
            this.zzarj.getLocationOnScreen(iArr);
            int zzc = com.google.android.gms.ads.internal.client.zzm.zzkr().zzc(this.zzahs, iArr[0]);
            int zzc2 = com.google.android.gms.ads.internal.client.zzm.zzkr().zzc(this.zzahs, iArr[1]);
            if (zzc != this.zzasl || zzc2 != this.zzasm) {
                this.zzasl = zzc;
                this.zzasm = zzc2;
                zzme zzxc = this.zzarn.zzcbm.zzxc();
                int i = this.zzasl;
                int i2 = this.zzasm;
                if (z) {
                    z2 = false;
                }
                zzxc.zza(i, i2, z2);
            }
        }
        zzhs();
    }

    private void zzhs() {
        View findViewById;
        if (this.zzarj == null || (findViewById = this.zzarj.getRootView().findViewById(16908290)) == null) {
            return;
        }
        Rect rect = new Rect();
        Rect rect2 = new Rect();
        this.zzarj.getGlobalVisibleRect(rect);
        findViewById.getGlobalVisibleRect(rect2);
        if (rect.top != rect2.top) {
            this.zzaso = false;
        }
        if (rect.bottom == rect2.bottom) {
            return;
        }
        this.zzasp = false;
    }

    public void destroy() {
        zzhr();
        this.zzarr = null;
        this.zzars = null;
        this.zzarv = null;
        this.zzaru = null;
        this.zzasc = null;
        this.zzart = null;
        zzi(false);
        if (this.zzarj != null) {
            this.zzarj.removeAllViews();
        }
        zzhm();
        zzho();
        this.zzarn = null;
    }

    @Override // android.view.ViewTreeObserver.OnGlobalLayoutListener
    public void onGlobalLayout() {
        zzh(false);
    }

    @Override // android.view.ViewTreeObserver.OnScrollChangedListener
    public void onScrollChanged() {
        zzh(true);
        this.zzasq = true;
    }

    public void zza(HashSet<zzkp> hashSet) {
        this.zzask = hashSet;
    }

    public HashSet<zzkp> zzhl() {
        return this.zzask;
    }

    public void zzhm() {
        if (this.zzarn == null || this.zzarn.zzcbm == null) {
            return;
        }
        this.zzarn.zzcbm.destroy();
    }

    public void zzhn() {
        if (this.zzarn == null || this.zzarn.zzcbm == null) {
            return;
        }
        this.zzarn.zzcbm.stopLoading();
    }

    public void zzho() {
        if (this.zzarn == null || this.zzarn.zzbwn == null) {
            return;
        }
        try {
            this.zzarn.zzbwn.destroy();
        } catch (RemoteException e) {
            zzkx.zzdi("Could not destroy mediation adapter.");
        }
    }

    public boolean zzhp() {
        return this.zzasi == 0;
    }

    public boolean zzhq() {
        return this.zzasi == 1;
    }

    public void zzhr() {
        if (this.zzarj != null) {
            this.zzarj.zzhr();
        }
    }

    public String zzht() {
        return (!this.zzaso || !this.zzasp) ? this.zzaso ? this.zzasq ? "top-scrollable" : "top-locked" : this.zzasp ? this.zzasq ? "bottom-scrollable" : "bottom-locked" : "" : "";
    }

    public void zzhu() {
        if (this.zzarp == null) {
            return;
        }
        if (this.zzarn != null) {
            this.zzarp.zzm(this.zzarn.zzcso);
            this.zzarp.zzn(this.zzarn.zzcsp);
            this.zzarp.zzae(this.zzarn.zzclb);
        }
        this.zzarp.zzad(this.zzarm.zzazr);
    }

    public void zzi(boolean z) {
        if (this.zzasi == 0) {
            zzhn();
        }
        if (this.zzark != null) {
            this.zzark.cancel();
        }
        if (this.zzarl != null) {
            this.zzarl.cancel();
        }
        if (z) {
            this.zzarn = null;
        }
    }
}
