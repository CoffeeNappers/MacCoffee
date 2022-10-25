package com.wmspanel.libstream;

import android.annotation.TargetApi;
import android.util.Log;
import com.wmspanel.libstream.Streamer;
@TargetApi(18)
/* loaded from: classes3.dex */
public class StreamerSurfaceBuilder extends StreamerBuilder {
    private static final String TAG = "BuilderSurface";

    @Override // com.wmspanel.libstream.StreamerBuilder
    /* renamed from: build  reason: collision with other method in class */
    public StreamerSurface mo1150build() {
        return build(Streamer.MODE.AUDIO_VIDEO);
    }

    public StreamerSurface build(Streamer.MODE mode) {
        AudioEncoder audioEncoder;
        VideoEncoder videoEncoder = null;
        StreamerSurface streamerSurface = new StreamerSurface(this.mMaxBufferItems);
        boolean z = true;
        if (!verify()) {
            return null;
        }
        if (mode != Streamer.MODE.VIDEO_ONLY) {
            audioEncoder = createAudioEncoder();
            if (audioEncoder == null || audioEncoder.getEncoder() == null) {
                Log.e(TAG, Messages.err_build_audio_enc);
                z = false;
            }
        } else {
            audioEncoder = null;
        }
        if (mode != Streamer.MODE.AUDIO_ONLY && ((videoEncoder = createVideoEncoder()) == null || videoEncoder.getEncoder() == null)) {
            Log.e(TAG, Messages.err_build_video_enc);
            z = false;
        }
        if (z) {
            streamerSurface.setContext(this.mContext);
            streamerSurface.setListener(this.mListener);
            streamerSurface.setVideoEncoder(videoEncoder);
            streamerSurface.setAudioEncoder(audioEncoder);
            streamerSurface.setUserAgent(this.mUserAgent);
            setEncodingSetup(streamerSurface);
        } else {
            if (audioEncoder != null) {
                audioEncoder.release();
            }
            if (videoEncoder != null) {
                videoEncoder.release();
            }
        }
        return streamerSurface;
    }
}
