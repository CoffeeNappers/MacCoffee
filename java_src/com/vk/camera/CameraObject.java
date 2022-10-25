package com.vk.camera;

import android.hardware.Camera;
import com.vk.camera.camera1.CameraOrientationListener;
import java.io.File;
/* loaded from: classes2.dex */
public class CameraObject {
    public static final int FLASH_MODE_AUTO = 1;
    public static final int FLASH_MODE_OFF = 0;
    public static final int FLASH_MODE_ON = 2;
    public static final int MODE_BOTH = 2;
    public static final int MODE_PHOTO = 0;
    public static final int MODE_VIDEO = 1;

    /* loaded from: classes2.dex */
    public interface OnPhotoResultListener {
        void onReady(byte[] bArr);
    }

    /* loaded from: classes2.dex */
    public interface OnRecordingCallback {
        void onCancel();

        void onError(int i, int i2);

        void onFinish(File file);

        void onInfo(int i, int i2);

        void onProgress(long j, long j2);

        void onStart();
    }

    /* loaded from: classes2.dex */
    public interface OnVideoResultListener {
        void onStop(File file);
    }

    /* loaded from: classes2.dex */
    public interface Recorder {
        boolean capture(Camera.PictureCallback pictureCallback);

        long getMaxRecordingLengthMs();

        boolean isRecording();

        void setMaxRecordingLengthMs(long j);

        void setRecordingCallback(OnRecordingCallback onRecordingCallback);

        boolean startRecording();

        void stopRecording();
    }

    /* loaded from: classes2.dex */
    public interface Viewer {
        CameraMode getCurrentMode();

        int getFlashMode();

        float getZoomLevel();

        boolean isBackCamera();

        boolean isFrontCamera();

        void setCameraOrientationListener(CameraOrientationListener cameraOrientationListener);

        void setFlashMode(int i);

        void setOnCameraResultListener(OnPhotoResultListener onPhotoResultListener);

        void setUseFullBleedPreview(boolean z);

        void setZoomLevel(float f);

        void start();

        void start(CameraMode cameraMode);

        void stop(boolean z);

        void takePicture();
    }
}
