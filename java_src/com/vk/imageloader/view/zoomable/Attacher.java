package com.vk.imageloader.view.zoomable;

import android.content.Context;
import android.graphics.Matrix;
import android.graphics.RectF;
import android.os.Build;
import android.support.annotation.Nullable;
import android.support.v4.view.GestureDetectorCompat;
import android.support.v4.view.MotionEventCompat;
import android.support.v4.widget.ScrollerCompat;
import android.view.GestureDetector;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewParent;
import android.view.animation.AccelerateDecelerateInterpolator;
import android.view.animation.Interpolator;
import com.facebook.drawee.drawable.ScalingUtils;
import com.facebook.drawee.generic.GenericDraweeHierarchy;
import com.vk.imageloader.view.VKDraweeView;
import java.lang.ref.WeakReference;
/* loaded from: classes2.dex */
public class Attacher implements IAttacher, View.OnTouchListener, OnScaleDragGestureListener {
    private static final int EDGE_BOTH = 2;
    private static final int EDGE_LEFT = 0;
    private static final int EDGE_NONE = -1;
    private static final int EDGE_RIGHT = 1;
    private FlingRunnable mCurrentFlingRunnable;
    private WeakReference<VKDraweeView<GenericDraweeHierarchy>> mDraweeView;
    private GestureDetectorCompat mGestureDetector;
    private View.OnLongClickListener mLongClickListener;
    private OnPhotoTapListener mPhotoTapListener;
    private OnScaleChangeListener mScaleChangeListener;
    private ScaleDragDetector mScaleDragDetector;
    private OnViewTapListener mViewTapListener;
    private final float[] mMatrixValues = new float[9];
    private final RectF mDisplayRect = new RectF();
    private final Interpolator mZoomInterpolator = new AccelerateDecelerateInterpolator();
    private float mMinScale = 1.0f;
    private float mMidScale = 1.75f;
    private float mMaxScale = 3.0f;
    private long mZoomDuration = 200;
    private boolean mBlockParentIntercept = false;
    private boolean mAllowParentInterceptOnEdge = true;
    private int mScrollEdge = 2;
    private boolean isZoomable = true;
    private final Matrix mMatrix = new Matrix();
    private int mImageInfoHeight = -1;
    private int mImageInfoWidth = -1;

    public Attacher(VKDraweeView<GenericDraweeHierarchy> draweeView) {
        this.mDraweeView = new WeakReference<>(draweeView);
        draweeView.getHierarchy().setActualImageScaleType(ScalingUtils.ScaleType.FIT_CENTER);
        draweeView.setOnTouchListener(this);
        this.mScaleDragDetector = new ScaleDragDetector(draweeView.getContext(), this);
        this.mGestureDetector = new GestureDetectorCompat(draweeView.getContext(), new GestureDetector.SimpleOnGestureListener() { // from class: com.vk.imageloader.view.zoomable.Attacher.1
            @Override // android.view.GestureDetector.SimpleOnGestureListener, android.view.GestureDetector.OnGestureListener
            public void onLongPress(MotionEvent e) {
                super.onLongPress(e);
                if (Attacher.this.mLongClickListener != null) {
                    Attacher.this.mLongClickListener.onLongClick(Attacher.this.getDraweeView());
                }
            }
        });
        this.mGestureDetector.setOnDoubleTapListener(new DefaultOnDoubleTapListener(this));
    }

    @Override // com.vk.imageloader.view.zoomable.IAttacher
    public void setOnDoubleTapListener(GestureDetector.OnDoubleTapListener newOnDoubleTapListener) {
        if (newOnDoubleTapListener != null) {
            this.mGestureDetector.setOnDoubleTapListener(newOnDoubleTapListener);
        } else {
            this.mGestureDetector.setOnDoubleTapListener(new DefaultOnDoubleTapListener(this));
        }
    }

    @Nullable
    public VKDraweeView<GenericDraweeHierarchy> getDraweeView() {
        return this.mDraweeView.get();
    }

    @Override // com.vk.imageloader.view.zoomable.IAttacher
    public boolean isZoomable() {
        return this.isZoomable;
    }

