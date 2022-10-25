package com.vk.camera.camera1;

import android.annotation.TargetApi;
import android.graphics.Matrix;
import android.graphics.Point;
import android.graphics.Rect;
import android.graphics.RectF;
import android.hardware.Camera;
import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import android.util.Log;
import java.util.ArrayList;
import java.util.List;
/* loaded from: classes2.dex */
public class FocusOverlayManager {
    private static final int RESET_TOUCH_FOCUS = 0;
    private static final int RESET_TOUCH_FOCUS_DELAY = 3000;
    private static final int STATE_FAIL = 4;
    private static final int STATE_FOCUSING = 1;
    private static final int STATE_FOCUSING_SNAP_ON_FINISH = 2;
    private static final int STATE_IDLE = 0;
    private static final int STATE_SUCCESS = 3;
    private static final String TAG = "CAM_FocusManager";
    private boolean mAeAwbLock;
    private int mDisplayOrientation;
    private List<Object> mFocusArea;
    private boolean mFocusAreaSupported;
    private String mFocusMode;
    private FocusViewCallback mFocusViewCallback;
    private Handler mHandler;
    Listener mListener;
    private boolean mLockAeAwbNeeded;
    private List<Object> mMeteringArea;
    private boolean mMeteringAreaSupported;
    private boolean mMirror;
    private String mOverrideFocusMode;
    private Camera.Parameters mParameters;
    private int mPreviewHeight;
    private int mPreviewWidth;
    private int mState = 0;
    private Matrix mMatrix = new Matrix();

    /* loaded from: classes2.dex */
    public interface Listener {
        void autoFocus();

        void cancelAutoFocus();

        boolean capture();

        void setFocusParameters();

        Point transformToPreviewCoordinates(int i, int i2);
    }

    /* loaded from: classes2.dex */
    private class MainHandler extends Handler {
        public MainHandler(Looper looper) {
            super(looper);
        }

        @Override // android.os.Handler
        public void handleMessage(Message msg) {
            switch (msg.what) {
                case 0:
                    FocusOverlayManager.this.cancelAutoFocus();
                    return;
                default:
                    return;
            }
        }
    }

    public FocusOverlayManager(Camera.Parameters parameters, Listener listener, boolean mirror, Looper looper) {
        this.mHandler = new MainHandler(looper);
        setParameters(parameters);
        this.mListener = listener;
        setMirror(mirror);
    }

    private boolean isInitialized() {
        return (this.mMatrix == null || this.mFocusViewCallback == null) ? false : true;
    }

    public void setFocusView(FocusViewCallback mFocusViewCallback) {
        this.mFocusViewCallback = mFocusViewCallback;
    }

    public void setParameters(Camera.Parameters parameters) {
        if (parameters != null) {
            this.mParameters = parameters;
            this.mFocusAreaSupported = CameraUtils.isFocusAreaSupported(parameters);
            this.mMeteringAreaSupported = CameraUtils.isMeteringAreaSupported(parameters);
            this.mLockAeAwbNeeded = CameraUtils.isAutoExposureLockSupported(this.mParameters) || CameraUtils.isAutoWhiteBalanceLockSupported(this.mParameters);
        }
    }

    public void setPreviewSize(int previewWidth, int previewHeight) {
        if (this.mPreviewWidth != previewWidth || this.mPreviewHeight != previewHeight) {
            this.mPreviewWidth = previewWidth;
            this.mPreviewHeight = previewHeight;
            setMatrix();
        }
    }

    public void setMirror(boolean mirror) {
        this.mMirror = mirror;
        setMatrix();
    }

    public void setDisplayOrientation(int displayOrientation) {
        this.mDisplayOrientation = displayOrientation;
        setMatrix();
    }

    private void setMatrix() {
        if (this.mPreviewWidth != 0 && this.mPreviewHeight != 0) {
            Matrix matrix = new Matrix();
            CameraUtils.prepareMatrix(matrix, this.mMirror, this.mDisplayOrientation, this.mPreviewWidth, this.mPreviewHeight);
            matrix.invert(this.mMatrix);
        }
    }

    private void lockAeAwbIfNeeded() {
        if (this.mLockAeAwbNeeded && !this.mAeAwbLock) {
            this.mAeAwbLock = true;
            this.mListener.setFocusParameters();
        }
    }

