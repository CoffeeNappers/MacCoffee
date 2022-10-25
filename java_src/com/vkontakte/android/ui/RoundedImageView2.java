package com.vkontakte.android.ui;

import android.annotation.TargetApi;
import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.Bitmap;
import android.graphics.BitmapShader;
import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.Shader;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.util.AttributeSet;
import android.view.View;
import android.widget.ImageView;
import com.vkontakte.android.R;
/* loaded from: classes3.dex */
public class RoundedImageView2 extends ImageView {
    private int corners;
    private DrawableFactory factory;
    private float imageRatio;
    private boolean isHeight;
    private OnBitmap onBitmap;
    @Nullable
    private Boolean roundDrawableEnable;

    /* loaded from: classes3.dex */
    public interface DrawableFactory {
        Drawable create(Bitmap bitmap, RoundedImageView2 roundedImageView2);
    }

    /* loaded from: classes3.dex */
    public interface OnBitmap {
        void onBitmap(Bitmap bitmap);
    }

    public RoundedImageView2(Context context) {
        super(context);
        this.imageRatio = 0.0f;
        this.isHeight = false;
        this.factory = null;
        this.roundDrawableEnable = true;
        init(context, null);
    }

    public RoundedImageView2(Context context, AttributeSet attrs) {
        super(context, attrs);
        this.imageRatio = 0.0f;
        this.isHeight = false;
        this.factory = null;
        this.roundDrawableEnable = true;
        init(context, attrs);
    }

    public RoundedImageView2(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        this.imageRatio = 0.0f;
        this.isHeight = false;
        this.factory = null;
        this.roundDrawableEnable = true;
        init(context, attrs);
    }

    @TargetApi(21)
    public RoundedImageView2(Context context, AttributeSet attrs, int defStyleAttr, int defStyleRes) {
        super(context, attrs, defStyleAttr, defStyleRes);
        this.imageRatio = 0.0f;
        this.isHeight = false;
        this.factory = null;
        this.roundDrawableEnable = true;
        init(context, attrs);
    }

    public void setRoundDrawableEnable(boolean roundDrawableEnable) {
        this.roundDrawableEnable = Boolean.valueOf(roundDrawableEnable);
    }

    public void setFactory(DrawableFactory factory) {
        this.factory = factory;
    }

    public void setImageRatio(float imageRatio) {
        this.imageRatio = imageRatio;
        requestLayout();
    }

    public void setIsHeight(boolean isHeight) {
        this.isHeight = isHeight;
    }

    private void init(@NonNull Context context, AttributeSet attrs) {
        if (attrs != null) {
            TypedArray a = context.obtainStyledAttributes(attrs, R.styleable.RoundedImageView);
            this.corners = a.getDimensionPixelSize(0, 0);
            this.imageRatio = a.getFloat(2, this.imageRatio);
            a.recycle();
        }
    }

    public void setOnBitmap(OnBitmap onBitmap) {
        this.onBitmap = onBitmap;
    }

    public void clearImage() {
        super.setImageDrawable(new ColorDrawable(0));
    }

    @Override // android.widget.ImageView
    public void setImageBitmap(Bitmap bm) {
        if (this.onBitmap != null) {
            this.onBitmap.onBitmap(bm);
        }
        if (this.roundDrawableEnable == null || this.roundDrawableEnable.booleanValue()) {
            super.setImageDrawable(createRoundedDrawable(bm, this));
        } else {
            super.setImageBitmap(bm);
        }
    }

    private Drawable createRoundedDrawable(Bitmap bitmap, RoundedImageView2 imageView) {
        if (bitmap == null) {
            return null;
        }
        return this.factory == null ? new RoundedDrawable(bitmap, imageView) : this.factory.create(bitmap, imageView);
    }

    @Override // android.widget.ImageView
    public void setImageDrawable(Drawable drawable) {
        if ((this.roundDrawableEnable == null || this.roundDrawableEnable.booleanValue()) && (drawable instanceof BitmapDrawable)) {
            setImageBitmap(((BitmapDrawable) drawable).getBitmap());
        } else {
            super.setImageDrawable(drawable);
        }
    }

