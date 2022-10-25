package com.vk.camera.camera1;

import android.app.Activity;
import android.content.Context;
import android.graphics.Matrix;
import android.graphics.Point;
import android.hardware.Camera;
import android.media.CamcorderProfile;
import android.os.Build;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import android.view.OrientationEventListener;
import android.view.SurfaceHolder;
import com.my.target.ads.instream.InstreamAd;
import com.vk.camera.BaseCameraView;
import com.vk.camera.CameraMode;
import com.vk.camera.CameraObject;
import com.vk.camera.CameraPrefs;
import com.vk.camera.CameraRecorder;
import com.vk.camera.CameraSurfaceView;
import com.vk.camera.Utils;
import com.vk.camera.camera1.CameraManager;
import com.vk.camera.camera1.FocusOverlayManager;
import com.vk.core.util.FileUtils;
import com.vk.core.util.TimeoutLock;
import com.vkontakte.android.ViewUtils;
import java.io.File;
import java.util.List;
/* loaded from: classes2.dex */
public class Camera1View extends BaseCameraView implements SurfaceHolder.Callback, FocusOverlayManager.Listener, Camera.AutoFocusCallback, CameraObject.Recorder, CameraObject.Viewer {
    private static final int MIN_RECORDING_DURATION_MS = 1000;
    private static final String TAG = Camera1View.class.getSimpleName();
    private CameraManager.CameraProxy camera;
    private int cameraId;
    private int cameraMode;
    private CameraOrientationListener cameraOrientationListener;
    private final CameraSurfaceView.SurfaceViewHolder cameraPreview;
    private int displayOrientation;
    private boolean enableRearLensDistortionCorrection;
    private int flashMode;
    private FocusOverlayManager focusOverlayManager;
    private int forcedDisplayRotation;
    private final Handler handler;
    private boolean inPreview;
    private int lastPictureOrientation;
    private final OnOrientationChange onOrientationChange;
    private int outputOrientation;
    private CameraObject.OnPhotoResultListener photoReadyCallback;
    private Camera.PictureCallback pictureCallback;
    private final Matrix previewTransformMatrix;
    private long recordStart;
    private CameraRecorder.RecorderBase recorder;
    private boolean respectDeviceOrientation;
    private final TimeoutLock startStopRecordingLock;
    private boolean surfaceExists;
    private final Runnable timerUpdateRunnable;
    private boolean useFullBleedPreview;
    private float zoomLevel;

    public Camera1View(Context context) {
        super(context);
        this.startStopRecordingLock = new TimeoutLock(1000L);
        this.cameraMode = 2;
        this.handler = new Handler(Looper.getMainLooper());
        this.camera = null;
        this.inPreview = false;
        this.cameraId = frontCameraByDefault() ? CameraHolder.instance().getFrontCameraId() : CameraHolder.instance().getBackCameraId();
        this.useFullBleedPreview = true;
        this.displayOrientation = -1;
        this.outputOrientation = -1;
        this.lastPictureOrientation = -1;
        this.respectDeviceOrientation = false;
        this.forcedDisplayRotation = 0;
        this.enableRearLensDistortionCorrection = false;
        this.pictureCallback = new Camera.PictureCallback() { // from class: com.vk.camera.camera1.Camera1View.1
            @Override // android.hardware.Camera.PictureCallback
            public void onPictureTaken(byte[] data, Camera camera) {
                Camera1View.this.processJpeg(data);
            }
        };
        this.flashMode = 0;
        this.previewTransformMatrix = new Matrix();
        this.timerUpdateRunnable = new Runnable() { // from class: com.vk.camera.camera1.Camera1View.3
            @Override // java.lang.Runnable
            public void run() {
                long milliseconds = System.currentTimeMillis() - Camera1View.this.recordStart;
                if (Camera1View.this.isRecording()) {
                    CameraObject.OnRecordingCallback cb = Camera1View.this.recorder.getCallback();
                    if (cb != null) {
                        cb.onProgress(milliseconds, Camera1View.this.recorder.getMaxRecordingLengthMs());
                    }
                    Camera1View.this.uiHandler.postDelayed(Camera1View.this.timerUpdateRunnable, 16L);
                    return;
                }
                Camera1View.this.stopTimer();
            }
        };
        this.onOrientationChange = new OnOrientationChange(context.getApplicationContext());
        this.forcedDisplayRotation = ViewUtils.getDeviceDegreesInPortraitMode(context);
        this.cameraPreview = CameraSurfaceView.create(getContext(), this);
        this.recorder = this.cameraPreview.getRecorder();
        addCameraView(this.cameraPreview.view());
    }

