package com.vk.media.streamer;

import android.content.Context;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import android.view.Surface;
import com.vk.media.camera.CameraRecorder;
import com.vkontakte.android.api.VKAPIRequest;
import com.wmspanel.libstream.AudioConfig;
import com.wmspanel.libstream.Streamer;
import com.wmspanel.libstream.StreamerSurface;
import com.wmspanel.libstream.StreamerSurfaceBuilder;
import com.wmspanel.libstream.VideoConfig;
/* loaded from: classes2.dex */
public class StreamRecorder extends CameraRecorder implements Streamer.Listener {
    private Streamer.CAPTURE_STATE mAudioCaptureState;
    private Handler mHandler;
    private Streamer.MODE mMode;
    private StreamerSurface mStreamer;
    private Streamer.CAPTURE_STATE mVideoCaptureState;

    public StreamRecorder(Context context) {
        super(context);
        this.mVideoCaptureState = Streamer.CAPTURE_STATE.FAILED;
        this.mAudioCaptureState = Streamer.CAPTURE_STATE.FAILED;
        this.mMode = Streamer.MODE.AUDIO_VIDEO;
        this.mHandler = new Handler(Looper.getMainLooper());
    }

    @Override // com.vk.media.camera.CameraUtils.Recorder
    public boolean prepare() {
        if (this.mState != CameraRecorder.State.IDLE) {
            return true;
        }
        release();
        if (this.mProfile == null) {
            Log.e(TAG, "can't create recorder on empty profile");
            return false;
        }
        Log.d(TAG, "prepare on " + this.mProfile.toString());
        AudioConfig audioConfig = new AudioConfig();
        audioConfig.audioSource = 5;
        audioConfig.channelCount = this.mProfile.audioChannels;
        audioConfig.sampleRate = this.mProfile.audioSampleRate;
        VideoConfig videoConfig = new VideoConfig();
        videoConfig.keyFrameInterval = 1;
        videoConfig.bitRate = this.mProfile.videoBitRate;
        videoConfig.fps = this.mProfile.videoFrameRate;
        videoConfig.videoSize = new Streamer.Size(this.mProfile.videoFrameHeight, this.mProfile.videoFrameWidth);
        StreamerSurfaceBuilder builder = new StreamerSurfaceBuilder();
        builder.setContext(this.mContext);
        builder.setListener(this);
        builder.setAudioConfig(audioConfig);
        builder.setVideoConfig(videoConfig);
        this.mStreamer = builder.build(this.mMode);
        this.mStreamer.startVideoCapture();
        Surface surface = this.mStreamer.getEncoderSurface();
        if (surface != null && this.mMode == Streamer.MODE.AUDIO_VIDEO) {
            this.mStreamer.startAudioCapture();
        }
        this.mState = CameraRecorder.State.PREPARING;
        Log.d(TAG, "preparing");
        return true;
    }

    @Override // com.vk.media.camera.CameraRecorder
    public void drainEncoder() {
        if (this.mStreamer != null) {
            this.mStreamer.drainEncoder();
        }
    }

    @Override // com.vk.media.camera.CameraRecorder
    public boolean setPresentationTime(long timestamp) {
        if (!super.setPresentationTime(timestamp)) {
            this.mHandler.post(new Runnable() { // from class: com.vk.media.streamer.StreamRecorder.1
                @Override // java.lang.Runnable
                public void run() {
                    StreamRecorder.this.mOnInfoListener.onInfo(null, VKAPIRequest.ERROR_VIDEO_ALREADY_ADDED, StreamRecorder.this.mMaxRecordingLengthMs);
                }
            });
            stop();
            return false;
        }
        return true;
    }

    @Override // com.vk.media.camera.CameraRecorder
    public Surface getSurface() {
        if (this.mStreamer != null) {
            return this.mStreamer.getEncoderSurface();
        }
        return null;
    }

    @Override // com.vk.media.camera.CameraUtils.Recorder
    public boolean start() {
        if (this.mStreamer != null && this.mFile != null) {
            Log.d(TAG, "start recording " + this.mState + " file=" + this.mFile);
            this.mRecording = true;
            startRecord();
        }
        return this.mRecording;
    }

