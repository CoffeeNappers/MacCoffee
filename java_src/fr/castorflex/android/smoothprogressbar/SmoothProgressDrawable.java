package fr.castorflex.android.smoothprogressbar;

import android.content.Context;
import android.content.res.Resources;
import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.LinearGradient;
import android.graphics.Paint;
import android.graphics.Rect;
import android.graphics.Shader;
import android.graphics.drawable.Animatable;
import android.graphics.drawable.Drawable;
import android.os.SystemClock;
import android.view.animation.AccelerateInterpolator;
import android.view.animation.Interpolator;
import com.vkontakte.android.R;
/* loaded from: classes3.dex */
public class SmoothProgressDrawable extends Drawable implements Animatable {
    private static final long FRAME_DURATION = 16;
    private static final float OFFSET_PER_FRAME = 0.01f;
    private final Rect fBackgroundRect;
    private Drawable mBackgroundDrawable;
    private Rect mBounds;
    private Callbacks mCallbacks;
    private int[] mColors;
    private int mColorsIndex;
    private float mCurrentOffset;
    private int mCurrentSections;
    private boolean mFinishing;
    private float mFinishingOffset;
    private Interpolator mInterpolator;
    private int[] mLinearGradientColors;
    private float[] mLinearGradientPositions;
    private float mMaxOffset;
    private boolean mMirrorMode;
    private boolean mNewTurn;
    private Paint mPaint;
    private boolean mProgressiveStartActivated;
    private float mProgressiveStartSpeed;
    private float mProgressiveStopSpeed;
    private boolean mReversed;
    private boolean mRunning;
    private int mSectionsCount;
    private int mSeparatorLength;
    private float mSpeed;
    private int mStartSection;
    private float mStrokeWidth;
    private final Runnable mUpdater;
    private boolean mUseGradients;

    /* loaded from: classes3.dex */
    public interface Callbacks {
        void onStart();

        void onStop();
    }

    private SmoothProgressDrawable(Interpolator interpolator, int sectionsCount, int separatorLength, int[] colors, float strokeWidth, float speed, float progressiveStartSpeed, float progressiveStopSpeed, boolean reversed, boolean mirrorMode, Callbacks callbacks, boolean progressiveStartActivated, Drawable backgroundDrawable, boolean useGradients) {
        this.fBackgroundRect = new Rect();
        this.mUpdater = new Runnable() { // from class: fr.castorflex.android.smoothprogressbar.SmoothProgressDrawable.1
            @Override // java.lang.Runnable
            public void run() {
                if (SmoothProgressDrawable.this.isFinishing()) {
                    SmoothProgressDrawable.this.mFinishingOffset += SmoothProgressDrawable.this.mProgressiveStopSpeed * SmoothProgressDrawable.OFFSET_PER_FRAME;
                    SmoothProgressDrawable.this.mCurrentOffset += SmoothProgressDrawable.this.mProgressiveStopSpeed * SmoothProgressDrawable.OFFSET_PER_FRAME;
                    if (SmoothProgressDrawable.this.mFinishingOffset >= 1.0f) {
                        SmoothProgressDrawable.this.stop();
                    }
                } else if (SmoothProgressDrawable.this.isStarting()) {
                    SmoothProgressDrawable.this.mCurrentOffset += SmoothProgressDrawable.this.mProgressiveStartSpeed * SmoothProgressDrawable.OFFSET_PER_FRAME;
                } else {
                    SmoothProgressDrawable.this.mCurrentOffset += SmoothProgressDrawable.this.mSpeed * SmoothProgressDrawable.OFFSET_PER_FRAME;
                }
                if (SmoothProgressDrawable.this.mCurrentOffset >= SmoothProgressDrawable.this.mMaxOffset) {
                    SmoothProgressDrawable.this.mNewTurn = true;
                    SmoothProgressDrawable.this.mCurrentOffset -= SmoothProgressDrawable.this.mMaxOffset;
                }
                SmoothProgressDrawable.this.scheduleSelf(SmoothProgressDrawable.this.mUpdater, SystemClock.uptimeMillis() + 16);
                SmoothProgressDrawable.this.invalidateSelf();
            }
        };
        this.mRunning = false;
        this.mInterpolator = interpolator;
        this.mSectionsCount = sectionsCount;
        this.mStartSection = 0;
        this.mCurrentSections = this.mSectionsCount;
        this.mSeparatorLength = separatorLength;
        this.mSpeed = speed;
        this.mProgressiveStartSpeed = progressiveStartSpeed;
        this.mProgressiveStopSpeed = progressiveStopSpeed;
        this.mReversed = reversed;
        this.mColors = colors;
        this.mColorsIndex = 0;
        this.mMirrorMode = mirrorMode;
        this.mFinishing = false;
        this.mBackgroundDrawable = backgroundDrawable;
        this.mStrokeWidth = strokeWidth;
        this.mMaxOffset = 1.0f / this.mSectionsCount;
        this.mPaint = new Paint();
        this.mPaint.setStrokeWidth(strokeWidth);
        this.mPaint.setStyle(Paint.Style.STROKE);
        this.mPaint.setDither(false);
        this.mPaint.setAntiAlias(false);
        this.mProgressiveStartActivated = progressiveStartActivated;
        this.mCallbacks = callbacks;
        this.mUseGradients = useGradients;
        refreshLinearGradientOptions();
    }

