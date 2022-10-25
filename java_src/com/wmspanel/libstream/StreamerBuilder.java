package com.wmspanel.libstream;

import android.content.Context;
import android.support.annotation.Nullable;
import android.util.Log;
import com.wmspanel.libstream.Streamer;
/* loaded from: classes3.dex */
public abstract class StreamerBuilder {
    private static final String TAG = "StreamerBuilder";
    protected AudioConfig mAudioConfig;
    protected Context mContext;
    protected Streamer.Listener mListener;
    protected VideoConfig mVideoConfig;
    protected String mUserAgent = "Larix/1.0.28";
    protected int mMaxBufferItems = 200;
    protected final int MIN_BUFFER_ITEMS = 70;

    @Nullable
    /* renamed from: build */
    public abstract Streamer mo1150build();

    public void setUserAgent(String userAgent) {
        this.mUserAgent = userAgent;
    }

    public void setContext(Context ctx) {
        this.mContext = ctx;
    }

    public void setListener(Streamer.Listener listener) {
        this.mListener = listener;
    }

    public void setAudioConfig(AudioConfig audioConfig) {
        this.mAudioConfig = audioConfig;
    }

    public void setVideoConfig(VideoConfig videoConfig) {
        this.mVideoConfig = videoConfig;
    }

    public void setMaxBufferItems(int items) {
        if (items >= 70) {
            this.mMaxBufferItems = items;
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public VideoEncoder createVideoEncoder() {
        if (this.mVideoConfig == null) {
            Log.e(TAG, Messages.err_build_video_config_null);
            return null;
        }
        VideoEncoderBuilder videoEncoderBuilder = new VideoEncoderBuilder();
        videoEncoderBuilder.setConfig(this.mVideoConfig);
        return videoEncoderBuilder.build();
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public AudioEncoder createAudioEncoder() {
        if (this.mAudioConfig == null) {
            Log.e(TAG, Messages.err_build_audio_config_null);
            return null;
        }
        AudioEncoderBuilder audioEncoderBuilder = new AudioEncoderBuilder();
        audioEncoderBuilder.setConfig(this.mAudioConfig);
        return audioEncoderBuilder.build();
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void setEncodingSetup(Streamer streamer) {
        streamer.setAudioConfig(this.mAudioConfig);
        streamer.setVideoConfig(this.mVideoConfig);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public boolean verify() {
        boolean z = true;
        if (this.mContext == null) {
            Log.e(TAG, Messages.err_build_context_null);
            z = false;
        }
        if (this.mUserAgent == null) {
            Log.e(TAG, Messages.err_ua_null);
            z = false;
        }
        if (this.mListener == null) {
            Log.e(TAG, Messages.err_build_listener_null);
            z = false;
        }
        if (this.mListener != null && this.mListener.getHandler() == null) {
            Log.e(TAG, Messages.err_build_handler_null);
            return false;
        }
        return z;
    }
}
