package com.vk.media.camera;

import android.content.Context;
import android.media.CamcorderProfile;
import android.media.MediaRecorder;
import android.opengl.GLES20;
import android.os.Build;
import android.util.Log;
import android.view.Surface;
import com.google.android.exoplayer2.C;
import com.vk.analytics.Analytics;
import com.vk.analytics.AnalyticsEvent;
import com.vk.media.camera.CameraUtils;
import com.vk.media.streamer.StreamRecorder;
import com.vk.media.utils.grafika.EglCore;
import com.vk.media.utils.grafika.WindowSurface;
import java.io.File;
/* loaded from: classes2.dex */
public abstract class CameraRecorder implements CameraUtils.Recorder, MediaRecorder.OnErrorListener, MediaRecorder.OnInfoListener {
    protected static final String TAG = CameraRecorder.class.getSimpleName();
    protected Context mContext;
    private WindowSurface mEncoderSurface;
    protected File mFile;
    protected MediaRecorder.OnErrorListener mOnErrorListener;
    protected MediaRecorder.OnInfoListener mOnInfoListener;
    protected CamcorderProfile mProfile;
    private CameraUtils.Recorder.OnRecordFrame mRecordFrameCallback;
    protected boolean mRecording = false;
    protected State mState = State.IDLE;
    protected int mOrientationHint = 0;
    protected int mMaxRecordingLengthMs = Integer.MAX_VALUE;
    protected Surface mSurface = null;
    protected long mStartPresentationTime = -1;
    protected long mLastPresentationTime = -1;
    private boolean mUseMediaRecorder = true;

    /* loaded from: classes2.dex */
    public enum State {
        IDLE,
        PREPARING,
        PREPARED,
        RECORDING
    }

    public boolean useExternalRecorder() {
        return !this.mUseMediaRecorder;
    }

