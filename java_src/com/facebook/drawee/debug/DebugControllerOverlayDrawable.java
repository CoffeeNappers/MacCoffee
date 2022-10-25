package com.facebook.drawee.debug;

import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Matrix;
import android.graphics.Paint;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.drawable.Drawable;
import com.facebook.common.internal.VisibleForTesting;
import com.facebook.drawee.drawable.ScalingUtils;
import javax.annotation.Nullable;
/* loaded from: classes.dex */
public class DebugControllerOverlayDrawable extends Drawable {
    private static final float IMAGE_SIZE_THRESHOLD_NOT_OK = 0.5f;
    private static final float IMAGE_SIZE_THRESHOLD_OK = 0.1f;
    private static final int MAX_LINE_WIDTH_EM = 7;
    private static final int MAX_NUMBER_OF_LINES = 7;
    private static final int MAX_TEXT_SIZE_PX = 40;
    private static final int MIN_TEXT_SIZE_PX = 12;
    private static final String NO_CONTROLLER_ID = "none";
    private static final int OUTLINE_COLOR = -26624;
    private static final int OUTLINE_STROKE_WIDTH_PX = 2;
    @VisibleForTesting
    static final int OVERLAY_COLOR_IMAGE_ALMOST_OK = 1728026624;
    @VisibleForTesting
    static final int OVERLAY_COLOR_IMAGE_NOT_OK = 1727284022;
    @VisibleForTesting
    static final int OVERLAY_COLOR_IMAGE_OK = 1716301648;
    private static final int TEXT_COLOR = -1;
    private static final int TEXT_LINE_SPACING_PX = 8;
    private static final int TEXT_PADDING_PX = 10;
    private String mControllerId;
    private int mCurrentTextXPx;
    private int mCurrentTextYPx;
    private int mFrameCount;
    private int mHeightPx;
    private String mImageFormat;
    private int mImageSizeBytes;
    private int mLineIncrementPx;
    private int mLoopCount;
    private ScalingUtils.ScaleType mScaleType;
    private int mStartTextXPx;
    private int mStartTextYPx;
    private int mWidthPx;
    private int mTextGravity = 80;
    private final Paint mPaint = new Paint(1);
    private final Matrix mMatrix = new Matrix();
    private final Rect mRect = new Rect();
    private final RectF mRectF = new RectF();

    public DebugControllerOverlayDrawable() {
        reset();
    }

    public void reset() {
        this.mWidthPx = -1;
        this.mHeightPx = -1;
        this.mImageSizeBytes = -1;
        this.mFrameCount = -1;
        this.mLoopCount = -1;
        this.mImageFormat = null;
        setControllerId(null);
        invalidateSelf();
    }

    public void setTextGravity(int textGravity) {
        this.mTextGravity = textGravity;
        invalidateSelf();
    }

    public void setControllerId(@Nullable String controllerId) {
        if (controllerId == null) {
            controllerId = "none";
        }
        this.mControllerId = controllerId;
        invalidateSelf();
    }

    public void setDimensions(int widthPx, int heightPx) {
        this.mWidthPx = widthPx;
        this.mHeightPx = heightPx;
        invalidateSelf();
    }

    public void setAnimationInfo(int frameCount, int loopCount) {
        this.mFrameCount = frameCount;
        this.mLoopCount = loopCount;
        invalidateSelf();
    }

    public void setImageSize(int imageSizeBytes) {
        this.mImageSizeBytes = imageSizeBytes;
    }

    public void setImageFormat(@Nullable String imageFormat) {
        this.mImageFormat = imageFormat;
    }

    public void setScaleType(ScalingUtils.ScaleType scaleType) {
        this.mScaleType = scaleType;
    }

    @Override // android.graphics.drawable.Drawable
    protected void onBoundsChange(Rect bounds) {
        super.onBoundsChange(bounds);
        prepareDebugTextParameters(bounds, 7, 7);
    }

    @Override // android.graphics.drawable.Drawable
    public void draw(Canvas canvas) {
        Rect bounds = getBounds();
        this.mPaint.setStyle(Paint.Style.STROKE);
        this.mPaint.setStrokeWidth(2.0f);
        this.mPaint.setColor(OUTLINE_COLOR);
        canvas.drawRect(bounds.left, bounds.top, bounds.right, bounds.bottom, this.mPaint);
        this.mPaint.setStyle(Paint.Style.FILL);
        this.mPaint.setColor(determineOverlayColor(this.mWidthPx, this.mHeightPx, this.mScaleType));
        canvas.drawRect(bounds.left, bounds.top, bounds.right, bounds.bottom, this.mPaint);
        this.mPaint.setStyle(Paint.Style.FILL);
        this.mPaint.setStrokeWidth(0.0f);
        this.mPaint.setColor(-1);
        this.mCurrentTextXPx = this.mStartTextXPx;
        this.mCurrentTextYPx = this.mStartTextYPx;
        addDebugText(canvas, "ID: %s", this.mControllerId);
        addDebugText(canvas, "D: %dx%d", Integer.valueOf(bounds.width()), Integer.valueOf(bounds.height()));
        addDebugText(canvas, "I: %dx%d", Integer.valueOf(this.mWidthPx), Integer.valueOf(this.mHeightPx));
        addDebugText(canvas, "I: %d KiB", Integer.valueOf(this.mImageSizeBytes / 1024));
        if (this.mImageFormat != null) {
            addDebugText(canvas, "i format: %s", this.mImageFormat);
        }
        if (this.mFrameCount > 0) {
            addDebugText(canvas, "anim: f %d, l %d", Integer.valueOf(this.mFrameCount), Integer.valueOf(this.mLoopCount));
        }
        if (this.mScaleType != null) {
            addDebugText(canvas, "scale: %s", this.mScaleType);
        }
    }

