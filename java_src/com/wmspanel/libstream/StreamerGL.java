package com.wmspanel.libstream;

import android.annotation.TargetApi;
import android.graphics.Bitmap;
import android.hardware.camera2.CaptureRequest;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.util.Log;
import android.view.Surface;
import com.wmspanel.libstream.SnapshotWriter;
import com.wmspanel.libstream.Streamer;
import com.wmspanel.libstream.VideoListener;
import java.io.File;
import java.util.List;
@TargetApi(18)
/* loaded from: classes3.dex */
public class StreamerGL extends Streamer {
    private static final String TAG = "StreamerGL";
    protected String mCameraId;
    protected int mDisplayOrientation;
    protected List<VideoListener.FlipCameraInfo> mFlipCameraInfo;
    protected Surface mSurface;
    protected Streamer.Size mSurfaceSize;
    protected int mVideoOrientation;

    /* loaded from: classes3.dex */
    public static class ORIENTATIONS {
        public static int LANDSCAPE = 0;
        public static int PORTRAIT = 1;
        public static int HORIZON = 2;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public StreamerGL(Streamer.CAMERA_API api, int items) {
        init(api, items);
    }

    public void setSurfaceSize(@NonNull Streamer.Size size) {
        if (size != null) {
            this.mSurfaceSize = size;
            if (this.mVideoListener != null) {
                this.mVideoListener.setSurfaceSize(this.mSurfaceSize);
            }
        }
    }

    public void setDisplayRotation(int rotation) {
        this.mDisplayOrientation = rotationToDegrees(rotation);
        if (this.mVideoListener != null) {
            Log.d(TAG, "display rotation is " + Integer.toString(this.mDisplayOrientation) + " degrees");
            this.mVideoListener.setDisplayOrientation(this.mDisplayOrientation);
        }
    }

    public void setVideoOrientation(int o) {
        this.mVideoOrientation = o;
        if (this.mVideoListener != null) {
            Log.d(TAG, "video rotation is " + Integer.toString(this.mVideoOrientation));
            this.mVideoListener.setVideoOrientation(this.mVideoOrientation);
        }
    }

    @Override // com.wmspanel.libstream.Streamer
    public void startVideoCapture() {
        Log.d(TAG, "startVideoCapture");
        if (this.mVideoListener == null) {
            if (this.mStreamBuffer == null) {
                throw new IllegalStateException(Messages.err_after_release);
            }
            if (this.mVideoEncoder == null) {
                this.mVideoEncoder = createVideoEncoder();
                if (this.mVideoEncoder == null) {
                    throw new RuntimeException(Messages.err_no_video_encoder);
                }
            }
            if (this.mCameraApi == Streamer.CAMERA_API.CAMERA) {
                this.mVideoListener = new VideoListenerGLES16(this.mStreamBuffer, this.mListener);
            } else {
                this.mVideoListener = new VideoListenerGLES21(this.mStreamBuffer, this.mListener);
            }
            this.mVideoListener.setFocusMode(this.mFocusMode);
            this.mVideoListener.setSurface(this.mSurface);
            this.mVideoListener.setSurfaceSize(this.mSurfaceSize);
            this.mVideoListener.setDisplayOrientation(this.mDisplayOrientation);
            this.mVideoListener.setVideoOrientation(this.mVideoOrientation);
            this.mVideoListener.setFlipCameraInfo(this.mFlipCameraInfo);
            this.mVideoListener.start(this.mContext, this.mCameraId, null, null, this.mVideoEncoder);
        }
    }

    @Nullable
    public Streamer.Size getActiveCameraVideoSize() {
        if (this.mVideoListener != null) {
            for (VideoListener.FlipCameraInfo flipCameraInfo : this.mFlipCameraInfo) {
                if (flipCameraInfo.cameraId.equals(this.mVideoListener.getCameraId())) {
                    return flipCameraInfo.videoSize;
                }
            }
        }
        return null;
    }

    @Nullable
    public String getActiveCameraId() {
        if (this.mVideoListener != null) {
            return this.mVideoListener.getCameraId();
        }
        return null;
    }

    @Override // com.wmspanel.libstream.Streamer
    public void flip() {
        super.flip();
        if (this.mVideoListener != null) {
            this.mCameraId = this.mVideoListener.getCameraId();
        }
    }

    public void takeSnapshot(@NonNull File file, Bitmap.CompressFormat format, int quality) {
        if (file == null) {
            throw new IllegalArgumentException(Messages.err_param_is_null);
        }
        SnapshotWriter.setCompressFormat(format);
        SnapshotWriter.setQuality(quality);
        if (this.mVideoListener != null) {
            this.mVideoListener.takeSnapshot(file);
        }
    }

    public void takeSnapshot(@NonNull SnapshotWriter.SnapshotCallback callback) {
        if (callback == null) {
            throw new IllegalArgumentException(Messages.err_param_is_null);
        }
        if (this.mVideoListener != null) {
            this.mVideoListener.takeSnapshot(callback);
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void setFlipCameraInfo(@NonNull List<VideoListener.FlipCameraInfo> info) {
        this.mFlipCameraInfo = info;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void setCameraId(@NonNull String id) {
        this.mCameraId = id;
    }

    public void setSurface(@NonNull Surface s) {
        this.mSurface = s;
    }

    @Override // com.wmspanel.libstream.Streamer
    public void changeVideoConfig(VideoConfig videoConfig) {
        super.changeVideoConfig(videoConfig);
        for (VideoListener.FlipCameraInfo flipCameraInfo : this.mFlipCameraInfo) {
            VideoLetterboxCalc.calculateLetterboxing(flipCameraInfo, this.mVideoConfig.videoSize);
        }
    }

    public void changeCameraConfig(CameraConfig cameraConfig) {
        if (this.mVideoListener != null) {
            throw new IllegalStateException(Messages.err_video_capture_running);
        }
        if (cameraConfig == null) {
            throw new IllegalArgumentException(Messages.err_param_is_null);
        }
        for (VideoListener.FlipCameraInfo flipCameraInfo : this.mFlipCameraInfo) {
            if (flipCameraInfo.cameraId.equals(cameraConfig.cameraId)) {
                flipCameraInfo.videoSize = cameraConfig.videoSize;
                flipCameraInfo.fpsRange = cameraConfig.fpsRange;
                VideoLetterboxCalc.calculateLetterboxing(flipCameraInfo, this.mVideoConfig.videoSize);
            }
        }
    }

    @TargetApi(21)
    public CaptureRequest.Builder createCaptureRequest() {
        if (this.mVideoListener != null) {
            return this.mVideoListener.createCaptureRequest();
        }
        return null;
    }

    @TargetApi(21)
    public void setRepeatingRequest(CaptureRequest.Builder builder) {
        if (this.mVideoListener != null) {
            this.mVideoListener.setRepeatingRequest(builder);
        }
    }
}
