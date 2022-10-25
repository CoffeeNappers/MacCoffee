package com.facebook.drawee.drawable;

import android.graphics.Canvas;
import android.graphics.drawable.Drawable;
import android.os.SystemClock;
import com.facebook.common.internal.Preconditions;
import com.facebook.common.internal.VisibleForTesting;
import java.util.Arrays;
/* loaded from: classes.dex */
public class FadeDrawable extends ArrayDrawable {
    @VisibleForTesting
    public static final int TRANSITION_NONE = 2;
    @VisibleForTesting
    public static final int TRANSITION_RUNNING = 1;
    @VisibleForTesting
    public static final int TRANSITION_STARTING = 0;
    @VisibleForTesting
    int mAlpha;
    @VisibleForTesting
    int[] mAlphas;
    @VisibleForTesting
    int mDurationMs;
    @VisibleForTesting
    boolean[] mIsLayerOn;
    private final Drawable[] mLayers;
    @VisibleForTesting
    int mPreventInvalidateCount;
    @VisibleForTesting
    int[] mStartAlphas;
    @VisibleForTesting
    long mStartTimeMs;
    @VisibleForTesting
    int mTransitionState;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public FadeDrawable(Drawable[] layers) {
        super(layers);
        boolean z = true;
        Preconditions.checkState(layers.length < 1 ? false : z, "At least one layer required!");
        this.mLayers = layers;
        this.mStartAlphas = new int[layers.length];
        this.mAlphas = new int[layers.length];
        this.mAlpha = 255;
        this.mIsLayerOn = new boolean[layers.length];
        this.mPreventInvalidateCount = 0;
        resetInternal();
    }

    @Override // android.graphics.drawable.Drawable
    public void invalidateSelf() {
        if (this.mPreventInvalidateCount == 0) {
            super.invalidateSelf();
        }
    }

    public void beginBatchMode() {
        this.mPreventInvalidateCount++;
    }

    public void endBatchMode() {
        this.mPreventInvalidateCount--;
        invalidateSelf();
    }

    public void setTransitionDuration(int durationMs) {
        this.mDurationMs = durationMs;
        if (this.mTransitionState == 1) {
            this.mTransitionState = 0;
        }
    }

    public int getTransitionDuration() {
        return this.mDurationMs;
    }

    private void resetInternal() {
        this.mTransitionState = 2;
        Arrays.fill(this.mStartAlphas, 0);
        this.mStartAlphas[0] = 255;
        Arrays.fill(this.mAlphas, 0);
        this.mAlphas[0] = 255;
        Arrays.fill(this.mIsLayerOn, false);
        this.mIsLayerOn[0] = true;
    }

    public void reset() {
        resetInternal();
        invalidateSelf();
    }

    public void fadeInLayer(int index) {
        this.mTransitionState = 0;
        this.mIsLayerOn[index] = true;
        invalidateSelf();
    }

    public void fadeOutLayer(int index) {
        this.mTransitionState = 0;
        this.mIsLayerOn[index] = false;
        invalidateSelf();
    }

    public void fadeInAllLayers() {
        this.mTransitionState = 0;
        Arrays.fill(this.mIsLayerOn, true);
        invalidateSelf();
    }

    public void fadeOutAllLayers() {
        this.mTransitionState = 0;
        Arrays.fill(this.mIsLayerOn, false);
        invalidateSelf();
    }

    public void fadeToLayer(int index) {
        this.mTransitionState = 0;
        Arrays.fill(this.mIsLayerOn, false);
        this.mIsLayerOn[index] = true;
        invalidateSelf();
    }

    public void fadeUpToLayer(int index) {
        this.mTransitionState = 0;
        Arrays.fill(this.mIsLayerOn, 0, index + 1, true);
        Arrays.fill(this.mIsLayerOn, index + 1, this.mLayers.length, false);
        invalidateSelf();
    }

    public void finishTransitionImmediately() {
        this.mTransitionState = 2;
        for (int i = 0; i < this.mLayers.length; i++) {
            this.mAlphas[i] = this.mIsLayerOn[i] ? 255 : 0;
        }
        invalidateSelf();
    }

    private boolean updateAlphas(float ratio) {
        boolean done = true;
        for (int i = 0; i < this.mLayers.length; i++) {
            int dir = this.mIsLayerOn[i] ? 1 : -1;
            this.mAlphas[i] = (int) (this.mStartAlphas[i] + (dir * 255 * ratio));
            if (this.mAlphas[i] < 0) {
                this.mAlphas[i] = 0;
            }
            if (this.mAlphas[i] > 255) {
                this.mAlphas[i] = 255;
            }
            if (this.mIsLayerOn[i] && this.mAlphas[i] < 255) {
                done = false;
            }
            if (!this.mIsLayerOn[i] && this.mAlphas[i] > 0) {
                done = false;
            }
        }
        return done;
    }

    @Override // com.facebook.drawee.drawable.ArrayDrawable, android.graphics.drawable.Drawable
    public void draw(Canvas canvas) {
        int i = 2;
        boolean z = false;
        boolean done = true;
        switch (this.mTransitionState) {
            case 0:
                System.arraycopy(this.mAlphas, 0, this.mStartAlphas, 0, this.mLayers.length);
                this.mStartTimeMs = getCurrentTimeMs();
                float ratio = this.mDurationMs == 0 ? 1.0f : 0.0f;
                done = updateAlphas(ratio);
                if (!done) {
                    i = 1;
                }
                this.mTransitionState = i;
                break;
            case 1:
                if (this.mDurationMs > 0) {
                    z = true;
                }
                Preconditions.checkState(z);
                float ratio2 = ((float) (getCurrentTimeMs() - this.mStartTimeMs)) / this.mDurationMs;
                done = updateAlphas(ratio2);
                if (!done) {
                    i = 1;
                }
                this.mTransitionState = i;
                break;
            case 2:
                done = true;
                break;
        }
        for (int i2 = 0; i2 < this.mLayers.length; i2++) {
            drawDrawableWithAlpha(canvas, this.mLayers[i2], (this.mAlphas[i2] * this.mAlpha) / 255);
        }
        if (!done) {
            invalidateSelf();
        }
    }

    private void drawDrawableWithAlpha(Canvas canvas, Drawable drawable, int alpha) {
        if (drawable != null && alpha > 0) {
            this.mPreventInvalidateCount++;
            drawable.mutate().setAlpha(alpha);
            this.mPreventInvalidateCount--;
            drawable.draw(canvas);
        }
    }

    @Override // com.facebook.drawee.drawable.ArrayDrawable, android.graphics.drawable.Drawable
    public void setAlpha(int alpha) {
        if (this.mAlpha != alpha) {
            this.mAlpha = alpha;
            invalidateSelf();
        }
    }

    @Override // android.graphics.drawable.Drawable
    public int getAlpha() {
        return this.mAlpha;
    }

    protected long getCurrentTimeMs() {
        return SystemClock.uptimeMillis();
    }

    @VisibleForTesting
    public int getTransitionState() {
        return this.mTransitionState;
    }

    public boolean isLayerOn(int index) {
        return this.mIsLayerOn[index];
    }
}
