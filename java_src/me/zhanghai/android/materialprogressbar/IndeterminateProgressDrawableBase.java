package me.zhanghai.android.materialprogressbar;

import android.animation.Animator;
import android.content.Context;
import android.graphics.Canvas;
import android.graphics.drawable.Animatable;
/* loaded from: classes3.dex */
abstract class IndeterminateProgressDrawableBase extends ProgressDrawableBase implements Animatable {
    protected Animator[] mAnimators;

    public IndeterminateProgressDrawableBase(Context context) {
        super(context);
    }

    @Override // me.zhanghai.android.materialprogressbar.ProgressDrawableBase, android.graphics.drawable.Drawable
    public void draw(Canvas canvas) {
        super.draw(canvas);
        if (isStarted()) {
            invalidateSelf();
        }
    }

    public void start() {
        Animator[] animatorArr;
        if (!isStarted()) {
            for (Animator animator : this.mAnimators) {
                animator.start();
            }
            invalidateSelf();
        }
    }

    private boolean isStarted() {
        Animator[] animatorArr;
        for (Animator animator : this.mAnimators) {
            if (animator.isStarted()) {
                return true;
            }
        }
        return false;
    }

    public void stop() {
        Animator[] animatorArr;
        for (Animator animator : this.mAnimators) {
            animator.end();
        }
    }

    public boolean isRunning() {
        Animator[] animatorArr;
        for (Animator animator : this.mAnimators) {
            if (animator.isRunning()) {
                return true;
            }
        }
        return false;
    }
}
