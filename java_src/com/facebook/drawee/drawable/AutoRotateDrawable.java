package com.facebook.drawee.drawable;

import android.graphics.Canvas;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.os.SystemClock;
import com.facebook.common.internal.Preconditions;
import com.facebook.common.internal.VisibleForTesting;
/* loaded from: classes.dex */
public class AutoRotateDrawable extends ForwardingDrawable implements Runnable, CloneableDrawable {
    private static final int DEGREES_IN_FULL_ROTATION = 360;
    private static final int FRAME_INTERVAL_MS = 20;
    private boolean mClockwise;
    private int mInterval;
    private boolean mIsScheduled;
    @VisibleForTesting
    float mRotationAngle;

    public AutoRotateDrawable(Drawable drawable, int interval) {
        this(drawable, interval, true);
    }

    public AutoRotateDrawable(Drawable drawable, int interval, boolean clockwise) {
        super((Drawable) Preconditions.checkNotNull(drawable));
        this.mRotationAngle = 0.0f;
        this.mIsScheduled = false;
        this.mInterval = interval;
        this.mClockwise = clockwise;
    }

    public void reset() {
        this.mRotationAngle = 0.0f;
        this.mIsScheduled = false;
        unscheduleSelf(this);
        invalidateSelf();
    }

    public void setClockwise(boolean clockwise) {
        this.mClockwise = clockwise;
    }

    @Override // com.facebook.drawee.drawable.ForwardingDrawable, android.graphics.drawable.Drawable
    public void draw(Canvas canvas) {
        int saveCount = canvas.save();
        Rect bounds = getBounds();
        int width = bounds.right - bounds.left;
        int height = bounds.bottom - bounds.top;
        float angle = this.mRotationAngle;
        if (!this.mClockwise) {
            angle = 360.0f - this.mRotationAngle;
        }
        canvas.rotate(angle, bounds.left + (width / 2), bounds.top + (height / 2));
        super.draw(canvas);
        canvas.restoreToCount(saveCount);
        scheduleNextFrame();
    }

    @Override // java.lang.Runnable
    public void run() {
        this.mIsScheduled = false;
        this.mRotationAngle += getIncrement();
        invalidateSelf();
    }

    @Override // com.facebook.drawee.drawable.CloneableDrawable
    /* renamed from: cloneDrawable  reason: collision with other method in class */
    public AutoRotateDrawable mo212cloneDrawable() {
        Drawable delegateCopy = DrawableUtils.cloneDrawable(getDrawable());
        return new AutoRotateDrawable(delegateCopy, this.mInterval, this.mClockwise);
    }

    private void scheduleNextFrame() {
        if (!this.mIsScheduled) {
            this.mIsScheduled = true;
            scheduleSelf(this, SystemClock.uptimeMillis() + 20);
        }
    }

    private int getIncrement() {
        return (int) ((20.0f / this.mInterval) * 360.0f);
    }
}
