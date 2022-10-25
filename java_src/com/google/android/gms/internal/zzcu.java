package com.google.android.gms.internal;

import android.annotation.TargetApi;
import android.app.Activity;
import android.app.Application;
import android.app.KeyguardManager;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.graphics.Rect;
import android.os.Bundle;
import android.os.PowerManager;
import android.support.annotation.Nullable;
import android.util.DisplayMetrics;
import android.view.View;
import android.view.ViewTreeObserver;
import android.view.Window;
import android.view.WindowManager;
import java.lang.ref.WeakReference;
import java.util.HashSet;
import java.util.Iterator;
@zzji
@TargetApi(14)
/* loaded from: classes.dex */
public class zzcu implements Application.ActivityLifecycleCallbacks, View.OnAttachStateChangeListener, ViewTreeObserver.OnGlobalLayoutListener, ViewTreeObserver.OnScrollChangedListener {
    private static final long zzauk = zzdr.zzbgu.get().longValue();
    private final Context zzatc;
    private final WindowManager zzati;
    private final PowerManager zzatj;
    private final KeyguardManager zzatk;
    @Nullable
    BroadcastReceiver zzatr;
    private Application zzaul;
    private WeakReference<ViewTreeObserver> zzaum;
    WeakReference<View> zzaun;
    private zzcv zzauo;
    private DisplayMetrics zzaur;
    private zzlm zzasn = new zzlm(zzauk);
    private boolean zzatq = false;
    private int zzaup = -1;
    private HashSet<zzb> zzauq = new HashSet<>();

    /* loaded from: classes2.dex */
    public static class zza {
        public final long timestamp;
        public final boolean zzaut;
        public final boolean zzauu;
        public final int zzauv;
        public final Rect zzauw;
        public final Rect zzaux;
        public final Rect zzauy;
        public final boolean zzauz;
        public final Rect zzava;
        public final boolean zzavb;
        public final Rect zzavc;
        public final float zzavd;
        public final boolean zzave;

        public zza(long j, boolean z, boolean z2, int i, Rect rect, Rect rect2, Rect rect3, boolean z3, Rect rect4, boolean z4, Rect rect5, float f, boolean z5) {
            this.timestamp = j;
            this.zzaut = z;
            this.zzauu = z2;
            this.zzauv = i;
            this.zzauw = rect;
            this.zzaux = rect2;
            this.zzauy = rect3;
            this.zzauz = z3;
            this.zzava = rect4;
            this.zzavb = z4;
            this.zzavc = rect5;
            this.zzavd = f;
            this.zzave = z5;
        }
    }

    /* loaded from: classes2.dex */
    public interface zzb {
        void zza(zza zzaVar);
    }

    public zzcu(Context context, View view) {
        this.zzatc = context.getApplicationContext();
        this.zzati = (WindowManager) context.getSystemService("window");
        this.zzatj = (PowerManager) this.zzatc.getSystemService("power");
        this.zzatk = (KeyguardManager) context.getSystemService("keyguard");
        if (this.zzatc instanceof Application) {
            this.zzaul = (Application) this.zzatc;
            this.zzauo = new zzcv((Application) this.zzatc, this);
        }
        this.zzaur = context.getResources().getDisplayMetrics();
        zze(view);
    }

    private void zza(Activity activity, int i) {
        Window window;
        if (this.zzaun == null || (window = activity.getWindow()) == null) {
            return;
        }
        View peekDecorView = window.peekDecorView();
        View view = this.zzaun.get();
        if (view == null || peekDecorView == null || view.getRootView() != peekDecorView.getRootView()) {
            return;
        }
        this.zzaup = i;
    }

