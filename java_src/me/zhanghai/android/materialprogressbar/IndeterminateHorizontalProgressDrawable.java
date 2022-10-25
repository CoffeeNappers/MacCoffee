package me.zhanghai.android.materialprogressbar;

import android.animation.Animator;
import android.content.Context;
import android.content.res.ColorStateList;
import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.PorterDuff;
import android.graphics.RectF;
import android.support.annotation.ColorInt;
import android.support.annotation.Keep;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import me.zhanghai.android.materialprogressbar.internal.ThemeUtils;
/* loaded from: classes3.dex */
public class IndeterminateHorizontalProgressDrawable extends IndeterminateProgressDrawableBase implements ShowTrackDrawable {
    private static final float PADDED_INTRINSIC_HEIGHT_DP = 16.0f;
    private static final float PROGRESS_INTRINSIC_HEIGHT_DP = 3.2f;
    private int mPaddedIntrinsicHeight;
    private int mProgressIntrinsicHeight;
    private RectTransformX mRect1TransformX;
    private RectTransformX mRect2TransformX;
    private boolean mShowTrack;
    private float mTrackAlpha;
    private static final RectF RECT_BOUND = new RectF(-180.0f, -1.0f, 180.0f, 1.0f);
    private static final RectF RECT_PADDED_BOUND = new RectF(-180.0f, -5.0f, 180.0f, 5.0f);
    private static final RectF RECT_PROGRESS = new RectF(-144.0f, -1.0f, 144.0f, 1.0f);
    private static final RectTransformX RECT_1_TRANSFORM_X = new RectTransformX(-522.6f, 0.1f);
    private static final RectTransformX RECT_2_TRANSFORM_X = new RectTransformX(-197.6f, 0.1f);

    @Override // me.zhanghai.android.materialprogressbar.IndeterminateProgressDrawableBase, me.zhanghai.android.materialprogressbar.ProgressDrawableBase, android.graphics.drawable.Drawable
    public /* bridge */ /* synthetic */ void draw(Canvas canvas) {
        super.draw(canvas);
    }

    @Override // me.zhanghai.android.materialprogressbar.ProgressDrawableBase, android.graphics.drawable.Drawable
    public /* bridge */ /* synthetic */ ColorFilter getColorFilter() {
        return super.getColorFilter();
    }

    @Override // me.zhanghai.android.materialprogressbar.ProgressDrawableBase, me.zhanghai.android.materialprogressbar.IntrinsicPaddingDrawable
    public /* bridge */ /* synthetic */ boolean getUseIntrinsicPadding() {
        return super.getUseIntrinsicPadding();
    }

    @Override // me.zhanghai.android.materialprogressbar.IndeterminateProgressDrawableBase, android.graphics.drawable.Animatable
    public /* bridge */ /* synthetic */ boolean isRunning() {
        return super.isRunning();
    }

    @Override // me.zhanghai.android.materialprogressbar.ProgressDrawableBase, android.graphics.drawable.Drawable
    public /* bridge */ /* synthetic */ void setAlpha(int i) {
        super.setAlpha(i);
    }

    @Override // me.zhanghai.android.materialprogressbar.ProgressDrawableBase, android.graphics.drawable.Drawable
    public /* bridge */ /* synthetic */ void setColorFilter(@Nullable ColorFilter colorFilter) {
        super.setColorFilter(colorFilter);
    }

    @Override // me.zhanghai.android.materialprogressbar.ProgressDrawableBase, android.graphics.drawable.Drawable, me.zhanghai.android.materialprogressbar.TintableDrawable
    public /* bridge */ /* synthetic */ void setTint(@ColorInt int i) {
        super.setTint(i);
    }

    @Override // me.zhanghai.android.materialprogressbar.ProgressDrawableBase, android.graphics.drawable.Drawable, me.zhanghai.android.materialprogressbar.TintableDrawable
    public /* bridge */ /* synthetic */ void setTintList(@Nullable ColorStateList colorStateList) {
        super.setTintList(colorStateList);
    }

    @Override // me.zhanghai.android.materialprogressbar.ProgressDrawableBase, android.graphics.drawable.Drawable, me.zhanghai.android.materialprogressbar.TintableDrawable
    public /* bridge */ /* synthetic */ void setTintMode(@NonNull PorterDuff.Mode mode) {
        super.setTintMode(mode);
    }

    @Override // me.zhanghai.android.materialprogressbar.ProgressDrawableBase, me.zhanghai.android.materialprogressbar.IntrinsicPaddingDrawable
    public /* bridge */ /* synthetic */ void setUseIntrinsicPadding(boolean z) {
        super.setUseIntrinsicPadding(z);
    }