    @Override // android.graphics.drawable.Drawable
    public void setAlpha(int alpha) {
    }

    @Override // android.graphics.drawable.Drawable
    public void setColorFilter(ColorFilter cf) {
    }

    @Override // android.graphics.drawable.Drawable
    public int getOpacity() {
        return -3;
    }

    private void prepareDebugTextParameters(Rect bounds, int numberOfLines, int maxLineLengthEm) {
        int textSizePx = Math.min(40, Math.max(12, Math.min(bounds.width() / maxLineLengthEm, bounds.height() / numberOfLines)));
        this.mPaint.setTextSize(textSizePx);
        this.mLineIncrementPx = textSizePx + 8;
        if (this.mTextGravity == 80) {
            this.mLineIncrementPx *= -1;
        }
        this.mStartTextXPx = bounds.left + 10;
        this.mStartTextYPx = this.mTextGravity == 80 ? bounds.bottom - 10 : bounds.top + 10 + 12;
    }

    private void addDebugText(Canvas canvas, String text, @Nullable Object... args) {
        if (args == null) {
            canvas.drawText(text, this.mCurrentTextXPx, this.mCurrentTextYPx, this.mPaint);
        } else {
            canvas.drawText(String.format(text, args), this.mCurrentTextXPx, this.mCurrentTextYPx, this.mPaint);
        }
        this.mCurrentTextYPx += this.mLineIncrementPx;
    }

    @VisibleForTesting
    int determineOverlayColor(int imageWidth, int imageHeight, @Nullable ScalingUtils.ScaleType scaleType) {
        int visibleDrawnAreaWidth = getBounds().width();
        int visibleDrawnAreaHeight = getBounds().height();
        if (visibleDrawnAreaWidth <= 0 || visibleDrawnAreaHeight <= 0 || imageWidth <= 0 || imageHeight <= 0) {
            return OVERLAY_COLOR_IMAGE_NOT_OK;
        }
        if (scaleType != null) {
            Rect rect = this.mRect;
            this.mRect.top = 0;
            rect.left = 0;
            this.mRect.right = visibleDrawnAreaWidth;
            this.mRect.bottom = visibleDrawnAreaHeight;
            this.mMatrix.reset();
            scaleType.getTransform(this.mMatrix, this.mRect, imageWidth, imageHeight, 0.0f, 0.0f);
            RectF rectF = this.mRectF;
            this.mRectF.top = 0.0f;
            rectF.left = 0.0f;
            this.mRectF.right = imageWidth;
            this.mRectF.bottom = imageHeight;
            this.mMatrix.mapRect(this.mRectF);
            int drawnAreaWidth = (int) this.mRectF.width();
            int drawnAreaHeight = (int) this.mRectF.height();
            visibleDrawnAreaWidth = Math.min(visibleDrawnAreaWidth, drawnAreaWidth);
            visibleDrawnAreaHeight = Math.min(visibleDrawnAreaHeight, drawnAreaHeight);
        }
        float scaledImageWidthThresholdOk = visibleDrawnAreaWidth * IMAGE_SIZE_THRESHOLD_OK;
        float scaledImageWidthThresholdNotOk = visibleDrawnAreaWidth * 0.5f;
        float scaledImageHeightThresholdOk = visibleDrawnAreaHeight * IMAGE_SIZE_THRESHOLD_OK;
        float scaledImageHeightThresholdNotOk = visibleDrawnAreaHeight * 0.5f;
        int absWidthDifference = Math.abs(imageWidth - visibleDrawnAreaWidth);
        int absHeightDifference = Math.abs(imageHeight - visibleDrawnAreaHeight);
        if (absWidthDifference < scaledImageWidthThresholdOk && absHeightDifference < scaledImageHeightThresholdOk) {
            return OVERLAY_COLOR_IMAGE_OK;
        }
        if (absWidthDifference < scaledImageWidthThresholdNotOk && absHeightDifference < scaledImageHeightThresholdNotOk) {
            return OVERLAY_COLOR_IMAGE_ALMOST_OK;
        }
        return OVERLAY_COLOR_IMAGE_NOT_OK;
    }
}
