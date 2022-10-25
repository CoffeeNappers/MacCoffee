package com.vk.sharing.view;

import android.annotation.TargetApi;
import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.Bitmap;
import android.graphics.BitmapShader;
import android.graphics.Canvas;
import android.graphics.LinearGradient;
import android.graphics.Paint;
import android.graphics.PorterDuff;
import android.graphics.RectF;
import android.graphics.Shader;
import android.graphics.drawable.Drawable;
import android.net.Uri;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.v4.content.ContextCompat;
import android.util.AttributeSet;
import com.facebook.drawee.drawable.ScalingUtils;
import com.vk.core.util.Screen;
import com.vk.imageloader.view.VKMultiImageView;
import com.vkontakte.android.R;
import java.util.Arrays;
/* loaded from: classes2.dex */
final class TargetImageView extends VKMultiImageView {
    private static final int BORDER = Screen.dp(2);
    private static final String DIALOG_SCHEME = "vkchatphoto";
    private static final int MAX_IMAGES = 4;
    private static final String PHOTO_PARAMETER = "photo";
    private Canvas imageCanvas;
    private Paint imagePaint;
    private RectF imageRect;
    private String[] imagesToLoad;
    private int imagesToLoadCount;
    private Drawable selectionDrawable;
    private int selectionEndColor;
    private Paint selectionPaint;
    private RectF selectionRect;
    private int selectionStartColor;

    public TargetImageView(Context context) {
        super(context);
        this.imagesToLoad = new String[4];
        this.imagesToLoadCount = 0;
    }

    public TargetImageView(Context context, AttributeSet attrs) {
        super(context, attrs);
        this.imagesToLoad = new String[4];
        this.imagesToLoadCount = 0;
    }

    public TargetImageView(Context context, AttributeSet attrs, int defStyle) {
        super(context, attrs, defStyle);
        this.imagesToLoad = new String[4];
        this.imagesToLoadCount = 0;
    }

    @TargetApi(21)
    public TargetImageView(Context context, @Nullable AttributeSet attrs, int defStyleAttr, int defStyleRes) {
        super(context, attrs, defStyleAttr, defStyleRes);
        this.imagesToLoad = new String[4];
        this.imagesToLoadCount = 0;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.vk.imageloader.view.VKMultiImageView
    public void init(@NonNull Context context, @Nullable AttributeSet attrs) {
        super.init(context, attrs);
        int p = BORDER * 2;
        setPadding(p, p, p, p);
        this.imageRect = new RectF();
        this.imagePaint = new Paint(7);
        this.selectionRect = new RectF();
        this.selectionPaint = new Paint(1);
        this.selectionPaint.setStrokeWidth(BORDER);
        this.selectionPaint.setStyle(Paint.Style.STROKE);
        this.selectionStartColor = ContextCompat.getColor(context, R.color.cornflower_blue);
        this.selectionEndColor = ContextCompat.getColor(context, R.color.cool_blue);
        this.selectionDrawable = ContextCompat.getDrawable(context, R.drawable.bounds_copy_5);
        if (attrs != null) {
            TypedArray array = context.obtainStyledAttributes(attrs, R.styleable.TargetView);
            setSelected(array.getBoolean(0, false));
            array.recycle();
        }
        for (int i = 0; i < 4; i++) {
            addImage();
            this.draweeHolder.get(i).getHierarchy().setPlaceholderImage(R.drawable.user_placeholder);
        }
        setScaleType(ScalingUtils.ScaleType.CENTER_CROP);
    }

    @Override // android.view.View
    protected void onSizeChanged(int w, int h, int oldw, int oldh) {
        super.onSizeChanged(w, h, oldw, oldh);
        int paddingLeft = getPaddingLeft();
        int paddingRight = getPaddingRight();
        int paddingTop = getPaddingTop();
        int paddingBottom = getPaddingBottom();
        int imageWidth = w - paddingRight;
        int imageHeight = h - paddingBottom;
        this.imageRect.set(paddingLeft, paddingTop, imageWidth, imageHeight);
        Bitmap imageBitmap = Bitmap.createBitmap(imageWidth, imageHeight, Bitmap.Config.ARGB_8888);
        this.imageCanvas = new Canvas(imageBitmap);
        this.imagePaint.setShader(new BitmapShader(imageBitmap, Shader.TileMode.CLAMP, Shader.TileMode.CLAMP));
        float border2 = BORDER / 2;
        this.selectionRect.set(border2, border2, w - border2, h - border2);
        this.selectionPaint.setShader(new LinearGradient(w / 2, 0.0f, w / 2, h, this.selectionStartColor, this.selectionEndColor, Shader.TileMode.CLAMP));
        this.selectionDrawable.setBounds(w - this.selectionDrawable.getIntrinsicWidth(), h - this.selectionDrawable.getIntrinsicHeight(), w, h);
        updateDrawableBounds();
    }

    @Override // android.view.View
    protected void onDraw(Canvas canvas) {
        this.imageCanvas.drawColor(0, PorterDuff.Mode.CLEAR);
        for (int i = 0; i < this.imagesToLoadCount; i++) {
            Drawable drawable = this.draweeHolder.get(i).getTopLevelDrawable();
            if (drawable != null) {
                drawable.draw(this.imageCanvas);
            }
        }
        canvas.drawOval(this.imageRect, this.imagePaint);
        if (isSelected()) {
            canvas.drawCircle(this.selectionRect.centerX(), this.selectionRect.centerY(), this.selectionRect.width() / 2.0f, this.selectionPaint);
            this.selectionDrawable.draw(canvas);
        }
    }

    public void load(@Nullable String url) {
        Arrays.fill(this.imagesToLoad, (Object) null);
        if (url != null) {
            Uri uri = Uri.parse(url);
            if ("vkchatphoto".equals(uri.getScheme())) {
                this.imagesToLoadCount = 0;
                while (true) {
                    String imageUrl = uri.getQueryParameter("photo" + this.imagesToLoadCount);
                    if (imageUrl == null) {
                        break;
                    }
                    String[] strArr = this.imagesToLoad;
                    int i = this.imagesToLoadCount;
                    this.imagesToLoadCount = i + 1;
                    strArr[i] = imageUrl;
                }
            } else {
                this.imagesToLoad[0] = url;
                this.imagesToLoadCount = 1;
            }
        } else {
            clear();
            this.imagesToLoadCount = 1;
        }
        if (getWidth() != 0 && getHeight() != 0) {
            updateDrawableBounds();
        }
        for (int i2 = 0; i2 < this.imagesToLoadCount; i2++) {
            load(i2, this.imagesToLoad[i2]);
        }
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
}
