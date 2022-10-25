package com.wmspanel.libstream;

import android.annotation.TargetApi;
import android.content.Context;
import android.graphics.SurfaceTexture;
import android.media.MediaCodec;
import android.os.Build;
import android.util.Log;
import android.view.Surface;
import android.view.SurfaceHolder;
import com.wmspanel.libstream.Streamer;
@TargetApi(18)
/* loaded from: classes3.dex */
class VideoListenerSurface extends VideoListener16Base {
    private static final String TAG = "VideoListenerSurface";
    private Surface mRecordingSurface;

    public VideoListenerSurface(StreamBuffer streamBuffer, Streamer.Listener listener) {
        super(streamBuffer, listener);
    }

    public void start(VideoEncoder videoEncoder) {
        if (videoEncoder == null || videoEncoder.getEncoder() == null) {
            throw new IllegalArgumentException();
        }
        try {
            if (Build.VERSION.SDK_INT < 21) {
                this.mBufferInfo = new MediaCodec.BufferInfo();
            }
            this.mEncoder = videoEncoder;
            openEncoder();
        } catch (Exception e) {
            Log.e(TAG, Log.getStackTraceString(e));
            setVideoCaptureState(e instanceof MediaCodec.CodecException ? Streamer.CAPTURE_STATE.ENCODER_FAIL : Streamer.CAPTURE_STATE.FAILED);
            release();
        }
    }

    public void openEncoder() {
        this.mEncoder.getFormat().setInteger("color-format", 2130708361);
        if (Build.VERSION.SDK_INT >= 21) {
            this.mEncoder.getEncoder().setCallback(this.mMediaCodecCallback);
        }
        this.mEncoder.configure();
        this.mRecordingSurface = this.mEncoder.getEncoder().createInputSurface();
        this.mEncoder.start();
    }

    @Override // com.wmspanel.libstream.VideoListener
    public void release() {
        Log.d(TAG, "release");
        try {
            resetMediaFormat();
            releaseEncoder();
            if (this.mRecordingSurface != null) {
                this.mRecordingSurface.release();
                this.mRecordingSurface = null;
            }
        } catch (Exception e) {
            Log.e(TAG, Log.getStackTraceString(e));
        } finally {
            setVideoCaptureState(Streamer.CAPTURE_STATE.STOPPED);
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public Surface getEncoderSurface() {
        return this.mRecordingSurface;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void drainEncoder() {
        if (Build.VERSION.SDK_INT < 21) {
            getVideoFrame();
        }
    }

    @Override // com.wmspanel.libstream.VideoListener
    public void start(Context context, String cameraIdStr, SurfaceHolder previewSurfaceHolder, SurfaceTexture texture, VideoEncoder encoder) {
        throw new IllegalStateException();
    }
}
