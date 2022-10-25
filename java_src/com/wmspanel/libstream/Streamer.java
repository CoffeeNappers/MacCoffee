package com.wmspanel.libstream;

import android.annotation.TargetApi;
import android.content.Context;
import android.hardware.Camera;
import android.os.Build;
import android.os.Handler;
import android.support.annotation.NonNull;
import android.util.Log;
import com.facebook.imagepipeline.common.RotationOptions;
import com.wmspanel.libstream.StreamBuffer;
import java.io.File;
import java.util.Arrays;
/* loaded from: classes3.dex */
public abstract class Streamer {
    public static final int MAX_BUFFER_ITEMS = 200;
    private static final String TAG = "Streamer";
    public static final String VERSION_NAME = "1.0.28";
    private d dy;
    private StreamRecorder dz;
    AudioConfig mAudioConfig;
    protected AudioEncoder mAudioEncoder;
    protected AudioListener mAudioListener;
    protected Context mContext;
    protected Listener mListener;
    protected StreamBuffer mStreamBuffer;
    VideoConfig mVideoConfig;
    protected VideoEncoder mVideoEncoder;
    protected VideoListener mVideoListener;
    protected FocusMode mFocusMode = new FocusMode();
    protected CAMERA_API mCameraApi = CAMERA_API.CAMERA;

    /* loaded from: classes3.dex */
    public enum AUTH {
        DEFAULT,
        LLNW
    }

    /* loaded from: classes3.dex */
    public enum CAMERA_API {
        CAMERA,
        CAMERA2
    }

    /* loaded from: classes3.dex */
    public enum CAPTURE_STATE {
        STARTED,
        STOPPED,
        ENCODER_FAIL,
        FAILED
    }

    /* loaded from: classes3.dex */
    public enum CONNECTION_STATE {
        INITIALIZED,
        CONNECTED,
        SETUP,
        RECORD,
        DISCONNECTED
    }

    /* loaded from: classes3.dex */
    public interface Listener {
        Handler getHandler();

        void onAudioCaptureStateChanged(CAPTURE_STATE capture_state);

        void onConnectionStateChanged(int i, CONNECTION_STATE connection_state, STATUS status);

        void onRecordStateChanged(RECORD_STATE record_state);

        void onVideoCaptureStateChanged(CAPTURE_STATE capture_state);
    }

    /* loaded from: classes3.dex */
    public enum MODE {
        AUDIO_VIDEO,
        VIDEO_ONLY,
        AUDIO_ONLY
    }

    /* loaded from: classes3.dex */
    public enum RECORD_STATE {
        INITIALIZED,
        STARTED,
        STOPPED,
        FAILED
    }

    /* loaded from: classes3.dex */
    public enum STATUS {
        SUCCESS,
        CONN_FAIL,
        AUTH_FAIL,
        UNKNOWN_FAIL
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes3.dex */
    public static class a {
        AUTH dB = AUTH.DEFAULT;
        String password;
        String username;
        String v;
    }

    public abstract void startVideoCapture();

    /* loaded from: classes3.dex */
    public static class Size {
        public int height;
        public int width;

        public Size(int width, int height) {
            this.width = width;
            this.height = height;
        }

        public double getRatio() {
            return this.width / this.height;
        }

        public double getVerticalRatio() {
            return this.height / this.width;
        }
    }

    /* loaded from: classes3.dex */
    public static class FpsRange {
        public float fpsMax;
        public float fpsMin;

