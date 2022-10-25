package com.wmspanel.libstream;

import android.graphics.SurfaceTexture;
import android.support.annotation.NonNull;
import android.util.Log;
import android.view.SurfaceHolder;
import com.wmspanel.libstream.Streamer;
/* loaded from: classes3.dex */
public class StreamerCamera extends Streamer {
    private static final String TAG = "StreamerCamera";
    private SurfaceHolder dI;
    private SurfaceTexture dJ;
    private String mCameraId;
    protected int mDisplayOrientation;

    public StreamerCamera(Streamer.CAMERA_API api, int items) {
        init(api, items);
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
            if (this.dI != null) {
                if (this.mCameraApi == Streamer.CAMERA_API.CAMERA) {
                    this.mVideoListener = new VideoListener16(this.mStreamBuffer, this.mListener);
                    this.mVideoListener.setDisplayOrientation(this.mDisplayOrientation);
                } else {
                    Log.w(TAG, "SurfaceHolder is not recommended for Camera2, use SurfaceTexture instead");
                    this.mVideoListener = new VideoListener21(this.mStreamBuffer, this.mListener);
                }
                this.mVideoListener.setFocusMode(this.mFocusMode);
                this.mVideoListener.start(this.mContext, this.mCameraId, this.dI, null, this.mVideoEncoder);
            } else if (this.dJ != null) {
                if (this.mCameraApi == Streamer.CAMERA_API.CAMERA2) {
                    this.mVideoListener = new VideoListener21(this.mStreamBuffer, this.mListener);
                    this.mVideoListener.start(this.mContext, this.mCameraId, null, this.dJ, this.mVideoEncoder);
                    return;
                }
                throw new IllegalStateException("Use SurfaceHolder for Camera preview display");
            } else {
                throw new IllegalStateException("Set SurfaceHolder or SurfaceTexture to start video capture");
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void setCameraId(@NonNull String id) {
        this.mCameraId = id;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void setSurfaceHolder(@NonNull SurfaceHolder holder) {
        this.dI = holder;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void setDisplayRotation(int rotation) {
        this.mDisplayOrientation = rotationToDegrees(rotation);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void setSurfaceTexture(@NonNull SurfaceTexture texture) {
        this.dJ = texture;
    }
}
