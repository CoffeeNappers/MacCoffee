package com.vk.attachpicker.crop;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import android.animation.AnimatorSet;
import android.animation.ObjectAnimator;
import android.animation.ValueAnimator;
import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.Bitmap;
import android.graphics.RectF;
import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import android.util.AttributeSet;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewTreeObserver;
import android.widget.FrameLayout;
import android.widget.ImageView;
import com.vk.attachpicker.crop.RectCropOverlayView;
import com.vk.attachpicker.editor.ImageState;
import com.vk.attachpicker.util.BitmapUtils;
import com.vk.core.util.AnimationUtils;
import com.vkontakte.android.R;
/* loaded from: classes2.dex */
public class CropImageView extends FrameLayout {
    private final int MESSAGE_DROP_CENTER;
    private Bitmap bitmap;
    private CropController cropController;
    private CropTouchListener cropTouchListener;
    private Delegate delegate;
    private final Handler handler;
    private ImageView imageView;
    private CropOverlayView overlayView;

    /* loaded from: classes2.dex */
    public interface Delegate {
        void onImageGeometryChange();

        void setAdjusterViewTouchEnabled(boolean z);

        void setControlsTouchEnabled(boolean z);
    }

    public CropImageView(Context context) {
        this(context, null);
    }

    public CropImageView(Context context, AttributeSet attrs) {
        this(context, attrs, 0);
    }

    public CropImageView(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        this.MESSAGE_DROP_CENTER = 0;
        this.handler = new Handler(Looper.getMainLooper()) { // from class: com.vk.attachpicker.crop.CropImageView.3
            @Override // android.os.Handler
            public void handleMessage(Message msg) {
                if (msg.what == 0) {
                    CropImageView.this.dropToCenterAnimation();
                }
            }
        };
        TypedArray a = context.obtainStyledAttributes(attrs, R.styleable.CropImageView, 0, 0);
        boolean circleCrop = a.getBoolean(0, false);
        a.recycle();
        init(context, circleCrop);
    }

    public void cancelPendingAnimations() {
        cancelDropCenter();
        if (this.cropController != null) {
            this.cropController.cancelSpringback();
            this.cropController.springback(false);
        }
    }

    @Override // android.widget.FrameLayout, android.view.ViewGroup, android.view.View
    protected void onLayout(boolean changed, int left, int top, int right, int bottom) {
        super.onLayout(changed, left, top, right, bottom);
        float oldCropWidth = this.overlayView.getCropWidth();
        float oldX0 = this.overlayView.getX0();
        float oldY0 = this.overlayView.getY0();
        this.overlayView.initWithAspectRatio(this.overlayView.getCropAspectRatio());
        float newCropWidth = this.overlayView.getCropWidth();
        float newX0 = this.overlayView.getX0();
        float newY0 = this.overlayView.getY0();
        if (oldCropWidth != 0.0f && this.cropController != null) {
            float deltaScale = newCropWidth / oldCropWidth;
            this.cropController.getGeometryState().postScale(deltaScale, oldX0, oldY0);
        }
        if (oldX0 != 0.0f && this.cropController != null) {
            this.cropController.getGeometryState().postTranslate(newX0 - oldX0, 0.0f);
        }
        if (oldY0 != 0.0f && this.cropController != null) {
            this.cropController.getGeometryState().postTranslate(0.0f, newY0 - oldY0);
        }
        if (this.cropController != null) {
            this.cropController.updateMatrix();
        }
        cancelPendingAnimations();
    }

    private void init(Context context, boolean circleCrop) {
        this.imageView = new ImageView(context);
        this.imageView.setDrawingCacheEnabled(true);
        if (circleCrop) {
            this.overlayView = new CircleCropOverlayView(context);
        } else {
            this.overlayView = new RectCropOverlayView(context);
        }
        addView(this.imageView);
        addView(this.overlayView);
    }

    public CropOverlayView overlayView() {
        return this.overlayView;
    }

    public ImageView preview() {
        return this.imageView;
    }

    public void setForcedAspectRatio(float aspectRatio, boolean doSpringback) {
        this.overlayView.setForcedAspectRatio(this.cropController.getGeometryState().getCropAspectRatio(), aspectRatio, doSpringback);
    }

    public Bitmap cropBitmap(int maxWidth) {
        return this.cropController.cropBitmap(this.bitmap, maxWidth);
    }

    public CropController getCropController() {
        return this.cropController;
    }

    public void setDelegate(Delegate delegate) {
        this.delegate = delegate;
    }

