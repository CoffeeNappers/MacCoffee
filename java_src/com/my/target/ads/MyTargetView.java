package com.my.target.ads;

import android.content.Context;
import android.util.AttributeSet;
import android.widget.RelativeLayout;
import com.my.target.Tracer;
import com.my.target.core.engines.b;
import com.my.target.core.facades.h;
import com.my.target.core.factories.c;
/* loaded from: classes2.dex */
public class MyTargetView extends RelativeLayout {
    private h ad;
    private h.a adListener;
    private b engine;
    private boolean isInitialized;
    private MyTargetViewListener listener;
    private boolean trackingEvironmentEnabled;

    /* loaded from: classes2.dex */
    public interface AdSize {
        public static final int BANNER_300x250 = 1;
        public static final int BANNER_320x50 = 0;
    }

    /* loaded from: classes2.dex */
    public interface MyTargetViewListener {
        void onClick(MyTargetView myTargetView);

        void onLoad(MyTargetView myTargetView);

        void onNoAd(String str, MyTargetView myTargetView);
    }

    public MyTargetViewListener getListener() {
        return this.listener;
    }

    public void setListener(MyTargetViewListener myTargetViewListener) {
        this.listener = myTargetViewListener;
    }

    public void setTrackingEnvironmentEnabled(boolean z) {
        this.trackingEvironmentEnabled = z;
        if (this.ad != null) {
            this.ad.setTrackingEnvironmentEnabled(z);
        }
    }

    public MyTargetView(Context context) {
        super(context);
        this.trackingEvironmentEnabled = true;
        this.adListener = new h.a() { // from class: com.my.target.ads.MyTargetView.1
            @Override // com.my.target.core.facades.h.a
            public void onLoad(h hVar) {
                if (hVar == MyTargetView.this.ad) {
                    if (MyTargetView.this.engine == null) {
                        MyTargetView.this.engine = c.a(hVar, MyTargetView.this, MyTargetView.this.getContext());
                    }
                    if (MyTargetView.this.engine != null) {
                        MyTargetView.this.engine.a(hVar);
                    }
                }
            }

            @Override // com.my.target.core.facades.h.a
            public void onNoAd(String str, h hVar) {
                if (MyTargetView.this.listener != null) {
                    MyTargetView.this.listener.onNoAd(str, MyTargetView.this);
                }
            }
        };
        Tracer.i("AdView created. Version: 4.6.4");
    }

    public MyTargetView(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        this.trackingEvironmentEnabled = true;
        this.adListener = new h.a() { // from class: com.my.target.ads.MyTargetView.1
            @Override // com.my.target.core.facades.h.a
            public void onLoad(h hVar) {
                if (hVar == MyTargetView.this.ad) {
                    if (MyTargetView.this.engine == null) {
                        MyTargetView.this.engine = c.a(hVar, MyTargetView.this, MyTargetView.this.getContext());
                    }
                    if (MyTargetView.this.engine != null) {
                        MyTargetView.this.engine.a(hVar);
                    }
                }
            }

            @Override // com.my.target.core.facades.h.a
            public void onNoAd(String str, h hVar) {
                if (MyTargetView.this.listener != null) {
                    MyTargetView.this.listener.onNoAd(str, MyTargetView.this);
                }
            }
        };
        Tracer.i("AdView created. Version: 4.6.4");
    }

    public MyTargetView(Context context, AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
        this.trackingEvironmentEnabled = true;
        this.adListener = new h.a() { // from class: com.my.target.ads.MyTargetView.1
            @Override // com.my.target.core.facades.h.a
            public void onLoad(h hVar) {
                if (hVar == MyTargetView.this.ad) {
                    if (MyTargetView.this.engine == null) {
                        MyTargetView.this.engine = c.a(hVar, MyTargetView.this, MyTargetView.this.getContext());
                    }
                    if (MyTargetView.this.engine != null) {
                        MyTargetView.this.engine.a(hVar);
                    }
                }
            }

            @Override // com.my.target.core.facades.h.a
            public void onNoAd(String str, h hVar) {
                if (MyTargetView.this.listener != null) {
                    MyTargetView.this.listener.onNoAd(str, MyTargetView.this);
                }
            }
        };
        Tracer.i("AdView created. Version: 4.6.4");
    }

    public void init(int i) {
        init(i, (CustomParams) null, true);
    }

    public void init(int i, CustomParams customParams) {
        init(i, customParams, true);
    }

    public void init(int i, CustomParams customParams, boolean z) {
        init(i, 0, customParams, z);
    }

    public void init(int i, int i2) {
        init(i, i2, null, true);
    }

    public void init(int i, int i2, CustomParams customParams) {
        init(i, i2, customParams, true);
    }

    public void init(int i, int i2, CustomParams customParams, boolean z) {
        if (!this.isInitialized) {
            String str = "standard_320x50";
            if (i2 == 1) {
                str = "standard_300x250";
            }
            this.ad = new h(i, str, getContext(), customParams, Boolean.valueOf(z));
            this.ad.setTrackingEnvironmentEnabled(this.trackingEvironmentEnabled);
            this.ad.a(this.adListener);
            this.isInitialized = true;
            Tracer.d("AdView initialized");
        }
    }

    public void load() {
        if (checkInit()) {
            this.ad.load();
        }
    }

    private boolean checkInit() {
        if (this.isInitialized) {
            return true;
        }
        Tracer.d("AdView not initialized");
        return false;
    }

    public void start() {
        if (this.engine != null) {
            this.engine.d();
        }
    }

    public void stop() {
        if (this.engine != null) {
            this.engine.c();
        }
    }

    public void pause() {
        if (this.engine != null) {
            this.engine.a();
        }
    }

    public void resume() {
        if (this.engine != null) {
            this.engine.b();
        }
    }

    public void destroy() {
        if (this.isInitialized) {
            if (this.engine != null) {
                this.engine.f();
                this.engine = null;
            }
            this.isInitialized = false;
            this.ad.a((h.a) null);
            this.ad = null;
        }
        this.listener = null;
    }
}
