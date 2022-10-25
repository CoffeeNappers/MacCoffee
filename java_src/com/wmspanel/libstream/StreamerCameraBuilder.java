package com.wmspanel.libstream;

import android.graphics.SurfaceTexture;
import android.support.annotation.Nullable;
import android.util.Log;
import android.view.SurfaceHolder;
import com.wmspanel.libstream.Streamer;
/* loaded from: classes3.dex */
public class StreamerCameraBuilder extends StreamerCameraBuilderBase {
    private static final String TAG = "BuilderCamera";
    private SurfaceHolder dI;
    private SurfaceTexture dJ;

    @Override // com.wmspanel.libstream.StreamerBuilder
    @Nullable
    /* renamed from: build  reason: collision with other method in class */
    public StreamerCamera mo1150build() {
        return build(Streamer.MODE.AUDIO_VIDEO);
    }

    @Nullable
    public StreamerCamera build(Streamer.MODE mode) {
        AudioEncoder audioEncoder;
        VideoEncoder videoEncoder;
        boolean z = true;
        if (!verify()) {
            return null;
        }
        if (mode != Streamer.MODE.VIDEO_ONLY) {
            audioEncoder = createAudioEncoder();
            if (audioEncoder == null || audioEncoder.getEncoder() == null) {
                Log.e(TAG, Messages.err_build_audio_enc);
                z = false;
            }
        } else {
            audioEncoder = null;
        }
        if (mode != Streamer.MODE.AUDIO_ONLY) {
            VideoEncoder createVideoEncoder = createVideoEncoder();
            if (createVideoEncoder == null || createVideoEncoder.getEncoder() == null) {
                Log.e(TAG, Messages.err_build_video_enc);
                z = false;
            }
            if (this.dI == null && this.dJ == null) {
                Log.e(TAG, Messages.err_build_surface_null);
                z = false;
            }
            if (this.mCameraApi == Streamer.CAMERA_API.CAMERA2 && this.dI != null) {
                Log.w(TAG, "SurfaceHolder is not recommended for Camera2, use SurfaceTexture instead");
            }
            if (this.mCameraApi == Streamer.CAMERA_API.CAMERA && this.dJ != null) {
                Log.e(TAG, "Use SurfaceHolder for Camera preview display");
                z = false;
            }
            if (this.mCameraId == null) {
                Log.e(TAG, Messages.err_build_camera_id_null);
                z = false;
            }
            if (this.mFocusMode == null) {
                Log.e(TAG, Messages.err_build_focus_mode_null);
                z = false;
                videoEncoder = createVideoEncoder;
            } else {
                videoEncoder = createVideoEncoder;
            }
        } else {
            videoEncoder = null;
        }
        if (z) {
            StreamerCamera streamerCamera = new StreamerCamera(this.mCameraApi, this.mMaxBufferItems);
            streamerCamera.setContext(this.mContext);
            streamerCamera.setListener(this.mListener);
            streamerCamera.setVideoEncoder(videoEncoder);
            streamerCamera.setAudioEncoder(audioEncoder);
            streamerCamera.setUserAgent(this.mUserAgent);
            streamerCamera.setSurfaceHolder(this.dI);
            streamerCamera.setDisplayRotation(this.mDisplayRotation);
            streamerCamera.setCameraId(this.mCameraId);
            streamerCamera.setFocusMode(this.mFocusMode);
            streamerCamera.setSurfaceTexture(this.dJ);
            setEncodingSetup(streamerCamera);
            return streamerCamera;
        }
        if (audioEncoder != null) {
            audioEncoder.release();
        }
        if (videoEncoder == null) {
            return null;
        }
        videoEncoder.release();
        return null;
    }

    public void setSurfaceHolder(SurfaceHolder holder) {
        this.dI = holder;
    }

    public void setSurfaceTexture(SurfaceTexture texture) {
        this.dJ = texture;
    }
}