    public void setBitmap(final Bitmap bitmap, final GeometryState geometryState, final CropAspectRatio cropAspectRatio, final boolean enableTouch, final boolean isCrop) {
        if (bitmap != null && !bitmap.isRecycled()) {
            this.bitmap = bitmap;
            this.imageView.getViewTreeObserver().addOnPreDrawListener(new ViewTreeObserver.OnPreDrawListener() { // from class: com.vk.attachpicker.crop.CropImageView.1
                @Override // android.view.ViewTreeObserver.OnPreDrawListener
                public boolean onPreDraw() {
                    CropImageView.this.imageView.getViewTreeObserver().removeOnPreDrawListener(this);
                    CropImageView.this.cropController = new CropController(CropImageView.this.imageView, CropImageView.this.overlayView, CropImageView.this.getBitmapWidth(), CropImageView.this.getBitmapHeight());
                    CropImageView.this.cropTouchListener = new CropTouchListener(CropImageView.this.getContext(), CropImageView.this.cropController) { // from class: com.vk.attachpicker.crop.CropImageView.1.1
                        @Override // com.vk.attachpicker.crop.CropTouchListener, android.view.View.OnTouchListener
                        public boolean onTouch(View v, MotionEvent ev) {
                            if (isEnabled()) {
                                if (CropImageView.this.hasDropCenter()) {
                                    CropImageView.this.sendDropCenter();
                                }
                                if (ev.getAction() == 2) {
                                    CropImageView.this.enableMove();
                                    CropImageView.this.setLinesVisible(true);
                                } else {
                                    CropImageView.this.enableAll();
                                    CropImageView.this.setLinesVisible(false);
                                }
                                CropImageView.this.onImageGeometryChange();
                            }
                            return super.onTouch(v, ev);
                        }
                    };
                    CropImageView.this.imageView.setOnTouchListener(CropImageView.this.cropTouchListener);
                    CropImageView.this.overlayView.setOnCropChangeListener(new RectCropOverlayView.OnCropChangeListener() { // from class: com.vk.attachpicker.crop.CropImageView.1.2
                        @Override // com.vk.attachpicker.crop.RectCropOverlayView.OnCropChangeListener
                        public void onCropChange() {
                            CropImageView.this.cancelDropCenter();
                            if (CropImageView.this.cropController != null) {
                                CropImageView.this.cropController.springback(false);
                            }
                            CropImageView.this.enableCrop();
                            CropImageView.this.onImageGeometryChange();
                        }

                        @Override // com.vk.attachpicker.crop.RectCropOverlayView.OnCropChangeListener
                        public void onCropEnd() {
                            CropImageView.this.enableAll();
                            CropImageView.this.sendDropCenter();
                        }
                    });
                    CropImageView.this.cropController.getGeometryState().set(geometryState);
                    if (isCrop) {
                        CropImageView.this.overlayView.initWithAspectRatio(CropImageView.this.cropController.getGeometryState().getCropAspectRatio());
                        if (cropAspectRatio != null && cropAspectRatio != CropAspectRatio.CROP_NOT_SELECTED) {
                            CropImageView.this.setForcedAspectRatio(cropAspectRatio.ar, false);
                        }
                        CropUtils.convertGeometryStateForCrop(CropImageView.this.cropController.getGeometryState(), CropImageView.this.overlayView.getCropWidth(), CropImageView.this.overlayView.getX0(), CropImageView.this.overlayView.getY0());
                    } else {
                        float scale = CropImageView.this.overlayView.getCropWidth() / ImageState.PREVIEW_WIDTH;
                        float scaledWidth = ImageState.PREVIEW_WIDTH * scale;
                        float scaledHeight = scaledWidth / BitmapUtils.getAspectRatio(bitmap);
                        float xDelta = CropImageView.this.overlayView.getCenterX() - (scaledWidth / 2.0f);
                        float yDelta = CropImageView.this.overlayView.getCenterY() - (scaledHeight / 2.0f);
                        CropImageView.this.cropController.getGeometryState().postScale(scale, 0.0f, 0.0f);
                        CropImageView.this.cropController.getGeometryState().postTranslate(xDelta, yDelta);
                    }
                    CropImageView.this.cropController.updateMatrix();
                    if (enableTouch) {
                        CropImageView.this.enableAll();
                    } else {
                        CropImageView.this.disableAll();
                    }
                    return false;
                }
            });
            this.imageView.setImageBitmap(bitmap);
        }
    }

    public void setLinesVisible(boolean visible) {
        this.overlayView.setLinesAndTransparentOverlayVisible(visible);
    }

    public boolean isDefaultGeometryState() {
        return this.cropController.getGeometryState().isDefaultState();
    }

    public void reset() {
        if (this.cropController != null) {
            this.cropController.cancelSpringback();
            this.cropController.reset(0);
        }
        this.overlayView.initWithAspectRatio(this.cropController.getGeometryState().getCropAspectRatio());
    }

    public void rotate90() {
        int newRotation = (int) (this.cropController.getGeometryState().getBaseRotation() - 90.0f);
        if (this.cropController != null) {
            this.cropController.cancelSpringback();
            this.cropController.reset(newRotation);
        }
        this.overlayView.initWithAspectRatio(this.cropController.getGeometryState().getCropAspectRatio());
        onImageGeometryChange();
    }

    public void rotate(float degress) {
        if (this.cropController != null) {
            this.cropController.onRotate(degress);
        }
        if (hasDropCenter()) {
            sendDropCenter();
        }
        onImageGeometryChange();
    }

    public float getBitmapWidth() {
        if (this.bitmap == null || this.bitmap.isRecycled()) {
            return 0.0f;
        }
        return this.bitmap.getWidth();
    }