    public CameraSurfaceView.Status setEffect(String name) {
        return this.cameraPreview.setEffect(name);
    }

    @Override // android.view.SurfaceHolder.Callback
    public void surfaceCreated(SurfaceHolder holder) {
        Log.v(TAG, "surfaceCreated");
        this.surfaceExists = true;
        startCameraPreview();
    }

    @Override // android.view.SurfaceHolder.Callback
    public void surfaceChanged(SurfaceHolder holder, int format, int width, int height) {
    }

    @Override // android.view.SurfaceHolder.Callback
    public void surfaceDestroyed(SurfaceHolder holder) {
        Log.v(TAG, "surfaceDestroyed");
        this.surfaceExists = false;
        destroyPreview(true);
    }

    private void startCameraPreview() {
        if (this.camera == null) {
            this.camera = CameraHolder.instance().tryOpen(this.cameraId);
            if (this.camera != null) {
                if (getActivity().getRequestedOrientation() != -1) {
                    this.onOrientationChange.enable();
                }
                setupParameters();
                Camera.Parameters cameraParameters = CameraHolder.instance().getParameters();
                if (cameraParameters != null) {
                    this.focusOverlayManager = new FocusOverlayManager(cameraParameters, this, isFrontCamera(), getContext().getMainLooper());
                    this.focusOverlayManager.setPreviewSize(cameraParameters.getPreviewSize().width, cameraParameters.getPreviewSize().height);
                    this.focusOverlayManager.setFocusView(this);
                }
                setFocusParameters();
                setCameraDisplayOrientation();
                startPreview();
            }
        }
    }

    void destroyPreview(boolean keep) {
        if (this.camera != null) {
            if (this.inPreview) {
                stopPreview(keep);
            }
            if (keep) {
                CameraHolder.instance().keep();
            }
            CameraHolder.instance().release();
            this.camera = null;
        }
    }

    @Override // com.vk.camera.BaseCameraView
    protected int getDisplayOrientation() {
        return this.displayOrientation;
    }

    @Override // com.vk.camera.BaseCameraView
    protected boolean useFullBleedPreview() {
        return this.useFullBleedPreview;
    }

    @Override // com.vk.camera.BaseCameraView
    protected boolean isCameraPreviewAvailable() {
        return getPreviewSize() != null;
    }

    @Override // com.vk.camera.BaseCameraView
    protected int getCameraPreviewWidth() {
        Camera.Size size = getPreviewSize();
        if (size != null) {
            return size.width;
        }
        return 0;
    }

