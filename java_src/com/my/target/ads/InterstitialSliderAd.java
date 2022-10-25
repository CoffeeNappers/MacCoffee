package com.my.target.ads;

import android.app.Activity;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.support.annotation.Nullable;
import android.view.WindowManager;
import com.my.target.Tracer;
import com.my.target.core.facades.a;
import com.my.target.core.facades.c;
import com.my.target.core.facades.e;
import com.my.target.core.factories.d;
/* loaded from: classes.dex */
public class InterstitialSliderAd extends a {
    @Nullable
    private c ad;
    @Nullable
    private com.my.target.core.ui.a adDialog;
    private final c.a adListener;
    private final DialogInterface.OnDismissListener dialogDismissListener;
    private boolean hideStatusBarInDialog;
    @Nullable
    private InterstitialSliderAdListener listener;

    /* loaded from: classes2.dex */
    public interface InterstitialSliderAdListener {
        void onClick(InterstitialSliderAd interstitialSliderAd);

        void onDismiss(InterstitialSliderAd interstitialSliderAd);

        void onDisplay(InterstitialSliderAd interstitialSliderAd);

        void onLoad(InterstitialSliderAd interstitialSliderAd);

        void onNoAd(String str, InterstitialSliderAd interstitialSliderAd);
    }

    public boolean isHideStatusBarInDialog() {
        return this.hideStatusBarInDialog;
    }

    public void setHideStatusBarInDialog(boolean z) {
        this.hideStatusBarInDialog = z;
    }

    public void setListener(@Nullable InterstitialSliderAdListener interstitialSliderAdListener) {
        this.listener = interstitialSliderAdListener;
    }

    public InterstitialSliderAd(int i, Context context) {
        this(i, context, null);
    }

    public InterstitialSliderAd(int i, Context context, CustomParams customParams) {
        this.adListener = new c.a() { // from class: com.my.target.ads.InterstitialSliderAd.1
            @Override // com.my.target.core.facades.c.a
            public void onLoad(c cVar) {
                if (InterstitialSliderAd.this.listener != null) {
                    InterstitialSliderAd.this.listener.onLoad(InterstitialSliderAd.this);
                }
            }

            @Override // com.my.target.core.facades.c.a
            public void onError(String str, c cVar) {
                Tracer.d("InterstitialSliderAd has no banners");
                if (InterstitialSliderAd.this.listener != null) {
                    InterstitialSliderAd.this.listener.onNoAd("No ad", InterstitialSliderAd.this);
                }
            }

            @Override // com.my.target.core.facades.c.a
            public void onClick(c cVar) {
                if (InterstitialSliderAd.this.listener != null) {
                    InterstitialSliderAd.this.listener.onClick(InterstitialSliderAd.this);
                }
            }

            @Override // com.my.target.core.facades.c.a
            public void onDismiss(c cVar) {
                if (InterstitialSliderAd.this.listener != null) {
                    InterstitialSliderAd.this.listener.onDismiss(InterstitialSliderAd.this);
                }
            }

            @Override // com.my.target.core.facades.c.a
            public void onVideoCompleted(c cVar) {
            }

            @Override // com.my.target.core.facades.c.a
            public void onDisplay(c cVar) {
                if (InterstitialSliderAd.this.listener != null) {
                    InterstitialSliderAd.this.listener.onDisplay(InterstitialSliderAd.this);
                }
            }
        };
        this.dialogDismissListener = new DialogInterface.OnDismissListener() { // from class: com.my.target.ads.InterstitialSliderAd.2
            @Override // android.content.DialogInterface.OnDismissListener
            public void onDismiss(DialogInterface dialogInterface) {
                com.my.target.core.ui.a aVar = (com.my.target.core.ui.a) dialogInterface;
                aVar.setOnDismissListener(null);
                if (aVar == InterstitialSliderAd.this.adDialog) {
                    InterstitialSliderAd.this.adDialog = null;
                    if (InterstitialSliderAd.this.listener != null) {
                        InterstitialSliderAd.this.listener.onDismiss(InterstitialSliderAd.this);
                    }
                }
            }
        };
        this.hideStatusBarInDialog = false;
        com.my.target.core.a aVar = new com.my.target.core.a(i, "fullscreenslider");
        if (customParams != null) {
            aVar.a(customParams);
        }
        init(aVar, context);
        Tracer.i("InterstitialSliderAd created. Version: 4.6.4");
    }

    public void show() {
        if (this.ad == null || !this.ad.a()) {
            Tracer.i("InterstitialSliderAd.show: No ad");
            return;
        }
        MyTargetActivity.ad = this.ad;
        Intent intent = new Intent(this.context, MyTargetActivity.class);
        intent.setAction("com.my.target.actions.interstitial");
        if (!(this.context instanceof Activity)) {
            intent.addFlags(268435456);
        }
        this.context.startActivity(intent);
    }

    public void showDialog() {
        if (this.adDialog != null && this.adDialog.isShowing()) {
            Tracer.i("InterstitialSliderAd.showDialog: dialog already showing");
        } else if (this.ad == null || !this.ad.a()) {
            Tracer.i("InterstitialSliderAd.showDialog: No ad");
        } else {
            this.adDialog = new com.my.target.core.ui.a(this.ad, this.hideStatusBarInDialog, this.context);
            this.adDialog.setOnDismissListener(this.dialogDismissListener);
            this.adDialog.show();
            if ((this.ad instanceof e) && this.adDialog.getWindow() != null) {
                WindowManager.LayoutParams attributes = this.adDialog.getWindow().getAttributes();
                attributes.dimAmount = 0.0f;
                this.adDialog.getWindow().setAttributes(attributes);
                this.adDialog.getWindow().addFlags(2);
            }
        }
    }

    public void dismiss() {
        if (this.adDialog != null && this.adDialog.isShowing()) {
            this.adDialog.dismiss();
        } else if (this.context != null) {
            this.context.sendBroadcast(new Intent(MyTargetActivity.ACTION_CLOSE));
        }
    }

    @Deprecated
    public void dismissDialog() {
        if (this.adDialog != null && this.adDialog.isShowing()) {
            this.adDialog.dismiss();
        }
    }

    public void destroy() {
        dismiss();
        if (this.ad != null) {
            this.ad.a(null);
            this.ad = null;
        }
    }

    @Override // com.my.target.core.facades.a
    protected void onLoad(com.my.target.core.models.c cVar) {
        this.ad = d.a(cVar, this.context);
        if (this.ad == null) {
            if (this.listener != null) {
                this.listener.onNoAd("No ad", this);
                return;
            }
            return;
        }
        this.ad.a(this.adListener);
        this.ad.load();
    }

    @Override // com.my.target.core.facades.a
    protected void onLoadError(String str) {
        if (this.listener != null) {
            this.listener.onNoAd("No ad: " + str, this);
        }
    }
}