    public float getBitmapHeight() {
        if (this.bitmap == null || this.bitmap.isRecycled()) {
            return 0.0f;
        }
        return this.bitmap.getHeight();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void dropToCenterAnimation() {
        disableAll();
        AnimatorSet set = new AnimatorSet();
        set.setDuration(300L);
        set.addListener(new AnimatorListenerAdapter() { // from class: com.vk.attachpicker.crop.CropImageView.2
            @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
            public void onAnimationCancel(Animator animation) {
                onAnimationEnd(animation);
            }

            @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
            public void onAnimationEnd(Animator animation) {
                CropImageView.this.cropController.springback(true);
                CropImageView.this.enableAll();
            }
        });
        float cropAr = this.overlayView.getCropAspectRatio();
        RectF newPosition = this.overlayView.calculatePosition(cropAr);
        float x0 = newPosition.left;
        float y0 = newPosition.top;
        float x1 = newPosition.right;
        float y1 = newPosition.bottom;
        float targetScale = Math.max((x1 - x0) / this.overlayView.getCropWidth(), (y1 - y0) / this.overlayView.getCropHeight());
        ValueAnimator imageScaleAnimator = createMovePreviewToCenterAnimator(targetScale, this.overlayView.getCenterX(), this.overlayView.getCenterY(), (((x1 - x0) / 2.0f) + x0) - this.overlayView.getCenterX(), (((y1 - y0) / 2.0f) + y0) - this.overlayView.getCenterY());
        set.playTogether(AnimationUtils.accelerateDecelerate(ObjectAnimator.ofFloat(this.overlayView, "x0", x0)), AnimationUtils.accelerateDecelerate(ObjectAnimator.ofFloat(this.overlayView, "y0", y0)), AnimationUtils.accelerateDecelerate(ObjectAnimator.ofFloat(this.overlayView, "x1", x1)), AnimationUtils.accelerateDecelerate(ObjectAnimator.ofFloat(this.overlayView, "y1", y1)), AnimationUtils.accelerateDecelerate(imageScaleAnimator));
        set.start();
    }

    private ValueAnimator createMovePreviewToCenterAnimator(float targetScale, float centerX, float centerY, float translateX, float translateY) {
        ValueAnimator imageScaleAnimator = ValueAnimator.ofFloat(0.0f, 1.0f);
        float finalScale = targetScale * this.cropController.getGeometryState().getScale();
        float[] currentScale = {1.0f};
        float[] currentX = new float[1];
        float[] currentY = new float[1];
        imageScaleAnimator.addUpdateListener(CropImageView$$Lambda$1.lambdaFactory$(this, targetScale, currentScale, centerX, centerY, translateX, translateY, currentX, currentY, finalScale));
        return imageScaleAnimator;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$createMovePreviewToCenterAnimator$0(float targetScale, float[] currentScale, float centerX, float centerY, float translateX, float translateY, float[] currentX, float[] currentY, float finalScale, ValueAnimator animation) {
        float value = ((Float) animation.getAnimatedValue()).floatValue();
        float newScale = 1.0f + ((targetScale - 1.0f) * value);
        float deltaScale = newScale / currentScale[0];
        currentScale[0] = currentScale[0] * deltaScale;
        this.cropController.getGeometryState().postScale(deltaScale, centerX, centerY);
        float newX = value * translateX;
        float newY = value * translateY;
        float deltaX = newX - currentX[0];
        float deltaY = newY - currentY[0];
        float goCurrentScale = this.cropController.getGeometryState().getScale();
        this.cropController.getGeometryState().postTranslate((deltaX * goCurrentScale) / finalScale, (deltaY * goCurrentScale) / finalScale);
        currentX[0] = newX;
        currentY[0] = newY;
        this.cropController.updateMatrix();
    }

    public void enableAll() {
        setTouchesEnabled(true, true, true, true);
    }

    public void disableAll() {
        setTouchesEnabled(false, false, false, false);
    }

    public void enableRotate() {
        setTouchesEnabled(true, false, false, false);
    }

    public void enableMove() {
        setTouchesEnabled(false, true, false, false);
    }

    public void enableCrop() {
        setTouchesEnabled(false, false, true, false);
    }

    private void setTouchesEnabled(boolean rotate, boolean move, boolean cropOverlay, boolean controls) {
        if (this.delegate != null) {
            this.delegate.setAdjusterViewTouchEnabled(rotate);
            this.delegate.setControlsTouchEnabled(controls);
        }
        if (this.cropTouchListener != null) {
            this.cropTouchListener.setTouchEnabled(move);
        }
        if (this.overlayView != null) {
            this.overlayView.setTouchEnabled(cropOverlay);
        }
    }

    public void onImageGeometryChange() {
        if (this.delegate != null) {
            this.delegate.onImageGeometryChange();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public boolean hasDropCenter() {
        return this.handler.hasMessages(0);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void cancelDropCenter() {
        this.handler.removeMessages(0);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void sendDropCenter() {
        this.handler.removeMessages(0);
        this.handler.sendMessageDelayed(Message.obtain(this.handler, 0), 800L);
    }
}
