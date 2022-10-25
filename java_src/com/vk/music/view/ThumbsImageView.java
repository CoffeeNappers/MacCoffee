package com.vk.music.view;

import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.Bitmap;
import android.graphics.BitmapShader;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.PorterDuff;
import android.graphics.RectF;
import android.graphics.Shader;
import android.graphics.drawable.Drawable;
import android.support.annotation.DrawableRes;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.util.AttributeSet;
import com.facebook.drawee.drawable.ScalingUtils;
import com.vk.core.util.CollectionUtils;
import com.vk.imageloader.view.VKMultiImageView;
import com.vk.music.dto.Thumb;
import com.vkontakte.android.R;
import com.vkontakte.android.ViewUtils;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
/* loaded from: classes2.dex */
public final class ThumbsImageView extends VKMultiImageView {
    private static final int MAX_IMAGES = 4;
    private int cornerRadiusBottomLeft;
    private int cornerRadiusBottomRight;
    private int cornerRadiusTopLeft;
    private int cornerRadiusTopRight;
    private Drawable emptyDrawable;
    private Canvas imageCanvas;
    private Paint imagePaint;
    private Path imagePath;
    private RectF imageRect;
    private String[] imagesToLoad;
    private int imagesToLoadCount;
    private Drawable loadingDrawable;
    private Drawable placeholderDrawable;
    private int[] sizes;
    private List<Thumb> thumbs;

    private static void calcSizes(@NonNull int[] sizes, int viewSize, int imagesCount) {
        Arrays.fill(sizes, 0);
        switch (imagesCount) {
            case 1:
                sizes[0] = viewSize;
                return;
            case 2:
                sizes[0] = viewSize;
                sizes[1] = viewSize;
                return;
            case 3:
                int viewSize2 = viewSize / 2;
                sizes[0] = viewSize;
                sizes[1] = viewSize2;
                sizes[2] = viewSize2;
                return;
            case 4:
                int viewSize22 = viewSize / 2;
                for (int i = 0; i < imagesCount; i++) {
                    sizes[i] = viewSize22;
                }
                return;
            default:
                return;
        }
    }

    public ThumbsImageView(Context context) {
        super(context);
        this.imagePath = null;
        this.imagesToLoad = new String[4];
        this.imagesToLoadCount = 0;
        this.sizes = new int[4];
    }

    public ThumbsImageView(Context context, AttributeSet attrs) {
        super(context, attrs);
        this.imagePath = null;
        this.imagesToLoad = new String[4];
        this.imagesToLoadCount = 0;
        this.sizes = new int[4];
    }

