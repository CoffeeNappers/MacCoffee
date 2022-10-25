package com.vk.media.camera;

import android.content.Context;
import android.hardware.Camera;
import android.util.Log;
import android.view.WindowManager;
import com.facebook.imagepipeline.common.RotationOptions;
import com.my.target.ads.instream.InstreamAd;
import com.vk.media.camera.CameraUtils;
import com.vk.media.utils.MediaUtils;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
/* loaded from: classes2.dex */
public class CameraSource {
    private static final float ASPECT_RATIO_TOLERANCE = 0.01f;
    private static final int PREVIEW_BUFFERS = 3;
    private static final String TAG = "CameraSource";
    private Camera mCamera;
    private Camera.CameraInfo mCameraInfo;
    private Context mContext;
    private int mHeight;
    private CameraUtils.FrameObserver mObserver;
    private float mRequestedFps;
    private int mWidth;
    private MediaUtils.Size mSize = null;
    private int mRequestedCameraId = 0;
    private int mBufferSize = 0;

    public CameraSource(CameraUtils.FrameObserver observer, int width, int height, Context context, float fps) {
        this.mObserver = null;
        this.mRequestedFps = 0.0f;
        this.mWidth = 0;
        this.mHeight = 0;
        this.mObserver = observer;
        this.mWidth = width;
        this.mHeight = height;
        this.mContext = context;
        this.mRequestedFps = fps;
        Log.d(TAG, "CameraSource res: " + this.mWidth + "x" + this.mHeight);
    }

    public boolean start(Camera camera, int cameraId) {
        if (this.mObserver == null || camera == null) {
            return false;
        }
        if (this.mCamera != null) {
            stop();
        }
        try {
            this.mRequestedCameraId = cameraId;
            this.mCamera = camera;
            this.mCameraInfo = new Camera.CameraInfo();
            Camera.getCameraInfo(this.mRequestedCameraId, this.mCameraInfo);
            int format = CameraUtils.getCameraFormat();
            Camera.Parameters parameters = this.mCamera.getParameters();
            parameters.setPreviewFormat(format);
            setParameters(this.mCamera, parameters);
            this.mCamera.setPreviewCallbackWithBuffer(new CameraPreviewCallback());
            for (int i = 0; i < 3; i++) {
                this.mCamera.addCallbackBuffer(createPreviewBuffer(this.mSize, format));
            }
            return true;
        } catch (Throwable th) {
            return false;
        }
    }

    public void stop() {
        try {
            if (this.mCamera != null) {
                this.mCamera.setPreviewCallbackWithBuffer(null);
            }
        } catch (Throwable th) {
        }
        this.mCamera = null;
    }

    public boolean isReady() {
        return this.mCamera != null;
    }

    private void setParameters(Camera camera, Camera.Parameters parameters) {
        SizePair sizePair = selectSizePair(camera, this.mWidth, this.mHeight);
        if (sizePair == null) {
            throw new RuntimeException("Could not find suitable preview size.");
        }
        this.mSize = sizePair.previewSize();
        int[] previewFpsRange = selectPreviewFpsRange(camera, this.mRequestedFps);
        if (previewFpsRange == null) {
            throw new RuntimeException("Could not find suitable preview frames per second range.");
        }
        parameters.setPreviewSize(this.mSize.getWidth(), this.mSize.getHeight());
        parameters.setPreviewFpsRange(previewFpsRange[0], previewFpsRange[1]);
        camera.setParameters(parameters);
    }