    @Override // com.vk.imageloader.view.zoomable.IAttacher
    public void setZoomable(boolean zoomable) {
        this.isZoomable = zoomable;
    }

    @Override // com.vk.imageloader.view.zoomable.IAttacher
    public float getMinimumScale() {
        return this.mMinScale;
    }

    @Override // com.vk.imageloader.view.zoomable.IAttacher
    public float getMediumScale() {
        return this.mMidScale;
    }

    @Override // com.vk.imageloader.view.zoomable.IAttacher
    public float getMaximumScale() {
        return this.mMaxScale;
    }

    @Override // com.vk.imageloader.view.zoomable.IAttacher
    public void setMaximumScale(float maximumScale) {
        checkZoomLevels(this.mMinScale, this.mMidScale, maximumScale);
        this.mMaxScale = maximumScale;
    }

    @Override // com.vk.imageloader.view.zoomable.IAttacher
    public void setMediumScale(float mediumScale) {
        checkZoomLevels(this.mMinScale, mediumScale, this.mMaxScale);
        this.mMidScale = mediumScale;
    }

    @Override // com.vk.imageloader.view.zoomable.IAttacher
    public void setMinimumScale(float minimumScale) {
        checkZoomLevels(minimumScale, this.mMidScale, this.mMaxScale);
        this.mMinScale = minimumScale;
    }

    @Override // com.vk.imageloader.view.zoomable.IAttacher
    public float getScale() {
        return (float) Math.sqrt(((float) Math.pow(getMatrixValue(this.mMatrix, 0), 2.0d)) + ((float) Math.pow(getMatrixValue(this.mMatrix, 3), 2.0d)));
    }

    @Override // com.vk.imageloader.view.zoomable.IAttacher
    public void setScale(float scale) {
        setScale(scale, false);
    }

    @Override // com.vk.imageloader.view.zoomable.IAttacher
    public void setScale(float scale, boolean animate) {
        VKDraweeView<GenericDraweeHierarchy> draweeView = getDraweeView();
        if (draweeView != null) {
            setScale(scale, draweeView.getRight() / 2, draweeView.getBottom() / 2, false);
        }
    }

    @Override // com.vk.imageloader.view.zoomable.IAttacher
    public void setScale(float scale, float focalX, float focalY, boolean animate) {
        VKDraweeView<GenericDraweeHierarchy> draweeView = getDraweeView();
        if (draweeView != null && scale >= this.mMinScale && scale <= this.mMaxScale) {
            if (animate) {
                draweeView.post(new AnimatedZoomRunnable(getScale(), scale, focalX, focalY));
                return;
            }
            this.mMatrix.setScale(scale, scale, focalX, focalY);
            checkMatrixAndInvalidate();
        }
    }

    @Override // com.vk.imageloader.view.zoomable.IAttacher
    public void setZoomTransitionDuration(long duration) {
        if (duration < 0) {
            duration = 200;
        }
        this.mZoomDuration = duration;
    }

    @Override // com.vk.imageloader.view.zoomable.IAttacher
    public void setAllowParentInterceptOnEdge(boolean allow) {
        this.mAllowParentInterceptOnEdge = allow;
    }

    @Override // com.vk.imageloader.view.zoomable.IAttacher
    public void setOnScaleChangeListener(OnScaleChangeListener listener) {
        this.mScaleChangeListener = listener;
    }

    @Override // com.vk.imageloader.view.zoomable.IAttacher
    public void setOnLongClickListener(View.OnLongClickListener listener) {
        this.mLongClickListener = listener;
    }

    @Override // com.vk.imageloader.view.zoomable.IAttacher
    public void setOnPhotoTapListener(OnPhotoTapListener listener) {
        this.mPhotoTapListener = listener;
    }

    @Override // com.vk.imageloader.view.zoomable.IAttacher
    public void setOnViewTapListener(OnViewTapListener listener) {
        this.mViewTapListener = listener;
    }

    @Override // com.vk.imageloader.view.zoomable.IAttacher
    public OnPhotoTapListener getOnPhotoTapListener() {
        return this.mPhotoTapListener;
    }