    private void unlockAeAwbIfNeeded() {
        if (this.mLockAeAwbNeeded && this.mAeAwbLock && this.mState != 2) {
            this.mAeAwbLock = false;
            this.mListener.setFocusParameters();
        }
    }

    public void onShutterDown() {
        if (isInitialized()) {
            boolean autoFocusCalled = false;
            if (needAutoFocusCall() && this.mState != 3 && this.mState != 4) {
                autoFocus();
                autoFocusCalled = true;
            }
            if (!autoFocusCalled) {
                lockAeAwbIfNeeded();
            }
        }
    }

    public void onShutterUp() {
        if (isInitialized()) {
            if (needAutoFocusCall() && (this.mState == 1 || this.mState == 3 || this.mState == 4)) {
                cancelAutoFocus();
            }
            unlockAeAwbIfNeeded();
        }
    }

    public void doSnap() {
        if (isInitialized()) {
            if (!needAutoFocusCall() || this.mState == 3 || this.mState == 4) {
                capture();
            } else if (this.mState == 1) {
                this.mState = 2;
            } else if (this.mState == 0) {
                capture();
            }
        }
    }

    public void onAutoFocus(boolean focused, boolean shutterButtonPressed) {
        if (this.mState == 2) {
            if (focused) {
                this.mState = 3;
            } else {
                this.mState = 4;
            }
            updateFocusUI();
            capture();
        } else if (this.mState == 1) {
            if (focused) {
                this.mState = 3;
            } else {
                this.mState = 4;
            }
            updateFocusUI();
            if (this.mFocusArea != null) {
                this.mHandler.sendEmptyMessageDelayed(0, 3000L);
            }
            if (shutterButtonPressed) {
                lockAeAwbIfNeeded();
            }
        } else {
            if (this.mState == 0) {
            }
        }
    }

    @TargetApi(14)
    private void initializeFocusAreas(int focusWidth, int focusHeight, int x, int y, int previewWidth, int previewHeight) {
        if (this.mFocusArea == null) {
            this.mFocusArea = new ArrayList();
            this.mFocusArea.add(new Camera.Area(new Rect(), 1));
        }
        calculateTapArea(focusWidth, focusHeight, 1.0f, x, y, previewWidth, previewHeight, ((Camera.Area) this.mFocusArea.get(0)).rect);
    }

    @TargetApi(14)
    private void initializeMeteringAreas(int focusWidth, int focusHeight, int x, int y, int previewWidth, int previewHeight) {
        if (this.mMeteringArea == null) {
            this.mMeteringArea = new ArrayList();
            this.mMeteringArea.add(new Camera.Area(new Rect(), 1));
        }
        calculateTapArea(focusWidth, focusHeight, 1.5f, x, y, previewWidth, previewHeight, ((Camera.Area) this.mMeteringArea.get(0)).rect);
    }

    public void onSingleTapUp(int x, int y) {
        if (isInitialized() && this.mState != 2) {
            if (this.mFocusArea != null && (this.mState == 1 || this.mState == 3 || this.mState == 4)) {
                cancelAutoFocus();
            }
            int focusWidth = (int) (this.mPreviewWidth * 0.05f);
            int focusHeight = (int) (this.mPreviewHeight * 0.05f);
            int previewWidth = this.mPreviewWidth;
            int previewHeight = this.mPreviewHeight;
            Point previewCoordinates = this.mListener.transformToPreviewCoordinates(x, y);
            if (previewCoordinates != null) {
                if (this.mFocusAreaSupported) {
                    initializeFocusAreas(focusWidth, focusHeight, previewCoordinates.x, previewCoordinates.y, previewWidth, previewHeight);
                }
                if (this.mMeteringAreaSupported) {
                    initializeMeteringAreas(focusWidth, focusHeight, previewCoordinates.x, previewCoordinates.y, previewWidth, previewHeight);
                }
            }
            this.mFocusViewCallback.setFocus(x, y);
            this.mListener.setFocusParameters();
            if (this.mFocusAreaSupported) {
                autoFocus();
                return;
            }
            updateFocusUI();
            this.mHandler.removeMessages(0);
            this.mHandler.sendEmptyMessageDelayed(0, 3000L);
        }
    }