    @Override // com.vk.media.camera.CameraRecorder, com.vk.media.camera.CameraUtils.Recorder
    public void stop() {
        super.stop();
        if (this.mStreamer != null && this.mRecording) {
            Log.d(TAG, "stop recording");
            this.mRecording = false;
            this.mStreamer.stopRecord();
            this.mState = CameraRecorder.State.PREPARED;
        }
    }

    @Override // com.vk.media.camera.CameraRecorder, com.vk.media.camera.CameraUtils.Recorder
    public void release() {
        super.release();
        if (this.mStreamer != null) {
            stop();
            this.mState = CameraRecorder.State.IDLE;
            this.mStreamer.stopVideoCapture();
            this.mStreamer.stopAudioCapture();
            this.mStreamer.release();
            this.mStreamer = null;
            this.mHandler.removeCallbacksAndMessages(null);
        }
    }

    @Override // com.wmspanel.libstream.Streamer.Listener
    public Handler getHandler() {
        return this.mHandler;
    }

    @Override // com.wmspanel.libstream.Streamer.Listener
    public void onConnectionStateChanged(int i, Streamer.CONNECTION_STATE state, Streamer.STATUS status) {
        Log.d(TAG, "onConnectionStateChanged: " + state + " status: " + status);
        switch (state) {
            case INITIALIZED:
            case CONNECTED:
            case SETUP:
            case RECORD:
                return;
            default:
                stop();
                return;
        }
    }

    @Override // com.wmspanel.libstream.Streamer.Listener
    public void onVideoCaptureStateChanged(Streamer.CAPTURE_STATE state) {
        Log.d(TAG, "onVideoCaptureStateChanged: " + state);
        this.mVideoCaptureState = state;
        switch (state) {
            case STARTED:
                startRecord();
                return;
            case STOPPED:
                return;
            case FAILED:
            case ENCODER_FAIL:
                stop();
                int error = state == Streamer.CAPTURE_STATE.FAILED ? 1000 : 1001;
                notifyError(error, true);
                return;
            default:
                stop();
                return;
        }
    }

    @Override // com.wmspanel.libstream.Streamer.Listener
    public void onAudioCaptureStateChanged(Streamer.CAPTURE_STATE state) {
        Log.d(TAG, "onAudioCaptureStateChanged: " + state);
        this.mAudioCaptureState = state;
        switch (state) {
            case STARTED:
                startRecord();
                return;
            case STOPPED:
                return;
            case FAILED:
            case ENCODER_FAIL:
                stop();
                int error = state == Streamer.CAPTURE_STATE.FAILED ? 1000 : 1001;
                notifyError(error, false);
                return;
            default:
                stop();
                return;
        }
    }

    @Override // com.wmspanel.libstream.Streamer.Listener
    public void onRecordStateChanged(Streamer.RECORD_STATE state) {
        Log.d(TAG, "onRecordStateChanged " + state);
        if (state == Streamer.RECORD_STATE.STARTED && this.mStartPresentationTime < 0 && this.mLastPresentationTime > 0) {
            this.mStartPresentationTime = this.mLastPresentationTime;
            Log.d(TAG, "recording start on: " + this.mStartPresentationTime);
        }
    }

    private void startRecord() {
        boolean ready = false;
        if (this.mMode == Streamer.MODE.AUDIO_VIDEO) {
            ready = this.mVideoCaptureState == Streamer.CAPTURE_STATE.STARTED && this.mAudioCaptureState == Streamer.CAPTURE_STATE.STARTED;
        } else if (this.mMode == Streamer.MODE.VIDEO_ONLY) {
            ready = this.mVideoCaptureState == Streamer.CAPTURE_STATE.STARTED;
        } else {
            stop();
        }
        if (ready) {
            this.mState = CameraRecorder.State.PREPARED;
            if (this.mFile != null && this.mRecording && this.mState != CameraRecorder.State.RECORDING) {
                Log.d(TAG, "startRecord");
                this.mStreamer.startRecord(this.mFile);
                this.mState = CameraRecorder.State.RECORDING;
            }
        }
    }
}
