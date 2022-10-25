package com.vkontakte.android.media;

import android.content.Context;
import android.content.SharedPreferences;
import com.vk.analytics.Analytics;
import com.vkontakte.android.api.video.VideoViewSegments;
import com.vkontakte.android.navigation.ArgKeys;
import com.vkontakte.android.utils.L;
import com.vkontakte.android.utils.Range;
import io.fabric.sdk.android.services.events.EventsFilesManager;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
/* loaded from: classes3.dex */
public class ViewedSegments {
    private static final long SAVE_PERIOD = 10000;
    private Range currentRange;
    private long lastSave;
    private boolean lastSessionSent;
    private int ownerId;
    private final SharedPreferences preferences;
    private String referrer;
    private int videoId;
    private final Map<String, Long> viewedSessionHistory = new HashMap();
    private final List<Range> viewedRanges = new ArrayList();

    public ViewedSegments(Context context) {
        this.preferences = context.getSharedPreferences("video_stats", 0);
    }

    public void sendLastSessionStats() {
        if (!this.lastSessionSent) {
            this.lastSessionSent = true;
            if (this.preferences.contains("current_range") || this.preferences.contains("ranges")) {
                int videoId = this.preferences.getInt("video_id", 0);
                int ownerId = this.preferences.getInt("owner_id", 0);
                String referrer = this.preferences.getString(ArgKeys.REFERRER, null);
                String currentRange = this.preferences.getString("current_range", null);
                Set<String> ranges = this.preferences.getStringSet("ranges", Collections.emptySet());
                if (videoId != 0 && ownerId != 0) {
                    try {
                        List<Range> viewedRanges = new ArrayList<>();
                        for (String range : ranges) {
                            viewedRanges.add(new Range(range));
                        }
                        if (currentRange != null) {
                            viewedRanges.add(new Range(currentRange));
                        }
                        new VideoViewSegments(Range.merge(viewedRanges), ownerId, videoId, referrer, 0).exec();
                    } catch (Exception e) {
                        L.e("VK", e);
                        Analytics.logException(e);
                    }
                }
                this.preferences.edit().clear().apply();
            }
        }
    }

    public void setCurrentVideo(int videoId, int ownerId, String referrer) {
        sendLastSessionStats();
        this.videoId = videoId;
        this.ownerId = ownerId;
        this.referrer = referrer;
        this.viewedRanges.clear();
        this.currentRange = null;
        this.preferences.edit().clear().putString(ArgKeys.REFERRER, referrer).putInt("video_id", videoId).putInt("owner_id", ownerId).apply();
    }

    public void updateCurrentRange(int sec) {
        if (this.currentRange == null) {
            this.currentRange = new Range(sec, sec);
        } else {
            this.currentRange.setEnd(sec);
        }
        if (System.currentTimeMillis() - this.lastSave > SAVE_PERIOD) {
            Range curRange = this.currentRange;
            Set<String> ranges = new LinkedHashSet<>();
            for (Range range : Range.merge(this.viewedRanges)) {
                ranges.add(range.toString());
            }
            this.preferences.edit().clear().putString(ArgKeys.REFERRER, this.referrer).putInt("video_id", this.videoId).putInt("owner_id", this.ownerId).putStringSet("ranges", ranges).putString("current_range", curRange == null ? null : curRange.toString()).apply();
            this.lastSave = System.currentTimeMillis();
        }
    }

    public void closeCurrentRange() {
        if (this.currentRange != null) {
            if (this.currentRange.getStart() != this.currentRange.getEnd()) {
                this.viewedRanges.add(this.currentRange);
            }
            this.currentRange = null;
            this.lastSave = 0L;
            Set<String> ranges = new LinkedHashSet<>();
            for (Range range : Range.merge(this.viewedRanges)) {
                ranges.add(range.toString());
            }
            this.preferences.edit().clear().putString(ArgKeys.REFERRER, this.referrer).putInt("video_id", this.videoId).putInt("owner_id", this.ownerId).putStringSet("ranges", ranges).apply();
        }
    }

    public void sendViewedRanges() {
        closeCurrentRange();
        if (!this.viewedRanges.isEmpty()) {
            String id = this.videoId + EventsFilesManager.ROLL_OVER_FILE_NAME_SEPARATOR + this.ownerId;
            Long viewedLength = this.viewedSessionHistory.get(id);
            Set<Range> merged = Range.merge(this.viewedRanges);
            long length = Range.getLength(merged);
            if (viewedLength == null || length > viewedLength.longValue()) {
                Set<Range> ranges = new LinkedHashSet<>(merged);
                new VideoViewSegments(ranges, this.ownerId, this.videoId, this.referrer, 0).exec();
                this.viewedSessionHistory.put(id, Long.valueOf(length));
                this.viewedRanges.clear();
                this.preferences.edit().clear().apply();
            }
        }
    }
}
