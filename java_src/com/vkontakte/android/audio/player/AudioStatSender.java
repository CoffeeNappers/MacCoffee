package com.vkontakte.android.audio.player;

import android.support.annotation.NonNull;
import android.text.TextUtils;
import com.coremedia.iso.boxes.UserBox;
import com.facebook.share.internal.ShareConstants;
import com.vkontakte.android.VKApplication;
import com.vkontakte.android.audio.MusicTrack;
import com.vkontakte.android.audio.contentprovider.AudioContentProviderConstants;
import com.vkontakte.android.audio.player.MediaPlayerHelperI;
import com.vkontakte.android.data.Analytics;
import com.vkontakte.android.utils.L;
import com.vkontakte.android.utils.Utils;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes2.dex */
public class AudioStatSender {
    private MusicTrack track = null;
    private long duration_max = 0;
    private long duration = 0;
    private long lastProgress = 0;
    private long startTime = 0;
    private MediaPlayerHelperI.Refer refer = null;
    private volatile boolean sent = false;

    private void checkNewTrack(MusicTrack track, long duration_max) {
        if (!Utils.equals(this.track, track)) {
            trySendStat();
            this.startTime = System.currentTimeMillis() / 1000;
            this.track = track;
            this.duration_max = duration_max;
            this.duration = 0L;
            this.sent = false;
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void onPrepared(@NonNull MusicTrack track, long duration_max, MediaPlayerHelperI.Refer refer) {
        this.refer = refer;
        checkNewTrack(track, duration_max);
        this.lastProgress = 0L;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void onProgress(@NonNull MusicTrack track, long duration_max, long progress, MediaPlayerHelperI.Refer refer) {
        this.refer = refer;
        checkNewTrack(track, duration_max);
        if (progress > this.lastProgress && progress - this.lastProgress < 2000) {
            this.duration += progress - this.lastProgress;
        }
        this.lastProgress = progress;
        if (this.duration >= duration_max) {
            trySendStat();
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void release() {
        trySendStat();
    }

    private long getTimeListened() {
        return Math.min(this.duration, this.duration_max) / 1000;
    }

    private boolean isDurationValid() {
        return true;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public long getTodayListeningTimeSec() {
        Prefs prefs = Prefs.getInstance(VKApplication.context);
        Date today = new Date();
        Date lastSend = new Date(prefs.playedLastDate.mo473get().longValue());
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
        return sdf.format(today).equals(sdf.format(lastSend)) ? prefs.playedTime.mo473get().longValue() + getTimeListened() : getTimeListened();
    }

    private synchronized void trySendStat() {
        if (!this.sent && this.track != null && isDurationValid()) {
            long durationSecToSend = getTimeListened();
            long time = this.startTime;
            Analytics.EventBuilder builder = Analytics.track("audio_play").addParam("audio_id", this.track.getMid()).addParam(UserBox.TYPE, Integer.valueOf(UUID.randomUUID().hashCode())).addParam("start_time", Long.valueOf(time)).addParam("duration", Long.valueOf(durationSecToSend));
            if (!TextUtils.isEmpty(this.track.playlistId)) {
                builder.addParam(AudioContentProviderConstants.MUSIC_TRACK_COLUMN_PLAY_LIST_ID, this.track.playlistId);
            }
            if (this.refer != null) {
                builder.addParam(ShareConstants.FEED_SOURCE_PARAM, this.refer.getStr());
            }
            builder.commit();
            L.d("Send audio_play stat", "duration:", Long.valueOf(durationSecToSend), "time:", Long.valueOf(time));
            this.sent = true;
            try {
                Prefs prefs = Prefs.getInstance(VKApplication.context);
                long timeAll = getTodayListeningTimeSec();
                prefs.playedLastDate.set(Long.valueOf(System.currentTimeMillis()));
                prefs.playedTime.set(Long.valueOf(timeAll));
                L.e(Long.valueOf(timeAll));
            } catch (Exception e) {
                L.e(e, new Object[0]);
            }
        }
    }
}
