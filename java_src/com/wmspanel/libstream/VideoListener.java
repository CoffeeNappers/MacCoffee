package com.wmspanel.libstream;

import android.annotation.TargetApi;
import android.content.Context;
import android.graphics.SurfaceTexture;
import android.hardware.Camera;
import android.hardware.camera2.CaptureRequest;
import android.media.MediaCodec;
import android.media.MediaFormat;
import android.os.Build;
import android.os.Handler;
import android.util.Log;
import android.view.Surface;
import android.view.SurfaceHolder;
import com.wmspanel.libstream.SnapshotWriter;
import com.wmspanel.libstream.StreamBuffer;
import com.wmspanel.libstream.Streamer;
import java.io.File;
import java.nio.ByteBuffer;
import java.util.List;
import net.ypresto.androidtranscoder.format.MediaFormatExtraConstants;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes3.dex */
public abstract class VideoListener {
    protected static final byte[] NAL_SEPARATOR = {0, 0, 0, 1};
    private static final String TAG = "VideoListener";
    protected long mAbsolutePtsUs;
    protected String mCameraId;
    protected int mDisplayOrientation;
    protected VideoEncoder mEncoder;
    protected List<FlipCameraInfo> mFlipCameraInfo;
    protected long mGapPtsUs;
    protected long mLastPtsUs;
    protected Streamer.Listener mListener;
    protected MediaCodec.Callback mMediaCodecCallback;
    protected Streamer.Size mPreviewSize;
    protected StreamRecorder mRecorder;
    protected File mSnapshot;
    protected SnapshotWriter.SnapshotCallback mSnapshotCallback;
    protected Streamer.CAPTURE_STATE mState;
    protected StreamBuffer mStreamBuffer;
    protected Surface mSurface;
    protected Streamer.Size mSurfaceSize;
    protected boolean mTakeSnapshot;
    protected MediaFormat mVideoFormat;
    protected int mVideoOrientation;
    protected long mFrameId = 1;
    protected FocusMode mFocusMode = new FocusMode();

    /* loaded from: classes3.dex */
    protected static class FlipCameraInfo {
        public String cameraId;
        public Streamer.FpsRange fpsRange;
        public float scale;
        public float scale_horizon;
        public float scale_landscape_letterbox;
        public float scale_landscape_pillarbox;
        public float scale_letterbox;
        public Streamer.Size videoSize;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public abstract void release();

    /* JADX INFO: Access modifiers changed from: package-private */
    public abstract void start(Context context, String str, SurfaceHolder surfaceHolder, SurfaceTexture surfaceTexture, VideoEncoder videoEncoder);