    public void setInterpolator(Interpolator interpolator) {
        if (interpolator == null) {
            throw new IllegalArgumentException("Interpolator cannot be null");
        }
        this.mInterpolator = interpolator;
        invalidateSelf();
    }

    public void setColors(int[] colors) {
        if (colors == null || colors.length == 0) {
            throw new IllegalArgumentException("Colors cannot be null or empty");
        }
        this.mColorsIndex = 0;
        this.mColors = colors;
        refreshLinearGradientOptions();
        invalidateSelf();
    }

    public void setColor(int color) {
        setColors(new int[]{color});
    }

    public void setSpeed(float speed) {
        if (speed < 0.0f) {
            throw new IllegalArgumentException("Speed must be >= 0");
        }
        this.mSpeed = speed;
        invalidateSelf();
    }

    public void setProgressiveStartSpeed(float speed) {
        if (speed < 0.0f) {
            throw new IllegalArgumentException("SpeedProgressiveStart must be >= 0");
        }
        this.mProgressiveStartSpeed = speed;
        invalidateSelf();
    }

    public void setProgressiveStopSpeed(float speed) {
        if (speed < 0.0f) {
            throw new IllegalArgumentException("SpeedProgressiveStop must be >= 0");
        }
        this.mProgressiveStopSpeed = speed;
        invalidateSelf();
    }

    public void setSectionsCount(int sectionsCount) {
        if (sectionsCount <= 0) {
            throw new IllegalArgumentException("SectionsCount must be > 0");
        }
        this.mSectionsCount = sectionsCount;
        this.mMaxOffset = 1.0f / this.mSectionsCount;
        this.mCurrentOffset %= this.mMaxOffset;
        refreshLinearGradientOptions();
        invalidateSelf();
    }

    public void setSeparatorLength(int separatorLength) {
        if (separatorLength < 0) {
            throw new IllegalArgumentException("SeparatorLength must be >= 0");
        }
        this.mSeparatorLength = separatorLength;
        invalidateSelf();
    }

    public void setStrokeWidth(float strokeWidth) {
        if (strokeWidth < 0.0f) {
            throw new IllegalArgumentException("The strokeWidth must be >= 0");
        }
        this.mPaint.setStrokeWidth(strokeWidth);
        invalidateSelf();
    }

    public void setReversed(boolean reversed) {
        if (this.mReversed != reversed) {
            this.mReversed = reversed;
            invalidateSelf();
        }
    }

    public void setMirrorMode(boolean mirrorMode) {
        if (this.mMirrorMode != mirrorMode) {
            this.mMirrorMode = mirrorMode;
            invalidateSelf();
        }
    }

    public void setBackgroundDrawable(Drawable backgroundDrawable) {
        if (this.mBackgroundDrawable != backgroundDrawable) {
            this.mBackgroundDrawable = backgroundDrawable;
            invalidateSelf();
        }
    }

    public Drawable getBackgroundDrawable() {
        return this.mBackgroundDrawable;
    }

    public int[] getColors() {
        return this.mColors;
    }

    public float getStrokeWidth() {
        return this.mStrokeWidth;
    }

    public void setProgressiveStartActivated(boolean progressiveStartActivated) {
        this.mProgressiveStartActivated = progressiveStartActivated;
    }

    public void setUseGradients(boolean useGradients) {
        if (this.mUseGradients != useGradients) {
            this.mUseGradients = useGradients;
            refreshLinearGradientOptions();
            invalidateSelf();
        }
    }

