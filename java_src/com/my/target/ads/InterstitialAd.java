package com.my.target.ads;

import android.app.Activity;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.view.WindowManager;
import com.my.target.Tracer;
import com.my.target.core.facades.a;
import com.my.target.core.facades.c;
import com.my.target.core.facades.e;
import com.my.target.core.factories.d;
/* loaded from: classes.dex */
public class InterstitialAd extends a {
    private c ad;
    private com.my.target.core.ui.a adDialog;
    private final c.a adListener;
    private final DialogInterface.OnDismissListener dialogDismissListener;
    private boolean hideStatusBarInDialog;
    private InterstitialAdListener listener;

    /* loaded from: classes2.dex */
    public interface InterstitialAdListener {
        void onClick(InterstitialAd interstitialAd);

        void onDismiss(InterstitialAd interstitialAd);

        void onDisplay(InterstitialAd interstitialAd);

        void onLoad(InterstitialAd interstitialAd);

        void onNoAd(String str, InterstitialAd interstitialAd);

        void onVideoCompleted(InterstitialAd interstitialAd);
    }

    public InterstitialAd(int i, Context context) {
        this(i, context, null);
    }

    public InterstitialAd(int i, Context context, CustomParams customParams) {
        this.hideStatusBarInDialog = false;
        this.adListener = new c.a() { // from class: com.my.target.ads.InterstitialAd.1
            @Override // com.my.target.core.facades.c.a
            public void onLoad(c cVar) {
                if (InterstitialAd.this.listener != null) {
                    InterstitialAd.this.listener.onLoad(InterstitialAd.this);
                }
            }

            @Override // com.my.target.core.facades.c.a
            public void onError(String str, c cVar) {
                Tracer.d("InterstitialAd has no banners");
                if (InterstitialAd.this.listener != null) {
                    InterstitialAd.this.listener.onNoAd("No ad", InterstitialAd.this);
                }
            }

            @Override // com.my.target.core.facades.c.a
            public void onClick(c cVar) {
                if (InterstitialAd.this.listener != null) {
                    InterstitialAd.this.listener.onClick(InterstitialAd.this);
                }
            }

            @Override // com.my.target.core.facades.c.a
            public void onDismiss(c cVar) {
                if (InterstitialAd.this.listener != null) {
                    InterstitialAd.this.listener.onDismiss(InterstitialAd.this);
                }
            }

            @Override // com.my.target.core.facades.c.a
            public void onVideoCompleted(c cVar) {
                if (InterstitialAd.this.listener != null) {
                    InterstitialAd.this.listener.onVideoCompleted(InterstitialAd.this);
                }
            }

            @Override // com.my.target.core.facades.c.a
            public void onDisplay(c cVar) {
                if (InterstitialAd.this.listener != null) {
                    InterstitialAd.this.listener.onDisplay(InterstitialAd.this);
                }
            }
        };
        this.dialogDismissListener = new DialogInterface.OnDismissListener() { // from class: com.my.target.ads.InterstitialAd.2
            @Override // android.content.DialogInterface.OnDismissListener
            public void onDismiss(DialogInterface dialogInterface) {
                com.my.target.core.ui.a aVar = (com.my.target.core.ui.a) dialogInterface;
                aVar.setOnDismissListener(null);
                if (aVar == InterstitialAd.this.adDialog) {
                    InterstitialAd.this.adDialog = null;
                    if (InterstitialAd.this.listener != null) {
                        InterstitialAd.this.listener.onDismiss(InterstitialAd.this);
                    }
                }
            }
        };
        com.my.target.core.a aVar = new com.my.target.core.a(i, "fullscreen");
        if (customParams != null) {
            aVar.a(customParams);
        }
        init(aVar, context);
        Tracer.i("InterstitialAd created. Version: 4.6.4");
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

    public void show() {
        if (this.ad == null || !this.ad.a()) {
            Tracer.i("InterstitialAd.show: No ad");
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
            Tracer.i("InterstitialAd.showDialog: dialog already showing");
        } else if (this.ad == null || !this.ad.a()) {
            Tracer.i("InterstitialAd.showDialog: No ad");
        } else {
            this.adDialog = new com.my.target.core.ui.a(this.ad, this.hideStatusBarInDialog, this.context);
            this.adDialog.setOnDismissListener(this.dialogDismissListener);
            this.adDialog.show();
            if (this.ad instanceof e) {
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

    public void setListener(InterstitialAdListener interstitialAdListener) {
        this.listener = interstitialAdListener;
    }

    public boolean isHideStatusBarInDialog() {
        return this.hideStatusBarInDialog;
    }

    public void setHideStatusBarInDialog(boolean z) {
        this.hideStatusBarInDialog = z;
    }

    public void destroy() {
        dismiss();
        if (this.ad != null) {
            this.ad.a(null);
            this.ad = null;
        }
    }
}