    @Override // com.vk.imageloader.view.zoomable.IAttacher
    public OnViewTapListener getOnViewTapListener() {
        return this.mViewTapListener;
    }

    @Override // com.vk.imageloader.view.zoomable.IAttacher
    public void update(int imageInfoWidth, int imageInfoHeight) {
        this.mImageInfoWidth = imageInfoWidth;
        this.mImageInfoHeight = imageInfoHeight;
        updateBaseMatrix();
    }

    private static void checkZoomLevels(float minZoom, float midZoom, float maxZoom) {
        if (minZoom >= midZoom) {
            throw new IllegalArgumentException("MinZoom has to be less than MidZoom");
        }
        if (midZoom >= maxZoom) {
            throw new IllegalArgumentException("MidZoom has to be less than MaxZoom");
        }
    }

    private int getViewWidth() {
        VKDraweeView<GenericDraweeHierarchy> draweeView = getDraweeView();
        if (draweeView != null) {
            return (draweeView.getWidth() - draweeView.getPaddingLeft()) - draweeView.getPaddingRight();
        }
        return 0;
    }

    private int getViewHeight() {
        VKDraweeView<GenericDraweeHierarchy> draweeView = getDraweeView();
        if (draweeView != null) {
            return (draweeView.getHeight() - draweeView.getPaddingTop()) - draweeView.getPaddingBottom();
        }
        return 0;
    }

    private float getMatrixValue(Matrix matrix, int whichValue) {
        matrix.getValues(this.mMatrixValues);
        return this.mMatrixValues[whichValue];
    }

    public Matrix getDrawMatrix() {
        return this.mMatrix;
    }

    @Override // com.vk.imageloader.view.zoomable.IAttacher
    public RectF getDisplayRect() {
        checkMatrixBounds();
        return getDisplayRect(getDrawMatrix());
    }

    public void checkMatrixAndInvalidate() {
        VKDraweeView<GenericDraweeHierarchy> draweeView = getDraweeView();
        if (draweeView != null && checkMatrixBounds()) {
            draweeView.invalidate();
        }
    }

    public boolean checkMatrixBounds() {
        RectF rect = getDisplayRect(getDrawMatrix());
        if (rect == null) {
            return false;
        }
        float height = rect.height();
        float width = rect.width();
        float deltaX = 0.0f;
        float deltaY = 0.0f;
        int viewHeight = getViewHeight();
        if (height <= viewHeight) {
            deltaY = ((viewHeight - height) / 2.0f) - rect.top;
        } else if (rect.top > 0.0f) {
            deltaY = -rect.top;
        } else if (rect.bottom < viewHeight) {
            deltaY = viewHeight - rect.bottom;
        }
        int viewWidth = getViewWidth();
        if (width <= viewWidth) {
            deltaX = ((viewWidth - width) / 2.0f) - rect.left;
            this.mScrollEdge = 2;
        } else if (rect.left > 0.0f) {
            deltaX = -rect.left;
            this.mScrollEdge = 0;
        } else if (rect.right < viewWidth) {
            deltaX = viewWidth - rect.right;
            this.mScrollEdge = 1;
        } else {
            this.mScrollEdge = -1;
        }
        this.mMatrix.postTranslate(deltaX, deltaY);
        return true;
    }

    private RectF getDisplayRect(Matrix matrix) {
        VKDraweeView<GenericDraweeHierarchy> draweeView = getDraweeView();
        if (draweeView == null || (this.mImageInfoWidth == -1 && this.mImageInfoHeight == -1)) {
            return null;
        }
        this.mDisplayRect.set(0.0f, 0.0f, this.mImageInfoWidth, this.mImageInfoHeight);
        draweeView.getHierarchy().getActualImageBounds(this.mDisplayRect);
        matrix.mapRect(this.mDisplayRect);
        return this.mDisplayRect;
    }

    private void updateBaseMatrix() {
        if (this.mImageInfoWidth != -1 || this.mImageInfoHeight != -1) {
            resetMatrix();
        }
    }

