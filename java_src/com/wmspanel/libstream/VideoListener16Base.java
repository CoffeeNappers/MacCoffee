package com.wmspanel.libstream;

import android.hardware.Camera;
import android.media.MediaCodec;
import android.media.MediaFormat;
import android.util.Log;
import com.vkontakte.android.media.audio.AudioMessageUtils;
import com.wmspanel.libstream.StreamBuffer;
import com.wmspanel.libstream.Streamer;
import java.nio.ByteBuffer;
import java.util.Iterator;
import java.util.List;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes3.dex */
public abstract class VideoListener16Base extends VideoListener {
    private static final String TAG = "VideoListener16Base";
    protected MediaCodec.BufferInfo mBufferInfo;
    protected Camera mCamera;
    protected Camera.ErrorCallback mErrorCallback;

    public VideoListener16Base(StreamBuffer streamBuffer, Streamer.Listener listener) {
        super(streamBuffer, listener);
        this.mErrorCallback = new Camera.ErrorCallback() { // from class: com.wmspanel.libstream.VideoListener16Base.1
            @Override // android.hardware.Camera.ErrorCallback
            public void onError(int error, Camera camera) {
                Log.e(VideoListener16Base.TAG, "OnError, error=" + Integer.toString(error));
                VideoListener16Base.this.setVideoCaptureState(Streamer.CAPTURE_STATE.FAILED);
                VideoListener16Base.this.release();
            }
        };
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void getVideoFrame() {
        try {
            if (this.mEncoder.getEncoder() == null) {
                Log.e(TAG, "video codec is null");
            } else if (this.mBufferInfo == null) {
                Log.e(TAG, "bufferInfo is null");
            } else {
                while (true) {
                    int dequeueOutputBuffer = this.mEncoder.getEncoder().dequeueOutputBuffer(this.mBufferInfo, 0L);
                    if (-2 == dequeueOutputBuffer) {
                        MediaFormat outputFormat = this.mEncoder.getEncoder().getOutputFormat();
                        processOutputFormatChanged(outputFormat);
                        addVideoTrack(outputFormat);
                    } else if (dequeueOutputBuffer >= 0) {
                        ByteBuffer byteBuffer = this.mEncoder.getEncoder().getOutputBuffers()[dequeueOutputBuffer];
                        byteBuffer.position(this.mBufferInfo.offset);
                        byteBuffer.limit(this.mBufferInfo.offset + this.mBufferInfo.size);
                        int i = this.mBufferInfo.size;
                        if (o.b(byteBuffer, NAL_SEPARATOR)) {
                            i -= NAL_SEPARATOR.length;
                        }
                        if ((this.mBufferInfo.flags & 2) == 2) {
                            if (this.mStreamBuffer.ac() == null) {
                                processCodecConfig(byteBuffer);
                            }
                        } else {
                            long j = this.mFrameId;
                            this.mFrameId = 1 + j;
                            BufferItem b = BufferItem.b(j, i);
                            b.setTimestamp(this.mBufferInfo.presentationTimeUs);
                            b.setFlags(this.mBufferInfo.flags);
                            byteBuffer.get(b.getData(), 0, i);
                            if (this.mRecorder != null) {
                                byte[] bArr = new byte[this.mBufferInfo.size];
                                byteBuffer.position(this.mBufferInfo.offset);
                                byteBuffer.get(bArr, 0, this.mBufferInfo.size);
                                b.c(bArr);
                            }
                            this.mStreamBuffer.i(b);
                        }
                        this.mEncoder.getEncoder().releaseOutputBuffer(dequeueOutputBuffer, false);
                    } else {
                        return;
                    }
                }
            }
        } catch (Exception e) {
            Log.e(TAG, "failed to get video frame from encoder");
            Log.e(TAG, Log.getStackTraceString(e));
        }
    }

    protected void processCodecConfig(ByteBuffer outBuffer) {
        StreamBuffer.VideoFormatParams videoFormatParams = new StreamBuffer.VideoFormatParams();
        videoFormatParams.sps_buf = new byte[this.mBufferInfo.size];
        videoFormatParams.sps_len = 0;
        videoFormatParams.pps_buf = new byte[this.mBufferInfo.size];
        videoFormatParams.pps_len = 0;
        while (true) {
            int a = o.a(outBuffer, NAL_SEPARATOR);
            if (a == -1) {
                a = outBuffer.limit();
            }
            int position = a - outBuffer.position();
            if ((outBuffer.get(outBuffer.position()) & AudioMessageUtils.NORMALIZED_MAX_VALUE) == 7) {
                outBuffer.get(videoFormatParams.sps_buf, videoFormatParams.sps_len, position);
                videoFormatParams.sps_len = position + videoFormatParams.sps_len;
            } else if ((outBuffer.get(outBuffer.position()) & AudioMessageUtils.NORMALIZED_MAX_VALUE) == 8) {
                outBuffer.get(videoFormatParams.pps_buf, videoFormatParams.pps_len, position);
                videoFormatParams.pps_len = position + videoFormatParams.pps_len;
            }
            if (outBuffer.limit() - outBuffer.position() >= 4) {
                outBuffer.position(a + 4);
            } else {
                this.mStreamBuffer.a(videoFormatParams);
                setVideoCaptureState(Streamer.CAPTURE_STATE.STARTED);
                return;
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    @Override // com.wmspanel.libstream.VideoListener
    public Camera.Parameters getCameraParameters() {
        if (this.mCamera == null) {
            Log.e(TAG, Messages.err_video_capture_not_started);
            return null;
        }
        return this.mCamera.getParameters();
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void releaseCamera() {
        if (this.mCamera != null) {
            this.mCamera.stopPreview();
            this.mCamera.setPreviewCallback(null);
            this.mCamera.setErrorCallback(null);
            this.mCamera.release();
            this.mCamera = null;
        }
    }

    protected String getSupportedMode(String mode, String defMode, List<String> supportedModes, String name) {
        String str = null;
        if (supportedModes == null || supportedModes.size() <= 0) {
            defMode = null;
        } else {
            StringBuilder sb = new StringBuilder();
            for (String str2 : supportedModes) {
                sb.append(str2).append(";");
            }
            Iterator<String> it = supportedModes.iterator();
            while (true) {
                if (!it.hasNext()) {
                    break;
                } else if (it.next().equals(mode)) {
                    str = mode;
                    break;
                }
            }
            if (str == null) {
                for (String str3 : supportedModes) {
                    if (str3.equals(defMode)) {
                        break;
                    }
                }
            }
            defMode = str;
        }
        if (defMode != null) {
        }
        return defMode;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void setFocusMode(Camera.Parameters parameters, String mode) {
        String supportedMode = getSupportedMode(mode, "continuous-video", parameters.getSupportedFocusModes(), "focus_mode");
        if (supportedMode != null) {
            parameters.setFocusMode(supportedMode);
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void setAwbMode(Camera.Parameters parameters, String mode) {
        String supportedMode = getSupportedMode(mode, "auto", parameters.getSupportedWhiteBalance(), "awb_mode");
        if (supportedMode != null) {
            parameters.setWhiteBalance(supportedMode);
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void setAntibandingMode(Camera.Parameters parameters, String mode) {
        String supportedMode = getSupportedMode(mode, "off", parameters.getSupportedAntibanding(), "antibanding_mode");
        if (supportedMode != null) {
            parameters.setAntibanding(supportedMode);
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void setExposureCompensation(Camera.Parameters parameters, int value) {
        int value2 = parameters.getMinExposureCompensation();
        int value3 = parameters.getMaxExposureCompensation();
        if (value < value2) {
            value = value2;
        }
        if (value > value3) {
            value = value3;
        }
        parameters.setExposureCompensation(value);
    }
}
