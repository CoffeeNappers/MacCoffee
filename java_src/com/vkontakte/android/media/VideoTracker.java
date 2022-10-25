package com.vkontakte.android.media;

import android.support.annotation.Nullable;
import android.text.TextUtils;
import com.facebook.appevents.AppEventsConstants;
import com.facebook.share.internal.ShareConstants;
import com.google.android.exoplayer2.text.ttml.TtmlNode;
import com.vkontakte.android.api.VideoFile;
import com.vkontakte.android.data.Analytics;
import com.vkontakte.android.statistics.Statistic;
import io.fabric.sdk.android.services.events.EventsFilesManager;
/* loaded from: classes3.dex */
public class VideoTracker {
    static final boolean DEBUG = false;
    static final String TAG = "VideoStats";
    static final int position3s = 3;
    static final int positionStart = 0;
    int lastPosition = -1;
    final boolean mAutoplay;
    final String mContext;
    final VideoFile mFile;
    final int mPostId;
    final int mPostOwnerId;
    final String mSource;
    final Statistic mStatistic;
    final int position25;
    final int position50;
    final int position75;
    final int position95;
    final int positionEnd;

    public VideoTracker(VideoFile file, @Nullable Statistic statistic, int postId, int postOwnerId, String referer, boolean autoplay, @Nullable String context) {
        this.mFile = file;
        this.mPostId = postId;
        this.mPostOwnerId = postOwnerId;
        this.mStatistic = statistic;
        this.position25 = (int) (file.duration * 0.25f);
        this.position50 = (int) (file.duration * 0.5f);
        this.position75 = (int) (file.duration * 0.75f);
        this.position95 = (int) (file.duration * 0.95f);
        this.positionEnd = file.duration - 1;
        this.mSource = referer;
        this.mAutoplay = autoplay;
        this.mContext = context;
    }

    public void reset() {
        this.lastPosition = -1;
    }

    public void reset(int position) {
        this.lastPosition = position;
    }

    public void track(int sec, int quality) {
        if (sec != this.lastPosition) {
            if (contains(this.lastPosition, sec, 0)) {
                send(TtmlNode.START, quality);
                sendAdsStat(Statistic.TYPE_VIDEO_PLAY);
            }
            if (this.mFile.duration > 0) {
                if (contains(this.lastPosition, sec, 3)) {
                    send("3s", quality);
                    sendAdsStat(Statistic.TYPE_VIDEO_3S);
                }
                if (contains(this.lastPosition, sec, this.position25)) {
                    send("25", quality);
                    sendAdsStat(Statistic.TYPE_VIDEO_25);
                }
                if (contains(this.lastPosition, sec, this.position50)) {
                    send("50", quality);
                    sendAdsStat(Statistic.TYPE_VIDEO_50);
                }
                if (contains(this.lastPosition, sec, this.position75)) {
                    send("75", quality);
                    sendAdsStat(Statistic.TYPE_VIDEO_75);
                }
                if (contains(this.lastPosition, sec, this.position95)) {
                    send("95", quality);
                    sendAdsStat(Statistic.TYPE_VIDEO_95);
                }
                if (contains(this.lastPosition, sec, this.positionEnd)) {
                    send("100", quality);
                    sendAdsStat(Statistic.TYPE_VIDEO_100);
                }
            }
            this.lastPosition = sec;
        }
    }

    public void trackResume() {
        sendAdsStat(Statistic.TYPE_VIDEO_RESUME);
        sendVideoEvent("resume");
    }

    public void trackPause() {
        sendAdsStat(Statistic.TYPE_VIDEO_PAUSE);
        sendVideoEvent("pause");
    }

    public void trackFullscreenOn() {
        sendAdsStat(Statistic.TYPE_VIDEO_FULLSCREEN_ON);
        sendVideoEvent("fullscreen_on");
    }

    public void trackFullscreenOff() {
        sendAdsStat(Statistic.TYPE_VIDEO_FULLSCREEN_OFF);
        sendVideoEvent("fullscreen_off");
    }

    public void trackVolumeOn() {
        sendAdsStat(Statistic.TYPE_VIDEO_VOLUME_ON);
        sendVideoEvent("volume_on");
    }

    public void trackVolumeOff() {
        sendAdsStat(Statistic.TYPE_VIDEO_VOLUME_OFF);
        sendVideoEvent("volume_off");
    }

    private void send(String position, int quality) {
        Analytics.EventBuilder event = Analytics.track("video_play");
        event.addParam("video_id", this.mFile.oid + EventsFilesManager.ROLL_OVER_FILE_NAME_SEPARATOR + this.mFile.vid);
        event.addParam(ShareConstants.FEED_SOURCE_PARAM, this.mSource);
        event.addParam("autoplay", this.mAutoplay ? AppEventsConstants.EVENT_PARAM_VALUE_YES : AppEventsConstants.EVENT_PARAM_VALUE_NO);
        event.addParam("position", position);
        if (quality >= 0) {
            event.addParam("quality", Integer.valueOf(quality - 2));
        }
        if (!TextUtils.isEmpty(this.mContext)) {
            event.addParam("context", this.mContext);
        }
        event.sendNow();
    }

    private void sendVideoEvent(String eventStr) {
        Analytics.EventBuilder event = Analytics.track("video_event");
        event.addParam("video_id", this.mFile.oid + EventsFilesManager.ROLL_OVER_FILE_NAME_SEPARATOR + this.mFile.vid);
        event.addParam(ShareConstants.FEED_SOURCE_PARAM, this.mSource);
        event.addParam("event", eventStr);
        if (!TextUtils.isEmpty(this.mContext)) {
            event.addParam("context", this.mContext);
        }
        event.sendNow();
    }

    private void sendAdsStat(String type) {
        if (this.mStatistic != null) {
            Analytics.sendPromoActionByType(this.mStatistic, type);
        }
    }

    static boolean contains(int left, int right, int val) {
        return val > left && val <= right;
    }
}
