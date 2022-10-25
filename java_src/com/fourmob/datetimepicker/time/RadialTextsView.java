package com.fourmob.datetimepicker.time;

import android.animation.Keyframe;
import android.animation.ObjectAnimator;
import android.animation.PropertyValuesHolder;
import android.animation.ValueAnimator;
import android.content.Context;
import android.content.res.Resources;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Typeface;
import android.util.Log;
import android.view.View;
import com.fourmob.datetimepicker.R;
/* loaded from: classes.dex */
public class RadialTextsView extends View {
    private static final String TAG = "RadialTextsView";
    private float mAmPmCircleRadiusMultiplier;
    private float mAnimationRadiusMultiplier;
    private float mCircleRadius;
    private float mCircleRadiusMultiplier;
    ObjectAnimator mDisappearAnimator;
    private boolean mDrawValuesReady;
    private boolean mHasInnerCircle;
    private float mInnerNumbersRadiusMultiplier;
    private float[] mInnerTextGridHeights;
    private float[] mInnerTextGridWidths;
    private float mInnerTextSize;
    private float mInnerTextSizeMultiplier;
    private String[] mInnerTexts;
    private InvalidateUpdateListener mInvalidateUpdateListener;
    private boolean mIs24HourMode;
    private boolean mIsInitialized;
    private float mNumbersRadiusMultiplier;
    private final Paint mPaint;
    ObjectAnimator mReappearAnimator;
    private float[] mTextGridHeights;
    private boolean mTextGridValuesDirty;
    private float[] mTextGridWidths;
    private float mTextSize;
    private float mTextSizeMultiplier;
    private String[] mTexts;
    private float mTransitionEndRadiusMultiplier;
    private float mTransitionMidRadiusMultiplier;
    private Typeface mTypefaceLight;
    private Typeface mTypefaceRegular;
    private int mXCenter;
    private int mYCenter;

    public RadialTextsView(Context context) {
        super(context);
        this.mPaint = new Paint();
        this.mIsInitialized = false;
    }

    public void initialize(Resources res, String[] texts, String[] innerTexts, boolean is24HourMode, boolean disappearsOut) {
        int i = -1;
        boolean z = false;
        if (this.mIsInitialized) {
            Log.e(TAG, "This RadialTextsView may only be initialized once.");
            return;
        }
        int numbersTextColor = res.getColor(R.color.numbers_text_color);
        this.mPaint.setColor(numbersTextColor);
        String typefaceFamily = res.getString(R.string.radial_numbers_typeface);
        this.mTypefaceLight = Typeface.create(typefaceFamily, 0);
        String typefaceFamilyRegular = res.getString(R.string.sans_serif);
        this.mTypefaceRegular = Typeface.create(typefaceFamilyRegular, 0);
        this.mPaint.setAntiAlias(true);
        this.mPaint.setTextAlign(Paint.Align.CENTER);
        this.mTexts = texts;
        this.mInnerTexts = innerTexts;
        this.mIs24HourMode = is24HourMode;
        if (innerTexts != null) {
            z = true;
        }
        this.mHasInnerCircle = z;
        if (is24HourMode) {
            this.mCircleRadiusMultiplier = Float.parseFloat(res.getString(R.string.circle_radius_multiplier_24HourMode));
        } else {
            this.mCircleRadiusMultiplier = Float.parseFloat(res.getString(R.string.circle_radius_multiplier));
            this.mAmPmCircleRadiusMultiplier = Float.parseFloat(res.getString(R.string.ampm_circle_radius_multiplier));
        }
        this.mTextGridHeights = new float[7];
        this.mTextGridWidths = new float[7];
        if (this.mHasInnerCircle) {
            this.mNumbersRadiusMultiplier = Float.parseFloat(res.getString(R.string.numbers_radius_multiplier_outer));
            this.mTextSizeMultiplier = Float.parseFloat(res.getString(R.string.text_size_multiplier_outer));
            this.mInnerNumbersRadiusMultiplier = Float.parseFloat(res.getString(R.string.numbers_radius_multiplier_inner));
            this.mInnerTextSizeMultiplier = Float.parseFloat(res.getString(R.string.text_size_multiplier_inner));
            this.mInnerTextGridHeights = new float[7];
            this.mInnerTextGridWidths = new float[7];
        } else {
            this.mNumbersRadiusMultiplier = Float.parseFloat(res.getString(R.string.numbers_radius_multiplier_normal));
            this.mTextSizeMultiplier = Float.parseFloat(res.getString(R.string.text_size_multiplier_normal));
        }
        this.mAnimationRadiusMultiplier = 1.0f;
        this.mTransitionMidRadiusMultiplier = ((disappearsOut ? -1 : 1) * 0.05f) + 1.0f;
        if (disappearsOut) {
            i = 1;
        }
        this.mTransitionEndRadiusMultiplier = (0.3f * i) + 1.0f;
        this.mInvalidateUpdateListener = new InvalidateUpdateListener();
        this.mTextGridValuesDirty = true;
        this.mIsInitialized = true;
    }

