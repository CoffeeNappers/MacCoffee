package com.wmspanel.libstream;

import android.annotation.TargetApi;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.util.Log;
import android.view.Surface;
import com.wmspanel.libstream.Streamer;
import com.wmspanel.libstream.StreamerGL;
import com.wmspanel.libstream.VideoListener;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
@TargetApi(18)
/* loaded from: classes3.dex */
public class StreamerGLBuilder extends StreamerCameraBuilderBase {
    private static final String TAG = "BuilderGL";
    private Surface mSurface;
    private Streamer.Size mSurfaceSize;
    private int mVideoOrientation = StreamerGL.ORIENTATIONS.LANDSCAPE;
    private List<VideoListener.FlipCameraInfo> mFlipCameraInfo = new ArrayList();

    public void addCamera(CameraConfig cameraConfig) {
        boolean z;
        if (this.mVideoConfig == null || this.mVideoConfig.videoSize == null) {
            throw new IllegalStateException(Messages.err_set_video_size_first);
        }
        if (cameraConfig == null || cameraConfig.cameraId == null || cameraConfig.videoSize == null) {
            Log.e(TAG, Messages.err_param_is_null);
            return;
        }
        VideoListener.FlipCameraInfo flipCameraInfo = new VideoListener.FlipCameraInfo();
        flipCameraInfo.cameraId = cameraConfig.cameraId;
        flipCameraInfo.videoSize = cameraConfig.videoSize;
        flipCameraInfo.fpsRange = cameraConfig.fpsRange;
        VideoLetterboxCalc.calculateLetterboxing(flipCameraInfo, this.mVideoConfig.videoSize);
        boolean z2 = false;
        Iterator<VideoListener.FlipCameraInfo> it = this.mFlipCameraInfo.iterator();
        while (true) {
            z = z2;
            if (!it.hasNext()) {
                break;
            }
            z2 = it.next().cameraId.equals(flipCameraInfo.cameraId) ? true : z;
        }
        if (!z) {
            this.mFlipCameraInfo.add(flipCameraInfo);
        } else {
            Log.w(TAG, "Camera already added: " + flipCameraInfo.cameraId);
        }
        if (this.mFlipCameraInfo.size() > 2) {
            Log.w(TAG, "More than 2 cameras: " + Integer.toString(this.mFlipCameraInfo.size()));
        }
    }

    public void setSurface(@NonNull Surface surface) {
        this.mSurface = surface;
    }

    public void setSurfaceSize(@NonNull Streamer.Size size) {
        this.mSurfaceSize = size;
    }

    public void setVideoOrientation(int orientation) {
        this.mVideoOrientation = orientation;
    }

    @Override // com.wmspanel.libstream.StreamerBuilder
    @Nullable
    /* renamed from: build  reason: collision with other method in class */
    public StreamerGL mo1150build() {
        return build(Streamer.MODE.AUDIO_VIDEO);
    }

    @Nullable
    public StreamerGL build(Streamer.MODE mode) {
        boolean z;
        AudioEncoder audioEncoder;
        VideoEncoder videoEncoder;
        boolean z2;
        boolean z3 = false;
        if (!verify()) {
            return null;
        }
        if (mode != Streamer.MODE.VIDEO_ONLY) {
            AudioEncoder createAudioEncoder = createAudioEncoder();
            if (createAudioEncoder == null || createAudioEncoder.getEncoder() == null) {
                Log.e(TAG, Messages.err_build_audio_enc);
                audioEncoder = createAudioEncoder;
                z = false;
            } else {
                audioEncoder = createAudioEncoder;
                z = true;
            }
        } else {
            z = true;
            audioEncoder = null;
        }
        if (mode != Streamer.MODE.AUDIO_ONLY) {
            VideoEncoder createVideoEncoder = createVideoEncoder();
            if (createVideoEncoder == null || createVideoEncoder.getEncoder() == null) {
                Log.e(TAG, Messages.err_build_video_enc);
                z = false;
            }
            if (this.mSurface == null) {
                Log.e(TAG, Messages.err_build_surface_null);
                z = false;
            }
            if (this.mSurfaceSize == null) {
                Log.e(TAG, Messages.err_build_surface_size_null);
                z = false;
            }
            if (this.mCameraId == null) {
                Log.e(TAG, Messages.err_build_camera_id_null);
                z = false;
            }
            if (this.mFlipCameraInfo.isEmpty()) {
                Log.e(TAG, Messages.err_build_no_camera_info);
                z2 = false;
            } else {
                z2 = z;
            }
            boolean z4 = false;
            for (VideoListener.FlipCameraInfo flipCameraInfo : this.mFlipCameraInfo) {
                z4 = flipCameraInfo.cameraId.equals(this.mCameraId) ? true : z4;
            }
            if (!z4) {
                Log.e(TAG, "Build failed: add at least one camera, CameraId: " + this.mCameraId);
                z2 = false;
            }
            if (this.mFocusMode == null) {
                Log.e(TAG, Messages.err_build_focus_mode_null);
                videoEncoder = createVideoEncoder;
            } else {
                z3 = z2;
                videoEncoder = createVideoEncoder;
            }
        } else {
            z3 = z;
            videoEncoder = null;
        }
        if (z3) {
            StreamerGL streamerGL = new StreamerGL(this.mCameraApi, this.mMaxBufferItems);
            streamerGL.setContext(this.mContext);
            streamerGL.setListener(this.mListener);
            streamerGL.setVideoEncoder(videoEncoder);
            streamerGL.setAudioEncoder(audioEncoder);
            streamerGL.setUserAgent(this.mUserAgent);
            streamerGL.setSurface(this.mSurface);
            streamerGL.setSurfaceSize(this.mSurfaceSize);
            streamerGL.setDisplayRotation(this.mDisplayRotation);
            streamerGL.setVideoOrientation(this.mVideoOrientation);
            streamerGL.setCameraId(this.mCameraId);
            streamerGL.setFlipCameraInfo(this.mFlipCameraInfo);
            streamerGL.setFocusMode(this.mFocusMode);
            setEncodingSetup(streamerGL);
            return streamerGL;
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
}
