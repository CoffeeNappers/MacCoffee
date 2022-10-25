package com.vkontakte.android.media;

import android.content.Context;
import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import android.support.annotation.Nullable;
import android.support.annotation.StringRes;
import com.vkontakte.android.R;
import com.vkontakte.android.api.VideoFile;
import com.vkontakte.android.data.Analytics;
import com.vkontakte.android.ui.widget.VideoTextureView;
/* loaded from: classes3.dex */
public abstract class AbsVideoPlayer {
    public static final int ERROR_CANT_DECODE = 1;
    public static final int ERROR_CONTENT_RESTRICTED = 6;
    public static final int ERROR_LIVE_NOT_STARTED = 5;
    public static final int ERROR_NETWORK = -1;
    public static final int ERROR_NOT_PROCESSED = 4;
    public static final int ERROR_NOT_SUPPORT = 7;
    public static final int ERROR_NOT_SUPPORT_RESOLUTION = 8;
    public static final int ERROR_SERVER = 2;
    public static final int UNKNOWN_POSITION = -1;
    protected final Context context;
    protected final UiHandler handler = new UiHandler();
    protected boolean isAutoplay;
    protected final VideoFile mFile;
    private final ViewedRangeListener rangeListener;
    protected VideoTextureView renderView;

    /* loaded from: classes.dex */
    public interface PlayerStateListener {
        void onEndOfBuffer(AbsVideoPlayer absVideoPlayer);

        void onError(AbsVideoPlayer absVideoPlayer, int i);

        void onPlaybackCompleted(AbsVideoPlayer absVideoPlayer);

        void onPlaybackResumed(AbsVideoPlayer absVideoPlayer);

        void onPlayerReady(AbsVideoPlayer absVideoPlayer, int i, int i2);

        void onRenderedFirstFrame(AbsVideoPlayer absVideoPlayer);

        void onUpdateBuffered(AbsVideoPlayer absVideoPlayer, int i);

        void onUpdatePlaybackPosition(AbsVideoPlayer absVideoPlayer, int i);
    }

    public abstract void createPlayer(int i, int i2, int i3, int i4);

    public abstract int getPosition();

    public abstract int getQuality();

    public abstract boolean isCompleted();

    public abstract void pause();

    public abstract void play(boolean z);

    public abstract void recallReady();

    public abstract void replay(int i);

    public abstract void seek(int i);

    public abstract void setDataSourceAndPrepare(String str, int i, boolean z, boolean z2);

    public abstract void setVolume(float f);

    public abstract void stopAndRelease();

    public AbsVideoPlayer(Context context, VideoFile videoFile, String referrer) {
        this.context = context;
        this.mFile = videoFile;
        if (videoFile.isLive()) {
            this.rangeListener = null;
            return;
        }
        this.rangeListener = new ViewedRangeListener(videoFile.vid, videoFile.oid, referrer);
        this.handler.setRangeListener(this.rangeListener);
    }

    public void setView(@Nullable VideoTextureView view) {
        this.renderView = view;
    }

    public VideoTextureView getView() {
        return this.renderView;
    }

    public void setPlayerStateListener(PlayerStateListener l) {
        this.handler.setListener(l);
    }

    public void userStartSeeking() {
        if (this.rangeListener != null) {
            this.rangeListener.setSeeking(true);
            this.rangeListener.closeCurrentRange();
        }
    }