    @Override // android.view.View
    public boolean hasOverlappingRendering() {
        return false;
    }

    public void setAnimationRadiusMultiplier(float animationRadiusMultiplier) {
        this.mAnimationRadiusMultiplier = animationRadiusMultiplier;
        this.mTextGridValuesDirty = true;
    }

    @Override // android.view.View
    public void onDraw(Canvas canvas) {
        int viewWidth = getWidth();
        if (viewWidth != 0 && this.mIsInitialized) {
            if (!this.mDrawValuesReady) {
                this.mXCenter = getWidth() / 2;
                this.mYCenter = getHeight() / 2;
                this.mCircleRadius = Math.min(this.mXCenter, this.mYCenter) * this.mCircleRadiusMultiplier;
                if (!this.mIs24HourMode) {
                    float amPmCircleRadius = this.mCircleRadius * this.mAmPmCircleRadiusMultiplier;
                    this.mYCenter = (int) (this.mYCenter - (amPmCircleRadius / 2.0f));
                }
                this.mTextSize = this.mCircleRadius * this.mTextSizeMultiplier;
                if (this.mHasInnerCircle) {
                    this.mInnerTextSize = this.mCircleRadius * this.mInnerTextSizeMultiplier;
                }
                renderAnimations();
                this.mTextGridValuesDirty = true;
                this.mDrawValuesReady = true;
            }
            if (this.mTextGridValuesDirty) {
                float numbersRadius = this.mCircleRadius * this.mNumbersRadiusMultiplier * this.mAnimationRadiusMultiplier;
                calculateGridSizes(numbersRadius, this.mXCenter, this.mYCenter, this.mTextSize, this.mTextGridHeights, this.mTextGridWidths);
                if (this.mHasInnerCircle) {
                    float innerNumbersRadius = this.mCircleRadius * this.mInnerNumbersRadiusMultiplier * this.mAnimationRadiusMultiplier;
                    calculateGridSizes(innerNumbersRadius, this.mXCenter, this.mYCenter, this.mInnerTextSize, this.mInnerTextGridHeights, this.mInnerTextGridWidths);
                }
                this.mTextGridValuesDirty = false;
            }
            drawTexts(canvas, this.mTextSize, this.mTypefaceLight, this.mTexts, this.mTextGridWidths, this.mTextGridHeights);
            if (this.mHasInnerCircle) {
                drawTexts(canvas, this.mInnerTextSize, this.mTypefaceRegular, this.mInnerTexts, this.mInnerTextGridWidths, this.mInnerTextGridHeights);
            }
        }
    }

    private void calculateGridSizes(float numbersRadius, float xCenter, float yCenter, float textSize, float[] textGridHeights, float[] textGridWidths) {
        float offset2 = (((float) Math.sqrt(3.0d)) * numbersRadius) / 2.0f;
        float offset3 = numbersRadius / 2.0f;
        this.mPaint.setTextSize(textSize);
        float yCenter2 = yCenter - ((this.mPaint.descent() + this.mPaint.ascent()) / 2.0f);
        textGridHeights[0] = yCenter2 - numbersRadius;
        textGridWidths[0] = xCenter - numbersRadius;
        textGridHeights[1] = yCenter2 - offset2;
        textGridWidths[1] = xCenter - offset2;
        textGridHeights[2] = yCenter2 - offset3;
        textGridWidths[2] = xCenter - offset3;
        textGridHeights[3] = yCenter2;
        textGridWidths[3] = xCenter;
        textGridHeights[4] = yCenter2 + offset3;
        textGridWidths[4] = xCenter + offset3;
        textGridHeights[5] = yCenter2 + offset2;
        textGridWidths[5] = xCenter + offset2;
        textGridHeights[6] = yCenter2 + numbersRadius;
        textGridWidths[6] = xCenter + numbersRadius;
    }

