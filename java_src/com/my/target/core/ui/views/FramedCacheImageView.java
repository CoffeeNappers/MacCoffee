package com.my.target.core.ui.views;

import android.content.Context;
import android.graphics.Bitmap;
import android.widget.FrameLayout;
/* loaded from: classes2.dex */
public class FramedCacheImageView extends FrameLayout {
    private final CacheImageView a;

    public void setImageBitmap(Bitmap bitmap) {
        this.a.setImageBitmap(bitmap);
    }

    public FramedCacheImageView(Context context) {
        super(context);
        this.a = new CacheImageView(context);
        FrameLayout.LayoutParams layoutParams = new FrameLayout.LayoutParams(-2, -2);
        layoutParams.gravity = 17;
        addView(this.a, layoutParams);
    }
}