        public FpsRange(float min, float max) {
            this.fpsMin = min;
            this.fpsMax = max;
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void init(int items) {
        this.mStreamBuffer = new StreamBuffer(items, items / 2);
        this.dy = new d(this.mStreamBuffer);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void init(CAMERA_API api, int items) {
        if (Build.VERSION.SDK_INT < 21 && api == CAMERA_API.CAMERA2) {
            throw new IllegalArgumentException("Need at least Android 5.0 to use Camera2");
        }
        this.mCameraApi = api;
        init(items);
    }

    public void release() {
        if (this.mStreamBuffer == null) {
            Log.w(TAG, Messages.err_double_release);
            return;
        }
        if (this.dy != null) {
            this.dy.release();
            this.dy = null;
        }
        stopRecord();
        stopVideoCapture();
        stopAudioCapture();
        this.mStreamBuffer = null;
    }

    public void startAudioCapture() {
        if (this.mStreamBuffer == null) {
            throw new IllegalStateException(Messages.err_after_release);
        }
        if (this.mAudioEncoder == null) {
            AudioEncoderBuilder audioEncoderBuilder = new AudioEncoderBuilder();
            audioEncoderBuilder.setConfig(this.mAudioConfig);
            this.mAudioEncoder = audioEncoderBuilder.build();
            if (this.mAudioEncoder == null) {
                throw new IllegalStateException(Messages.err_no_audio_encoder);
            }
        }
        if (this.mAudioListener == null) {
            Log.d(TAG, "startAudioCapture, source is: " + Integer.toString(this.mAudioConfig.audioSource));
            this.mAudioListener = new AudioListener(this.mStreamBuffer, this.mAudioConfig.audioSource, this.mAudioEncoder, this.mListener);
            this.mAudioListener.start();
        }
    }

    /* JADX WARN: Type inference failed for: r2v0, types: [com.wmspanel.libstream.AudioListener, com.wmspanel.libstream.AudioEncoder] */
    public void stopAudioCapture() {
        if (this.mStreamBuffer == null) {
            throw new IllegalStateException(Messages.err_after_release);
        }
        Log.d(TAG, "stopAudioCapture");
        if (this.mAudioListener != null) {
            try {
                this.mAudioListener.interrupt();
                this.mAudioListener.join();
            } catch (InterruptedException e) {
                Thread.currentThread().interrupt();
            } finally {
                this.mAudioListener = null;
                this.mAudioEncoder = null;
            }
        }
        if (this.mAudioEncoder != null) {
            this.mAudioEncoder.release();
            this.mAudioEncoder = null;
        }
    }

    public void stopVideoCapture() {
        if (this.mStreamBuffer == null) {
            throw new IllegalStateException(Messages.err_after_release);
        }
        Log.d(TAG, "stopVideoCapture");
        if (this.mVideoListener != null) {
            this.mVideoListener.release();
            this.mVideoListener = null;
            this.mVideoEncoder = null;
        }
        if (this.mVideoEncoder != null) {
            this.mVideoEncoder.release();
            this.mVideoEncoder = null;
        }
    }

    public int createConnection(ConnectionConfig config) {
        if (this.dy == null) {
            throw new IllegalStateException(Messages.err_after_release);
        }
        if (config == null || config.uri == null || config.mode == null || config.auth == null) {
            Log.e(TAG, Messages.err_param_is_null);
            return -1;
        }
        return this.dy.a(config, this.mListener);
    }

    public long getBytesSent(int connectionId) {
        if (this.dy == null) {
            throw new IllegalStateException(Messages.err_after_release);
        }
        return this.dy.getBytesSent(connectionId);
    }

    public long getBytesRecv(int connectionId) {
        if (this.dy == null) {
            throw new IllegalStateException(Messages.err_after_release);
        }
        return this.dy.getBytesRecv(connectionId);
    }

    public long getAudioPacketsSent(int connectionId) {
        if (this.dy == null) {
            throw new IllegalStateException(Messages.err_after_release);
        }
        return this.dy.getAudioPacketsSent(connectionId);
    }

    public long getAudioPacketsLost(int connectionId) {
        if (this.dy == null) {
            throw new IllegalStateException(Messages.err_after_release);
        }
        return this.dy.getAudioPacketsLost(connectionId);
    }

    public long getVideoPacketsSent(int connectionId) {
        if (this.dy == null) {
            throw new IllegalStateException(Messages.err_after_release);
        }
        return this.dy.getVideoPacketsSent(connectionId);
    }

    public long getVideoPacketsLost(int connectionId) {
        if (this.dy == null) {
            throw new IllegalStateException(Messages.err_after_release);
        }
        return this.dy.getVideoPacketsLost(connectionId);
    }

    public void releaseConnection(int connectionId) {
        if (this.dy == null) {
            throw new IllegalStateException(Messages.err_after_release);
        }
        this.dy.releaseConnection(connectionId);
    }

    public void setUserAgent(@NonNull String userAgent) {
        if (this.dy == null) {
            throw new IllegalStateException(Messages.err_after_release);
        }
        if (userAgent != null) {
            this.dy.setUserAgent(userAgent);
        }
    }

    public void getUserAgent() {
        if (this.dy == null) {
            throw new IllegalStateException(Messages.err_after_release);
        }
        this.dy.z();
    }

    public byte[] getProfileLevelId() {
        if (this.mStreamBuffer == null) {
            throw new IllegalStateException(Messages.err_after_release);
        }
        StreamBuffer.VideoFormatParams ac = this.mStreamBuffer.ac();
        if (ac != null && ac.sps_buf != null && ac.sps_buf.length > 3) {
            return Arrays.copyOfRange(ac.sps_buf, 1, 4);
        }
        return null;
    }

    public double getFps() {
        if (this.mStreamBuffer == null) {
            throw new IllegalStateException(Messages.err_after_release);
        }
        return this.mStreamBuffer.getFps();
    }

    public CAMERA_API getCameraApi() {
        if (this.mStreamBuffer == null) {
            throw new IllegalStateException(Messages.err_after_release);
        }
        return this.mCameraApi;
    }

    public void setCameraParameters(@NonNull Camera.Parameters param) {
        if (this.mStreamBuffer == null) {
            throw new IllegalStateException(Messages.err_after_release);
        }
        if (this.mCameraApi != CAMERA_API.CAMERA) {
            throw new UnsupportedOperationException(Messages.err_need_camera1);
        }
        if (this.mVideoListener == null) {
            Log.w(TAG, Messages.err_video_capture_not_started);
        } else if (param != null) {
            this.mVideoListener.setCameraParameters(param);
        }
    }

    public Camera.Parameters getCameraParameters() {
        if (this.mStreamBuffer == null) {
            throw new IllegalStateException(Messages.err_after_release);
        }
        if (this.mCameraApi != CAMERA_API.CAMERA) {
            throw new UnsupportedOperationException(Messages.err_need_camera1);
        }
        if (this.mVideoListener != null) {
            return this.mVideoListener.getCameraParameters();
        }
        Log.w(TAG, Messages.err_video_capture_not_started);
        return null;
    }

    public void toggleTorch() {
        if (this.mStreamBuffer == null) {
            throw new IllegalStateException(Messages.err_after_release);
        }
        if (this.mVideoListener == null) {
            Log.w(TAG, Messages.err_video_capture_not_started);
        } else {
            this.mVideoListener.toggleTorch();
        }
    }

    public void flip() {
        if (this.mStreamBuffer == null) {
            throw new IllegalStateException(Messages.err_after_release);
        }
        Log.d(TAG, "flip Camera");
        if (this.mVideoListener == null) {
            Log.w(TAG, Messages.err_video_capture_not_started);
        } else {
            this.mVideoListener.flip();
        }
    }

    @TargetApi(18)
    public void startRecord(@NonNull File file) {
        if (Build.VERSION.SDK_INT >= 18) {
            if (this.mStreamBuffer == null) {
                throw new IllegalStateException(Messages.err_after_release);
            }
            if (file == null) {
                throw new IllegalArgumentException(Messages.err_param_is_null);
            }
            if (this.mVideoListener == null && this.mAudioListener == null) {
                throw new IllegalStateException("start audio or video capture first");
            }
            Log.d(TAG, "startRecord");
            MODE mode = MODE.AUDIO_VIDEO;
            if (this.mVideoListener == null) {
                mode = MODE.AUDIO_ONLY;
            } else if (this.mAudioListener == null) {
                mode = MODE.VIDEO_ONLY;
            }
            this.dz = new StreamRecorder(this.mStreamBuffer, this.mListener, file, mode);
            if (!this.dz.start()) {
                this.dz = null;
                return;
            }
            if (mode == MODE.AUDIO_VIDEO || mode == MODE.VIDEO_ONLY) {
                Log.d(TAG, "start mp4 video record");
                this.mVideoListener.startRecord(this.dz);
            }
            if (mode == MODE.AUDIO_VIDEO || mode == MODE.AUDIO_ONLY) {
                Log.d(TAG, "start mp4 audio record");
                this.mAudioListener.startRecord(this.dz);
            }
        }
    }

    @TargetApi(18)
    public void stopRecord() {
        if (Build.VERSION.SDK_INT >= 18) {
            if (this.mStreamBuffer == null) {
                throw new IllegalStateException(Messages.err_after_release);
            }
            Log.d(TAG, "stopRecord");
            if (this.mVideoListener != null) {
                this.mVideoListener.stopRecord();
            }
            if (this.mAudioListener != null) {
                this.mAudioListener.stopRecord();
            }
            if (this.dz != null) {
                this.dz.stop();
                this.dz = null;
            }
        }
    }

    public static int rotationToDegrees(int rotation) {
        switch (rotation) {
            case 0:
            default:
                return 0;
            case 1:
                return 90;
            case 2:
                return RotationOptions.ROTATE_180;
            case 3:
                return RotationOptions.ROTATE_270;
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void setContext(@NonNull Context context) {
        this.mContext = context;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void setListener(Listener listener) {
        this.mListener = listener;
        this.dy.setListener(listener);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void setVideoEncoder(@NonNull VideoEncoder videoEncoder) {
        this.mVideoEncoder = videoEncoder;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void setAudioEncoder(@NonNull AudioEncoder audioEncoder) {
        this.mAudioEncoder = audioEncoder;
    }

    @TargetApi(19)
    public void changeBitRate(int bitRate) {
        if (this.mStreamBuffer == null) {
            throw new IllegalStateException(Messages.err_after_release);
        }
        if (this.mVideoEncoder != null) {
            this.mVideoEncoder.changeBitRate(bitRate);
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void setFocusMode(@NonNull FocusMode mode) {
        this.mFocusMode = mode;
    }

    public void focus(FocusMode mode) {
        if (this.mStreamBuffer == null) {
            throw new IllegalStateException(Messages.err_after_release);
        }
        if (this.mVideoListener == null) {
            Log.w(TAG, Messages.err_video_capture_not_started);
        } else if (mode != null) {
            this.mVideoListener.setFocusMode(mode);
            this.mVideoListener.focus();
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void setAudioConfig(AudioConfig config) {
        this.mAudioConfig = config;
    }

    public void changeAudioConfig(AudioConfig audioConfig) {
        if (this.mAudioListener != null) {
            throw new IllegalStateException(Messages.err_audio_capture_running);
        }
        if (audioConfig == null) {
            throw new IllegalArgumentException(Messages.err_param_is_null);
        }
        if (!this.dy.y()) {
            Log.w(TAG, Messages.err_connection_running);
        }
        setAudioConfig(audioConfig);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void setVideoConfig(VideoConfig config) {
        this.mVideoConfig = config;
    }

    public void changeVideoConfig(VideoConfig videoConfig) {
        if (this.mVideoListener != null) {
            throw new IllegalStateException(Messages.err_video_capture_running);
        }
        if (videoConfig == null || videoConfig.videoSize == null) {
            throw new IllegalArgumentException(Messages.err_param_is_null);
        }
        if (!this.dy.y()) {
            Log.w(TAG, Messages.err_connection_running);
        }
        setVideoConfig(videoConfig);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public VideoEncoder createVideoEncoder() {
        VideoEncoderBuilder videoEncoderBuilder = new VideoEncoderBuilder();
        videoEncoderBuilder.setConfig(this.mVideoConfig);
        return videoEncoderBuilder.build();
    }
}