    private void drawTexts(Canvas canvas, float textSize, Typeface typeface, String[] texts, float[] textGridWidths, float[] textGridHeights) {
        this.mPaint.setTextSize(textSize);
        this.mPaint.setTypeface(typeface);
        canvas.drawText(texts[0], textGridWidths[3], textGridHeights[0], this.mPaint);
        canvas.drawText(texts[1], textGridWidths[4], textGridHeights[1], this.mPaint);
        canvas.drawText(texts[2], textGridWidths[5], textGridHeights[2], this.mPaint);
        canvas.drawText(texts[3], textGridWidths[6], textGridHeights[3], this.mPaint);
        canvas.drawText(texts[4], textGridWidths[5], textGridHeights[4], this.mPaint);
        canvas.drawText(texts[5], textGridWidths[4], textGridHeights[5], this.mPaint);
        canvas.drawText(texts[6], textGridWidths[3], textGridHeights[6], this.mPaint);
        canvas.drawText(texts[7], textGridWidths[2], textGridHeights[5], this.mPaint);
        canvas.drawText(texts[8], textGridWidths[1], textGridHeights[4], this.mPaint);
        canvas.drawText(texts[9], textGridWidths[0], textGridHeights[3], this.mPaint);
        canvas.drawText(texts[10], textGridWidths[1], textGridHeights[2], this.mPaint);
        canvas.drawText(texts[11], textGridWidths[2], textGridHeights[1], this.mPaint);
    }

    private void renderAnimations() {
        Keyframe kf0 = Keyframe.ofFloat(0.0f, 1.0f);
        Keyframe kf1 = Keyframe.ofFloat(0.2f, this.mTransitionMidRadiusMultiplier);
        Keyframe kf2 = Keyframe.ofFloat(1.0f, this.mTransitionEndRadiusMultiplier);
        PropertyValuesHolder radiusDisappear = PropertyValuesHolder.ofKeyframe("animationRadiusMultiplier", kf0, kf1, kf2);
        Keyframe kf02 = Keyframe.ofFloat(0.0f, 1.0f);
        Keyframe kf12 = Keyframe.ofFloat(1.0f, 0.0f);
        PropertyValuesHolder fadeOut = PropertyValuesHolder.ofKeyframe("alpha", kf02, kf12);
        this.mDisappearAnimator = ObjectAnimator.ofPropertyValuesHolder(this, radiusDisappear, fadeOut).setDuration(500);
        this.mDisappearAnimator.addUpdateListener(this.mInvalidateUpdateListener);
        float totalDurationMultiplier = 1.0f + 0.25f;
        int totalDuration = (int) (500 * totalDurationMultiplier);
        float delayPoint = (500 * 0.25f) / totalDuration;
        float midwayPoint = 1.0f - ((1.0f - delayPoint) * 0.2f);
        Keyframe kf03 = Keyframe.ofFloat(0.0f, this.mTransitionEndRadiusMultiplier);
        Keyframe kf13 = Keyframe.ofFloat(delayPoint, this.mTransitionEndRadiusMultiplier);
        Keyframe kf22 = Keyframe.ofFloat(midwayPoint, this.mTransitionMidRadiusMultiplier);
        Keyframe kf3 = Keyframe.ofFloat(1.0f, 1.0f);
        PropertyValuesHolder radiusReappear = PropertyValuesHolder.ofKeyframe("animationRadiusMultiplier", kf03, kf13, kf22, kf3);
        Keyframe kf04 = Keyframe.ofFloat(0.0f, 0.0f);
        Keyframe kf14 = Keyframe.ofFloat(delayPoint, 0.0f);
        Keyframe kf23 = Keyframe.ofFloat(1.0f, 1.0f);
        PropertyValuesHolder fadeIn = PropertyValuesHolder.ofKeyframe("alpha", kf04, kf14, kf23);
        this.mReappearAnimator = ObjectAnimator.ofPropertyValuesHolder(this, radiusReappear, fadeIn).setDuration(totalDuration);
        this.mReappearAnimator.addUpdateListener(this.mInvalidateUpdateListener);
    }

    public ObjectAnimator getDisappearAnimator() {
        if (!this.mIsInitialized || !this.mDrawValuesReady || this.mDisappearAnimator == null) {
            Log.e(TAG, "RadialTextView was not ready for animation.");
            return null;
        }
        return this.mDisappearAnimator;
    }

    public ObjectAnimator getReappearAnimator() {
        if (!this.mIsInitialized || !this.mDrawValuesReady || this.mReappearAnimator == null) {
            Log.e(TAG, "RadialTextView was not ready for animation.");
            return null;
        }
        return this.mReappearAnimator;
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes.dex */
    public class InvalidateUpdateListener implements ValueAnimator.AnimatorUpdateListener {
        private InvalidateUpdateListener() {
        }

        @Override // android.animation.ValueAnimator.AnimatorUpdateListener
        public void onAnimationUpdate(ValueAnimator animation) {
            RadialTextsView.this.invalidate();
        }
    }
}
