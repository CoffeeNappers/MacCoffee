package com.vk.attachpicker.crop;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import android.animation.ObjectAnimator;
import android.animation.ValueAnimator;
import android.graphics.Bitmap;
import android.graphics.Matrix;
import android.graphics.PointF;
import android.graphics.RectF;
import android.view.View;
import android.view.animation.DecelerateInterpolator;
import android.widget.ImageView;
import com.vk.attachpicker.crop.CropTouchListener;
import com.vk.attachpicker.widget.AdjusterView;
import java.lang.ref.WeakReference;
/* loaded from: classes2.dex */
public class CropController implements CropTouchListener.GestureCallback, AdjusterView.ScrollListener {
    private volatile boolean animationInProgress;
    private final CropAreaProvider cropAreaProvider;
    private final GeometryState geometryState;
    private final WeakReference<ImageView> imageView;
    private SpringbackRunnable mCurrentSpringbackRunnable;
    private final MinimumScaleFinder minimumScaleFinder = new MinimumScaleFinder();
    private final MinimumTranslationFinder minimumTranslationFinder = new MinimumTranslationFinder();
    private final Matrix matrix = new Matrix();
    private final Matrix workMatrix = new Matrix();
    private final float[] rawImageRect = new float[8];
    private final PointF[] cropRect = {new PointF(), new PointF(), new PointF(), new PointF()};
    private final PointF[] imageRect = {new PointF(), new PointF(), new PointF(), new PointF()};

    public CropController(ImageView imageView, CropAreaProvider cropAreaProvider, float width, float height) {
        this.cropAreaProvider = cropAreaProvider;
        this.geometryState = new GeometryState(width, height);
        this.imageView = new WeakReference<>(imageView);
        imageView.setScaleType(ImageView.ScaleType.MATRIX);
    }

    public void updateMatrix() {
        this.geometryState.getTransformationMatrix(this.matrix);
        ImageView iv = this.imageView.get();
        if (iv != null) {
            iv.setImageMatrix(this.matrix);
        }
    }

    public GeometryState getGeometryState() {
        return this.geometryState;
    }

    public boolean isAnimationInProgress() {
        return this.animationInProgress;
    }

    public void onAnimationStart() {
        this.animationInProgress = true;
    }

    public void onAnimationEnd() {
        this.animationInProgress = false;
    }

    public void reset(int baseRotation) {
        this.geometryState.resetTransformationMatrix(this.cropAreaProvider, this.minimumScaleFinder, baseRotation);
        updateMatrix();
    }

    public void cancelSpringback() {
        if (this.mCurrentSpringbackRunnable != null) {
            this.mCurrentSpringbackRunnable.cancelTranslate();
            this.mCurrentSpringbackRunnable = null;
        }
    }

    public void springback(boolean animated) {
        springback(animated, false);
    }

    public void springback(boolean animated, boolean fit) {
        View view = this.imageView.get();
        if (view != null) {
            this.geometryState.setCropAspectRatio(this.cropAreaProvider.getCropAspectRatio());
            float scale = 1.0f;
            float dx = 0.0f;
            float dy = 0.0f;
            float currentMinScale = this.minimumScaleFinder.findMinimumScale(this.geometryState.getRotation(), this.geometryState.getWidth(), this.geometryState.getHeight(), this.geometryState.getBaseRotation() % 180.0f != 0.0f, this.cropAreaProvider.getCropWidth(), this.cropAreaProvider.getCropHeight());
            if (this.geometryState.isDefaultTranslation()) {
                scale = currentMinScale / this.geometryState.getScale();
            } else if (this.geometryState.getScale() < currentMinScale) {
                scale = currentMinScale / this.geometryState.getScale();
            } else if (this.geometryState.getScale() > this.geometryState.getMaxScale()) {
                scale = this.geometryState.getMaxScale() / this.geometryState.getScale();
            }
            while (!isImageFitScreen(scale) && Math.abs(dx) < 0.001f && Math.abs(dy) < 0.001f) {
                PointF p = this.minimumTranslationFinder.findMinTranslate(this.imageRect, this.cropAreaProvider.getCropWidth(), this.cropAreaProvider.getCropHeight(), this.cropAreaProvider.getX0(), this.cropAreaProvider.getY0(), this.geometryState.getRotation());
                dx = p.x;
                dy = p.y;
                if (Math.abs(dx) < 0.001f && Math.abs(dy) < 0.001f) {
                    scale *= 1.01f;
                }
            }
            if (scale != 1.0f || dx != 0.0f || dy != 0.0f) {
                if (animated) {
                    this.mCurrentSpringbackRunnable = new SpringbackRunnable(scale, -dx, -dy);
                    view.post(this.mCurrentSpringbackRunnable);
                    return;
                }
                this.geometryState.postScale(scale, this.cropAreaProvider.getCenterX(), this.cropAreaProvider.getCenterY());
                this.geometryState.postTranslate(-dx, -dy);
                updateMatrix();
                return;
            }
            updateMatrix();
        }
    }