    public static CameraRecorder create(Context context, CameraUtils.Recorder.OnRecordFrame callback, boolean useMediaRecorder) {
        CameraRecorder recorder;
        if (Build.VERSION.SDK_INT < 21 || !useMediaRecorder) {
            recorder = new StreamRecorder(context);
            recorder.mUseMediaRecorder = false;
        } else {
            recorder = new Recorder(context);
        }
        recorder.mRecordFrameCallback = callback;
        Log.d(TAG, "create recorder system: " + recorder.mUseMediaRecorder);
        return recorder;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public CameraRecorder(Context context) {
        this.mContext = context;
    }

    @Override // com.vk.media.camera.CameraUtils.Recorder
    public void setProfile(CamcorderProfile profile) {
        this.mProfile = profile;
    }

    @Override // com.vk.media.camera.CameraUtils.Recorder
    public void setOrientationHint(int orientationHint) {
        this.mOrientationHint = orientationHint;
    }

    @Override // com.vk.media.camera.CameraUtils.Recorder
    public void setMaxDuration(int maxRecordingLengthMs) {
        this.mMaxRecordingLengthMs = maxRecordingLengthMs;
    }

    @Override // com.vk.media.camera.CameraUtils.Recorder
    public void setOnInfoListener(MediaRecorder.OnInfoListener listener) {
        this.mOnInfoListener = listener;
    }

    @Override // com.vk.media.camera.CameraUtils.Recorder
    public void setOnErrorListener(MediaRecorder.OnErrorListener listener) {
        this.mOnErrorListener = listener;
    }

    @Override // com.vk.media.camera.CameraUtils.Recorder
    public void stop() {
        this.mLastPresentationTime = -1L;
        this.mStartPresentationTime = -1L;
    }

    @Override // com.vk.media.camera.CameraUtils.Recorder
    public boolean isRecording() {
        return this.mRecording;
    }

    @Override // com.vk.media.camera.CameraUtils.Recorder
    public void setOutputFile(File file) {
        this.mFile = file;
    }

    @Override // com.vk.media.camera.CameraUtils.Recorder
    public void release() {
        if (this.mEncoderSurface != null) {
            this.mEncoderSurface.release();
            this.mEncoderSurface = null;
        }
    }

    @Override // android.media.MediaRecorder.OnErrorListener
    public void onError(MediaRecorder mr, int what, int extra) {
        Log.d(TAG, "onError: what=" + what + ", extra=" + extra);
        release();
        notifyError(1000, true);
    }

    @Override // android.media.MediaRecorder.OnInfoListener
    public void onInfo(MediaRecorder mr, int what, int extra) {
        Log.d(TAG, "onInfo: what=" + what + ", extra=" + extra);
        if (this.mOnInfoListener != null) {
            this.mOnInfoListener.onInfo(mr, what, extra);
        }
    }

    public void record(CameraUtils.Frame frame, EglCore core, int viewWidth, int viewHeight) {
        synchronized (this) {
            createSurface(core);
            if (this.mEncoderSurface != null && this.mRecording) {
                if (frame != null) {
                    GLES20.glViewport(0, 0, frame.getWidth(), frame.getHeight());
                } else {
                    GLES20.glViewport(0, 0, viewWidth, viewHeight);
                }
                this.mEncoderSurface.makeCurrent();
                drainEncoder();
                long timestamp = isPrepared() ? this.mRecordFrameCallback.onRecord(frame) : 0L;
                if (Build.VERSION.SDK_INT > 24) {
                    timestamp = System.nanoTime();
                }
                this.mEncoderSurface.setPresentationTime(timestamp);
                this.mEncoderSurface.swapBuffers();
            }
            setPresentationTime(System.nanoTime());
        }
    }

    public void drainEncoder() {
    }

    public boolean setPresentationTime(long timestamp) {
        this.mLastPresentationTime = timestamp;
        if (this.mMaxRecordingLengthMs != Integer.MAX_VALUE && this.mStartPresentationTime > 0) {
            long positionUs = this.mLastPresentationTime - this.mStartPresentationTime;
            long durationUs = this.mMaxRecordingLengthMs * C.MICROS_PER_SECOND;
            if (positionUs >= durationUs) {
                Log.d(TAG, "recording stop " + timestamp + " limit: " + positionUs + CameraUtilsEffects.FILE_DELIM + durationUs + "(us)");
                return false;
            }
        }
        return true;
    }

    public Surface getSurface() {
        return null;
    }

    public boolean isPrepared() {
        return this.mRecording && (this.mState == State.PREPARED || this.mState == State.RECORDING);
    }

    public void createSurface(EglCore core) {
        Surface surface;
        if (this.mEncoderSurface == null && core != null) {
            if (((this.mState == State.PREPARING && useExternalRecorder()) || this.mState == State.PREPARED) && (surface = getSurface()) != null) {
                Log.d(TAG, "create input surface " + surface);
                this.mEncoderSurface = new WindowSurface(core, surface, true);
                this.mEncoderSurface.makeCurrent();
                if (useExternalRecorder()) {
                    Log.d(TAG, "drain first video frame on external recorder!");
                    this.mEncoderSurface.setPresentationTime(0L);
                    this.mEncoderSurface.swapBuffers();
                }
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void notifyError(int error, boolean video) {
        boolean z = true;
        if (this.mOnErrorListener != null) {
            this.mOnErrorListener.onError(null, error, video ? 2 : 1);
        }
        if (error != 1001) {
            z = false;
        }
        AnalyticsEvent e = new AnalyticsEvent.MediaRecorderEvent(z, video);
        Analytics.log(e);
    }

    /* loaded from: classes2.dex */
    private static class Recorder extends CameraRecorder {
        private MediaRecorder mRecorder;

        public Recorder(Context context) {
            super(context);
        }

        @Override // com.vk.media.camera.CameraUtils.Recorder
        public boolean start() {
            if (this.mRecorder != null && this.mFile != null) {
                this.mRecording = true;
                if (this.mSurface != null && this.mState == State.PREPARED) {
                    try {
                        this.mRecorder.start();
                        this.mState = State.RECORDING;
                        Log.d(TAG, "start recording");
                    } catch (Exception e) {
                        Log.w(TAG, "start failed: " + (e != null ? e.getMessage() : ""));
                    }
                }
            }
            return true;
        }

        @Override // com.vk.media.camera.CameraUtils.Recorder
        public boolean prepare() {
            if (this.mState != State.IDLE) {
                return true;
            }
            release();
            if (this.mRecorder == null) {
                this.mRecorder = new MediaRecorder();
            }
            try {
                this.mRecorder.setAudioSource(1);
                this.mRecorder.setVideoSource(2);
                this.mRecorder.setOutputFormat(2);
                if (this.mProfile != null) {
                    this.mRecorder.setVideoEncodingBitRate(this.mProfile.videoBitRate);
                    this.mRecorder.setVideoFrameRate(this.mProfile.videoFrameRate);
                    this.mRecorder.setAudioEncodingBitRate(this.mProfile.audioBitRate);
                    this.mRecorder.setAudioSamplingRate(this.mProfile.audioSampleRate);
                    if (this.mOrientationHint == 90 || this.mOrientationHint == 270) {
                        this.mRecorder.setVideoSize(this.mProfile.videoFrameHeight, this.mProfile.videoFrameWidth);
                    } else {
                        this.mRecorder.setVideoSize(this.mProfile.videoFrameWidth, this.mProfile.videoFrameHeight);
                    }
                }
                this.mRecorder.setVideoEncoder(2);
                this.mRecorder.setAudioEncoder(3);
                if (this.mMaxRecordingLengthMs > 0) {
                    this.mRecorder.setMaxDuration(this.mMaxRecordingLengthMs);
                }
                this.mRecorder.setOnInfoListener(this);
                this.mRecorder.setOnErrorListener(this);
                this.mRecorder.setOutputFile(this.mFile.getAbsolutePath());
                Log.d(TAG, "preparing");
                this.mRecorder.prepare();
                this.mState = State.PREPARED;
                Log.d(TAG, "prepared");
                return true;
            } catch (Exception e) {
                Log.w(TAG, "prepare failed: " + (e != null ? e.getMessage() : ""));
                release();
                return false;
            }
        }

        @Override // com.vk.media.camera.CameraRecorder, com.vk.media.camera.CameraUtils.Recorder
        public void stop() {
            synchronized (this) {
                super.stop();
                if (this.mRecorder != null && this.mRecording && this.mState == State.RECORDING) {
                    this.mRecording = false;
                    try {
                        Log.d(TAG, "stop");
                        this.mRecorder.stop();
                    } catch (Exception e) {
                        Log.w(TAG, "stop failed: " + (e != null ? e.getMessage() : ""));
                    }
                    this.mRecorder.reset();
                    this.mState = State.IDLE;
                }
            }
        }

        @Override // com.vk.media.camera.CameraRecorder, com.vk.media.camera.CameraUtils.Recorder
        public void release() {
            stop();
            synchronized (this) {
                if (this.mRecorder != null) {
                    this.mRecorder.release();
                    this.mRecorder = null;
                    this.mSurface = null;
                    this.mRecording = false;
                    this.mState = State.IDLE;
                }
                super.release();
            }
        }

        @Override // com.vk.media.camera.CameraRecorder
        public Surface getSurface() {
            if (this.mState == State.PREPARED && Build.VERSION.SDK_INT >= 21) {
                this.mSurface = this.mRecorder.getSurface();
                if (this.mRecording) {
                    start();
                }
            }
            return this.mSurface;
        }
    }
}
