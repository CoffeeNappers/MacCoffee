package com.wmspanel.libstream;

import android.annotation.TargetApi;
import android.media.AudioRecord;
import android.media.MediaCodec;
import android.media.MediaFormat;
import android.os.Build;
import android.os.Handler;
import android.util.Log;
import com.google.android.exoplayer2.C;
import com.wmspanel.libstream.StreamBuffer;
import com.wmspanel.libstream.Streamer;
import java.nio.ByteBuffer;
import net.ypresto.androidtranscoder.format.MediaFormatExtraConstants;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes3.dex */
public class AudioListener extends Thread {
    private static final String TAG = "AudioListener";
    private AudioEncoder mAudioEncoder;
    private MediaFormat mAudioFormat;
    private AudioRecord mAudioRecord;
    private int mAudioSource;
    private long mFrameId;
    private Streamer.Listener mListener;
    private StreamRecorder mRecorder;
    private long mStartPTS;
    private StreamBuffer mStreamBuffer;
    private long mTotalSamplesNum;
    private final MediaCodec.BufferInfo mBufferInfo = new MediaCodec.BufferInfo();
    private Streamer.CAPTURE_STATE mState = Streamer.CAPTURE_STATE.STOPPED;

    public AudioListener(StreamBuffer streamBuffer, int audioSource, AudioEncoder audioEncoder, Streamer.Listener listener) {
        if (streamBuffer == null) {
            throw new IllegalArgumentException();
        }
        if (audioEncoder == null || audioEncoder.getEncoder() == null) {
            throw new IllegalArgumentException();
        }
        this.mStreamBuffer = streamBuffer;
        this.mAudioSource = audioSource;
        this.mAudioEncoder = audioEncoder;
        this.mListener = listener;
    }

    private void setAudioCaptureState(final Streamer.CAPTURE_STATE audioCaptureState) {
        Handler handler;
        if (audioCaptureState != this.mState) {
            this.mState = audioCaptureState;
            if (this.mListener != null && (handler = this.mListener.getHandler()) != null) {
                handler.post(new Runnable() { // from class: com.wmspanel.libstream.AudioListener.1
                    @Override // java.lang.Runnable
                    public void run() {
                        AudioListener.this.mListener.onAudioCaptureStateChanged(audioCaptureState);
                    }
                });
            }
        }
    }

    private boolean openEncoder(int bufferSize) {
        try {
            this.mAudioEncoder.setBufferSize(bufferSize);
            this.mAudioEncoder.configure();
            this.mAudioEncoder.start();
            return true;
        } catch (Exception e) {
            Log.e(TAG, Log.getStackTraceString(e));
            return false;
        }
    }

    private long getJitterFreePTS(long bufferPts, long bufferSamplesNum) {
        long sampleRate = (C.MICROS_PER_SECOND * bufferSamplesNum) / this.mAudioEncoder.getSampleRate();
        long bufferPts2 = bufferPts - sampleRate;
        if (this.mTotalSamplesNum == 0) {
            this.mStartPTS = bufferPts2;
            this.mTotalSamplesNum = 0L;
        }
        long sampleRate2 = this.mStartPTS + ((this.mTotalSamplesNum * C.MICROS_PER_SECOND) / this.mAudioEncoder.getSampleRate());
        if (bufferPts2 - sampleRate2 >= sampleRate * 2) {
            this.mStartPTS = bufferPts2;
            this.mTotalSamplesNum = 0L;
            sampleRate2 = this.mStartPTS;
        }
        this.mTotalSamplesNum += bufferSamplesNum;
        return sampleRate2;
    }

    /* JADX WARN: Removed duplicated region for block: B:21:0x0040  */
    /* JADX WARN: Removed duplicated region for block: B:24:0x004d  */
    /* JADX WARN: Removed duplicated region for block: B:27:0x0059  */
    @Override // java.lang.Thread, java.lang.Runnable
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public void run() {
        /*
            Method dump skipped, instructions count: 278
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.wmspanel.libstream.AudioListener.run():void");
    }

    private void getAudioFrame() {
        ByteBuffer outputBuffer;
        while (true) {
            try {
                int dequeueOutputBuffer = this.mAudioEncoder.getEncoder().dequeueOutputBuffer(this.mBufferInfo, 0L);
                if (-2 == dequeueOutputBuffer) {
                    MediaFormat outputFormat = this.mAudioEncoder.getEncoder().getOutputFormat();
                    StreamBuffer.AudioFormatParams audioFormatParams = new StreamBuffer.AudioFormatParams();
                    audioFormatParams.configBuf = outputFormat.getByteBuffer(MediaFormatExtraConstants.KEY_AVC_SPS).array();
                    audioFormatParams.configLen = audioFormatParams.configBuf.length;
                    audioFormatParams.sampleRate = outputFormat.getInteger("sample-rate");
                    audioFormatParams.channelCount = outputFormat.getInteger("channel-count");
                    this.mStreamBuffer.a(audioFormatParams);
                    addAudioTrack(outputFormat);
                    setAudioCaptureState(Streamer.CAPTURE_STATE.STARTED);
                } else if (dequeueOutputBuffer >= 0) {
                    if (Build.VERSION.SDK_INT < 21) {
                        outputBuffer = this.mAudioEncoder.getEncoder().getOutputBuffers()[dequeueOutputBuffer];
                    } else {
                        outputBuffer = this.mAudioEncoder.getEncoder().getOutputBuffer(dequeueOutputBuffer);
                    }
                    if ((this.mBufferInfo.flags & 2) == 2) {
                        StreamBuffer.AudioFormatParams audioFormatParams2 = new StreamBuffer.AudioFormatParams();
                        audioFormatParams2.configBuf = new byte[this.mBufferInfo.size];
                        audioFormatParams2.configLen = this.mBufferInfo.size;
                        outputBuffer.get(audioFormatParams2.configBuf, 0, audioFormatParams2.configLen);
                        this.mStreamBuffer.a(audioFormatParams2);
                        setAudioCaptureState(Streamer.CAPTURE_STATE.STARTED);
                    } else {
                        long j = this.mFrameId;
                        this.mFrameId = 1 + j;
                        BufferItem a = BufferItem.a(j, this.mBufferInfo.size);
                        a.setTimestamp(this.mBufferInfo.presentationTimeUs);
                        a.setFlags(this.mBufferInfo.flags);
                        outputBuffer.get(a.getData(), 0, this.mBufferInfo.size);
                        this.mStreamBuffer.i(a);
                    }
                    this.mAudioEncoder.getEncoder().releaseOutputBuffer(dequeueOutputBuffer, false);
                } else {
                    return;
                }
            } catch (Exception e) {
                Log.e(TAG, Log.getStackTraceString(e));
                setAudioCaptureState(Build.VERSION.SDK_INT >= 21 && (e instanceof MediaCodec.CodecException) ? Streamer.CAPTURE_STATE.ENCODER_FAIL : Streamer.CAPTURE_STATE.FAILED);
                return;
            }
        }
    }

    @TargetApi(18)
    private void addAudioTrack(MediaFormat format) {
        if (this.mRecorder != null) {
            this.mRecorder.addAudioTrack(format);
        } else {
            this.mAudioFormat = format;
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    @TargetApi(18)
    public void startRecord(StreamRecorder recorder) {
        if (this.mRecorder == null) {
            this.mRecorder = recorder;
            if (this.mAudioFormat != null) {
                this.mRecorder.addAudioTrack(this.mAudioFormat);
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    @TargetApi(18)
    public void stopRecord() {
        this.mRecorder = null;
    }
}