    protected void refreshLinearGradientOptions() {
        if (this.mUseGradients) {
            this.mLinearGradientColors = new int[this.mSectionsCount + 2];
            this.mLinearGradientPositions = new float[this.mSectionsCount + 2];
            return;
        }
        this.mPaint.setShader(null);
        this.mLinearGradientColors = null;
        this.mLinearGradientPositions = null;
    }

    @Override // android.graphics.drawable.Drawable
    public void draw(Canvas canvas) {
        this.mBounds = getBounds();
        canvas.clipRect(this.mBounds);
        if (this.mNewTurn) {
            this.mColorsIndex = decrementColor(this.mColorsIndex);
            this.mNewTurn = false;
            if (isFinishing()) {
                this.mStartSection++;
                if (this.mStartSection > this.mSectionsCount) {
                    stop();
                    return;
                }
            }
            if (this.mCurrentSections < this.mSectionsCount) {
                this.mCurrentSections++;
            }
        }
        if (this.mUseGradients) {
            drawGradient(canvas);
        }
        drawStrokes(canvas);
    }

    private void drawGradient(Canvas canvas) {
        float left;
        float right;
        float xSectionWidth = 1.0f / this.mSectionsCount;
        int currentIndexColor = this.mColorsIndex;
        this.mLinearGradientPositions[0] = 0.0f;
        this.mLinearGradientPositions[this.mLinearGradientPositions.length - 1] = 1.0f;
        int firstColorIndex = currentIndexColor - 1;
        if (firstColorIndex < 0) {
            firstColorIndex += this.mColors.length;
        }
        this.mLinearGradientColors[0] = this.mColors[firstColorIndex];
        for (int i = 0; i < this.mSectionsCount; i++) {
            float position = this.mInterpolator.getInterpolation((i * xSectionWidth) + this.mCurrentOffset);
            this.mLinearGradientPositions[i + 1] = position;
            this.mLinearGradientColors[i + 1] = this.mColors[currentIndexColor];
            currentIndexColor = (currentIndexColor + 1) % this.mColors.length;
        }
        this.mLinearGradientColors[this.mLinearGradientColors.length - 1] = this.mColors[currentIndexColor];
        if (this.mReversed) {
            left = this.mMirrorMode ? Math.abs(this.mBounds.left - this.mBounds.right) / 2 : this.mBounds.left;
        } else {
            left = this.mBounds.left;
        }
        if (this.mMirrorMode) {
            right = this.mReversed ? this.mBounds.left : Math.abs(this.mBounds.left - this.mBounds.right) / 2;
        } else {
            right = this.mBounds.right;
        }
        float top = this.mBounds.centerY() - (this.mStrokeWidth / 2.0f);
        float bottom = this.mBounds.centerY() + (this.mStrokeWidth / 2.0f);
        LinearGradient linearGradient = new LinearGradient(left, top, right, bottom, this.mLinearGradientColors, this.mLinearGradientPositions, this.mMirrorMode ? Shader.TileMode.MIRROR : Shader.TileMode.CLAMP);
        this.mPaint.setShader(linearGradient);
    }

    private void drawStrokes(Canvas canvas) {
        float spaceLength;
        if (this.mReversed) {
            canvas.translate(this.mBounds.width(), 0.0f);
            canvas.scale(-1.0f, 1.0f);
        }
        float prevValue = 0.0f;
        int boundsWidth = this.mBounds.width();
        if (this.mMirrorMode) {
            boundsWidth /= 2;
        }
        int width = this.mSeparatorLength + boundsWidth + this.mSectionsCount;
        int centerY = this.mBounds.centerY();
        float xSectionWidth = 1.0f / this.mSectionsCount;
        float firstX = 0.0f;
        float lastX = 0.0f;
        int currentIndexColor = this.mColorsIndex;
        if (this.mStartSection == this.mCurrentSections && this.mCurrentSections == this.mSectionsCount) {
            firstX = canvas.getWidth();
        }
        for (int i = 0; i <= this.mCurrentSections; i++) {
            float xOffset = (i * xSectionWidth) + this.mCurrentOffset;
            float prev = Math.max(0.0f, xOffset - xSectionWidth);
            float ratioSectionWidth = Math.abs(this.mInterpolator.getInterpolation(prev) - this.mInterpolator.getInterpolation(Math.min(xOffset, 1.0f)));
            float sectionWidth = (int) (width * ratioSectionWidth);
            if (sectionWidth + prev < width) {
                spaceLength = Math.min(sectionWidth, this.mSeparatorLength);
            } else {
                spaceLength = 0.0f;
            }
            float drawLength = sectionWidth > spaceLength ? sectionWidth - spaceLength : 0.0f;
            float end = prevValue + drawLength;
            if (end > prevValue && i >= this.mStartSection) {
                float xFinishingOffset = this.mInterpolator.getInterpolation(Math.min(this.mFinishingOffset, 1.0f));
                float startX = Math.max(width * xFinishingOffset, Math.min(boundsWidth, prevValue));
                float endX = Math.min(boundsWidth, end);
                drawLine(canvas, boundsWidth, startX, centerY, endX, centerY, currentIndexColor);
                if (i == this.mStartSection) {
                    firstX = startX - this.mSeparatorLength;
                }
            }
            if (i == this.mCurrentSections) {
                lastX = prevValue + sectionWidth;
            }
            prevValue = end + spaceLength;
            currentIndexColor = incrementColor(currentIndexColor);
        }
        drawBackgroundIfNeeded(canvas, firstX, lastX);
    }

