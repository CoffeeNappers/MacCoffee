package com.vk.camera;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.os.Handler;
import android.os.Looper;
import android.support.v4.view.GestureDetectorCompat;
import android.util.AttributeSet;
import android.view.GestureDetector;
import android.view.MotionEvent;
import android.view.ScaleGestureDetector;
import android.view.View;
import android.view.ViewGroup;
import android.view.animation.DecelerateInterpolator;
import android.widget.FrameLayout;
import com.vk.camera.CameraObject;
import com.vk.camera.camera1.CameraHolder;
import com.vk.camera.camera1.CameraUtils;
import com.vk.camera.camera1.FocusViewCallback;
import com.vk.core.util.TimeoutLock;
import com.vkontakte.android.R;
/* loaded from: classes2.dex */
public abstract class BaseCameraView extends FrameLayout implements CameraObject.Viewer, FocusViewCallback {
    private final TimeoutLock changeCameraLock;
    private final Runnable clearRunnable;
    protected CameraMode currentCameraMode;
    private View.OnTouchListener externalTouchListener;
    private View focusView;
    private int focusX;
    private int focusY;
    private FrameLayout mainLayout;
    protected final Handler uiHandler;

    public abstract void changeCamera();

    protected abstract int getCameraPreviewHeight();

    protected abstract int getCameraPreviewWidth();

    protected abstract int getDisplayOrientation();

    protected abstract boolean isCameraPreviewAvailable();

    protected abstract void onSingleTap(int i, int i2);

    protected abstract boolean useFullBleedPreview();

    public static boolean frontCameraByDefault() {
        return CameraHolder.instance().getNumberOfCameras() > 1 && CameraPrefs.instance().useFrontCamera();
    }

    public BaseCameraView(Context context) {
        super(context);
        this.uiHandler = new Handler(Looper.getMainLooper());
        this.changeCameraLock = new TimeoutLock(500L);
        this.currentCameraMode = frontCameraByDefault() ? CameraMode.FRONT : CameraMode.BACK;
        this.clearRunnable = new Runnable() { // from class: com.vk.camera.BaseCameraView.2
            @Override // java.lang.Runnable
            public void run() {
                BaseCameraView.this.clear();
            }
        };
        init();
    }

    public BaseCameraView(Context context, AttributeSet attrs) {
        super(context, attrs);
        this.uiHandler = new Handler(Looper.getMainLooper());
        this.changeCameraLock = new TimeoutLock(500L);
        this.currentCameraMode = frontCameraByDefault() ? CameraMode.FRONT : CameraMode.BACK;
        this.clearRunnable = new Runnable() { // from class: com.vk.camera.BaseCameraView.2
            @Override // java.lang.Runnable
            public void run() {
                BaseCameraView.this.clear();
            }
        };
        init();
    }

    public BaseCameraView(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        this.uiHandler = new Handler(Looper.getMainLooper());
        this.changeCameraLock = new TimeoutLock(500L);
        this.currentCameraMode = frontCameraByDefault() ? CameraMode.FRONT : CameraMode.BACK;
        this.clearRunnable = new Runnable() { // from class: com.vk.camera.BaseCameraView.2
            @Override // java.lang.Runnable
            public void run() {
                BaseCameraView.this.clear();
            }
        };
        init();
    }

    private void init() {
        this.focusView = new View(getContext());
        this.focusView.setBackgroundResource(R.drawable.focus_circle);
        this.mainLayout = new FrameLayout(getContext());
        addView(this.mainLayout);
        addView(new View(getContext()) { // from class: com.vk.camera.BaseCameraView.1
            private Paint paint;

            private void init() {
                this.paint = new Paint();
                this.paint.setAntiAlias(true);
                this.paint.setDither(true);
                this.paint.setStyle(Paint.Style.FILL);
                this.paint.setStrokeWidth(1.0f);
                this.paint.setColor(33554431);
            }

            @Override // android.view.View
            public void onDraw(Canvas canvas) {
                super.onDraw(canvas);
                if (this.paint == null) {
                    init();
                }
                canvas.drawLine(0.0f, 0.0f, 0.0f, canvas.getHeight(), this.paint);
                canvas.drawLine(0.0f, 0.0f, canvas.getWidth(), 0.0f, this.paint);
            }
        });
    }

    public void setExternalTouchListener(View.OnTouchListener externalTouchListener) {
        this.externalTouchListener = externalTouchListener;
    }

    @Override // com.vk.camera.camera1.FocusViewCallback
    public void setFocus(int x, int y) {
        this.focusX = x;
        this.focusY = y;
    }

    @Override // com.vk.camera.camera1.FocusViewCallback
    public void clear() {
        this.uiHandler.removeCallbacks(this.clearRunnable);
        this.mainLayout.removeView(this.focusView);
    }

    @Override // com.vk.camera.camera1.FocusViewCallback
    public void showStart() {
        clear();
        this.mainLayout.addView(this.focusView, new FrameLayout.LayoutParams(FocusViewCallback.FOCUS_SIZE, FocusViewCallback.FOCUS_SIZE));
        this.focusView.setTranslationX(CameraUtils.clamp(this.focusX - (FocusViewCallback.FOCUS_SIZE / 2), 0, getWidth() - FocusViewCallback.FOCUS_SIZE));
        this.focusView.setTranslationY(CameraUtils.clamp(this.focusY - (FocusViewCallback.FOCUS_SIZE / 2), 0, getHeight() - FocusViewCallback.FOCUS_SIZE));
        this.focusView.setScaleX(0.0f);
        this.focusView.setScaleY(0.0f);
        this.focusView.animate().scaleX(1.0f).scaleY(1.0f).setInterpolator(new DecelerateInterpolator()).setDuration(300L).start();
    }