    public void onPreviewStarted() {
        this.mState = 0;
    }

    public void onPreviewStopped() {
        this.mState = 0;
        resetTouchFocus();
        updateFocusUI();
    }

    public void onCameraReleased() {
        onPreviewStopped();
    }

    private void autoFocus() {
        Log.v(TAG, "Start autofocus.");
        this.mListener.autoFocus();
        this.mState = 1;
        updateFocusUI();
        this.mHandler.removeMessages(0);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void cancelAutoFocus() {
        Log.v(TAG, "Cancel autofocus.");
        resetTouchFocus();
        this.mListener.cancelAutoFocus();
        this.mState = 0;
        updateFocusUI();
        this.mHandler.removeMessages(0);
    }

    private void capture() {
        if (this.mListener.capture()) {
            this.mState = 0;
            this.mHandler.removeMessages(0);
        }
    }

    public String getFocusMode() {
        if (this.mOverrideFocusMode != null) {
            return this.mOverrideFocusMode;
        }
        List<String> supportedFocusModes = this.mParameters.getSupportedFocusModes();
        if (this.mFocusAreaSupported && this.mFocusArea != null) {
            this.mFocusMode = "auto";
        } else {
            this.mFocusMode = CameraUtils.FOCUS_MODE_CONTINUOUS_PICTURE;
        }
        if (!CameraUtils.isSupported(this.mFocusMode, supportedFocusModes)) {
            if (CameraUtils.isSupported("auto", this.mParameters.getSupportedFocusModes())) {
                this.mFocusMode = "auto";
            } else {
                this.mFocusMode = this.mParameters.getFocusMode();
            }
        }
        return this.mFocusMode;
    }

    public List getFocusAreas() {
        return this.mFocusArea;
    }

    public List getMeteringAreas() {
        return this.mMeteringArea;
    }

    public void updateFocusUI() {
        if (isInitialized()) {
            if (this.mState == 0) {
                if (this.mFocusArea == null) {
                    this.mFocusViewCallback.clear();
                } else {
                    this.mFocusViewCallback.showStart();
                }
            } else if (this.mState == 1 || this.mState == 2) {
                this.mFocusViewCallback.showStart();
            } else if (CameraUtils.FOCUS_MODE_CONTINUOUS_PICTURE.equals(this.mFocusMode)) {
                this.mFocusViewCallback.showSuccess(false);
            } else if (this.mState == 3) {
                this.mFocusViewCallback.showSuccess(false);
            } else if (this.mState == 4) {
                this.mFocusViewCallback.showFail(false);
            }
        }
    }

    public void resetTouchFocus() {
        if (isInitialized()) {
            this.mFocusViewCallback.clear();
            this.mFocusArea = null;
            this.mMeteringArea = null;
        }
    }

    private void calculateTapArea(int focusWidth, int focusHeight, float areaMultiple, int x, int y, int previewWidth, int previewHeight, Rect rect) {
        int areaWidth = (int) (focusWidth * areaMultiple);
        int areaHeight = (int) (focusHeight * areaMultiple);
        int left = CameraUtils.clamp(x - (areaWidth / 2), 0, previewWidth - areaWidth);
        int top = CameraUtils.clamp(y - (areaHeight / 2), 0, previewHeight - areaHeight);
        RectF rectF = new RectF(left, top, left + areaWidth, top + areaHeight);
        this.mMatrix.mapRect(rectF);
        CameraUtils.rectFToRect(rectF, rect);
    }

    int getFocusState() {
        return this.mState;
    }

    public boolean isFocusCompleted() {
        return this.mState == 3 || this.mState == 4;
    }

    public boolean isFocusingSnapOnFinish() {
        return this.mState == 2;
    }

    public void removeMessages() {
        this.mHandler.removeMessages(0);
    }

    public void overrideFocusMode(String focusMode) {
        this.mOverrideFocusMode = focusMode;
    }

    public void setAeAwbLock(boolean lock) {
        this.mAeAwbLock = lock;
    }

    public boolean getAeAwbLock() {
        return this.mAeAwbLock;
    }

    private boolean needAutoFocusCall() {
        String focusMode = getFocusMode();
        return !focusMode.equals("infinity") && !focusMode.equals("fixed") && !focusMode.equals("edof");
    }
}