    /* JADX INFO: Access modifiers changed from: package-private */
    public VideoListener(StreamBuffer streamBuffer, Streamer.Listener listener) {
        if (streamBuffer == null) {
            throw new IllegalArgumentException();
        }
        this.mStreamBuffer = streamBuffer;
        this.mListener = listener;
        this.mState = Streamer.CAPTURE_STATE.STOPPED;
        if (Build.VERSION.SDK_INT >= 21) {
            this.mMediaCodecCallback = new MediaCodec.Callback() { // from class: com.wmspanel.libstream.VideoListener.1
                @Override // android.media.MediaCodec.Callback
                @TargetApi(21)
                public void onInputBufferAvailable(MediaCodec codec, int index) {
                }

                @Override // android.media.MediaCodec.Callback
                @TargetApi(21)
                public void onOutputBufferAvailable(MediaCodec codec, int index, MediaCodec.BufferInfo info) {
                    boolean z;
                    try {
                        ByteBuffer outputBuffer = codec.getOutputBuffer(index);
                        outputBuffer.position(info.offset);
                        outputBuffer.limit(info.offset + info.size);
                        if ((info.flags & 2) == 0) {
                            int i = info.size;
                            if (o.b(outputBuffer, VideoListener.NAL_SEPARATOR)) {
                                i -= VideoListener.NAL_SEPARATOR.length;
                            }
                            VideoListener videoListener = VideoListener.this;
                            long j = videoListener.mFrameId;
                            videoListener.mFrameId = 1 + j;
                            BufferItem b = BufferItem.b(j, i);
                            VideoListener.this.translatePts(info.presentationTimeUs);
                            b.setTimestamp(VideoListener.this.mAbsolutePtsUs + VideoListener.this.mGapPtsUs);
                            b.setFlags(info.flags);
                            outputBuffer.get(b.getData(), 0, i);
                            if (VideoListener.this.mRecorder != null) {
                                outputBuffer.position(info.offset);
                                byte[] bArr = new byte[info.size];
                                outputBuffer.get(bArr, 0, info.size);
                                b.c(bArr);
                            }
                            VideoListener.this.mStreamBuffer.i(b);
                        }
                        codec.releaseOutputBuffer(index, false);
                    } catch (Exception e) {
                        Streamer.CAPTURE_STATE capture_state = Streamer.CAPTURE_STATE.FAILED;
                        if (!(e instanceof MediaCodec.CodecException)) {
                            z = true;
                        } else {
                            Streamer.CAPTURE_STATE capture_state2 = Streamer.CAPTURE_STATE.ENCODER_FAIL;
                            if (!((MediaCodec.CodecException) e).isTransient()) {
                                capture_state = capture_state2;
                                z = true;
                            } else {
                                Log.d(VideoListener.TAG, "MediaCodec resources are temporarily unavailable");
                                capture_state = capture_state2;
                                z = false;
                            }
                        }
                        if (z) {
                            Log.e(VideoListener.TAG, Log.getStackTraceString(e));
                            VideoListener.this.setVideoCaptureState(capture_state);
                            VideoListener.this.release();
                        }
                    }
                }

                @Override // android.media.MediaCodec.Callback
                @TargetApi(21)
                public void onError(MediaCodec codec, MediaCodec.CodecException e) {
                    Log.e(VideoListener.TAG, "onError");
                    if (e.isTransient()) {
                        Log.d(VideoListener.TAG, "MediaCodec resources are temporarily unavailable");
                        return;
                    }
                    Log.e(VideoListener.TAG, Log.getStackTraceString(e));
                    VideoListener.this.setVideoCaptureState(Streamer.CAPTURE_STATE.ENCODER_FAIL);
                    VideoListener.this.release();
                }

                @Override // android.media.MediaCodec.Callback
                @TargetApi(21)
                public void onOutputFormatChanged(MediaCodec codec, MediaFormat format) {
                    Log.d(VideoListener.TAG, "onOutputFormatChanged");
                    VideoListener.this.processOutputFormatChanged(format);
                    VideoListener.this.mVideoFormat = format;
                    VideoListener.this.addVideoTrack(VideoListener.this.mVideoFormat);
                }
            };
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @TargetApi(18)
    public void addVideoTrack(MediaFormat format) {
        if (this.mRecorder != null) {
            this.mRecorder.addVideoTrack(format);
        } else {
            this.mVideoFormat = format;
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @TargetApi(18)
    public void startRecord(StreamRecorder recorder) {
        if (this.mRecorder == null) {
            this.mRecorder = recorder;
            if (this.mVideoFormat != null) {
                this.mRecorder.addVideoTrack(this.mVideoFormat);
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @TargetApi(18)
    public void stopRecord() {
        this.mRecorder = null;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void resetMediaFormat() {
        if (this.mStreamBuffer != null) {
            this.mStreamBuffer.a((StreamBuffer.VideoFormatParams) null);
        }
        this.mVideoFormat = null;
        this.mRecorder = null;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void releaseEncoder() {
        if (this.mEncoder != null) {
            this.mEncoder.release();
            this.mEncoder = null;
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @TargetApi(18)
    public void takeSnapshot(File file) {
        this.mTakeSnapshot = true;
        this.mSnapshot = file;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @TargetApi(18)
    public void takeSnapshot(SnapshotWriter.SnapshotCallback callback) {
        this.mTakeSnapshot = true;
        this.mSnapshotCallback = callback;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void setVideoCaptureState(final Streamer.CAPTURE_STATE videoCaptureState) {
        Handler handler;
        if (videoCaptureState != this.mState) {
            this.mState = videoCaptureState;
            if (this.mListener != null && (handler = this.mListener.getHandler()) != null) {
                handler.post(new Runnable() { // from class: com.wmspanel.libstream.VideoListener.2
                    @Override // java.lang.Runnable
                    public void run() {
                        VideoListener.this.mListener.onVideoCaptureStateChanged(videoCaptureState);
                    }
                });
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void processOutputFormatChanged(MediaFormat format) {
        Log.d(TAG, "processOutputFormatChanged");
        StreamBuffer.VideoFormatParams videoFormatParams = new StreamBuffer.VideoFormatParams();
        ByteBuffer duplicate = format.getByteBuffer(MediaFormatExtraConstants.KEY_AVC_SPS).duplicate();
        o.b(duplicate, NAL_SEPARATOR);
        videoFormatParams.sps_len = duplicate.limit() - duplicate.position();
        videoFormatParams.sps_buf = new byte[videoFormatParams.sps_len];
        duplicate.get(videoFormatParams.sps_buf, 0, videoFormatParams.sps_len);
        ByteBuffer duplicate2 = format.getByteBuffer(MediaFormatExtraConstants.KEY_AVC_PPS).duplicate();
        o.b(duplicate2, NAL_SEPARATOR);
        videoFormatParams.pps_len = duplicate2.limit() - duplicate2.position();
        videoFormatParams.pps_buf = new byte[videoFormatParams.pps_len];
        duplicate2.get(videoFormatParams.pps_buf, 0, videoFormatParams.pps_len);
        this.mStreamBuffer.a(videoFormatParams);
        setVideoCaptureState(Streamer.CAPTURE_STATE.STARTED);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void toggleTorch() {
        throw new IllegalStateException(Messages.err_need_camera);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void flip() {
        throw new IllegalStateException(Messages.err_need_camera);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public Camera.Parameters getCameraParameters() {
        throw new IllegalStateException(Messages.err_need_camera1);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void setCameraParameters(Camera.Parameters param) {
        throw new IllegalStateException(Messages.err_need_camera1);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    @TargetApi(21)
    public CaptureRequest.Builder createCaptureRequest() {
        throw new IllegalStateException(Messages.err_need_camera2);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    @TargetApi(21)
    public void setRepeatingRequest(CaptureRequest.Builder builder) {
        throw new IllegalStateException(Messages.err_need_camera2);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void setFocusMode(FocusMode mode) {
        if (mode != null) {
            this.mFocusMode = mode;
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void focus() {
        Log.d(TAG, "Focus is not supported");
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void setSurface(Surface surface) {
        this.mSurface = surface;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void setSurfaceSize(Streamer.Size size) {
        this.mSurfaceSize = size;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void setDisplayOrientation(int rotation) {
        this.mDisplayOrientation = rotation;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void setVideoOrientation(int orientation) {
        this.mVideoOrientation = orientation;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void setFlipCameraInfo(List<FlipCameraInfo> info) {
        this.mFlipCameraInfo = info;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public String getCameraId() {
        return this.mCameraId;
    }

    protected void translatePts(long presentationTimeUs) {
        long j = presentationTimeUs - this.mLastPtsUs;
        if (this.mAbsolutePtsUs == 0 || Math.abs(j) > 250000) {
            this.mAbsolutePtsUs = System.nanoTime() / 1000;
            j = 0;
        }
        this.mAbsolutePtsUs = j + this.mAbsolutePtsUs;
        this.mLastPtsUs = presentationTimeUs;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void setGapPts(long gap) {
        this.mGapPtsUs = gap;
    }
}