    public void userStopSeeking() {
        if (this.rangeListener != null) {
            this.rangeListener.setSeeking(false);
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void sendViewedRanges() {
        if (this.rangeListener != null) {
            this.rangeListener.sendViewedRanges();
        }
    }

    public boolean isAutoplay() {
        return this.isAutoplay;
    }

    @StringRes
    public static int getErrorString(int error) {
        switch (error) {
            case -1:
                return R.string.video_err_network;
            case 0:
            case 3:
            default:
                return 0;
            case 1:
                return R.string.video_err_decode;
            case 2:
                return R.string.err_internal;
            case 4:
                return R.string.err_video_not_processed;
            case 5:
                return R.string.video_err_live_not_ready;
            case 6:
                return R.string.video_restricted_withdrawn;
            case 7:
                return R.string.video_not_supported_flv;
            case 8:
                return R.string.video_not_supported_resolution;
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes3.dex */
    public static class ViewedRangeListener {
        private boolean isSeeking;

        ViewedRangeListener(int videoId, int ownerId, String referrer) {
            Analytics.videoViewedSegments.setCurrentVideo(videoId, ownerId, referrer);
        }

        public void setSeeking(boolean seeking) {
            this.isSeeking = seeking;
        }

        void updateCurrentRange(int msec) {
            if (!this.isSeeking) {
                Analytics.videoViewedSegments.updateCurrentRange(msec / 1000);
            }
        }

        void closeCurrentRange() {
            Analytics.videoViewedSegments.closeCurrentRange();
        }

        void sendViewedRanges() {
            Analytics.videoViewedSegments.sendViewedRanges();
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes3.dex */
    public static class UiHandler extends Handler implements PlayerStateListener {
        static final int MESSAGE_END_OF_BUFFER = 5;
        static final int MESSAGE_ERROR = 6;
        static final int MESSAGE_FIRST_FRAME = 7;
        static final int MESSAGE_PLAYBACK_COMPLETE = 2;
        static final int MESSAGE_PLAYBACK_RESUMED = 1;
        static final int MESSAGE_UPDATE_BUFFERED = 4;
        static final int MESSAGE_UPDATE_POSITION = 3;
        private PlayerStateListener listener;
        private ViewedRangeListener rangeListener;

        UiHandler() {
            super(Looper.getMainLooper());
        }

        public void setListener(PlayerStateListener listener) {
            this.listener = listener;
        }

        public void setRangeListener(ViewedRangeListener rangeListener) {
            this.rangeListener = rangeListener;
        }

        @Override // com.vkontakte.android.media.AbsVideoPlayer.PlayerStateListener
        public void onPlayerReady(AbsVideoPlayer player, int videoW, int videoH) {
            if (this.listener != null) {
                this.listener.onPlayerReady(player, videoW, videoH);
            }
        }

        @Override // com.vkontakte.android.media.AbsVideoPlayer.PlayerStateListener
        public void onPlaybackResumed(AbsVideoPlayer player) {
            sendMessage(player, 0, 0, 1);
        }

        @Override // com.vkontakte.android.media.AbsVideoPlayer.PlayerStateListener
        public void onPlaybackCompleted(AbsVideoPlayer player) {
            sendMessage(player, 0, 0, 2);
            if (this.rangeListener != null) {
                this.rangeListener.sendViewedRanges();
            }
        }

        @Override // com.vkontakte.android.media.AbsVideoPlayer.PlayerStateListener
        public void onUpdatePlaybackPosition(AbsVideoPlayer player, int msec) {
            sendMessage(player, msec, 0, 3);
            if (this.rangeListener != null) {
                this.rangeListener.updateCurrentRange(msec);
            }
        }

        @Override // com.vkontakte.android.media.AbsVideoPlayer.PlayerStateListener
        public void onUpdateBuffered(AbsVideoPlayer player, int percent) {
            sendMessage(player, percent, 0, 4);
        }

        @Override // com.vkontakte.android.media.AbsVideoPlayer.PlayerStateListener
        public void onEndOfBuffer(AbsVideoPlayer player) {
            sendMessage(player, 0, 0, 5);
        }

        @Override // com.vkontakte.android.media.AbsVideoPlayer.PlayerStateListener
        public void onError(AbsVideoPlayer player, int errCode) {
            sendMessage(player, errCode, 0, 6);
        }

        @Override // com.vkontakte.android.media.AbsVideoPlayer.PlayerStateListener
        public void onRenderedFirstFrame(AbsVideoPlayer player) {
            sendMessage(player, 0, 0, 7);
        }

        void sendMessage(Object object, int arg1, int arg2, int code) {
            Message m = obtainMessage(code);
            m.obj = object;
            m.arg1 = arg1;
            m.arg2 = arg2;
            m.sendToTarget();
        }

        @Override // android.os.Handler
        public void handleMessage(Message msg) {
            AbsVideoPlayer obj = (AbsVideoPlayer) msg.obj;
            if (obj != null && this.listener != null) {
                switch (msg.what) {
                    case 1:
                        this.listener.onPlaybackResumed(obj);
                        return;
                    case 2:
                        this.listener.onPlaybackCompleted(obj);
                        return;
                    case 3:
                        this.listener.onUpdatePlaybackPosition(obj, msg.arg1);
                        return;
                    case 4:
                        this.listener.onUpdateBuffered(obj, msg.arg1);
                        return;
                    case 5:
                        this.listener.onEndOfBuffer(obj);
                        return;
                    case 6:
                        this.listener.onError(obj, msg.arg1);
                        return;
                    case 7:
                        this.listener.onRenderedFirstFrame(obj);
                        return;
                    default:
                        return;
                }
            }
        }
    }
}
