package com.vk.music.graphics;

import android.animation.TimeInterpolator;
import android.graphics.Bitmap;
import android.graphics.BitmapShader;
import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.PorterDuff;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.Shader;
import android.graphics.drawable.Drawable;
import android.support.annotation.ColorRes;
import android.support.annotation.DimenRes;
import android.support.annotation.IntegerRes;
import android.support.annotation.NonNull;
import android.view.animation.AccelerateInterpolator;
import android.view.animation.DecelerateInterpolator;
import com.vk.core.util.Resourcer;
import java.util.Random;
/* loaded from: classes2.dex */
public final class PlayingDrawable extends Drawable {
    private static final long UPDATE_INTERVAL = 150;
    private final AccelerateInterpolator accelerate;
    private boolean animating;
    private final int count;
    private final DecelerateInterpolator decelerate;
    private final int gapWidth;
    private final int height;
    private final TimeInterpolator[] interpolators;
    private final float[] nextVals;
    private final Paint paint;
    private final float[] prevVals;
    private final Random random;
    private final RectF rect;
    private int rectCornerRadius;
    private final int rectHeight;
    private final int rectMinHeight;
    private final int rectWidth;
    private final Canvas shaderCanvas;
    private final Paint shaderPaint;
    private long startTime;
    private final int width;

    /* loaded from: classes2.dex */
    public static class Builder {
        private int count;
        private int gapWidth;
        private int rectColor;
        private int rectCornerRadius;
        private int rectHeight;
        private int rectMinHeight;
        private int rectWidth;

        public Builder count(int val) {
            this.count = val;
            return this;
        }

        public Builder rectWidth(int val) {
            this.rectWidth = val;
            return this;
        }

        public Builder rectHeight(int val) {
            this.rectHeight = val;
            return this;
        }

        public Builder rectMinHeight(int val) {
            this.rectMinHeight = val;
            return this;
        }

        public Builder gapWidth(int val) {
            this.gapWidth = val;
            return this;
        }

        public Builder rectCornerRadius(int val) {
            this.rectCornerRadius = val;
            return this;
        }

        public Builder rectColor(int val) {
            this.rectColor = val;
            return this;
        }

        public PlayingDrawable build() {
            return new PlayingDrawable(this);
        }
    }

    /* loaded from: classes2.dex */
    public static final class ResourceBuilder extends Builder {
        private final Resourcer resourcer;

        public ResourceBuilder(@NonNull Resourcer resourcer) {
            this.resourcer = resourcer;
        }

        @Override // com.vk.music.graphics.PlayingDrawable.Builder
        public Builder count(@IntegerRes int val) {
            return super.count(this.resourcer.integer(val));
        }

        @Override // com.vk.music.graphics.PlayingDrawable.Builder
        public Builder rectWidth(@DimenRes int val) {
            return super.rectWidth(this.resourcer.dim(val));
        }

        @Override // com.vk.music.graphics.PlayingDrawable.Builder
        public Builder rectHeight(@DimenRes int val) {
            return super.rectHeight(this.resourcer.dim(val));
        }

        @Override // com.vk.music.graphics.PlayingDrawable.Builder
        public Builder rectMinHeight(@DimenRes int val) {
            return super.rectMinHeight(this.resourcer.dim(val));
        }

        @Override // com.vk.music.graphics.PlayingDrawable.Builder
        public Builder gapWidth(@DimenRes int val) {
            return super.gapWidth(this.resourcer.dim(val));
        }

        @Override // com.vk.music.graphics.PlayingDrawable.Builder
        public Builder rectCornerRadius(@DimenRes int val) {
            return super.rectCornerRadius(this.resourcer.dim(val));
        }

        @Override // com.vk.music.graphics.PlayingDrawable.Builder
        public Builder rectColor(@ColorRes int val) {
            return super.rectColor(this.resourcer.color(val));
        }
    }