    private void drawLine(Canvas canvas, int canvasWidth, float startX, float startY, float stopX, float stopY, int currentIndexColor) {
        this.mPaint.setColor(this.mColors[currentIndexColor]);
        if (!this.mMirrorMode) {
            canvas.drawLine(startX, startY, stopX, stopY, this.mPaint);
        } else if (this.mReversed) {
            canvas.drawLine(canvasWidth + startX, startY, canvasWidth + stopX, stopY, this.mPaint);
            canvas.drawLine(canvasWidth - startX, startY, canvasWidth - stopX, stopY, this.mPaint);
        } else {
            canvas.drawLine(startX, startY, stopX, stopY, this.mPaint);
            canvas.drawLine((canvasWidth * 2) - startX, startY, (canvasWidth * 2) - stopX, stopY, this.mPaint);
        }
    }

    private void drawBackgroundIfNeeded(Canvas canvas, float firstX, float lastX) {
        if (this.mBackgroundDrawable != null) {
            this.fBackgroundRect.top = (int) ((canvas.getHeight() - this.mStrokeWidth) / 2.0f);
            this.fBackgroundRect.bottom = (int) ((canvas.getHeight() + this.mStrokeWidth) / 2.0f);
            this.fBackgroundRect.left = 0;
            this.fBackgroundRect.right = this.mMirrorMode ? canvas.getWidth() / 2 : canvas.getWidth();
            this.mBackgroundDrawable.setBounds(this.fBackgroundRect);
            if (!isRunning()) {
                if (this.mMirrorMode) {
                    canvas.save();
                    canvas.translate(canvas.getWidth() / 2, 0.0f);
                    drawBackground(canvas, 0.0f, this.fBackgroundRect.width());
                    canvas.scale(-1.0f, 1.0f);
                    drawBackground(canvas, 0.0f, this.fBackgroundRect.width());
                    canvas.restore();
                    return;
                }
                drawBackground(canvas, 0.0f, this.fBackgroundRect.width());
            } else if (isFinishing() || isStarting()) {
                if (firstX > lastX) {
                    firstX = lastX;
                    lastX = firstX;
                }
                if (firstX > 0.0f) {
                    if (this.mMirrorMode) {
                        canvas.save();
                        canvas.translate(canvas.getWidth() / 2, 0.0f);
                        if (this.mReversed) {
                            drawBackground(canvas, 0.0f, firstX);
                            canvas.scale(-1.0f, 1.0f);
                            drawBackground(canvas, 0.0f, firstX);
                        } else {
                            drawBackground(canvas, (canvas.getWidth() / 2) - firstX, canvas.getWidth() / 2);
                            canvas.scale(-1.0f, 1.0f);
                            drawBackground(canvas, (canvas.getWidth() / 2) - firstX, canvas.getWidth() / 2);
                        }
                        canvas.restore();
                    } else {
                        drawBackground(canvas, 0.0f, firstX);
                    }
                }
                if (lastX <= canvas.getWidth()) {
                    if (this.mMirrorMode) {
                        canvas.save();
                        canvas.translate(canvas.getWidth() / 2, 0.0f);
                        if (this.mReversed) {
                            drawBackground(canvas, lastX, canvas.getWidth() / 2);
                            canvas.scale(-1.0f, 1.0f);
                            drawBackground(canvas, lastX, canvas.getWidth() / 2);
                        } else {
                            drawBackground(canvas, 0.0f, (canvas.getWidth() / 2) - lastX);
                            canvas.scale(-1.0f, 1.0f);
                            drawBackground(canvas, 0.0f, (canvas.getWidth() / 2) - lastX);
                        }
                        canvas.restore();
                        return;
                    }
                    drawBackground(canvas, lastX, canvas.getWidth());
                }
            }
        }
    }