    @Override // com.vk.camera.camera1.FocusViewCallback
    public void showSuccess(boolean timeout) {
        clearDelayed();
    }

    @Override // com.vk.camera.camera1.FocusViewCallback
    public void showFail(boolean timeout) {
        clearDelayed();
    }

    private void clearDelayed() {
        this.uiHandler.postDelayed(this.clearRunnable, 1000L);
    }

    public void addCameraView(View cameraView) {
        this.mainLayout.removeAllViews();
        CameraContainer cameraContainer = new CameraContainer(cameraView);
        cameraContainer.setOnTouchListener(new OnCameraTouchListener(getContext()));
        this.mainLayout.addView(cameraContainer, new FrameLayout.LayoutParams(-1, -1));
    }

    public void removeCameraView() {
        this.mainLayout.removeAllViews();
    }

    /* loaded from: classes2.dex */
    private class OnCameraTouchListener implements View.OnTouchListener, ScaleGestureDetector.OnScaleGestureListener {
        private final GestureDetectorCompat gestureDetector;
        private final ScaleGestureDetector scaleGestureDetector;
        private final GestureDetector.SimpleOnGestureListener simpleOnGestureListener = new GestureDetector.SimpleOnGestureListener() { // from class: com.vk.camera.BaseCameraView.OnCameraTouchListener.1
            @Override // android.view.GestureDetector.SimpleOnGestureListener, android.view.GestureDetector.OnDoubleTapListener
            public boolean onDoubleTap(MotionEvent e) {
                if (!BaseCameraView.this.changeCameraLock.checkAndMaybeLock()) {
                    BaseCameraView.this.changeCamera();
                    return true;
                }
                return true;
            }

            @Override // android.view.GestureDetector.SimpleOnGestureListener, android.view.GestureDetector.OnDoubleTapListener
            public boolean onSingleTapConfirmed(MotionEvent e) {
                BaseCameraView.this.onSingleTap((int) e.getX(), (int) e.getY());
                return true;
            }
        };

        public OnCameraTouchListener(Context context) {
            this.gestureDetector = new GestureDetectorCompat(context, this.simpleOnGestureListener);
            this.scaleGestureDetector = new ScaleGestureDetector(context, this);
        }

        @Override // android.view.View.OnTouchListener
        public boolean onTouch(View v, MotionEvent event) {
            this.gestureDetector.onTouchEvent(event);
            this.scaleGestureDetector.onTouchEvent(event);
            if (BaseCameraView.this.externalTouchListener != null) {
                BaseCameraView.this.externalTouchListener.onTouch(v, event);
                return true;
            }
            return true;
        }

        @Override // android.view.ScaleGestureDetector.OnScaleGestureListener
        public boolean onScale(ScaleGestureDetector detector) {
            BaseCameraView.this.setZoomLevel(BaseCameraView.this.getZoomLevel() + (detector.getScaleFactor() - 1.0f));
            return true;
        }

        @Override // android.view.ScaleGestureDetector.OnScaleGestureListener
        public boolean onScaleBegin(ScaleGestureDetector detector) {
            return true;
        }

        @Override // android.view.ScaleGestureDetector.OnScaleGestureListener
        public void onScaleEnd(ScaleGestureDetector detector) {
        }
    }

    /* loaded from: classes2.dex */
    private class CameraContainer extends ViewGroup {
        public CameraContainer(View cameraPreview) {
            super(BaseCameraView.this.getContext());
            addView(cameraPreview);
        }

        @Override // android.view.ViewGroup, android.view.View
        protected void onLayout(boolean changed, int l, int t, int r, int b) {
            if (getChildCount() > 0) {
                View child = getChildAt(0);
                int width = r - l;
                int height = b - t;
                int previewWidth = width;
                int previewHeight = height;
                if (BaseCameraView.this.isCameraPreviewAvailable()) {
                    if (BaseCameraView.this.getDisplayOrientation() == 90 || BaseCameraView.this.getDisplayOrientation() == 270) {
                        previewWidth = BaseCameraView.this.getCameraPreviewHeight();
                        previewHeight = BaseCameraView.this.getCameraPreviewWidth();
                    } else {
                        previewWidth = BaseCameraView.this.getCameraPreviewWidth();
                        previewHeight = BaseCameraView.this.getCameraPreviewHeight();
                    }
                }
                boolean useFirstStrategy = width * previewHeight > height * previewWidth;
                if ((useFirstStrategy && !BaseCameraView.this.useFullBleedPreview()) || (!useFirstStrategy && BaseCameraView.this.useFullBleedPreview())) {
                    int scaledChildWidth = (previewWidth * height) / previewHeight;
                    child.layout((width - scaledChildWidth) / 2, 0, (width + scaledChildWidth) / 2, height);
                    return;
                }
                int scaledChildHeight = (previewHeight * width) / previewWidth;
                child.layout(0, 0, width, scaledChildHeight);
            }
        }
    }
}
