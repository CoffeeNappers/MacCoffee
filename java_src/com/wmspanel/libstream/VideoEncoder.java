package com.wmspanel.libstream;

import android.annotation.TargetApi;
import android.media.MediaCodec;
import android.media.MediaCodecInfo;
import android.media.MediaCodecList;
import android.media.MediaFormat;
import android.os.Build;
import android.os.Bundle;
import android.util.Log;
import com.wmspanel.libstream.Streamer;
/* loaded from: classes3.dex */
public class VideoEncoder extends MediaCodecState {
    private static final String TAG = "VideoEncoder";

    @Override // com.wmspanel.libstream.MediaCodecState
    public /* bridge */ /* synthetic */ void release() {
        super.release();
    }

    VideoEncoder(MediaCodec encoder, MediaFormat format, MediaCodecInfo.CodecCapabilities cap) {
        if (encoder == null || format == null || cap == null) {
            throw new IllegalArgumentException();
        }
        this.mEncoder = encoder;
        this.mFormat = format;
        this.mCap = cap;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static VideoEncoder createVideoEncoder(Streamer.Size res) {
        if (Build.VERSION.SDK_INT < 18) {
            return createVideoEncoder16(res);
        }
        return createVideoEncoder18(res);
    }

    @TargetApi(18)
    private static VideoEncoder createVideoEncoder18(Streamer.Size res) {
        MediaCodec mediaCodec;
        VideoEncoder videoEncoder = null;
        try {
            mediaCodec = MediaCodec.createEncoderByType("video/avc");
        } catch (Exception e) {
            e = e;
            mediaCodec = null;
        }
        try {
            if (mediaCodec == null) {
                Log.e(TAG, "VideoEncoder18: failed to create video/avc encoder");
            } else {
                MediaCodecInfo codecInfo = mediaCodec.getCodecInfo();
                if (codecInfo == null) {
                    Log.e(TAG, "VideoEncoder18: failed to get codec info");
                    mediaCodec.release();
                } else {
                    MediaCodecInfo.CodecCapabilities capabilitiesForType = codecInfo.getCapabilitiesForType("video/avc");
                    if (capabilitiesForType == null) {
                        Log.e(TAG, "VideoEncoder18: failed to get codec capabilities");
                        mediaCodec.release();
                    } else {
                        MediaFormat createVideoFormat = MediaFormat.createVideoFormat("video/avc", res.width, res.height);
                        if (createVideoFormat == null) {
                            Log.e(TAG, "VideoEncoder18: failed to create video format");
                            mediaCodec.release();
                        } else {
                            videoEncoder = new VideoEncoder(mediaCodec, createVideoFormat, capabilitiesForType);
                        }
                    }
                }
            }
        } catch (Exception e2) {
            e = e2;
            Log.e(TAG, Log.getStackTraceString(e));
            if (mediaCodec != null) {
                mediaCodec.release();
            }
            return videoEncoder;
        }
        return videoEncoder;
    }

    private static VideoEncoder createVideoEncoder16(Streamer.Size res) {
        try {
            int codecCount = MediaCodecList.getCodecCount();
            VideoEncoder videoEncoder = null;
            for (int i = 0; i < codecCount; i++) {
                MediaCodecInfo codecInfoAt = MediaCodecList.getCodecInfoAt(i);
                if (codecInfoAt.isEncoder()) {
                    String[] supportedTypes = codecInfoAt.getSupportedTypes();
                    int length = supportedTypes.length;
                    int i2 = 0;
                    while (true) {
                        if (i2 >= length) {
                            break;
                        } else if (!supportedTypes[i2].equals("video/avc")) {
                            i2++;
                        } else {
                            MediaCodecInfo.CodecCapabilities capabilitiesForType = codecInfoAt.getCapabilitiesForType("video/avc");
                            if (capabilitiesForType == null) {
                                Log.e(TAG, "VideoEncoder16: failed to get codec capabilities");
                                return null;
                            }
                            MediaCodec createEncoderByType = MediaCodec.createEncoderByType("video/avc");
                            if (createEncoderByType == null) {
                                Log.e(TAG, "VideoEncoder16: failed to create video/avc encoder");
                                return null;
                            }
                            MediaFormat createVideoFormat = MediaFormat.createVideoFormat("video/avc", res.width, res.height);
                            if (createVideoFormat == null) {
                                Log.e(TAG, "VideoEncoder16: failed to create video format");
                                createEncoderByType.release();
                                return null;
                            }
                            videoEncoder = new VideoEncoder(createEncoderByType, createVideoFormat, capabilitiesForType);
                        }
                    }
                    if (videoEncoder != null) {
                        return videoEncoder;
                    }
                }
            }
            return videoEncoder;
        } catch (Exception e) {
            Log.e(TAG, Log.getStackTraceString(e));
            return null;
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void setFrameRate(float fps) {
        this.mFormat.setFloat("frame-rate", fps);
        if (Build.VERSION.SDK_INT >= 21) {
            this.mFormat.setFloat("capture-rate", fps);
        }
    }

    private static int getCompression(int profile) {
        switch (profile) {
            case 2:
                return 8000;
            case 8:
                return 8250;
            default:
                return 6500;
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void setBitRate(int bitRate) {
        this.mFormat.setInteger("bitrate", bitRate);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void setKeyFrameInterval(int keyFrameInterval) {
        this.mFormat.setInteger("i-frame-interval", keyFrameInterval);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void setProfile(MediaCodecInfo.CodecProfileLevel profileLevel) {
        if (profileLevel != null) {
            if (Build.VERSION.SDK_INT >= 21) {
                this.mFormat.setInteger("profile", profileLevel.profile);
            }
            if (Build.VERSION.SDK_INT >= 23) {
                this.mFormat.setInteger("level", profileLevel.level);
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public int[] getSupportedColorFormats() {
        return this.mCap.colorFormats;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    @TargetApi(19)
    public void changeBitRate(int bitRate) {
        if (this.mEncoder != null && Build.VERSION.SDK_INT >= 19) {
            try {
                Bundle bundle = new Bundle();
                bundle.putInt("video-bitrate", bitRate);
                this.mEncoder.setParameters(bundle);
            } catch (IllegalStateException e) {
                Log.e(TAG, Log.getStackTraceString(e));
            }
        }
    }
}