    private PlayingDrawable(@NonNull Builder builder) {
        this.startTime = 0L;
        this.count = builder.count;
        this.rectWidth = builder.rectWidth;
        this.rectHeight = builder.rectHeight;
        this.rectMinHeight = builder.rectMinHeight;
        if (this.rectMinHeight <= this.rectHeight) {
            this.gapWidth = builder.gapWidth;
            this.rectCornerRadius = builder.rectCornerRadius;
            this.width = (this.count * (this.rectWidth + this.gapWidth)) - this.gapWidth;
            this.height = this.rectHeight;
            Bitmap shaderBitmap = Bitmap.createBitmap(this.width, this.height, Bitmap.Config.ARGB_8888);
            this.shaderCanvas = new Canvas(shaderBitmap);
            this.rect = new RectF();
            this.random = new Random();
            this.shaderPaint = new Paint(1);
            this.shaderPaint.setColor(builder.rectColor);
            this.paint = new Paint(1);
            this.paint.setShader(new BitmapShader(shaderBitmap, Shader.TileMode.CLAMP, Shader.TileMode.CLAMP));
            this.prevVals = new float[this.count];
            this.nextVals = new float[this.count];
            this.interpolators = new TimeInterpolator[this.count];
            this.decelerate = new DecelerateInterpolator();
            this.accelerate = new AccelerateInterpolator();
            return;
        }
        throw new IllegalArgumentException("rectMinHeight = " + this.rectMinHeight + " must not be greater than rectHeight = " + this.rectHeight);
    }

    @Override // android.graphics.drawable.Drawable
    public void draw(@NonNull Canvas canvas) {
        long sysTime = System.currentTimeMillis();
        canvas.save();
        Rect bounds = getBounds();
        canvas.translate((bounds.width() - this.width) / 2, (bounds.height() - this.height) / 2);
        if (sysTime - this.startTime > UPDATE_INTERVAL) {
            this.startTime = sysTime;
            for (int i = 0; i < this.count; i++) {
                this.prevVals[i] = this.nextVals[i];
                if (this.animating) {
                    this.nextVals[i] = (float) (Math.cbrt(this.random.nextInt(1000000)) / 100.0d);
                } else {
                    this.nextVals[i] = 0.0f;
                }
                this.interpolators[i] = this.nextVals[i] > this.prevVals[i] ? this.accelerate : this.decelerate;
            }
        }
        float t = ((float) (sysTime - this.startTime)) / 150.0f;
        float s = 0.0f;
        this.shaderCanvas.drawColor(0, PorterDuff.Mode.CLEAR);
        for (int i2 = 0; i2 < this.count; i2++) {
            s += this.prevVals[i2];
            int rectH = Math.max(Math.round((this.prevVals[i2] + ((this.nextVals[i2] - this.prevVals[i2]) * this.interpolators[i2].getInterpolation(t))) * this.rectHeight), this.rectWidth);
            float left = (this.rectWidth + this.gapWidth) * i2;
            this.rect.set(left, this.rectHeight - rectH, this.rectWidth + left, this.rectHeight);
            this.shaderCanvas.drawRoundRect(this.rect, this.rectCornerRadius, this.rectCornerRadius, this.shaderPaint);
        }
        this.rect.set(0.0f, 0.0f, this.width, this.height);
        canvas.drawRect(this.rect, this.paint);
        canvas.restore();
        if (s != 0.0f || this.animating) {
            invalidateSelf();
        }
    }

    @Override // android.graphics.drawable.Drawable
    public void setAlpha(int alpha) {
        this.paint.setAlpha(alpha);
    }

    @Override // android.graphics.drawable.Drawable
    public void setColorFilter(ColorFilter colorFilter) {
        this.paint.setColorFilter(colorFilter);
    }

    @Override // android.graphics.drawable.Drawable
    public int getOpacity() {
        return -1;
    }

    @Override // android.graphics.drawable.Drawable
    public boolean isStateful() {
        return true;
    }

    @Override // android.graphics.drawable.Drawable
    protected boolean onStateChange(int[] state) {
        boolean oldValue = this.animating;
        this.animating = false;
        int length = state.length;
        int i = 0;
        while (true) {
            if (i >= length) {
                break;
            }
            int s = state[i];
            if (s != 16843518) {
                i++;
            } else {
                this.animating = true;
                break;
            }
        }
        return oldValue == this.animating;
    }
}