    @Override // com.vk.attachpicker.crop.CropTouchListener.GestureCallback
    public void onScale(float scaleDelta, float focalX, float focalY) {
        this.geometryState.postScale(scaleDelta, focalX, focalY);
        updateMatrix();
    }

    @Override // com.vk.attachpicker.crop.CropTouchListener.GestureCallback
    public boolean onTranslate(float dx, float dy) {
        if (!isImageFitScreen(1.0f)) {
            dx = rubberBandDistance(dx, this.cropAreaProvider.getCropWidth());
            dy = rubberBandDistance(dy, this.cropAreaProvider.getCropHeight());
        }
        this.geometryState.postTranslate(dx, dy);
        updateMatrix();
        return true;
    }

    private static float rubberBandDistance(float offset, float dimension) {
        float result = ((Math.abs(offset) * 0.43f) * dimension) / ((Math.abs(offset) * 0.43f) + dimension);
        return offset < 0.0f ? -result : result;
    }

    @Override // com.vk.attachpicker.crop.CropTouchListener.GestureCallback
    public void onTouchBegin() {
        cancelSpringback();
    }

    @Override // com.vk.attachpicker.crop.CropTouchListener.GestureCallback
    public void onTouchEnd() {
        springback(true);
    }

    @Override // com.vk.attachpicker.widget.AdjusterView.ScrollListener
    public void onRotate(float newRotate) {
        float oldRotate = this.geometryState.getRotation();
        float oldMinimumScale = this.minimumScaleFinder.findMinimumScale(oldRotate, this.geometryState.getWidth(), this.geometryState.getHeight(), this.geometryState.getBaseRotation() % 180.0f != 0.0f, this.cropAreaProvider.getCropWidth(), this.cropAreaProvider.getCropHeight());
        float oldScale = this.geometryState.getScale();
        float deltaRotate = newRotate - oldRotate;
        this.geometryState.postRotate(deltaRotate, this.cropAreaProvider.getCenterX(), this.cropAreaProvider.getCenterY());
        float newScale = this.minimumScaleFinder.findMinimumScale(newRotate, this.geometryState.getWidth(), this.geometryState.getHeight(), this.geometryState.getBaseRotation() % 180.0f != 0.0f, this.cropAreaProvider.getCropWidth(), this.cropAreaProvider.getCropHeight());
        if (newScale > this.geometryState.getScale() || oldMinimumScale == oldScale) {
            float deltaScale = newScale / this.geometryState.getScale();
            this.geometryState.postScale(deltaScale, this.cropAreaProvider.getCenterX(), this.cropAreaProvider.getCenterY());
        }
        springback(false);
    }

    public void rotate90Degress() {
        this.geometryState.postRotate90Degrees(this.cropAreaProvider.getCenterX(), this.cropAreaProvider.getCenterY());
        updateMatrix();
    }

    private void updateCropRect() {
        float _x0 = this.cropAreaProvider.getX0();
        float _x1 = this.cropAreaProvider.getX1();
        float _y0 = this.cropAreaProvider.getY0();
        float _y1 = this.cropAreaProvider.getY1();
        this.cropRect[0].set(_x0, _y0);
        this.cropRect[1].set(_x1, _y0);
        this.cropRect[2].set(_x1, _y1);
        this.cropRect[3].set(_x0, _y1);
    }

    private boolean isImageFitScreen(float deltaScale) {
        if (this.geometryState.getOriginalAspectRatio() != 0.0f) {
            this.rawImageRect[0] = 0.0f;
            this.rawImageRect[1] = 0.0f;
            this.rawImageRect[2] = this.geometryState.getWidth();
            this.rawImageRect[3] = 0.0f;
            this.rawImageRect[4] = this.geometryState.getWidth();
            this.rawImageRect[5] = this.geometryState.getHeight();
            this.rawImageRect[6] = 0.0f;
            this.rawImageRect[7] = this.geometryState.getHeight();
            this.geometryState.getTransformationMatrix(this.workMatrix);
            this.workMatrix.postScale(deltaScale, deltaScale, this.cropAreaProvider.getCenterX(), this.cropAreaProvider.getCenterY());
            this.workMatrix.mapPoints(this.rawImageRect);
            this.imageRect[0].x = this.rawImageRect[0];
            this.imageRect[0].y = this.rawImageRect[1];
            this.imageRect[1].x = this.rawImageRect[2];
            this.imageRect[1].y = this.rawImageRect[3];
            this.imageRect[2].x = this.rawImageRect[4];
            this.imageRect[2].y = this.rawImageRect[5];
            this.imageRect[3].x = this.rawImageRect[6];
            this.imageRect[3].y = this.rawImageRect[7];
            updateCropRect();
            return MathCropUtils.isPolygonContainsRectangle(this.imageRect, this.cropRect);
        }
        return false;
    }

