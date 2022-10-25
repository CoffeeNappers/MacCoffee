package com.vk.camera.camera1;

import android.annotation.TargetApi;
import android.graphics.SurfaceTexture;
import android.hardware.Camera;
import android.os.ConditionVariable;
import android.os.Handler;
import android.os.HandlerThread;
import android.os.Looper;
import android.os.Message;
import android.util.Log;
import android.view.SurfaceHolder;
import java.io.IOException;
/* loaded from: classes2.dex */
public class CameraManager {
    private static final int ADD_CALLBACK_BUFFER = 9;
    private static final int AUTO_FOCUS = 10;
    private static final int CANCEL_AUTO_FOCUS = 11;
    private static final int ENABLE_SHUTTER_SOUND = 25;
    private static final int GET_PARAMETERS = 20;
    private static final int LOCK = 4;
    private static final int RECONNECT = 2;
    private static final int RELEASE = 1;
    private static final int SET_AUTO_FOCUS_MOVE_CALLBACK = 12;
    private static final int SET_DISPLAY_ORIENTATION = 13;
    private static final int SET_ERROR_CALLBACK = 18;
    private static final int SET_FACE_DETECTION_LISTENER = 15;
    private static final int SET_PARAMETERS = 19;
    private static final int SET_PARAMETERS_ASYNC = 21;
    private static final int SET_PREVIEW_CALLBACK = 24;
    private static final int SET_PREVIEW_CALLBACK_WITH_BUFFER = 8;
    private static final int SET_PREVIEW_DISPLAY_ASYNC = 23;
    private static final int SET_PREVIEW_TEXTURE_ASYNC = 5;
    private static final int SET_ZOOM_CHANGE_LISTENER = 14;
    private static final int START_FACE_DETECTION = 16;
    private static final int START_PREVIEW_ASYNC = 6;
    private static final int STOP_FACE_DETECTION = 17;
    private static final int STOP_PREVIEW = 7;
    private static final String TAG = "CameraManager";
    private static final int UNLOCK = 3;
    private static final int WAIT_FOR_IDLE = 22;
    private static CameraManager sCameraManager = new CameraManager();
    private Camera mCamera;
    private Handler mCameraHandler;
    private CameraProxy mCameraProxy;
    private Camera.Parameters mParameters;
    private Exception mReconnectException;
    private ConditionVariable mSig = new ConditionVariable();

    public static CameraManager instance() {
        return sCameraManager;
    }

    private CameraManager() {
        HandlerThread ht = new HandlerThread("Camera Handler Thread");
        ht.start();
        this.mCameraHandler = new CameraHandler(ht.getLooper());
    }

    /* loaded from: classes2.dex */
    private class CameraHandler extends Handler {
        CameraHandler(Looper looper) {
            super(looper);
        }

        @TargetApi(14)
        private void startFaceDetection() {
            CameraManager.this.mCamera.startFaceDetection();
        }

        @TargetApi(14)
        private void stopFaceDetection() {
            CameraManager.this.mCamera.stopFaceDetection();
        }

        @TargetApi(14)
        private void setFaceDetectionListener(Camera.FaceDetectionListener listener) {
            CameraManager.this.mCamera.setFaceDetectionListener(listener);
        }