    private void zzf(View view) {
        ViewTreeObserver viewTreeObserver = view.getViewTreeObserver();
        if (viewTreeObserver.isAlive()) {
            this.zzaum = new WeakReference<>(viewTreeObserver);
            viewTreeObserver.addOnScrollChangedListener(this);
            viewTreeObserver.addOnGlobalLayoutListener(this);
        }
        zzie();
        if (this.zzaul != null) {
            try {
                this.zzaul.registerActivityLifecycleCallbacks(this.zzauo);
            } catch (Exception e) {
                zzkx.zzb("Error registering activity lifecycle callbacks.", e);
            }
        }
    }

    private void zzg(View view) {
        try {
            if (this.zzaum != null) {
                ViewTreeObserver viewTreeObserver = this.zzaum.get();
                if (viewTreeObserver != null && viewTreeObserver.isAlive()) {
                    viewTreeObserver.removeOnScrollChangedListener(this);
                    viewTreeObserver.removeGlobalOnLayoutListener(this);
                }
                this.zzaum = null;
            }
        } catch (Exception e) {
            zzkx.zzb("Error while unregistering listeners from the last ViewTreeObserver.", e);
        }
        try {
            ViewTreeObserver viewTreeObserver2 = view.getViewTreeObserver();
            if (viewTreeObserver2.isAlive()) {
                viewTreeObserver2.removeOnScrollChangedListener(this);
                viewTreeObserver2.removeGlobalOnLayoutListener(this);
            }
        } catch (Exception e2) {
            zzkx.zzb("Error while unregistering listeners from the ViewTreeObserver.", e2);
        }
        zzif();
        if (this.zzaul != null) {
            try {
                this.zzaul.unregisterActivityLifecycleCallbacks(this.zzauo);
            } catch (Exception e3) {
                zzkx.zzb("Error registering activity lifecycle callbacks.", e3);
            }
        }
    }

    private void zzie() {
        if (this.zzatr != null) {
            return;
        }
        IntentFilter intentFilter = new IntentFilter();
        intentFilter.addAction("android.intent.action.SCREEN_ON");
        intentFilter.addAction("android.intent.action.SCREEN_OFF");
        intentFilter.addAction("android.intent.action.USER_PRESENT");
        this.zzatr = new BroadcastReceiver() { // from class: com.google.android.gms.internal.zzcu.2
            @Override // android.content.BroadcastReceiver
            public void onReceive(Context context, Intent intent) {
                zzcu.this.zzl(3);
            }
        };
        this.zzatc.registerReceiver(this.zzatr, intentFilter);
    }

