package android.support.design.widget;

import android.content.res.ColorStateList;
import android.graphics.PorterDuff;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.LayerDrawable;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.design.R;
import android.support.design.widget.AnimationUtils;
import android.support.design.widget.FloatingActionButtonImpl;
import android.support.design.widget.ValueAnimatorCompat;
import android.support.v4.graphics.drawable.DrawableCompat;
import android.view.animation.Animation;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public class FloatingActionButtonGingerbread extends FloatingActionButtonImpl {
    ShadowDrawableWrapper mShadowDrawable;
    private final StateListAnimator mStateListAnimator;

    /* JADX INFO: Access modifiers changed from: package-private */
    public FloatingActionButtonGingerbread(VisibilityAwareImageButton view, ShadowViewDelegate shadowViewDelegate, ValueAnimatorCompat.Creator animatorCreator) {
        super(view, shadowViewDelegate, animatorCreator);
        this.mStateListAnimator = new StateListAnimator();
        this.mStateListAnimator.addState(PRESSED_ENABLED_STATE_SET, createAnimator(new ElevateToTranslationZAnimation()));
        this.mStateListAnimator.addState(FOCUSED_ENABLED_STATE_SET, createAnimator(new ElevateToTranslationZAnimation()));
        this.mStateListAnimator.addState(ENABLED_STATE_SET, createAnimator(new ResetElevationAnimation()));
        this.mStateListAnimator.addState(EMPTY_STATE_SET, createAnimator(new DisabledElevationAnimation()));
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    @Override // android.support.design.widget.FloatingActionButtonImpl
    public void setBackgroundDrawable(ColorStateList backgroundTint, PorterDuff.Mode backgroundTintMode, int rippleColor, int borderWidth) {
        Drawable[] layers;
        this.mShapeDrawable = DrawableCompat.wrap(createShapeDrawable());
        DrawableCompat.setTintList(this.mShapeDrawable, backgroundTint);
        if (backgroundTintMode != null) {
            DrawableCompat.setTintMode(this.mShapeDrawable, backgroundTintMode);
        }
        GradientDrawable touchFeedbackShape = createShapeDrawable();
        this.mRippleDrawable = DrawableCompat.wrap(touchFeedbackShape);
        DrawableCompat.setTintList(this.mRippleDrawable, createColorStateList(rippleColor));
        if (borderWidth > 0) {
            this.mBorderDrawable = createBorderDrawable(borderWidth, backgroundTint);
            layers = new Drawable[]{this.mBorderDrawable, this.mShapeDrawable, this.mRippleDrawable};
        } else {
            this.mBorderDrawable = null;
            layers = new Drawable[]{this.mShapeDrawable, this.mRippleDrawable};
        }
        this.mContentBackground = new LayerDrawable(layers);
        this.mShadowDrawable = new ShadowDrawableWrapper(this.mView.getContext(), this.mContentBackground, this.mShadowViewDelegate.getRadius(), this.mElevation, this.mElevation + this.mPressedTranslationZ);
        this.mShadowDrawable.setAddPaddingForCorners(false);
        this.mShadowViewDelegate.setBackgroundDrawable(this.mShadowDrawable);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    @Override // android.support.design.widget.FloatingActionButtonImpl
    public void setBackgroundTintList(ColorStateList tint) {
        if (this.mShapeDrawable != null) {
            DrawableCompat.setTintList(this.mShapeDrawable, tint);
        }
        if (this.mBorderDrawable != null) {
            this.mBorderDrawable.setBorderTint(tint);
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    @Override // android.support.design.widget.FloatingActionButtonImpl
    public void setBackgroundTintMode(PorterDuff.Mode tintMode) {
        if (this.mShapeDrawable != null) {
            DrawableCompat.setTintMode(this.mShapeDrawable, tintMode);
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    @Override // android.support.design.widget.FloatingActionButtonImpl
    public void setRippleColor(int rippleColor) {
        if (this.mRippleDrawable != null) {
            DrawableCompat.setTintList(this.mRippleDrawable, createColorStateList(rippleColor));
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    @Override // android.support.design.widget.FloatingActionButtonImpl
    public float getElevation() {
        return this.mElevation;
    }

    @Override // android.support.design.widget.FloatingActionButtonImpl
    void onElevationsChanged(float elevation, float pressedTranslationZ) {
        if (this.mShadowDrawable != null) {
            this.mShadowDrawable.setShadowSize(elevation, this.mPressedTranslationZ + elevation);
            updatePadding();
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    @Override // android.support.design.widget.FloatingActionButtonImpl
    public void onDrawableStateChanged(int[] state) {
        this.mStateListAnimator.setState(state);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    @Override // android.support.design.widget.FloatingActionButtonImpl
    public void jumpDrawableToCurrentState() {
        this.mStateListAnimator.jumpToCurrentState();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    @Override // android.support.design.widget.FloatingActionButtonImpl
    public void hide(@Nullable final FloatingActionButtonImpl.InternalVisibilityChangedListener listener, final boolean fromUser) {
        if (!isOrWillBeHidden()) {
            this.mAnimState = 1;
            Animation anim = android.view.animation.AnimationUtils.loadAnimation(this.mView.getContext(), R.anim.design_fab_out);
            anim.setInterpolator(AnimationUtils.FAST_OUT_LINEAR_IN_INTERPOLATOR);
            anim.setDuration(200L);
            anim.setAnimationListener(new AnimationUtils.AnimationListenerAdapter() { // from class: android.support.design.widget.FloatingActionButtonGingerbread.1
                @Override // android.support.design.widget.AnimationUtils.AnimationListenerAdapter, android.view.animation.Animation.AnimationListener
                public void onAnimationEnd(Animation animation) {
                    FloatingActionButtonGingerbread.this.mAnimState = 0;
                    FloatingActionButtonGingerbread.this.mView.internalSetVisibility(fromUser ? 8 : 4, fromUser);
                    if (listener != null) {
                        listener.onHidden();
                    }
                }
            });
            this.mView.startAnimation(anim);
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    @Override // android.support.design.widget.FloatingActionButtonImpl
    public void show(@Nullable final FloatingActionButtonImpl.InternalVisibilityChangedListener listener, boolean fromUser) {
        if (!isOrWillBeShown()) {
            this.mAnimState = 2;
            this.mView.internalSetVisibility(0, fromUser);
            Animation anim = android.view.animation.AnimationUtils.loadAnimation(this.mView.getContext(), R.anim.design_fab_in);
            anim.setDuration(200L);
            anim.setInterpolator(AnimationUtils.LINEAR_OUT_SLOW_IN_INTERPOLATOR);
            anim.setAnimationListener(new AnimationUtils.AnimationListenerAdapter() { // from class: android.support.design.widget.FloatingActionButtonGingerbread.2
                @Override // android.support.design.widget.AnimationUtils.AnimationListenerAdapter, android.view.animation.Animation.AnimationListener
                public void onAnimationEnd(Animation animation) {
                    FloatingActionButtonGingerbread.this.mAnimState = 0;
                    if (listener != null) {
                        listener.onShown();
                    }
                }
            });
            this.mView.startAnimation(anim);
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    @Override // android.support.design.widget.FloatingActionButtonImpl
    public void onCompatShadowChanged() {
    }

    @Override // android.support.design.widget.FloatingActionButtonImpl
    void getPadding(Rect rect) {
        this.mShadowDrawable.getPadding(rect);
    }

    private ValueAnimatorCompat createAnimator(@NonNull ShadowAnimatorImpl impl) {
        ValueAnimatorCompat animator = this.mAnimatorCreator.createAnimator();
        animator.setInterpolator(ANIM_INTERPOLATOR);
        animator.setDuration(100L);
        animator.addListener(impl);
        animator.addUpdateListener(impl);
        animator.setFloatValues(0.0f, 1.0f);
        return animator;
    }

    /* loaded from: classes.dex */
    private abstract class ShadowAnimatorImpl extends ValueAnimatorCompat.AnimatorListenerAdapter implements ValueAnimatorCompat.AnimatorUpdateListener {
        private float mShadowSizeEnd;
        private float mShadowSizeStart;
        private boolean mValidValues;

        protected abstract float getTargetShadowSize();

        private ShadowAnimatorImpl() {
        }

        @Override // android.support.design.widget.ValueAnimatorCompat.AnimatorUpdateListener
        public void onAnimationUpdate(ValueAnimatorCompat animator) {
            if (!this.mValidValues) {
                this.mShadowSizeStart = FloatingActionButtonGingerbread.this.mShadowDrawable.getShadowSize();
                this.mShadowSizeEnd = getTargetShadowSize();
                this.mValidValues = true;
            }
            FloatingActionButtonGingerbread.this.mShadowDrawable.setShadowSize(this.mShadowSizeStart + ((this.mShadowSizeEnd - this.mShadowSizeStart) * animator.getAnimatedFraction()));
        }

        @Override // android.support.design.widget.ValueAnimatorCompat.AnimatorListenerAdapter, android.support.design.widget.ValueAnimatorCompat.AnimatorListener
        public void onAnimationEnd(ValueAnimatorCompat animator) {
            FloatingActionButtonGingerbread.this.mShadowDrawable.setShadowSize(this.mShadowSizeEnd);
            this.mValidValues = false;
        }
    }

    /* loaded from: classes.dex */
    private class ResetElevationAnimation extends ShadowAnimatorImpl {
        ResetElevationAnimation() {
            super();
        }

        @Override // android.support.design.widget.FloatingActionButtonGingerbread.ShadowAnimatorImpl
        protected float getTargetShadowSize() {
            return FloatingActionButtonGingerbread.this.mElevation;
        }
    }

    /* loaded from: classes.dex */
    private class ElevateToTranslationZAnimation extends ShadowAnimatorImpl {
        ElevateToTranslationZAnimation() {
            super();
        }

        @Override // android.support.design.widget.FloatingActionButtonGingerbread.ShadowAnimatorImpl
        protected float getTargetShadowSize() {
            return FloatingActionButtonGingerbread.this.mElevation + FloatingActionButtonGingerbread.this.mPressedTranslationZ;
        }
    }

    /* loaded from: classes.dex */
    private class DisabledElevationAnimation extends ShadowAnimatorImpl {
        DisabledElevationAnimation() {
            super();
        }

        @Override // android.support.design.widget.FloatingActionButtonGingerbread.ShadowAnimatorImpl
        protected float getTargetShadowSize() {
            return 0.0f;
        }
    }

    private static ColorStateList createColorStateList(int selectedColor) {
        int[][] states = new int[3];
        int[] colors = new int[3];
        states[0] = FOCUSED_ENABLED_STATE_SET;
        colors[0] = selectedColor;
        int i = 0 + 1;
        states[i] = PRESSED_ENABLED_STATE_SET;
        colors[i] = selectedColor;
        int i2 = i + 1;
        states[i2] = new int[0];
        colors[i2] = 0;
        int i3 = i2 + 1;
        return new ColorStateList(states, colors);
    }
}
