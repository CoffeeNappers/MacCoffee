package com.vkontakte.android.ui.animation;

import android.animation.Animator;
import android.annotation.TargetApi;
import android.graphics.Rect;
import android.view.View;
import java.lang.ref.WeakReference;
/* loaded from: classes3.dex */
public interface RevealAnimator {
    void attachRevealInfo(RevealInfo revealInfo);

    float getRevealRadius();

    void invalidate(Rect rect);

    void onRevealAnimationCancel();

    void onRevealAnimationEnd();

    void onRevealAnimationStart();

    void setRevealRadius(float f);

    /* loaded from: classes3.dex */
    public static class RevealInfo {
        public final int centerX;
        public final int centerY;
        public final float endRadius;
        public final float startRadius;

        public RevealInfo(int centerX, int centerY, float startRadius, float endRadius) {
            this.centerX = centerX;
            this.centerY = centerY;
            this.startRadius = startRadius;
            this.endRadius = endRadius;
        }
    }

    /* loaded from: classes3.dex */
    public static class RevealFinishedGingerbread implements Animator.AnimatorListener {
        WeakReference<RevealAnimator> mReference;

        /* JADX INFO: Access modifiers changed from: package-private */
        public RevealFinishedGingerbread(RevealAnimator target) {
            this.mReference = new WeakReference<>(target);
        }

        @Override // android.animation.Animator.AnimatorListener
        public void onAnimationStart(Animator animation) {
            RevealAnimator target = this.mReference.get();
            target.onRevealAnimationStart();
        }

        @Override // android.animation.Animator.AnimatorListener
        public void onAnimationCancel(Animator animation) {
            RevealAnimator target = this.mReference.get();
            target.onRevealAnimationCancel();
        }

        @Override // android.animation.Animator.AnimatorListener
        public void onAnimationRepeat(Animator animation) {
        }

        @Override // android.animation.Animator.AnimatorListener
        public void onAnimationEnd(Animator animation) {
            RevealAnimator target = this.mReference.get();
            target.onRevealAnimationEnd();
        }
    }

    @TargetApi(11)
    /* loaded from: classes3.dex */
    public static class RevealFinishedIceCreamSandwich extends RevealFinishedGingerbread {
        int mFeaturedLayerType;
        int mLayerType;

        /* JADX INFO: Access modifiers changed from: package-private */
        public RevealFinishedIceCreamSandwich(RevealAnimator target) {
            super(target);
            this.mLayerType = ((View) target).getLayerType();
            this.mFeaturedLayerType = 1;
        }

        @Override // com.vkontakte.android.ui.animation.RevealAnimator.RevealFinishedGingerbread, android.animation.Animator.AnimatorListener
        public void onAnimationCancel(Animator animation) {
            ((View) this.mReference.get()).setLayerType(this.mLayerType, null);
            super.onAnimationEnd(animation);
        }

        @Override // com.vkontakte.android.ui.animation.RevealAnimator.RevealFinishedGingerbread, android.animation.Animator.AnimatorListener
        public void onAnimationStart(Animator animation) {
            ((View) this.mReference.get()).setLayerType(this.mFeaturedLayerType, null);
            super.onAnimationStart(animation);
        }

        @Override // com.vkontakte.android.ui.animation.RevealAnimator.RevealFinishedGingerbread, android.animation.Animator.AnimatorListener
        public void onAnimationEnd(Animator animation) {
            ((View) this.mReference.get()).setLayerType(this.mLayerType, null);
            super.onAnimationEnd(animation);
        }
    }

    /* loaded from: classes3.dex */
    public static class RevealFinishedJellyBeanMr2 extends RevealFinishedIceCreamSandwich {
        /* JADX INFO: Access modifiers changed from: package-private */
        @TargetApi(11)
        public RevealFinishedJellyBeanMr2(RevealAnimator target) {
            super(target);
            this.mFeaturedLayerType = 2;
        }
    }
}
