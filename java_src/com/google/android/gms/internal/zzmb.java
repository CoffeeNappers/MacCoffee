package com.google.android.gms.internal;

import android.view.View;
import android.view.ViewTreeObserver;
import java.lang.ref.WeakReference;
@zzji
/* loaded from: classes.dex */
abstract class zzmb {
    private final WeakReference<View> zzcyy;

    public zzmb(View view) {
        this.zzcyy = new WeakReference<>(view);
    }

    public final void detach() {
        ViewTreeObserver viewTreeObserver = getViewTreeObserver();
        if (viewTreeObserver != null) {
            zzb(viewTreeObserver);
        }
    }

    protected ViewTreeObserver getViewTreeObserver() {
        View view = this.zzcyy.get();
        if (view == null) {
            return null;
        }
        ViewTreeObserver viewTreeObserver = view.getViewTreeObserver();
        if (viewTreeObserver != null && viewTreeObserver.isAlive()) {
            return viewTreeObserver;
        }
        return null;
    }

    protected abstract void zza(ViewTreeObserver viewTreeObserver);

    protected abstract void zzb(ViewTreeObserver viewTreeObserver);

    public final void zzwu() {
        ViewTreeObserver viewTreeObserver = getViewTreeObserver();
        if (viewTreeObserver != null) {
            zza(viewTreeObserver);
        }
    }
}
