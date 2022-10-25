package android.support.design.widget;

import android.content.Context;
import android.content.res.ColorStateList;
import android.graphics.PorterDuff;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.support.annotation.Nullable;
import android.support.design.R;
import android.support.design.widget.ValueAnimatorCompat;
import android.support.v4.content.ContextCompat;
import android.view.ViewTreeObserver;
import android.view.animation.Interpolator;
/* loaded from: classes.dex */
abstract class FloatingActionButtonImpl {
    static final int ANIM_STATE_HIDING = 1;
    static final int ANIM_STATE_NONE = 0;
    static final int ANIM_STATE_SHOWING = 2;
    static final long PRESSED_ANIM_DELAY = 100;
    static final long PRESSED_ANIM_DURATION = 100;
    static final int SHOW_HIDE_ANIM_DURATION = 200;
    final ValueAnimatorCompat.Creator mAnimatorCreator;
    CircularBorderDrawable mBorderDrawable;
    Drawable mContentBackground;
    float mElevation;
    private ViewTreeObserver.OnPreDrawListener mPreDrawListener;
    float mPressedTranslationZ;
    Drawable mRippleDrawable;
    final ShadowViewDelegate mShadowViewDelegate;
    Drawable mShapeDrawable;
    final VisibilityAwareImageButton mView;
    static final Interpolator ANIM_INTERPOLATOR = AnimationUtils.FAST_OUT_LINEAR_IN_INTERPOLATOR;
    static final int[] PRESSED_ENABLED_STATE_SET = {16842919, 16842910};
    static final int[] FOCUSED_ENABLED_STATE_SET = {16842908, 16842910};
    static final int[] ENABLED_STATE_SET = {16842910};
    static final int[] EMPTY_STATE_SET = new int[0];
    int mAnimState = 0;
    private final Rect mTmpRect = new Rect();

    /* loaded from: classes.dex */
    interface InternalVisibilityChangedListener {
        void onHidden();

        void onShown();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public abstract float getElevation();

    abstract void getPadding(Rect rect);

    /* JADX INFO: Access modifiers changed from: package-private */
    public abstract void hide(@Nullable InternalVisibilityChangedListener internalVisibilityChangedListener, boolean z);

    /* JADX INFO: Access modifiers changed from: package-private */
    public abstract void jumpDrawableToCurrentState();

    /* JADX INFO: Access modifiers changed from: package-private */
    public abstract void onCompatShadowChanged();

    /* JADX INFO: Access modifiers changed from: package-private */
    public abstract void onDrawableStateChanged(int[] iArr);

    abstract void onElevationsChanged(float f, float f2);

    /* JADX INFO: Access modifiers changed from: package-private */
    public abstract void setBackgroundDrawable(ColorStateList colorStateList, PorterDuff.Mode mode, int i, int i2);

    /* JADX INFO: Access modifiers changed from: package-private */
    public abstract void setBackgroundTintList(ColorStateList colorStateList);

    /* JADX INFO: Access modifiers changed from: package-private */
    public abstract void setBackgroundTintMode(PorterDuff.Mode mode);

    /* JADX INFO: Access modifiers changed from: package-private */
    public abstract void setRippleColor(int i);

    /* JADX INFO: Access modifiers changed from: package-private */
    public abstract void show(@Nullable InternalVisibilityChangedListener internalVisibilityChangedListener, boolean z);

    /* JADX INFO: Access modifiers changed from: package-private */
    public FloatingActionButtonImpl(VisibilityAwareImageButton view, ShadowViewDelegate shadowViewDelegate, ValueAnimatorCompat.Creator animatorCreator) {
        this.mView = view;
        this.mShadowViewDelegate = shadowViewDelegate;
        this.mAnimatorCreator = animatorCreator;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public final void setElevation(float elevation) {
        if (this.mElevation != elevation) {
            this.mElevation = elevation;
            onElevationsChanged(elevation, this.mPressedTranslationZ);
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public final void setPressedTranslationZ(float translationZ) {
        if (this.mPressedTranslationZ != translationZ) {
            this.mPressedTranslationZ = translationZ;
            onElevationsChanged(this.mElevation, translationZ);
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public final Drawable getContentBackground() {
        return this.mContentBackground;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public final void updatePadding() {
        Rect rect = this.mTmpRect;
        getPadding(rect);
        onPaddingUpdated(rect);
        this.mShadowViewDelegate.setShadowPadding(rect.left, rect.top, rect.right, rect.bottom);
    }

    void onPaddingUpdated(Rect padding) {
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void onAttachedToWindow() {
        if (requirePreDrawListener()) {
            ensurePreDrawListener();
            this.mView.getViewTreeObserver().addOnPreDrawListener(this.mPreDrawListener);
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void onDetachedFromWindow() {
        if (this.mPreDrawListener != null) {
            this.mView.getViewTreeObserver().removeOnPreDrawListener(this.mPreDrawListener);
            this.mPreDrawListener = null;
        }
    }

    boolean requirePreDrawListener() {
        return false;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public CircularBorderDrawable createBorderDrawable(int borderWidth, ColorStateList backgroundTint) {
        Context context = this.mView.getContext();
        CircularBorderDrawable borderDrawable = newCircularDrawable();
        borderDrawable.setGradientColors(ContextCompat.getColor(context, R.color.design_fab_stroke_top_outer_color), ContextCompat.getColor(context, R.color.design_fab_stroke_top_inner_color), ContextCompat.getColor(context, R.color.design_fab_stroke_end_inner_color), ContextCompat.getColor(context, R.color.design_fab_stroke_end_outer_color));
        borderDrawable.setBorderWidth(borderWidth);
        borderDrawable.setBorderTint(backgroundTint);
        return borderDrawable;
    }

    CircularBorderDrawable newCircularDrawable() {
        return new CircularBorderDrawable();
    }

    void onPreDraw() {
    }

    private void ensurePreDrawListener() {
        if (this.mPreDrawListener == null) {
            this.mPreDrawListener = new ViewTreeObserver.OnPreDrawListener() { // from class: android.support.design.widget.FloatingActionButtonImpl.1
                @Override // android.view.ViewTreeObserver.OnPreDrawListener
                public boolean onPreDraw() {
                    FloatingActionButtonImpl.this.onPreDraw();
                    return true;
                }
            };
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public GradientDrawable createShapeDrawable() {
        GradientDrawable d = newGradientDrawableForShape();
        d.setShape(1);
        d.setColor(-1);
        return d;
    }

    GradientDrawable newGradientDrawableForShape() {
        return new GradientDrawable();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public boolean isOrWillBeShown() {
        return this.mView.getVisibility() != 0 ? this.mAnimState == 2 : this.mAnimState != 1;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public boolean isOrWillBeHidden() {
        return this.mView.getVisibility() == 0 ? this.mAnimState == 1 : this.mAnimState != 2;
    }
}