        @TargetApi(11)
        private void setPreviewTexture(Object surfaceTexture) {
            try {
                CameraManager.this.mCamera.setPreviewTexture((SurfaceTexture) surfaceTexture);
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        }

        @TargetApi(17)
        private void enableShutterSound(boolean enable) {
            CameraManager.this.mCamera.enableShutterSound(enable);
        }

        @Override // android.os.Handler
        public void handleMessage(Message msg) {
            try {
                switch (msg.what) {
                    case 1:
                        CameraManager.this.mCamera.release();
                        CameraManager.this.mCamera = null;
                        CameraManager.this.mCameraProxy = null;
                        break;
                    case 2:
                        CameraManager.this.mReconnectException = null;
                        try {
                            CameraManager.this.mCamera.reconnect();
                            break;
                        } catch (Exception ex) {
                            CameraManager.this.mReconnectException = ex;
                            break;
                        }
                    case 3:
                        try {
                            CameraManager.this.mCamera.unlock();
                            break;
                        } catch (Exception e) {
                            break;
                        }
                    case 4:
                        try {
                            CameraManager.this.mCamera.lock();
                            break;
                        } catch (Exception e2) {
                            break;
                        }
                    case 5:
                        try {
                            setPreviewTexture(msg.obj);
                            return;
                        } catch (Exception e3) {
                            return;
                        }
                    case 6:
                        try {
                            CameraManager.this.mCamera.startPreview();
                            return;
                        } catch (Exception e4) {
                            return;
                        }
                    case 7:
                        try {
                            CameraManager.this.mCamera.stopPreview();
                            break;
                        } catch (Exception e5) {
                            break;
                        }
                    case 8:
                        CameraManager.this.mCamera.setPreviewCallbackWithBuffer((Camera.PreviewCallback) msg.obj);
                        break;
                    case 9:
                        CameraManager.this.mCamera.addCallbackBuffer((byte[]) msg.obj);
                        break;
                    case 10:
                        try {
                            CameraManager.this.mCamera.autoFocus((Camera.AutoFocusCallback) msg.obj);
                            break;
                        } catch (Exception e6) {
                            break;
                        }
                    case 11:
                        try {
                            CameraManager.this.mCamera.cancelAutoFocus();
                            break;
                        } catch (Exception e7) {
                            break;
                        }
                    case 12:
                        CameraManager.this.setAutoFocusMoveCallback(CameraManager.this.mCamera, msg.obj);
                        break;
                    case 13:
                        try {
                            CameraManager.this.mCamera.setDisplayOrientation(msg.arg1);
                            break;
                        } catch (Exception e8) {
                            break;
                        }
                    case 14:
                        CameraManager.this.mCamera.setZoomChangeListener((Camera.OnZoomChangeListener) msg.obj);
                        break;
                    case 15:
                        setFaceDetectionListener((Camera.FaceDetectionListener) msg.obj);
                        break;
                    case 16:
                        startFaceDetection();
                        break;
                    case 17:
                        stopFaceDetection();
                        break;
                    case 18:
                        CameraManager.this.mCamera.setErrorCallback((Camera.ErrorCallback) msg.obj);
                        break;
                    case 19:
                        try {
                            CameraManager.this.mCamera.setParameters((Camera.Parameters) msg.obj);
                            break;
                        } catch (Exception e9) {
                            break;
                        }
                    case 20:
                        try {
                            CameraManager.this.mParameters = CameraManager.this.mCamera.getParameters();
                            break;
                        } catch (Exception e10) {
                            break;
                        }
                    case 21:
                        try {
                            CameraManager.this.mCamera.setParameters((Camera.Parameters) msg.obj);
                            return;
                        } catch (Exception e11) {
                            return;
                        }
                    case 22:
                        break;
                    case 23:
                        try {
                            CameraManager.this.mCamera.setPreviewDisplay((SurfaceHolder) msg.obj);
                            return;
                        } catch (Exception e12) {
                            return;
                        }
                    case 24:
                        CameraManager.this.mCamera.setPreviewCallback((Camera.PreviewCallback) msg.obj);
                        break;
                    case 25:
                        enableShutterSound(msg.arg1 == 1);
                        break;
                    default:
                        throw new RuntimeException("Invalid CameraProxy message=" + msg.what);
                }
                CameraManager.this.mSig.open();
            } catch (RuntimeException e13) {
                if (msg.what != 1 && CameraManager.this.mCamera != null) {
                    try {
                        CameraManager.this.mCamera.release();
                    } catch (Exception e14) {
                        Log.e(CameraManager.TAG, "Fail to release the camera.");
                    }
                    CameraManager.this.mCamera = null;
                    CameraManager.this.mCameraProxy = null;
                }
                throw e13;
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    @TargetApi(16)
    public void setAutoFocusMoveCallback(Camera camera, Object cb) {
        camera.setAutoFocusMoveCallback((Camera.AutoFocusMoveCallback) cb);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public CameraProxy cameraOpen(int cameraId) {
        this.mCamera = Camera.open(cameraId);
        if (this.mCamera != null) {
            this.mCameraProxy = new CameraProxy();
            return this.mCameraProxy;
        }
        return null;
    }

    /* loaded from: classes2.dex */
    public class CameraProxy {
        private CameraProxy() {
            if (CameraManager.this.mCamera == null) {
                throw new RuntimeException("Camera is null");
            }
        }

        public Camera getCamera() {
            return CameraManager.this.mCamera;
        }

        public void release() {
            CameraManager.this.mSig.close();
            CameraManager.this.mCameraHandler.sendEmptyMessage(1);
            CameraManager.this.mSig.block();
        }

        public void reconnect() throws Exception {
            CameraManager.this.mSig.close();
            CameraManager.this.mCameraHandler.sendEmptyMessage(2);
            CameraManager.this.mSig.block();
            if (CameraManager.this.mReconnectException != null) {
                throw CameraManager.this.mReconnectException;
            }
        }

        public void unlock() {
            CameraManager.this.mSig.close();
            CameraManager.this.mCameraHandler.sendEmptyMessage(3);
            CameraManager.this.mSig.block();
        }

        public void lock() {
            CameraManager.this.mSig.close();
            CameraManager.this.mCameraHandler.sendEmptyMessage(4);
            CameraManager.this.mSig.block();
        }

        @TargetApi(11)
        public void setPreviewTextureAsync(SurfaceTexture surfaceTexture) {
            CameraManager.this.mCameraHandler.obtainMessage(5, surfaceTexture).sendToTarget();
        }

        public void setPreviewDisplayAsync(SurfaceHolder surfaceHolder) {
            CameraManager.this.mCameraHandler.obtainMessage(23, surfaceHolder).sendToTarget();
        }

        public void startPreviewAsync() {
            CameraManager.this.mCameraHandler.sendEmptyMessage(6);
        }

        public void stopPreview() {
            CameraManager.this.mSig.close();
            CameraManager.this.mCameraHandler.sendEmptyMessage(7);
            CameraManager.this.mSig.block();
        }

        public void setPreviewCallback(Camera.PreviewCallback cb) {
            CameraManager.this.mSig.close();
            CameraManager.this.mCameraHandler.obtainMessage(24, cb).sendToTarget();
            CameraManager.this.mSig.block();
        }

        public void setPreviewCallbackWithBuffer(Camera.PreviewCallback cb) {
            CameraManager.this.mSig.close();
            CameraManager.this.mCameraHandler.obtainMessage(8, cb).sendToTarget();
            CameraManager.this.mSig.block();
        }

        public void addCallbackBuffer(byte[] callbackBuffer) {
            CameraManager.this.mSig.close();
            CameraManager.this.mCameraHandler.obtainMessage(9, callbackBuffer).sendToTarget();
            CameraManager.this.mSig.block();
        }

        public void autoFocus(Camera.AutoFocusCallback cb) {
            CameraManager.this.mSig.close();
            CameraManager.this.mCameraHandler.obtainMessage(10, cb).sendToTarget();
            CameraManager.this.mSig.block();
        }

        public void cancelAutoFocus() {
            CameraManager.this.mSig.close();
            CameraManager.this.mCameraHandler.sendEmptyMessage(11);
            CameraManager.this.mSig.block();
        }

        @TargetApi(16)
        public void setAutoFocusMoveCallback(Camera.AutoFocusMoveCallback cb) {
            CameraManager.this.mSig.close();
            CameraManager.this.mCameraHandler.obtainMessage(12, cb).sendToTarget();
            CameraManager.this.mSig.block();
        }

        public void takePicture(final Camera.ShutterCallback shutter, final Camera.PictureCallback raw, final Camera.PictureCallback postview, final Camera.PictureCallback jpeg) {
            CameraManager.this.mSig.close();
            CameraManager.this.mCameraHandler.post(new Runnable() { // from class: com.vk.camera.camera1.CameraManager.CameraProxy.1
                @Override // java.lang.Runnable
                public void run() {
                    try {
                        CameraManager.this.mCamera.takePicture(shutter, raw, postview, jpeg);
                    } catch (Exception e) {
                    }
                    CameraManager.this.mSig.open();
                }
            });
            CameraManager.this.mSig.block();
        }

        public void setDisplayOrientation(int degrees) {
            CameraManager.this.mSig.close();
            CameraManager.this.mCameraHandler.obtainMessage(13, degrees, 0).sendToTarget();
            CameraManager.this.mSig.block();
        }

        public void setZoomChangeListener(Camera.OnZoomChangeListener listener) {
            CameraManager.this.mSig.close();
            CameraManager.this.mCameraHandler.obtainMessage(14, listener).sendToTarget();
            CameraManager.this.mSig.block();
        }

        @TargetApi(14)
        public void setFaceDetectionListener(Camera.FaceDetectionListener listener) {
            CameraManager.this.mSig.close();
            CameraManager.this.mCameraHandler.obtainMessage(15, listener).sendToTarget();
            CameraManager.this.mSig.block();
        }

        public void startFaceDetection() {
            CameraManager.this.mSig.close();
            CameraManager.this.mCameraHandler.sendEmptyMessage(16);
            CameraManager.this.mSig.block();
        }

        public void stopFaceDetection() {
            CameraManager.this.mSig.close();
            CameraManager.this.mCameraHandler.sendEmptyMessage(17);
            CameraManager.this.mSig.block();
        }

        public void setErrorCallback(Camera.ErrorCallback cb) {
            CameraManager.this.mSig.close();
            CameraManager.this.mCameraHandler.obtainMessage(18, cb).sendToTarget();
            CameraManager.this.mSig.block();
        }

        public void setParameters(Camera.Parameters params) {
            CameraManager.this.mSig.close();
            CameraManager.this.mCameraHandler.obtainMessage(19, params).sendToTarget();
            CameraManager.this.mSig.block();
        }

        public void setParametersAsync(Camera.Parameters params) {
            CameraManager.this.mCameraHandler.removeMessages(21);
            CameraManager.this.mCameraHandler.obtainMessage(21, params).sendToTarget();
        }

        public Camera.Parameters getParameters() {
            CameraManager.this.mSig.close();
            CameraManager.this.mCameraHandler.sendEmptyMessage(20);
            CameraManager.this.mSig.block();
            Camera.Parameters parameters = CameraManager.this.mParameters;
            CameraManager.this.mParameters = null;
            return parameters;
        }

        public void enableShutterSound(boolean enable) {
            CameraManager.this.mSig.close();
            CameraManager.this.mCameraHandler.obtainMessage(25, enable ? 1 : 0, 0).sendToTarget();
            CameraManager.this.mSig.block();
        }

        public void waitForIdle() {
            CameraManager.this.mSig.close();
            CameraManager.this.mCameraHandler.sendEmptyMessage(22);
            CameraManager.this.mSig.block();
        }
    }
}