    public ThumbsImageView(Context context, AttributeSet attrs, int defStyle) {
        super(context, attrs, defStyle);
        this.imagePath = null;
        this.imagesToLoad = new String[4];
        this.imagesToLoadCount = 0;
        this.sizes = new int[4];
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.vk.imageloader.view.VKMultiImageView
    public void init(@NonNull Context context, @Nullable AttributeSet attrs) {
        super.init(context, attrs);
        if (attrs != null) {
            TypedArray array = context.obtainStyledAttributes(attrs, R.styleable.GenericDraweeHierarchy);
            setCornerRadius(array.getDimensionPixelSize(16, 0));
            this.loadingDrawable = array.getDrawable(12);
            this.emptyDrawable = array.getDrawable(2);
            array.recycle();
        } else {
            setCornerRadius(0);
        }
        if (this.emptyDrawable != null) {
            setPlaceholderDrawable(this.emptyDrawable);
        }
        this.imageRect = new RectF();
        buildDrawImageParams();
        this.imagePaint = new Paint(7);
        for (int i = 0; i < 4; i++) {
            addImage();
        }
        setScaleType(ScalingUtils.ScaleType.CENTER_CROP);
    }

    public void setCornerRadius(int cornerRadius) {
        setCornerRadius(cornerRadius, cornerRadius, cornerRadius, cornerRadius);
    }

    public void setCornerRadius(int cornerRadiusTopLeft, int cornerRadiusTopRight, int cornerRadiusBottomLeft, int cornerRadiusBottomRight) {
        this.cornerRadiusTopLeft = cornerRadiusTopLeft;
        this.cornerRadiusTopRight = cornerRadiusTopRight;
        this.cornerRadiusBottomLeft = cornerRadiusBottomLeft;
        this.cornerRadiusBottomRight = cornerRadiusBottomRight;
        buildDrawImageParams();
    }

    public void setPlaceholderImage(@DrawableRes int placeholderImage) {
        this.emptyDrawable = ViewUtils.getDrawable(getContext(), placeholderImage);
    }

    @Override // android.view.View
    protected void onSizeChanged(int w, int h, int oldw, int oldh) {
        if (this.placeholderDrawable != null) {
            this.placeholderDrawable.setBounds(0, 0, w, h);
        }
        int paddingLeft = getPaddingLeft();
        int paddingRight = getPaddingRight();
        int paddingTop = getPaddingTop();
        int paddingBottom = getPaddingBottom();
        int imageWidth = w - paddingRight;
        int imageHeight = h - paddingBottom;
        this.imageRect.set(paddingLeft, paddingTop, imageWidth, imageHeight);
        buildDrawImageParams();
        Bitmap imageBitmap = Bitmap.createBitmap(imageWidth, imageHeight, Bitmap.Config.ARGB_8888);
        this.imageCanvas = new Canvas(imageBitmap);
        this.imagePaint.setAntiAlias(true);
        this.imagePaint.setShader(new BitmapShader(imageBitmap, Shader.TileMode.CLAMP, Shader.TileMode.CLAMP));
        if (this.thumbs != null) {
            bindThumbs();
        }
    }

    private void bindThumbs() {
        Arrays.fill(this.imagesToLoad, (Object) null);
        this.imagesToLoadCount = CollectionUtils.countIfNotGreater(this.thumbs, 4);
        if (this.imagesToLoadCount > 0 && this.imagesToLoadCount <= 4) {
            calcSizes(this.sizes, getWidth(), this.imagesToLoadCount);
            for (int i = 0; i < this.imagesToLoadCount; i++) {
                this.imagesToLoad[i] = this.thumbs.get(i).getForSize(this.sizes[i]);
            }
        } else {
            clear();
        }
        updateDrawableBounds();
        for (int i2 = 0; i2 < this.imagesToLoadCount; i2++) {
            load(i2, this.imagesToLoad[i2]);
        }
        this.thumbs = null;
    }

    private void updateDrawableBounds() {
        int l = getPaddingLeft();
        int t = getPaddingTop();
        int w = (getWidth() - l) - getPaddingRight();
        int h = (getHeight() - t) - getPaddingBottom();
        int w2 = w / 2;
        int h2 = h / 2;
        switch (this.imagesToLoadCount) {
            case 1:
                this.draweeHolder.get(0).getTopLevelDrawable().setBounds(l, t, l + w, t + h);
                return;
            case 2:
                this.draweeHolder.get(0).getTopLevelDrawable().setBounds(l, t, l + w2 + 0, t + h);
                this.draweeHolder.get(1).getTopLevelDrawable().setBounds(l + w2 + 0, t, l + w, t + h);
                return;
            case 3:
                this.draweeHolder.get(0).getTopLevelDrawable().setBounds(l, t, l + w2 + 0, t + h);
                this.draweeHolder.get(1).getTopLevelDrawable().setBounds(l + w2 + 0, t, l + w, t + h2 + 0);
                this.draweeHolder.get(2).getTopLevelDrawable().setBounds(l + w2 + 0, t + h2 + 0, l + w, t + h);
                return;
            case 4:
                this.draweeHolder.get(0).getTopLevelDrawable().setBounds(l, t, l + w2 + 0, t + h2 + 0);
                this.draweeHolder.get(1).getTopLevelDrawable().setBounds(l, t + h2 + 0, l + w2 + 0, t + h);
                this.draweeHolder.get(2).getTopLevelDrawable().setBounds(l + w2 + 0, t, l + w, t + h2 + 0);
                this.draweeHolder.get(3).getTopLevelDrawable().setBounds(l + w2 + 0, t + h2 + 0, l + w, t + h);
                return;
            default:
                return;
        }
    }

    @Override // android.view.View
    public void draw(Canvas canvas) {
        super.draw(canvas);
    }

    @Override // android.view.View
    protected void onDraw(Canvas canvas) {
        this.imageCanvas.drawColor(0, PorterDuff.Mode.CLEAR);
        if (this.placeholderDrawable != null) {
            this.placeholderDrawable.draw(this.imageCanvas);
        }
        for (int i = 0; i < this.imagesToLoadCount; i++) {
            Drawable drawable = this.draweeHolder.get(i).getTopLevelDrawable();
            if (drawable != null) {
                drawable.draw(this.imageCanvas);
            }
        }
        drawImage(canvas);
    }

    private void drawImage(Canvas canvas) {
        if (this.imagePath == null) {
            canvas.drawRoundRect(this.imageRect, this.cornerRadiusTopLeft, this.cornerRadiusTopLeft, this.imagePaint);
        } else {
            canvas.drawPath(this.imagePath, this.imagePaint);
        }
    }

    private void buildDrawImageParams() {
        if (this.imageRect != null && (this.cornerRadiusTopRight != this.cornerRadiusBottomRight || this.cornerRadiusBottomRight != this.cornerRadiusBottomLeft || this.cornerRadiusBottomLeft != this.cornerRadiusTopLeft)) {
            this.imagePath = new Path();
            this.imagePath.arcTo(cornerRect(this.imageRect.right, this.imageRect.top, this.cornerRadiusTopRight, -1, 1), 270.0f, 90.0f, true);
            this.imagePath.arcTo(cornerRect(this.imageRect.right, this.imageRect.bottom, this.cornerRadiusBottomRight, -1, -1), 0.0f, 90.0f, false);
            this.imagePath.arcTo(cornerRect(this.imageRect.left, this.imageRect.bottom, this.cornerRadiusBottomLeft, 1, -1), 90.0f, 90.0f, false);
            this.imagePath.arcTo(cornerRect(this.imageRect.left, this.imageRect.top, this.cornerRadiusTopLeft, 1, 1), 180.0f, 90.0f, false);
            this.imagePath.close();
            return;
        }
        this.imagePath = null;
    }

    private static RectF cornerRect(float x, float y, float r, int signX, int signY) {
        float x2 = x + (signX * r);
        float y2 = y + (signY * r);
        return new RectF(x2 - r, y2 - r, x2 + r, y2 + r);
    }

    public void setThumbs(@Nullable List<Thumb> thumbs) {
        this.thumbs = thumbs;
        if (CollectionUtils.isEmpty(thumbs)) {
            setPlaceholderDrawable(this.emptyDrawable);
            clear();
            return;
        }
        setPlaceholderDrawable(this.loadingDrawable);
        if (getWidth() > 0 && getHeight() > 0) {
            bindThumbs();
        }
    }

    public void setPlaceholderDrawable(Drawable background) {
        this.placeholderDrawable = background;
        this.placeholderDrawable.setBounds(0, 0, getWidth(), getHeight());
        invalidate();
    }

    public void setThumb(@Nullable Thumb thumb) {
        if (thumb != null) {
            setThumbs(Collections.singletonList(thumb));
        } else {
            setThumbs(null);
        }
    }
}
