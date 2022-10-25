package com.google.android.exoplayer2;

import android.content.Context;
import com.google.android.exoplayer2.drm.DrmSessionManager;
import com.google.android.exoplayer2.drm.FrameworkMediaCrypto;
import com.google.android.exoplayer2.trackselection.TrackSelector;
/* loaded from: classes.dex */
public final class ExoPlayerFactory {
    public static final long DEFAULT_ALLOWED_VIDEO_JOINING_TIME_MS = 5000;

    private ExoPlayerFactory() {
    }

    public static SimpleExoPlayer newSimpleInstance(Context context, TrackSelector trackSelector, LoadControl loadControl) {
        return newSimpleInstance(context, trackSelector, loadControl, null);
    }

    public static SimpleExoPlayer newSimpleInstance(Context context, TrackSelector trackSelector, LoadControl loadControl, DrmSessionManager<FrameworkMediaCrypto> drmSessionManager) {
        return newSimpleInstance(context, trackSelector, loadControl, drmSessionManager, 0);
    }

    public static SimpleExoPlayer newSimpleInstance(Context context, TrackSelector trackSelector, LoadControl loadControl, DrmSessionManager<FrameworkMediaCrypto> drmSessionManager, int extensionRendererMode) {
        return newSimpleInstance(context, trackSelector, loadControl, drmSessionManager, extensionRendererMode, 5000L);
    }

    public static SimpleExoPlayer newSimpleInstance(Context context, TrackSelector trackSelector, LoadControl loadControl, DrmSessionManager<FrameworkMediaCrypto> drmSessionManager, int extensionRendererMode, long allowedVideoJoiningTimeMs) {
        return new SimpleExoPlayer(context, trackSelector, loadControl, drmSessionManager, extensionRendererMode, allowedVideoJoiningTimeMs);
    }

    public static ExoPlayer newInstance(Renderer[] renderers, TrackSelector trackSelector) {
        return newInstance(renderers, trackSelector, new DefaultLoadControl());
    }

    public static ExoPlayer newInstance(Renderer[] renderers, TrackSelector trackSelector, LoadControl loadControl) {
        return new ExoPlayerImpl(renderers, trackSelector, loadControl);
    }
}