    private void zzif() {
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

    private void zziw() {
        com.google.android.gms.ads.internal.zzu.zzgm();
        zzlb.zzcvl.post(new Runnable() { // from class: com.google.android.gms.internal.zzcu.1
            @Override // java.lang.Runnable
            public void run() {
                zzcu.this.zzl(3);
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void zzl(int i) {
        if (this.zzauq.size() == 0 || this.zzaun == null) {
            return;
        }
        View view = this.zzaun.get();
        boolean z = i == 1;
        boolean z2 = view == null;
        Rect rect = new Rect();
        Rect rect2 = new Rect();
        boolean z3 = false;
        Rect rect3 = new Rect();
        boolean z4 = false;
        Rect rect4 = new Rect();
        Rect rect5 = new Rect();
        rect5.right = this.zzati.getDefaultDisplay().getWidth();
        rect5.bottom = this.zzati.getDefaultDisplay().getHeight();
        int[] iArr = new int[2];
        int[] iArr2 = new int[2];
        if (view != null) {
            z3 = view.getGlobalVisibleRect(rect2);
            z4 = view.getLocalVisibleRect(rect3);
            view.getHitRect(rect4);
            try {
                view.getLocationOnScreen(iArr);
                view.getLocationInWindow(iArr2);
            } catch (Exception e) {
                zzkx.zzb("Failure getting view location.", e);
            }
            rect.left = iArr[0];
            rect.top = iArr[1];
            rect.right = rect.left + view.getWidth();
            rect.bottom = rect.top + view.getHeight();
        }
        int windowVisibility = view != null ? view.getWindowVisibility() : 8;
        if (this.zzaup != -1) {
            windowVisibility = this.zzaup;
        }
        boolean z5 = !z2 && com.google.android.gms.ads.internal.zzu.zzgm().zza(view, this.zzatj, this.zzatk) && z3 && z4 && windowVisibility == 0;
        if (z && !this.zzasn.tryAcquire() && z5 == this.zzatq) {
            return;
        }
        if (!z5 && !this.zzatq && i == 1) {
            return;
        }
        zza zzaVar = new zza(com.google.android.gms.ads.internal.zzu.zzgs().elapsedRealtime(), this.zzatj.isScreenOn(), view != null ? com.google.android.gms.ads.internal.zzu.zzgo().isAttachedToWindow(view) : false, view != null ? view.getWindowVisibility() : 8, zza(rect5), zza(rect), zza(rect2), z3, zza(rect3), z4, zza(rect4), this.zzaur.density, z5);
        Iterator<zzb> it = this.zzauq.iterator();
        while (it.hasNext()) {
            it.next().zza(zzaVar);
        }
        this.zzatq = z5;
    }

    private int zzm(int i) {
        return (int) (i / this.zzaur.density);
    }

    @Override // android.app.Application.ActivityLifecycleCallbacks
    public void onActivityCreated(Activity activity, Bundle bundle) {
        zza(activity, 0);
        zzl(3);
        zziw();
    }

    @Override // android.app.Application.ActivityLifecycleCallbacks
    public void onActivityDestroyed(Activity activity) {
        zzl(3);
        zziw();
    }

    @Override // android.app.Application.ActivityLifecycleCallbacks
    public void onActivityPaused(Activity activity) {
        zza(activity, 4);
        zzl(3);
        zziw();
    }

    @Override // android.app.Application.ActivityLifecycleCallbacks
    public void onActivityResumed(Activity activity) {
        zza(activity, 0);
        zzl(3);
        zziw();
    }

    @Override // android.app.Application.ActivityLifecycleCallbacks
    public void onActivitySaveInstanceState(Activity activity, Bundle bundle) {
        zzl(3);
        zziw();
    }

    @Override // android.app.Application.ActivityLifecycleCallbacks
    public void onActivityStarted(Activity activity) {
        zza(activity, 0);
        zzl(3);
        zziw();
    }

    @Override // android.app.Application.ActivityLifecycleCallbacks
    public void onActivityStopped(Activity activity) {
        zzl(3);
        zziw();
    }

    @Override // android.view.ViewTreeObserver.OnGlobalLayoutListener
    public void onGlobalLayout() {
        zzl(2);
    }

    @Override // android.view.ViewTreeObserver.OnScrollChangedListener
    public void onScrollChanged() {
        zzl(1);
    }

    @Override // android.view.View.OnAttachStateChangeListener
    public void onViewAttachedToWindow(View view) {
        this.zzaup = -1;
        zzf(view);
        zzl(3);
    }

    @Override // android.view.View.OnAttachStateChangeListener
    public void onViewDetachedFromWindow(View view) {
        this.zzaup = -1;
        zzl(3);
        zzg(view);
    }

    Rect zza(Rect rect) {
        return new Rect(zzm(rect.left), zzm(rect.top), zzm(rect.right), zzm(rect.bottom));
    }

    public void zza(zzb zzbVar) {
        this.zzauq.add(zzbVar);
        zzl(3);
    }

    public void zze(View view) {
        View view2 = this.zzaun != null ? this.zzaun.get() : null;
        if (view2 != null) {
            view2.removeOnAttachStateChangeListener(this);
            zzg(view2);
        }
        this.zzaun = new WeakReference<>(view);
        if (view != null) {
            if (com.google.android.gms.ads.internal.zzu.zzgo().isAttachedToWindow(view)) {
                zzf(view);
            }
            view.addOnAttachStateChangeListener(this);
        }
    }
}
