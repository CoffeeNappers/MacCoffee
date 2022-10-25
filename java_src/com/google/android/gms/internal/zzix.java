package com.google.android.gms.internal;

import android.annotation.TargetApi;
import android.app.Activity;
import android.content.Context;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.widget.FrameLayout;
import android.widget.PopupWindow;
import com.google.android.gms.internal.zziu;
import com.google.android.gms.internal.zzko;
@zzji
@TargetApi(19)
/* loaded from: classes.dex */
public class zzix extends zziv {
    private Object zzcgz;
    private PopupWindow zzcha;
    private boolean zzchb;

    /* JADX INFO: Access modifiers changed from: package-private */
    public zzix(Context context, zzko.zza zzaVar, zzmd zzmdVar, zziu.zza zzaVar2) {
        super(context, zzaVar, zzmdVar, zzaVar2);
        this.zzcgz = new Object();
        this.zzchb = false;
    }

    private void zzsf() {
        synchronized (this.zzcgz) {
            this.zzchb = true;
            if ((this.mContext instanceof Activity) && ((Activity) this.mContext).isDestroyed()) {
                this.zzcha = null;
            }
            if (this.zzcha != null) {
                if (this.zzcha.isShowing()) {
                    this.zzcha.dismiss();
                }
                this.zzcha = null;
            }
        }
    }

    @Override // com.google.android.gms.internal.zziq, com.google.android.gms.internal.zzld
    public void cancel() {
        zzsf();
        super.cancel();
    }

    @Override // com.google.android.gms.internal.zziq
    protected void zzao(int i) {
        zzsf();
        super.zzao(i);
    }

    @Override // com.google.android.gms.internal.zziv
    protected void zzse() {
        Window window = this.mContext instanceof Activity ? ((Activity) this.mContext).getWindow() : null;
        if (window == null || window.getDecorView() == null || ((Activity) this.mContext).isDestroyed()) {
            return;
        }
        FrameLayout frameLayout = new FrameLayout(this.mContext);
        frameLayout.setLayoutParams(new ViewGroup.LayoutParams(-1, -1));
        frameLayout.addView(this.zzbnz.getView(), -1, -1);
        synchronized (this.zzcgz) {
            if (this.zzchb) {
                return;
            }
            this.zzcha = new PopupWindow((View) frameLayout, 1, 1, false);
            this.zzcha.setOutsideTouchable(true);
            this.zzcha.setClippingEnabled(false);
            zzkx.zzdg("Displaying the 1x1 popup off the screen.");
            try {
                this.zzcha.showAtLocation(window.getDecorView(), 0, -1, -1);
            } catch (Exception e) {
                this.zzcha = null;
            }
        }
    }
}