    private void drawBackground(Canvas canvas, float fromX, float toX) {
        int count = canvas.save();
        canvas.clipRect(fromX, (int) ((canvas.getHeight() - this.mStrokeWidth) / 2.0f), toX, (int) ((canvas.getHeight() + this.mStrokeWidth) / 2.0f));
        this.mBackgroundDrawable.draw(canvas);
        canvas.restoreToCount(count);
    }

    private int incrementColor(int colorIndex) {
        int colorIndex2 = colorIndex + 1;
        if (colorIndex2 >= this.mColors.length) {
            return 0;
        }
        return colorIndex2;
    }

    private int decrementColor(int colorIndex) {
        int colorIndex2 = colorIndex - 1;
        if (colorIndex2 < 0) {
            int colorIndex3 = this.mColors.length - 1;
            return colorIndex3;
        }
        return colorIndex2;
    }

    public void progressiveStart() {
        progressiveStart(0);
    }

    public void progressiveStart(int index) {
        resetProgressiveStart(index);
        start();
    }

    private void resetProgressiveStart(int index) {
        checkColorIndex(index);
        this.mCurrentOffset = 0.0f;
        this.mFinishing = false;
        this.mFinishingOffset = 0.0f;
        this.mStartSection = 0;
        this.mCurrentSections = 0;
        this.mColorsIndex = index;
    }

    public void progressiveStop() {
        this.mFinishing = true;
        this.mStartSection = 0;
    }

    @Override // android.graphics.drawable.Drawable
    public void setAlpha(int alpha) {
        this.mPaint.setAlpha(alpha);
    }

    @Override // android.graphics.drawable.Drawable
    public void setColorFilter(ColorFilter cf) {
        this.mPaint.setColorFilter(cf);
    }

    @Override // android.graphics.drawable.Drawable
    public int getOpacity() {
        return -2;
    }

    @Override // android.graphics.drawable.Animatable
    public void start() {
        if (this.mProgressiveStartActivated) {
            resetProgressiveStart(0);
        }
        if (!isRunning()) {
            if (this.mCallbacks != null) {
                this.mCallbacks.onStart();
            }
            scheduleSelf(this.mUpdater, SystemClock.uptimeMillis() + 16);
            invalidateSelf();
        }
    }

    @Override // android.graphics.drawable.Animatable
    public void stop() {
        if (isRunning()) {
            if (this.mCallbacks != null) {
                this.mCallbacks.onStop();
            }
            this.mRunning = false;
            unscheduleSelf(this.mUpdater);
        }
    }

    @Override // android.graphics.drawable.Drawable
    public void scheduleSelf(Runnable what, long when) {
        this.mRunning = true;
        super.scheduleSelf(what, when);
    }

    @Override // android.graphics.drawable.Animatable
    public boolean isRunning() {
        return this.mRunning;
    }

    public boolean isStarting() {
        return this.mCurrentSections < this.mSectionsCount;
    }

    public boolean isFinishing() {
        return this.mFinishing;
    }

    public void setCallbacks(Callbacks callbacks) {
        this.mCallbacks = callbacks;
    }

    private void checkColorIndex(int index) {
        if (index < 0 || index >= this.mColors.length) {
            throw new IllegalArgumentException(String.format("Index %d not valid", Integer.valueOf(index)));
        }
    }

    /* loaded from: classes3.dex */
    public static class Builder {
        private Drawable mBackgroundDrawableWhenHidden;
        private int[] mColors;
        private boolean mGenerateBackgroundUsingColors;
        private boolean mGradients;
        private Interpolator mInterpolator;
        private boolean mMirrorMode;
        private Callbacks mOnProgressiveStopEndedListener;
        private boolean mProgressiveStartActivated;
        private float mProgressiveStartSpeed;
        private float mProgressiveStopSpeed;
        private boolean mReversed;
        private int mSectionsCount;
        private float mSpeed;
        private int mStrokeSeparatorLength;
        private float mStrokeWidth;

        public Builder(Context context) {
            initValues(context);
        }