    private void resetMatrix() {
        this.mMatrix.reset();
        checkMatrixBounds();
        VKDraweeView<GenericDraweeHierarchy> draweeView = getDraweeView();
        if (draweeView != null) {
            draweeView.invalidate();
        }
    }

    private void checkScale() {
        VKDraweeView<GenericDraweeHierarchy> draweeView = getDraweeView();
        if (draweeView != null) {
            if (getScale() < this.mMinScale) {
                RectF rect = getDisplayRect();
                if (rect != null) {
                    draweeView.post(new AnimatedZoomRunnable(getScale(), this.mMinScale, rect.centerX(), rect.centerY()));
                }
            } else if (getScale() > this.mMaxScale) {
                draweeView.post(new AnimatedZoomRunnable(getScale(), this.mMaxScale, draweeView.getRight() / 2, draweeView.getBottom() / 2));
            }
        }
    }

    @Override // com.vk.imageloader.view.zoomable.OnScaleDragGestureListener
    public void onScale(float scaleFactor, float focusX, float focusY) {
        if (this.mScaleChangeListener != null) {
            this.mScaleChangeListener.onScaleChange(scaleFactor, focusX, focusY);
        }
        this.mMatrix.postScale(scaleFactor, scaleFactor, focusX, focusY);
        checkMatrixAndInvalidate();
    }

    @Override // com.vk.imageloader.view.zoomable.OnScaleDragGestureListener
    public void onScaleEnd() {
        checkScale();
    }

    @Override // com.vk.imageloader.view.zoomable.OnScaleDragGestureListener
    public void onDrag(float dx, float dy) {
        VKDraweeView<GenericDraweeHierarchy> draweeView = getDraweeView();
        if (draweeView != null && !this.mScaleDragDetector.isScaling()) {
            this.mMatrix.postTranslate(dx, dy);
            checkMatrixAndInvalidate();
            ViewParent parent = draweeView.getParent();
            if (parent != null) {
                if (this.mAllowParentInterceptOnEdge && !this.mScaleDragDetector.isScaling() && !this.mBlockParentIntercept) {
                    if (this.mScrollEdge == 2 || ((this.mScrollEdge == 0 && dx >= 1.0f) || (this.mScrollEdge == 1 && dx <= -1.0f))) {
                        parent.requestDisallowInterceptTouchEvent(false);
                        return;
                    }
                    return;
                }
                parent.requestDisallowInterceptTouchEvent(true);
            }
        }
    }

    @Override // com.vk.imageloader.view.zoomable.OnScaleDragGestureListener
    public void onFling(float startX, float startY, float velocityX, float velocityY) {
        VKDraweeView<GenericDraweeHierarchy> draweeView = getDraweeView();
        if (draweeView != null) {
            this.mCurrentFlingRunnable = new FlingRunnable(draweeView.getContext());
            this.mCurrentFlingRunnable.fling(getViewWidth(), getViewHeight(), (int) velocityX, (int) velocityY);
            draweeView.post(this.mCurrentFlingRunnable);
        }
    }

