package com.mopub.nativeads;

import android.content.Context;
import android.support.annotation.Nullable;
import android.view.View;
import com.my.target.nativeads.NativeAd;
/* loaded from: classes2.dex */
public class MyTargetStaticNativeAd extends StaticNativeAd {
    private final ImpressionTracker impressionTracker;
    private NativeAd nativeAd;
    private final NativeClickHandler nativeClickHandler;

    public MyTargetStaticNativeAd(Context context) {
        this.nativeClickHandler = new NativeClickHandler(context);
        this.impressionTracker = new ImpressionTracker(context);
    }

    public void prepare(@Nullable View view) {
        if (view != null) {
            super.prepare(view);
            this.nativeClickHandler.setOnClickListener(view, this);
            this.impressionTracker.addView(view, this);
        }
    }

    public void recordImpression(View view) {
        if (this.nativeAd != null) {
            this.nativeAd.handleShow();
        }
    }

    public void handleClick(@Nullable View view) {
        if (this.nativeAd != null) {
            this.nativeAd.handleClick();
        }
    }

    public void clear(View view) {
        if (view != null) {
            super.clear(view);
            this.nativeClickHandler.clearOnClickListener(view);
            this.impressionTracker.clear();
        }
    }

    public void setNativeAd(NativeAd nativeAd) {
        this.nativeAd = nativeAd;
    }
}
