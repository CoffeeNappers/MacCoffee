package com.vkontakte.android.ui.animation;

import android.view.View;
import android.view.ViewGroup;
import android.view.animation.Animation;
import android.view.animation.Transformation;
/* loaded from: classes3.dex */
public class ResizeAnimation extends Animation {
    private final float mFromHeight;
    private final float mFromWidth;
    private final float mToHeight;
    private final float mToWidth;
    private final View mView;

    public ResizeAnimation(View v, float fromWidth, float fromHeight, float toWidth, float toHeight) {
        this.mToHeight = toHeight;
        this.mToWidth = toWidth;
        this.mFromHeight = fromHeight;
        this.mFromWidth = fromWidth;
        this.mView = v;
        setDuration(300L);
    }

    @Override // android.view.animation.Animation
    protected void applyTransformation(float interpolatedTime, Transformation t) {
        float height = ((this.mToHeight - this.mFromHeight) * interpolatedTime) + this.mFromHeight;
        float width = ((this.mToWidth - this.mFromWidth) * interpolatedTime) + this.mFromWidth;
        ViewGroup.LayoutParams p = this.mView.getLayoutParams();
        p.height = (int) height;
        p.width = (int) width;
        this.mView.requestLayout();
    }

    public boolean equals(Object o) {
        boolean z = true;
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        ResizeAnimation that = (ResizeAnimation) o;
        if (Float.compare(that.mToHeight, this.mToHeight) != 0 || Float.compare(that.mFromHeight, this.mFromHeight) != 0 || Float.compare(that.mToWidth, this.mToWidth) != 0 || Float.compare(that.mFromWidth, this.mFromWidth) != 0) {
            return false;
        }
        if (this.mView != null) {
            z = this.mView.equals(that.mView);
        } else if (that.mView != null) {
            z = false;
        }
        return z;
    }
}