        public SmoothProgressDrawable build() {
            if (this.mGenerateBackgroundUsingColors) {
                this.mBackgroundDrawableWhenHidden = SmoothProgressBarUtils.generateDrawableWithColors(this.mColors, this.mStrokeWidth);
            }
            SmoothProgressDrawable ret = new SmoothProgressDrawable(this.mInterpolator, this.mSectionsCount, this.mStrokeSeparatorLength, this.mColors, this.mStrokeWidth, this.mSpeed, this.mProgressiveStartSpeed, this.mProgressiveStopSpeed, this.mReversed, this.mMirrorMode, this.mOnProgressiveStopEndedListener, this.mProgressiveStartActivated, this.mBackgroundDrawableWhenHidden, this.mGradients);
            return ret;
        }

        private void initValues(Context context) {
            Resources res = context.getResources();
            this.mInterpolator = new AccelerateInterpolator();
            this.mSectionsCount = res.getInteger(R.integer.spb_default_sections_count);
            this.mColors = new int[]{res.getColor(R.color.spb_default_color)};
            this.mSpeed = Float.parseFloat(res.getString(R.string.spb_default_speed));
            this.mProgressiveStartSpeed = this.mSpeed;
            this.mProgressiveStopSpeed = this.mSpeed;
            this.mReversed = res.getBoolean(R.bool.spb_default_reversed);
            this.mStrokeSeparatorLength = res.getDimensionPixelSize(R.dimen.spb_default_stroke_separator_length);
            this.mStrokeWidth = res.getDimensionPixelOffset(R.dimen.spb_default_stroke_width);
            this.mProgressiveStartActivated = res.getBoolean(R.bool.spb_default_progressiveStart_activated);
            this.mGradients = false;
        }

        public Builder interpolator(Interpolator interpolator) {
            if (interpolator == null) {
                throw new IllegalArgumentException("Interpolator can't be null");
            }
            this.mInterpolator = interpolator;
            return this;
        }

        public Builder sectionsCount(int sectionsCount) {
            if (sectionsCount <= 0) {
                throw new IllegalArgumentException("SectionsCount must be > 0");
            }
            this.mSectionsCount = sectionsCount;
            return this;
        }

        public Builder separatorLength(int separatorLength) {
            if (separatorLength < 0) {
                throw new IllegalArgumentException("SeparatorLength must be >= 0");
            }
            this.mStrokeSeparatorLength = separatorLength;
            return this;
        }

        public Builder color(int color) {
            this.mColors = new int[]{color};
            return this;
        }

        public Builder colors(int[] colors) {
            if (colors == null || colors.length == 0) {
                throw new IllegalArgumentException("Your color array must not be empty");
            }
            this.mColors = colors;
            return this;
        }

        public Builder strokeWidth(float width) {
            if (width < 0.0f) {
                throw new IllegalArgumentException("The width must be >= 0");
            }
            this.mStrokeWidth = width;
            return this;
        }

        public Builder speed(float speed) {
            if (speed < 0.0f) {
                throw new IllegalArgumentException("Speed must be >= 0");
            }
            this.mSpeed = speed;
            return this;
        }

        public Builder progressiveStartSpeed(float progressiveStartSpeed) {
            if (progressiveStartSpeed < 0.0f) {
                throw new IllegalArgumentException("progressiveStartSpeed must be >= 0");
            }
            this.mProgressiveStartSpeed = progressiveStartSpeed;
            return this;
        }

        public Builder progressiveStopSpeed(float progressiveStopSpeed) {
            if (progressiveStopSpeed < 0.0f) {
                throw new IllegalArgumentException("progressiveStopSpeed must be >= 0");
            }
            this.mProgressiveStopSpeed = progressiveStopSpeed;
            return this;
        }

        public Builder reversed(boolean reversed) {
            this.mReversed = reversed;
            return this;
        }

        public Builder mirrorMode(boolean mirrorMode) {
            this.mMirrorMode = mirrorMode;
            return this;
        }

        public Builder progressiveStart(boolean progressiveStartActivated) {
            this.mProgressiveStartActivated = progressiveStartActivated;
            return this;
        }

        public Builder callbacks(Callbacks onProgressiveStopEndedListener) {
            this.mOnProgressiveStopEndedListener = onProgressiveStopEndedListener;
            return this;
        }

        public Builder backgroundDrawable(Drawable backgroundDrawableWhenHidden) {
            this.mBackgroundDrawableWhenHidden = backgroundDrawableWhenHidden;
            return this;
        }

        public Builder generateBackgroundUsingColors() {
            this.mGenerateBackgroundUsingColors = true;
            return this;
        }

        public Builder gradients() {
            return gradients(true);
        }

        public Builder gradients(boolean useGradients) {
            this.mGradients = useGradients;
            return this;
        }
    }
}