    private static SizePair selectSizePair(Camera camera, int desiredWidth, int desiredHeight) {
        List<SizePair> validPreviewSizes = generateValidPreviewSizeList(camera);
        SizePair selectedPair = null;
        int minDiff = Integer.MAX_VALUE;
        for (SizePair sizePair : validPreviewSizes) {
            MediaUtils.Size size = sizePair.previewSize();
            int diff = Math.abs(size.getWidth() - desiredWidth) + Math.abs(size.getHeight() - desiredHeight);
            if (diff < minDiff) {
                selectedPair = sizePair;
                minDiff = diff;
            }
        }
        return selectedPair;
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes2.dex */
    public static class SizePair {
        private MediaUtils.Size mPicture;
        private MediaUtils.Size mPreview;

        public SizePair(Camera.Size previewSize, Camera.Size pictureSize) {
            this.mPreview = new MediaUtils.Size(previewSize.width, previewSize.height);
            if (pictureSize != null) {
                this.mPicture = new MediaUtils.Size(pictureSize.width, pictureSize.height);
            }
        }

        public MediaUtils.Size previewSize() {
            return this.mPreview;
        }

        public MediaUtils.Size pictureSize() {
            return this.mPicture;
        }
    }

    private static List<SizePair> generateValidPreviewSizeList(Camera camera) {
        Camera.Parameters parameters = camera.getParameters();
        List<Camera.Size> supportedPreviewSizes = parameters.getSupportedPreviewSizes();
        List<Camera.Size> supportedPictureSizes = parameters.getSupportedPictureSizes();
        List<SizePair> validPreviewSizes = new ArrayList<>();
        for (Camera.Size previewSize : supportedPreviewSizes) {
            float previewAspectRatio = previewSize.width / previewSize.height;
            Iterator<Camera.Size> it = supportedPictureSizes.iterator();
            while (true) {
                if (it.hasNext()) {
                    Camera.Size pictureSize = it.next();
                    float pictureAspectRatio = pictureSize.width / pictureSize.height;
                    if (Math.abs(previewAspectRatio - pictureAspectRatio) < ASPECT_RATIO_TOLERANCE) {
                        validPreviewSizes.add(new SizePair(previewSize, pictureSize));
                        break;
                    }
                }
            }
        }
        if (validPreviewSizes.size() == 0) {
            Log.w(TAG, "No preview sizes have a corresponding same-aspect-ratio picture size");
            for (Camera.Size previewSize2 : supportedPreviewSizes) {
                validPreviewSizes.add(new SizePair(previewSize2, null));
            }
        }
        return validPreviewSizes;
    }

    private int[] selectPreviewFpsRange(Camera camera, float desiredPreviewFps) {
        int desiredPreviewFpsScaled = (int) (1000.0f * desiredPreviewFps);
        int[] selectedFpsRange = null;
        int minDiff = Integer.MAX_VALUE;
        List<int[]> previewFpsRangeList = camera.getParameters().getSupportedPreviewFpsRange();
        for (int[] range : previewFpsRangeList) {
            int deltaMin = desiredPreviewFpsScaled - range[0];
            int deltaMax = desiredPreviewFpsScaled - range[1];
            int diff = Math.abs(deltaMin) + Math.abs(deltaMax);
            if (diff < minDiff) {
                selectedFpsRange = range;
                minDiff = diff;
            }
        }
        return selectedFpsRange;
    }

    private byte[] createPreviewBuffer(MediaUtils.Size previewSize, int format) {
        this.mBufferSize = CameraUtils.getFrameSize(previewSize.getWidth(), previewSize.getHeight(), format);
        byte[] byteArray = new byte[this.mBufferSize];
        ByteBuffer buffer = ByteBuffer.wrap(byteArray);
        if (!buffer.hasArray() || buffer.array() != byteArray) {
            throw new IllegalStateException("Failed to create valid buffer for camera source.");
        }
        return byteArray;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public int getDeviceOrientation() {
        WindowManager wm = (WindowManager) this.mContext.getSystemService("window");
        switch (wm.getDefaultDisplay().getRotation()) {
            case 1:
                return 90;
            case 2:
                return RotationOptions.ROTATE_180;
            case 3:
                return RotationOptions.ROTATE_270;
            default:
                return 0;
        }
    }

    /* loaded from: classes2.dex */
    private class CameraPreviewCallback implements Camera.PreviewCallback {
        private CameraPreviewCallback() {
        }

        @Override // android.hardware.Camera.PreviewCallback
        public void onPreviewFrame(byte[] data, Camera camera) {
            int rotation = CameraSource.this.getDeviceOrientation();
            if (CameraSource.this.mCameraInfo.facing == 0) {
                rotation = 360 - rotation;
            }
            int rotation2 = (CameraSource.this.mCameraInfo.orientation + rotation) % InstreamAd.DEFAULT_VIDEO_QUALITY;
            if (CameraSource.this.mObserver != null && data != null && data.length == CameraSource.this.mBufferSize) {
                CameraSource.this.mObserver.onFrameCaptured(camera, data, CameraSource.this.mSize.getWidth(), CameraSource.this.mSize.getHeight(), rotation2);
            }
            CameraSource.this.mCamera.addCallbackBuffer(data);
        }
    }
}