    @Override // android.widget.ImageView
    public void setImageResource(int resId) {
        Drawable drawable = getResources().getDrawable(resId);
        if ((this.roundDrawableEnable == null || this.roundDrawableEnable.booleanValue()) && (drawable instanceof BitmapDrawable)) {
            setImageBitmap(((BitmapDrawable) drawable).getBitmap());
        } else {
            super.setImageResource(resId);
        }
    }

    @Override // android.widget.ImageView, android.view.View
    protected void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
        if (this.imageRatio != 0.0f) {
            if (this.isHeight) {
                int h = View.MeasureSpec.getSize(heightMeasureSpec);
                widthMeasureSpec = View.MeasureSpec.makeMeasureSpec((int) (h * this.imageRatio), 1073741824);
            } else {
                int w = View.MeasureSpec.getSize(widthMeasureSpec);
                heightMeasureSpec = View.MeasureSpec.makeMeasureSpec((int) (w * this.imageRatio), 1073741824);
            }
        }
        super.onMeasure(widthMeasureSpec, heightMeasureSpec);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public float getCorners(RectF rectF) {
        return (rectF.width() * this.corners) / getWidth();
    }

    /* loaded from: classes3.dex */
    public static class RoundedDrawable extends Drawable {
        protected int bitmapHeight;
        protected int bitmapWidth;
        protected final Paint paint;
        @Nullable
        protected RoundedImageView2 rIV2;
        protected final RectF rectF;

        public RoundedDrawable(Bitmap bitmap) {
            this(bitmap, null);
        }

        public RoundedDrawable(Bitmap bitmap, @Nullable RoundedImageView2 roundedImageView2) {
            this.rIV2 = roundedImageView2;
            this.rectF = new RectF();
            this.paint = new Paint();
            this.paint.setAntiAlias(true);
            this.paint.setDither(true);
            BitmapShader shader = new BitmapShader(bitmap, Shader.TileMode.CLAMP, Shader.TileMode.CLAMP);
            this.paint.setShader(shader);
            this.bitmapWidth = bitmap.getWidth();
            this.bitmapHeight = bitmap.getHeight();
        }

        @Override // android.graphics.drawable.Drawable
        public void draw(Canvas canvas) {
            float corners = this.rIV2 == null ? getIntrinsicHeight() / 2 : this.rIV2.getCorners(this.rectF);
            canvas.drawRoundRect(this.rectF, corners, corners, this.paint);
        }

        @Override // android.graphics.drawable.Drawable
        protected void onBoundsChange(Rect bounds) {
            super.onBoundsChange(bounds);
            this.rectF.set(bounds);
        }

        @Override // android.graphics.drawable.Drawable
        public void setAlpha(int alpha) {
            if (this.paint.getAlpha() != alpha) {
                this.paint.setAlpha(alpha);
                invalidateSelf();
            }
        }

        @Override // android.graphics.drawable.Drawable
        public void setColorFilter(ColorFilter cf) {
            this.paint.setColorFilter(cf);
        }

        @Override // android.graphics.drawable.Drawable
        public int getOpacity() {
            return -3;
        }

        @Override // android.graphics.drawable.Drawable
        public int getIntrinsicWidth() {
            return Math.min(this.bitmapWidth, this.bitmapHeight);
        }

        @Override // android.graphics.drawable.Drawable
        public int getIntrinsicHeight() {
            return getIntrinsicWidth();
        }

        public void setAntiAlias(boolean aa) {
            this.paint.setAntiAlias(aa);
            invalidateSelf();
        }

        @Override // android.graphics.drawable.Drawable
        public void setFilterBitmap(boolean filter) {
            this.paint.setFilterBitmap(filter);
            invalidateSelf();
        }

        @Override // android.graphics.drawable.Drawable
        public void setDither(boolean dither) {
            this.paint.setDither(dither);
            invalidateSelf();
        }
    }
}
