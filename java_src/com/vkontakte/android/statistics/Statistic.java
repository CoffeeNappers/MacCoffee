package com.vkontakte.android.statistics;

import com.vkontakte.android.utils.Serializer;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
/* loaded from: classes3.dex */
public interface Statistic extends Serializer.Serializable {
    public static final String TYPE_CLICK = "click";
    public static final String TYPE_DEEP_LINK = "click_deeplink";
    public static final String TYPE_IMPRESSION = "impression";
    public static final String TYPE_IMPRESSION_PRETTY_CARD = "ads/impression_pretty_card";
    public static final String TYPE_LOAD = "load";
    public static final String TYPE_POST_LIKE = "like_post";
    public static final String TYPE_POST_LINK = "click_post_link";
    public static final String TYPE_POST_OWNER_CLICK = "click_post_owner";
    public static final String TYPE_POST_SHARE = "share_post";
    public static final String TYPE_VIDEO_100 = "video_play_100";
    public static final String TYPE_VIDEO_25 = "video_play_25";
    public static final String TYPE_VIDEO_3S = "video_play_3s";
    public static final String TYPE_VIDEO_50 = "video_play_50";
    public static final String TYPE_VIDEO_75 = "video_play_75";
    public static final String TYPE_VIDEO_95 = "video_play_95";
    public static final String TYPE_VIDEO_FULLSCREEN_OFF = "video_fullscreen_off";
    public static final String TYPE_VIDEO_FULLSCREEN_ON = "video_fullscreen_on";
    public static final String TYPE_VIDEO_PAUSE = "video_pause";
    public static final String TYPE_VIDEO_PLAY = "video_start";
    public static final String TYPE_VIDEO_RESUME = "video_resume";
    public static final String TYPE_VIDEO_VOLUME_OFF = "video_volume_off";
    public static final String TYPE_VIDEO_VOLUME_ON = "video_volume_on";

    void addStatisticUrl(StatisticUrl statisticUrl);

    List<StatisticUrl> getStatisticByType(String str);

    int getStatisticHash();

    int getStatisticSizeByType(String str);

    /* loaded from: classes3.dex */
    public static class StatisticHelper {
        private final HashMap<String, ArrayList<StatisticUrl>> statistics = new HashMap<>();

        public void addStatisticUrl(StatisticUrl url) {
            ArrayList<StatisticUrl> urls = this.statistics.get(url.type);
            if (urls == null) {
                urls = new ArrayList<>();
                this.statistics.put(url.type, urls);
            }
            urls.add(url);
        }

        public int getStatisticSizeByType(String type) {
            ArrayList<StatisticUrl> urls = this.statistics.get(type);
            if (urls == null) {
                return 0;
            }
            return urls.size();
        }

        public List<StatisticUrl> getStatisticByType(String type) {
            ArrayList<StatisticUrl> urls = this.statistics.get(type);
            return urls == null ? Collections.emptyList() : urls;
        }

        public void serializeTo(Serializer os) {
            os.writeInt(this.statistics.size());
            for (Map.Entry<String, ArrayList<StatisticUrl>> entry : this.statistics.entrySet()) {
                os.writeString(entry.getKey());
                os.writeTypedList(entry.getValue());
            }
        }

        public void readFromSerializer(Serializer is) {
            int c = is.readInt();
            for (int i = 0; i < c; i++) {
                String key = is.readString();
                ArrayList<StatisticUrl> list = is.createTypedArrayList(StatisticUrl.CREATOR);
                if (list != null) {
                    this.statistics.put(key, list);
                }
            }
        }
    }
}
