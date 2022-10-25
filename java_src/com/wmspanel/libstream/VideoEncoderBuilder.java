package com.wmspanel.libstream;

import android.util.Log;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes3.dex */
public class VideoEncoderBuilder {
    private static final String TAG = "VideoEncoderBuilder";
    private VideoConfig mConfig;

    /* JADX INFO: Access modifiers changed from: package-private */
    public void setConfig(VideoConfig config) {
        this.mConfig = config;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public VideoEncoder build() {
        VideoEncoder videoEncoder = null;
        if (this.mConfig == null) {
            Log.e(TAG, Messages.err_build_video_config_null);
        } else if (this.mConfig.videoSize == null) {
            Log.e(TAG, Messages.err_build_video_size_null);
        } else {
            videoEncoder = VideoEncoder.createVideoEncoder(this.mConfig.videoSize);
            if (videoEncoder != null) {
                videoEncoder.setFrameRate(this.mConfig.fps);
                videoEncoder.setBitRate(this.mConfig.bitRate);
                videoEncoder.setKeyFrameInterval(this.mConfig.keyFrameInterval);
                if (this.mConfig.profileLevel != null) {
                    videoEncoder.setProfile(this.mConfig.profileLevel);
                }
            }
        }
        return videoEncoder;
    }
}
