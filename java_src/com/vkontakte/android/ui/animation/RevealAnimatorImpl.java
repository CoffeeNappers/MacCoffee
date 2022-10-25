package com.vkontakte.android.ui.animation;

import android.graphics.Canvas;
import android.graphics.Path;
import android.graphics.Rect;
import android.view.View;
import android.view.ViewGroup;
import com.vkontakte.android.ui.animation.RevealAnimator;
/* loaded from: classes3.dex */
public class RevealAnimatorImpl implements RevealAnimator {
    private float mRadius;
    private RevealAnimator.RevealInfo mRevealInfo;
    private boolean mRunning;
    private final ViewGroup mView;
    private final Rect mTargetBounds = new Rect();
    private Path mRevealPath = new Path();

    public RevealAnimatorImpl(ViewGroup view) {
        this.mView = view;
    }

    public int drawChild(Canvas canvas, View child, long drawingTime) {
        if (this.mRunning) {
            int state = canvas.save();
            this.mRevealPath.reset();
            this.mRevealPath.addCircle(this.mRevealInfo.centerX, this.mRevealInfo.centerY, this.mRadius, Path.Direction.CW);
            canvas.clipPath(this.mRevealPath);
            return state;
        }
        return 0;
    }

    @Override // com.vkontakte.android.ui.animation.RevealAnimator
    public void onRevealAnimationStart() {
        this.mRunning = true;
    }

    @Override // com.vkontakte.android.ui.animation.RevealAnimator
    public void onRevealAnimationEnd() {
        this.mRunning = false;
        invalidate(this.mTargetBounds);
    }

    @Override // com.vkontakte.android.ui.animation.RevealAnimator
    public void onRevealAnimationCancel() {
        onRevealAnimationEnd();
    }

    @Override // com.vkontakte.android.ui.animation.RevealAnimator
    public void setRevealRadius(float radius) {
        this.mRadius = radius;
        this.mView.getHitRect(this.mTargetBounds);
        invalidate(this.mTargetBounds);
    }

    @Override // com.vkontakte.android.ui.animation.RevealAnimator
    public float getRevealRadius() {
        return this.mRadius;
    }

    @Override // com.vkontakte.android.ui.animation.RevealAnimator
    public void invalidate(Rect bounds) {
        this.mView.invalidate(bounds);
    }

    @Override // com.vkontakte.android.ui.animation.RevealAnimator
    public void attachRevealInfo(RevealAnimator.RevealInfo info) {
        this.mRevealInfo = info;
    }
}