    @Override // com.vk.camera.BaseCameraView
    protected int getCameraPreviewHeight() {
        Camera.Size size = getPreviewSize();
        if (size != null) {
            return size.height;
        }
        return 0;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.vk.camera.BaseCameraView
    public void onSingleTap(int x, int y) {
        if (this.focusOverlayManager != null) {
            this.focusOverlayManager.onSingleTapUp(x, y);
        }
    }

    @Override // com.vk.camera.BaseCameraView
    public void changeCamera() {
        boolean z = true;
        if (CameraHolder.instance().getNumberOfCameras() > 1) {
            CameraPrefs instance = CameraPrefs.instance();
            if (getCurrentMode() != CameraMode.BACK) {
                z = false;
            }
            instance.useFrontCamera(z);
            if (getCurrentMode() == CameraMode.BACK) {
                start(CameraMode.FRONT);
            } else {
                start(CameraMode.BACK);
            }
        }
    }

    private Camera.Size getPreviewSize() {
        Camera.Parameters cameraParameters;
        if (this.camera == null || (cameraParameters = CameraHolder.instance().getParameters()) == null) {
            return null;
        }
        Camera.Size previewSize = cameraParameters.getPreviewSize();
        return previewSize;
    }

    @Override // com.vk.camera.CameraObject.Viewer
    public void start() {
        start(this.currentCameraMode);
    }

    @Override // com.vk.camera.CameraObject.Viewer
    public void start(CameraMode mode) {
        if (this.camera != null && mode != getCurrentMode()) {
            stop(true);
        }
        if (mode == CameraMode.BACK) {
            this.cameraId = CameraHolder.instance().getBackCameraId();
        } else {
            this.cameraId = CameraHolder.instance().getFrontCameraId();
        }
        this.currentCameraMode = mode;
        if (this.surfaceExists) {
            startCameraPreview();
        }
    }

    @Override // com.vk.camera.CameraObject.Viewer
    public void stop(boolean keep) {
        this.handler.removeCallbacksAndMessages(null);
        doStopRecording();
        if (this.camera != null) {
            destroyPreview(keep);
        }
        this.onOrientationChange.disable();
        this.lastPictureOrientation = -1;
    }

    @Override // com.vk.camera.CameraObject.Viewer
    public CameraMode getCurrentMode() {
        return this.currentCameraMode;
    }

    @Override // com.vk.camera.CameraObject.Viewer
    public void takePicture() {
        if (this.focusOverlayManager != null) {
            this.focusOverlayManager.doSnap();
        }
    }

    @Override // com.vk.camera.CameraObject.Viewer
    public void setOnCameraResultListener(CameraObject.OnPhotoResultListener photoFileReadyCallback) {
        this.photoReadyCallback = photoFileReadyCallback;
    }

    @Override // com.vk.camera.CameraObject.Viewer
    public void setZoomLevel(float zoomLevel) {
        this.zoomLevel = Math.max(0.0f, Math.min(1.0f, zoomLevel));
        setupParameters();
    }

    @Override // com.vk.camera.CameraObject.Viewer
    public float getZoomLevel() {
        return this.zoomLevel;
    }

    @Override // com.vk.camera.CameraObject.Viewer
    public boolean isBackCamera() {
        return this.cameraId == CameraHolder.instance().getBackCameraId();
    }

    @Override // com.vk.camera.CameraObject.Viewer
    public boolean isFrontCamera() {
        return this.cameraId == CameraHolder.instance().getFrontCameraId();
    }

    @Override // com.vk.camera.CameraObject.Viewer
    public int getFlashMode() {
        return this.flashMode;
    }

    @Override // com.vk.camera.CameraObject.Viewer
    public void setFlashMode(int mode) {
        this.flashMode = mode;
        setupParameters();
    }

    @Override // com.vk.camera.CameraObject.Viewer
    public void setCameraOrientationListener(CameraOrientationListener listener) {
        this.cameraOrientationListener = listener;
        if (this.cameraOrientationListener != null) {
            this.cameraOrientationListener.onOrientationChange(this.outputOrientation != -1 ? this.outputOrientation : 90);
        }
    }

    @Override // com.vk.camera.CameraObject.Viewer
    public void setUseFullBleedPreview(boolean useFullBleedPreview) {
        this.useFullBleedPreview = useFullBleedPreview;
    }

    @Override // com.vk.camera.CameraObject.Recorder
    public boolean startRecording() {
        if (this.startStopRecordingLock.checkAndMaybeLock()) {
            return false;
        }
        this.recorder.setup(this.camera, getVideoProfile(), this.outputOrientation);
        boolean status = this.recorder.startRecording();
        if (status) {
            Utils.keepScreenOn(getActivity(), true);
            this.uiHandler.postDelayed(Camera1View$$Lambda$1.lambdaFactory$(this), 600L);
            setupParameters();
            return status;
        }
        return status;
    }

    private void doStopRecording() {
        stopTimer();
        this.recorder.stopRecording();
        this.recorder.release();
        Utils.keepScreenOn(getActivity(), false);
        setupParameters();
    }

    @Override // com.vk.camera.CameraObject.Recorder
    public void stopRecording() {
        if (!this.startStopRecordingLock.checkAndMaybeLock() && this.recordStart > 0) {
            CameraObject.OnRecordingCallback cb = this.recorder.getCallback();
            File outputFile = this.recorder.getOutputFile();
            doStopRecording();
            if (System.currentTimeMillis() - this.recordStart < 1000) {
                if (outputFile != null) {
                    FileUtils.deleteFile(outputFile);
                }
                if (cb != null) {
                    cb.onCancel();
                }
            } else if (cb != null) {
                cb.onFinish(outputFile);
            }
            int currentFlashMode = getFlashMode();
            setFlashMode(0);
            this.handler.postDelayed(Camera1View$$Lambda$2.lambdaFactory$(this, currentFlashMode), 1000L);
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$stopRecording$0(int currentFlashMode) {
        if (currentFlashMode != 0) {
            setFlashMode(currentFlashMode);
        }
    }

    @Override // com.vk.camera.CameraObject.Recorder
    public boolean isRecording() {
        return this.recorder.isRecording();
    }

    @Override // com.vk.camera.CameraObject.Recorder
    public void setRecordingCallback(CameraObject.OnRecordingCallback recordingCallback) {
        this.recorder.setRecordingCallback(recordingCallback);
    }

    @Override // com.vk.camera.CameraObject.Recorder
    public long getMaxRecordingLengthMs() {
        return this.recorder.getMaxRecordingLengthMs();
    }

    @Override // com.vk.camera.CameraObject.Recorder
    public void setMaxRecordingLengthMs(long maxRecordingLengthMs) {
        this.recorder.setMaxRecordingLengthMs(maxRecordingLengthMs);
    }

    @Override // com.vk.camera.camera1.FocusOverlayManager.Listener
    public void autoFocus() {
        if (this.inPreview && this.camera != null) {
            this.camera.autoFocus(this);
        }
    }

    @Override // com.vk.camera.camera1.FocusOverlayManager.Listener
    public void cancelAutoFocus() {
        if (this.camera != null) {
            this.camera.cancelAutoFocus();
        }
    }

    @Override // com.vk.camera.camera1.FocusOverlayManager.Listener
    public boolean capture() {
        if (capture(this.pictureCallback)) {
            return true;
        }
        if (this.camera != null) {
            this.camera.takePicture(null, null, null, this.pictureCallback);
            return true;
        }
        return false;
    }

    @Override // com.vk.camera.CameraObject.Recorder
    public boolean capture(Camera.PictureCallback callback) {
        return this.recorder != null && this.recorder.capture(callback);
    }

    @Override // com.vk.camera.camera1.FocusOverlayManager.Listener
    public void setFocusParameters() {
        if (this.camera != null) {
            Camera.Parameters cameraParameters = CameraHolder.instance().getParameters();
            if (cameraParameters != null) {
                cameraParameters.setFocusMode(this.focusOverlayManager.getFocusMode());
                if (CameraUtils.isFocusAreaSupported(cameraParameters)) {
                    cameraParameters.setFocusAreas(this.focusOverlayManager.getFocusAreas());
                }
                if (CameraUtils.isMeteringAreaSupported(cameraParameters)) {
                    cameraParameters.setMeteringAreas(this.focusOverlayManager.getMeteringAreas());
                }
            }
            updateParameters();
        }
    }

    @Override // com.vk.camera.camera1.FocusOverlayManager.Listener
    public Point transformToPreviewCoordinates(int x, int y) {
        Camera.Parameters cameraParameters = CameraHolder.instance().getParameters();
        if (this.focusOverlayManager == null || cameraParameters == null) {
            return null;
        }
        float previewWidth = cameraParameters.getPreviewSize().width;
        float previewHeight = cameraParameters.getPreviewSize().height;
        this.previewTransformMatrix.reset();
        this.previewTransformMatrix.setScale(previewWidth / getWidth(), previewHeight / getHeight());
        float[] point = {x, y};
        this.previewTransformMatrix.mapPoints(point);
        return new Point((int) point[0], (int) point[1]);
    }

    @Override // android.hardware.Camera.AutoFocusCallback
    public void onAutoFocus(boolean success, Camera camera) {
        this.focusOverlayManager.onAutoFocus(success, false);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void updateParameters() {
        try {
            Camera.Parameters cameraParameters = CameraHolder.instance().getParameters();
            if (cameraParameters != null) {
                this.camera.setParameters(cameraParameters);
            }
        } catch (Throwable e) {
            Log.e("Camera", "", e);
        }
    }

    private void startPreview() {
        this.cameraPreview.requestLayout();
        this.inPreview = this.cameraPreview.startPreview(this.camera, this.cameraId);
    }

    private void stopPreview(boolean keep) {
        try {
            this.cameraPreview.stopPreview(keep);
            this.inPreview = false;
            this.camera.stopPreview();
        } catch (Exception e) {
        }
    }

    private Activity getActivity() {
        return com.vkontakte.android.utils.Utils.castToActivity(getContext());
    }

    private void setCameraDisplayOrientation() {
        int displayRotation = CameraUtils.getDisplayRotation(getActivity());
        this.displayOrientation = CameraUtils.getDisplayOrientation(displayRotation, this.cameraId);
        if (this.camera != null) {
            this.camera.setDisplayOrientation(this.displayOrientation);
        }
        if (this.focusOverlayManager != null) {
            this.focusOverlayManager.setDisplayOrientation(displayRotation + 90);
        }
    }

    private void setCameraPictureOrientation(Camera.Parameters params) {
        Camera.CameraInfo info = new Camera.CameraInfo();
        Camera.getCameraInfo(this.cameraId, info);
        if (getActivity().getRequestedOrientation() != -1) {
            setOutputOrientation(CameraUtils.getCameraPictureRotation(getActivity().getWindowManager().getDefaultDisplay().getRotation(), this.cameraId));
        } else if (info.facing == 1) {
            setOutputOrientation((360 - this.displayOrientation) % InstreamAd.DEFAULT_VIDEO_QUALITY);
        } else {
            setOutputOrientation(this.displayOrientation);
        }
        if (this.lastPictureOrientation != this.outputOrientation) {
            params.setRotation(this.outputOrientation);
            this.lastPictureOrientation = this.outputOrientation;
        }
    }

    private void setupParameters() {
        Camera.Parameters cameraParameters;
        if (this.camera != null && (cameraParameters = CameraHolder.instance().getParameters()) != null) {
            enableAutoPhotoMode(cameraParameters);
            setCameraPictureOrientation(cameraParameters);
            cameraParameters.setPictureFormat(256);
            if (isFrontCamera() || this.flashMode == 0) {
                cameraParameters.setFlashMode("off");
            } else if (this.flashMode == 1) {
                cameraParameters.setFlashMode("auto");
            } else if (this.flashMode == 2) {
                if (isRecording()) {
                    cameraParameters.setFlashMode("torch");
                } else {
                    cameraParameters.setFlashMode("on");
                }
            }
            if (cameraParameters.isZoomSupported()) {
                cameraParameters.setZoom((int) (this.zoomLevel * cameraParameters.getMaxZoom()));
            }
            enableAntibanding(cameraParameters);
            enableWhiteBalance(cameraParameters);
            setRearLensDistortionCorrection(cameraParameters, this.enableRearLensDistortionCorrection);
            if (this.cameraMode == 0) {
                Camera.Size newSize = CameraUtils.getOptimalPhotoPreviewSize(cameraParameters);
                if (newSize != null) {
                    cameraParameters.setPreviewSize(newSize.width, newSize.height);
                }
                Camera.Size pictureSize = CameraUtils.getOptimalPhotoPictureSize(cameraParameters, 4, 3);
                if (pictureSize != null) {
                    cameraParameters.setPictureSize(pictureSize.width, pictureSize.height);
                }
            } else {
                enableVideoStabilization(cameraParameters);
                CamcorderProfile profile = getVideoProfile();
                Camera.Size newSize2 = CameraUtils.getOptimalVideoPreviewSize(cameraParameters, profile.videoFrameWidth, profile.videoFrameHeight);
                if (newSize2 != null) {
                    cameraParameters.setPreviewSize(newSize2.width, newSize2.height);
                }
                Camera.Size pictureSize2 = CameraUtils.getOptimalPhotoPictureSize(cameraParameters, profile.videoFrameWidth, profile.videoFrameHeight);
                if (pictureSize2 != null) {
                    cameraParameters.setPictureSize(pictureSize2.width, pictureSize2.height);
                }
            }
            int[] fpsRanges = getPreviewFpsRange(cameraParameters);
            if (fpsRanges != null) {
                cameraParameters.setPreviewFpsRange(fpsRanges[0], fpsRanges[1]);
            }
            updateParameters();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void processJpeg(final byte[] jpegData) {
        this.uiHandler.post(new Runnable() { // from class: com.vk.camera.camera1.Camera1View.2
            @Override // java.lang.Runnable
            public void run() {
                if (Camera1View.this.photoReadyCallback != null) {
                    Camera1View.this.photoReadyCallback.onReady(jpegData);
                }
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void setOutputOrientation(int newOutputOrientation) {
        this.outputOrientation = newOutputOrientation;
        if (this.cameraOrientationListener != null) {
            this.cameraOrientationListener.onOrientationChange(this.outputOrientation != -1 ? this.outputOrientation : 90);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes2.dex */
    public class OnOrientationChange extends OrientationEventListener {
        private boolean isEnabled;

        public OnOrientationChange(Context context) {
            super(context);
            this.isEnabled = false;
            disable();
        }

        @Override // android.view.OrientationEventListener
        public void onOrientationChanged(int orientation) {
            if (Camera1View.this.camera != null && orientation != -1) {
                if (!Camera1View.this.respectDeviceOrientation) {
                    orientation = Camera1View.this.forcedDisplayRotation;
                }
                int newOutputOrientation = CameraUtils.getCameraPictureRotation(orientation, Camera1View.this.cameraId);
                if (newOutputOrientation != Camera1View.this.outputOrientation) {
                    Camera1View.this.setOutputOrientation(newOutputOrientation);
                    try {
                        Camera.Parameters cameraParameters = CameraHolder.instance().getParameters();
                        if (cameraParameters != null) {
                            cameraParameters.setRotation(Camera1View.this.outputOrientation);
                        }
                    } catch (Throwable e) {
                        Log.e("Camera", "", e);
                    }
                    Camera1View.this.updateParameters();
                    Camera1View.this.lastPictureOrientation = Camera1View.this.outputOrientation;
                }
            }
        }

        @Override // android.view.OrientationEventListener
        public void enable() {
            this.isEnabled = true;
            super.enable();
        }

        @Override // android.view.OrientationEventListener
        public void disable() {
            this.isEnabled = false;
            super.disable();
        }

        boolean isEnabled() {
            return this.isEnabled;
        }
    }

    private int[] getPreviewFpsRange(Camera.Parameters parameters) {
        int i2;
        int[] iArr4;
        List<int[]> supportedPreviewFpsRange = parameters.getSupportedPreviewFpsRange();
        int[] iArr2 = null;
        int i = Integer.MAX_VALUE;
        for (int[] iArr3 : supportedPreviewFpsRange) {
            if (iArr3[1] < 30000 || iArr3[0] >= i) {
                i2 = i;
                iArr4 = iArr2;
            } else {
                iArr4 = iArr3;
                i2 = iArr3[0];
            }
            iArr2 = iArr4;
            i = i2;
        }
        return iArr2 == null ? supportedPreviewFpsRange.get(supportedPreviewFpsRange.size() - 1) : iArr2;
    }

    private CamcorderProfile getVideoProfile() {
        CamcorderProfile profile = this.cameraPreview.getVideoProfile(this.cameraId);
        if (profile == null) {
            if (!"Meizu".equalsIgnoreCase(Build.MANUFACTURER) && CamcorderProfile.hasProfile(this.cameraId, 5)) {
                return CamcorderProfile.get(this.cameraId, 5);
            }
            if (CamcorderProfile.hasProfile(this.cameraId, 4)) {
                return CamcorderProfile.get(this.cameraId, 4);
            }
            return CamcorderProfile.get(this.cameraId, 0);
        }
        return profile;
    }

    public void startTimer() {
        CameraObject.OnRecordingCallback cb = this.recorder.getCallback();
        if (cb != null) {
            cb.onStart();
        }
        this.recordStart = System.currentTimeMillis();
        this.uiHandler.postDelayed(this.timerUpdateRunnable, 32L);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void stopTimer() {
        this.uiHandler.removeCallbacks(this.timerUpdateRunnable);
    }

    static void enableAntibanding(Camera.Parameters parameters) {
        List supportedAntibanding = parameters.getSupportedAntibanding();
        if (supportedAntibanding != null && supportedAntibanding.contains("auto")) {
            parameters.setAntibanding("auto");
        }
    }

    static void enableWhiteBalance(Camera.Parameters parameters) {
        List supportedWhiteBalance = parameters.getSupportedWhiteBalance();
        if (supportedWhiteBalance != null && supportedWhiteBalance.contains("auto")) {
            parameters.setWhiteBalance("auto");
        }
    }

    static void enableAutoPhotoMode(Camera.Parameters parameters) {
        List supportedSceneModes = parameters.getSupportedSceneModes();
        if (supportedSceneModes != null && supportedSceneModes.contains("auto")) {
            parameters.setSceneMode("auto");
        }
    }

    static void enableVideoStabilization(Camera.Parameters parameters) {
        if (parameters.isVideoStabilizationSupported()) {
            if (!Build.PRODUCT.equals("volantis") || Build.VERSION.SDK_INT != 23) {
                parameters.setVideoStabilization(true);
            }
        }
    }

    static void setRearLensDistortionCorrection(Camera.Parameters parameters, boolean on) {
        try {
            parameters.set("rear-lens-distortion-correction", on ? "on" : "off");
        } catch (Throwable th) {
        }
    }
}
