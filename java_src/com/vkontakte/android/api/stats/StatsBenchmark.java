package com.vkontakte.android.api.stats;

import com.vkontakte.android.api.ResultlessAPIRequest;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import org.json.JSONArray;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class StatsBenchmark extends ResultlessAPIRequest {
    private boolean haveDataToSend;

    public boolean getHaveDataToSend() {
        return this.haveDataToSend;
    }

    public StatsBenchmark(int apiResponseTime, ArrayList<Integer> apiFailCount, int imageLoadTime, HashMap<String, Integer> imageLoadFailures, int audioLoadTime, int audioFailCount, int videoSpeedBytesPerSecond) {
        super("stats.benchmark");
        if (apiResponseTime != 0) {
            param("api_response_time", apiResponseTime);
            this.haveDataToSend = true;
        }
        if (apiFailCount.size() > 0) {
            JSONArray failCountJsonArray = new JSONArray((Collection) apiFailCount);
            param("api_fail_count", failCountJsonArray.toString());
            this.haveDataToSend = true;
        }
        if (imageLoadTime != 0) {
            param("image_load_time", imageLoadTime);
            this.haveDataToSend = true;
        }
        if (imageLoadFailures.size() > 0) {
            JSONObject imageFailuresJson = new JSONObject(imageLoadFailures);
            param("image_fail_count", imageFailuresJson.toString());
            this.haveDataToSend = true;
        }
        if (audioLoadTime > 0) {
            param("audio_load_time", audioLoadTime);
            this.haveDataToSend = true;
        }
        if (audioFailCount > 0) {
            param("audio_fail_count", audioFailCount);
            this.haveDataToSend = true;
        }
        if (videoSpeedBytesPerSecond > 0) {
            param("video_speed", videoSpeedBytesPerSecond / 1000);
            this.haveDataToSend = true;
        }
    }
}