    @Override // android.view.View.OnTouchListener
    public boolean onTouch(View v, MotionEvent event) {
        boolean z = true;
        if (!this.isZoomable) {
            return false;
        }
        int action = MotionEventCompat.getActionMasked(event);
        switch (action) {
            case 0:
                ViewParent parent = v.getParent();
                if (parent != null) {
                    parent.requestDisallowInterceptTouchEvent(true);
                }
                cancelFling();
                break;
            case 1:
            case 3:
                ViewParent parent2 = v.getParent();
                if (parent2 != null) {
                    parent2.requestDisallowInterceptTouchEvent(false);
                    break;
                }
                break;
        }
        boolean wasScaling = this.mScaleDragDetector.isScaling();
        boolean wasDragging = this.mScaleDragDetector.isDragging();
        boolean handled = this.mScaleDragDetector.onTouchEvent(event);
        boolean noScale = !wasScaling && !this.mScaleDragDetector.isScaling();
        boolean noDrag = !wasDragging && !this.mScaleDragDetector.isDragging();
        if (!noScale || !noDrag) {
            z = false;
        }
        this.mBlockParentIntercept = z;
        if (this.mGestureDetector.onTouchEvent(event)) {
            handled = true;
        }
        return handled;
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes2.dex */
    public class AnimatedZoomRunnable implements Runnable {
        private final float mFocalX;
        private final float mFocalY;
        private final long mStartTime = System.currentTimeMillis();
        private final float mZoomEnd;
        private final float mZoomStart;

        public AnimatedZoomRunnable(float currentZoom, float targetZoom, float focalX, float focalY) {
            this.mFocalX = focalX;
            this.mFocalY = focalY;
            this.mZoomStart = currentZoom;
            this.mZoomEnd = targetZoom;
        }

        @Override // java.lang.Runnable
        public void run() {
            VKDraweeView<GenericDraweeHierarchy> draweeView = Attacher.this.getDraweeView();
            if (draweeView != null) {
                float t = interpolate();
                float scale = this.mZoomStart + ((this.mZoomEnd - this.mZoomStart) * t);
                float deltaScale = scale / Attacher.this.getScale();
                Attacher.this.onScale(deltaScale, this.mFocalX, this.mFocalY);
                if (t < 1.0f) {
                    Attacher.this.postOnAnimation(draweeView, this);
                }
            }
        }

        private float interpolate() {
            float t = (((float) (System.currentTimeMillis() - this.mStartTime)) * 1.0f) / ((float) Attacher.this.mZoomDuration);
            return Attacher.this.mZoomInterpolator.getInterpolation(Math.min(1.0f, t));
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes2.dex */
    public class FlingRunnable implements Runnable {
        private int mCurrentX;
        private int mCurrentY;
        private final ScrollerCompat mScroller;

        public FlingRunnable(Context context) {
            this.mScroller = ScrollerCompat.create(context);
        }

        public void cancelFling() {
            this.mScroller.abortAnimation();
        }

        public void fling(int viewWidth, int viewHeight, int velocityX, int velocityY) {
            int maxX;
            int minX;
            int maxY;
            int minY;
            RectF rect = Attacher.this.getDisplayRect();
            if (rect != null) {
                int startX = Math.round(-rect.left);
                if (viewWidth < rect.width()) {
                    minX = 0;
                    maxX = Math.round(rect.width() - viewWidth);
                } else {
                    maxX = startX;
                    minX = startX;
                }
                int startY = Math.round(-rect.top);
                if (viewHeight < rect.height()) {
                    minY = 0;
                    maxY = Math.round(rect.height() - viewHeight);
                } else {
                    maxY = startY;
                    minY = startY;
                }
                this.mCurrentX = startX;
                this.mCurrentY = startY;
                if (startX != maxX || startY != maxY) {
                    this.mScroller.fling(startX, startY, velocityX, velocityY, minX, maxX, minY, maxY, 0, 0);
                }
            }
        }

        @Override // java.lang.Runnable
        public void run() {
            VKDraweeView<GenericDraweeHierarchy> draweeView;
            if (!this.mScroller.isFinished() && (draweeView = Attacher.this.getDraweeView()) != null && this.mScroller.computeScrollOffset()) {
                int newX = this.mScroller.getCurrX();
                int newY = this.mScroller.getCurrY();
                Attacher.this.mMatrix.postTranslate(this.mCurrentX - newX, this.mCurrentY - newY);
                draweeView.invalidate();
                this.mCurrentX = newX;
                this.mCurrentY = newY;
                Attacher.this.postOnAnimation(draweeView, this);
            }
        }
    }

    private void cancelFling() {
        if (this.mCurrentFlingRunnable != null) {
            this.mCurrentFlingRunnable.cancelFling();
            this.mCurrentFlingRunnable = null;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void postOnAnimation(View view, Runnable runnable) {
        if (Build.VERSION.SDK_INT >= 16) {
            view.postOnAnimation(runnable);
        } else {
            view.postDelayed(runnable, 16L);
        }
    }

    public void onDetachedFromWindow() {
        cancelFling();
    }
}