    public RectF getCropRect() {
        return new RectF(this.cropAreaProvider.getX0(), this.cropAreaProvider.getY0(), this.cropAreaProvider.getX1(), this.cropAreaProvider.getY1());
    }

    public RectF getImageRect() {
        float[] _rawImageRect = {0.0f, 0.0f, this.geometryState.getWidth(), 0.0f, this.geometryState.getWidth(), this.geometryState.getHeight(), 0.0f, this.geometryState.getHeight()};
        this.geometryState.getTransformationMatrix(this.workMatrix);
        this.workMatrix.mapPoints(_rawImageRect);
        return new RectF(_rawImageRect[0], _rawImageRect[1], _rawImageRect[4], _rawImageRect[5]);
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes2.dex */
    public class SpringbackRunnable implements Runnable {
        private final float finalScale;
        private float currentScale = 1.0f;
        private float currentX = 0.0f;
        private float currentY = 0.0f;
        private final ValueAnimator mAnimator = ObjectAnimator.ofFloat(0.0f, 1.0f);

        public SpringbackRunnable(final float targetScale, final float translateX, final float translateY) {
            this.finalScale = CropController.this.geometryState.getScale() * targetScale;
            this.mAnimator.setDuration(600L);
            this.mAnimator.setInterpolator(new DecelerateInterpolator(3.0f));
            CropController.this.onAnimationStart();
            this.mAnimator.addListener(new AnimatorListenerAdapter() { // from class: com.vk.attachpicker.crop.CropController.SpringbackRunnable.1
                @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
                public void onAnimationCancel(Animator animation) {
                    onAnimationEnd(animation);
                }

                @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
                public void onAnimationEnd(Animator animation) {
                    super.onAnimationEnd(animation);
                    CropController.this.onAnimationEnd();
                }
            });
            this.mAnimator.addUpdateListener(new ValueAnimator.AnimatorUpdateListener() { // from class: com.vk.attachpicker.crop.CropController.SpringbackRunnable.2
                @Override // android.animation.ValueAnimator.AnimatorUpdateListener
                public void onAnimationUpdate(ValueAnimator animation) {
                    if (CropController.this.geometryState != null) {
                        float value = ((Float) animation.getAnimatedValue()).floatValue();
                        float newScale = 1.0f + ((targetScale - 1.0f) * value);
                        float deltaScale = newScale / SpringbackRunnable.this.currentScale;
                        SpringbackRunnable.this.currentScale *= deltaScale;
                        CropController.this.geometryState.postScale(deltaScale, CropController.this.cropAreaProvider.getCenterX(), CropController.this.cropAreaProvider.getCenterY());
                        float newX = value * translateX;
                        float newY = value * translateY;
                        float deltaX = newX - SpringbackRunnable.this.currentX;
                        float deltaY = newY - SpringbackRunnable.this.currentY;
                        float currentScale = CropController.this.geometryState.getScale();
                        CropController.this.geometryState.postTranslate((deltaX * currentScale) / SpringbackRunnable.this.finalScale, (deltaY * currentScale) / SpringbackRunnable.this.finalScale);
                        SpringbackRunnable.this.currentX = newX;
                        SpringbackRunnable.this.currentY = newY;
                        CropController.this.updateMatrix();
                    }
                }
            });
        }

        public void cancelTranslate() {
            if (this.mAnimator != null) {
                this.mAnimator.cancel();
            }
        }

        @Override // java.lang.Runnable
        public void run() {
            if (this.mAnimator != null) {
                this.mAnimator.start();
            }
        }
    }

    public Bitmap cropBitmap(Bitmap bitmap, int maxWidth) {
        System.gc();
        System.gc();
        return CropUtils.applySquareMatrixFixed(bitmap, this.cropAreaProvider, this.geometryState.getTransformationMatrix(), maxWidth);
    }
}
