package com.vkontakte.android.ui.animation;

import android.annotation.TargetApi;
import android.content.Context;
import android.graphics.Canvas;
import android.util.AttributeSet;
import android.view.View;
import android.widget.LinearLayout;
import com.vkontakte.android.ui.animation.RevealAnimator;
/* loaded from: classes3.dex */
public class RevealLinearLayout extends LinearLayout implements RevealAnimator {
    private final RevealAnimatorImpl IMPL;

    public RevealLinearLayout(Context context) {
        super(context);
        this.IMPL = new RevealAnimatorImpl(this);
    }

    public RevealLinearLayout(Context context, AttributeSet attrs) {
        super(context, attrs);
        this.IMPL = new RevealAnimatorImpl(this);
    }

    public RevealLinearLayout(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        this.IMPL = new RevealAnimatorImpl(this);
    }

    @TargetApi(21)
    public RevealLinearLayout(Context context, AttributeSet attrs, int defStyleAttr, int defStyleRes) {
        super(context, attrs, defStyleAttr, defStyleRes);
        this.IMPL = new RevealAnimatorImpl(this);
    }

    @Override // com.vkontakte.android.ui.animation.RevealAnimator
    public void onRevealAnimationStart() {
        this.IMPL.onRevealAnimationStart();
    }

    @Override // com.vkontakte.android.ui.animation.RevealAnimator
    public void onRevealAnimationEnd() {
        this.IMPL.onRevealAnimationEnd();
    }

    @Override // com.vkontakte.android.ui.animation.RevealAnimator
    public void onRevealAnimationCancel() {
        this.IMPL.onRevealAnimationCancel();
    }

    @Override // com.vkontakte.android.ui.animation.RevealAnimator
    public void setRevealRadius(float radius) {
        this.IMPL.setRevealRadius(radius);
    }

    @Override // com.vkontakte.android.ui.animation.RevealAnimator
    public float getRevealRadius() {
        return this.IMPL.getRevealRadius();
    }

    @Override // com.vkontakte.android.ui.animation.RevealAnimator
    public void attachRevealInfo(RevealAnimator.RevealInfo info) {
        this.IMPL.attachRevealInfo(info);
    }

    @Override // android.view.ViewGroup
    protected boolean drawChild(Canvas canvas, View child, long drawingTime) {
        int state = this.IMPL.drawChild(canvas, child, drawingTime);
        if (state != 0) {
            boolean isInvalided = super.drawChild(canvas, child, drawingTime);
            canvas.restoreToCount(state);
            return isInvalided;
        }
        boolean isInvalided2 = super.drawChild(canvas, child, drawingTime);
        return isInvalided2;
    }
}