    @Override // me.zhanghai.android.materialprogressbar.IndeterminateProgressDrawableBase, android.graphics.drawable.Animatable
    public /* bridge */ /* synthetic */ void start() {
        super.start();
    }

    @Override // me.zhanghai.android.materialprogressbar.IndeterminateProgressDrawableBase, android.graphics.drawable.Animatable
    public /* bridge */ /* synthetic */ void stop() {
        super.stop();
    }

    public IndeterminateHorizontalProgressDrawable(Context context) {
        super(context);
        this.mShowTrack = true;
        this.mRect1TransformX = new RectTransformX(RECT_1_TRANSFORM_X);
        this.mRect2TransformX = new RectTransformX(RECT_2_TRANSFORM_X);
        float density = context.getResources().getDisplayMetrics().density;
        this.mProgressIntrinsicHeight = Math.round(PROGRESS_INTRINSIC_HEIGHT_DP * density);
        this.mPaddedIntrinsicHeight = Math.round(PADDED_INTRINSIC_HEIGHT_DP * density);
        this.mTrackAlpha = ThemeUtils.getFloatFromAttrRes(16842803, context);
        this.mAnimators = new Animator[]{Animators.createIndeterminateHorizontalRect1(this.mRect1TransformX), Animators.createIndeterminateHorizontalRect2(this.mRect2TransformX)};
    }

    @Override // me.zhanghai.android.materialprogressbar.ShowTrackDrawable
    public boolean getShowTrack() {
        return this.mShowTrack;
    }

    @Override // me.zhanghai.android.materialprogressbar.ShowTrackDrawable
    public void setShowTrack(boolean showTrack) {
        if (this.mShowTrack != showTrack) {
            this.mShowTrack = showTrack;
            invalidateSelf();
        }
    }

    @Override // android.graphics.drawable.Drawable
    public int getIntrinsicHeight() {
        return this.mUseIntrinsicPadding ? this.mPaddedIntrinsicHeight : this.mProgressIntrinsicHeight;
    }

    @Override // android.graphics.drawable.Drawable
    public int getOpacity() {
        if (this.mAlpha == 0) {
            return -2;
        }
        if (this.mAlpha == 255 && (!this.mShowTrack || this.mTrackAlpha == 1.0f)) {
            return -1;
        }
        return -3;
    }

    @Override // me.zhanghai.android.materialprogressbar.ProgressDrawableBase
    protected void onPreparePaint(Paint paint) {
        paint.setStyle(Paint.Style.FILL);
    }

    @Override // me.zhanghai.android.materialprogressbar.ProgressDrawableBase
    protected void onDraw(Canvas canvas, int width, int height, Paint paint) {
        if (this.mUseIntrinsicPadding) {
            canvas.scale(width / RECT_PADDED_BOUND.width(), height / RECT_PADDED_BOUND.height());
            canvas.translate(RECT_PADDED_BOUND.width() / 2.0f, RECT_PADDED_BOUND.height() / 2.0f);
        } else {
            canvas.scale(width / RECT_BOUND.width(), height / RECT_BOUND.height());
            canvas.translate(RECT_BOUND.width() / 2.0f, RECT_BOUND.height() / 2.0f);
        }
        if (this.mShowTrack) {
            paint.setAlpha(Math.round(this.mAlpha * this.mTrackAlpha));
            drawTrackRect(canvas, paint);
            paint.setAlpha(this.mAlpha);
        }
        drawProgressRect(canvas, this.mRect2TransformX, paint);
        drawProgressRect(canvas, this.mRect1TransformX, paint);
    }

    private static void drawTrackRect(Canvas canvas, Paint paint) {
        canvas.drawRect(RECT_BOUND, paint);
    }

    private static void drawProgressRect(Canvas canvas, RectTransformX transformX, Paint paint) {
        int saveCount = canvas.save();
        canvas.translate(transformX.mTranslateX, 0.0f);
        canvas.scale(transformX.mScaleX, 1.0f);
        canvas.drawRect(RECT_PROGRESS, paint);
        canvas.restoreToCount(saveCount);
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes3.dex */
    public static class RectTransformX {
        public float mScaleX;
        public float mTranslateX;

        public RectTransformX(float translateX, float scaleX) {
            this.mTranslateX = translateX;
            this.mScaleX = scaleX;
        }

        public RectTransformX(RectTransformX that) {
            this.mTranslateX = that.mTranslateX;
            this.mScaleX = that.mScaleX;
        }

        @Keep
        public void setTranslateX(float translateX) {
            this.mTranslateX = translateX;
        }

        @Keep
        public void setScaleX(float scaleX) {
            this.mScaleX = scaleX;
        }
    }
}
