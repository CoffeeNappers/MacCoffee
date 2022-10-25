package com.vkontakte.android.auth.configs;

import com.vkontakte.android.data.ServerKeys;
import com.vkontakte.android.utils.L;
import io.fabric.sdk.android.services.common.IdManager;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Pattern;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class ProfilerConfig {
    private final boolean apiRequests;
    private final List<DownloadPattern> downloadPatterns;

    public ProfilerConfig(String string) throws JSONException {
        this(new JSONObject(string));
    }

    public ProfilerConfig(JSONObject obj) {
        this.downloadPatterns = new ArrayList();
        this.apiRequests = obj.optBoolean("api_requests");
        JSONArray patterns = obj.optJSONArray("download_patterns");
        if (patterns != null) {
            for (int i = 0; i < patterns.length(); i++) {
                JSONObject pattern = patterns.optJSONObject(i);
                if (pattern != null) {
                    this.downloadPatterns.add(new DownloadPattern(pattern));
                }
            }
        }
    }

    public boolean isApiRequests() {
        return this.apiRequests;
    }

    public List<DownloadPattern> getDownloadPatterns() {
        return this.downloadPatterns;
    }

    public String toJSONString() {
        try {
            JSONObject result = new JSONObject();
            result.put("api_requests", this.apiRequests);
            JSONArray array = new JSONArray();
            for (DownloadPattern pattern : this.downloadPatterns) {
                JSONObject item = pattern.toJSON();
                if (item != null) {
                    array.put(item);
                }
            }
            result.put("download_patterns", array);
            return result.toString();
        } catch (Exception e) {
            L.e("ProfilerConfig", "JSON build error " + e);
            return null;
        }
    }

    /* loaded from: classes2.dex */
    public static class DownloadPattern {
        private final float errorProbability;
        private final Pattern pattern;
        private final float probability;
        private final String type;

        public DownloadPattern(JSONObject obj) {
            this.type = obj.optString(ServerKeys.TYPE);
            this.pattern = Pattern.compile(obj.optString("pattern"));
            this.probability = Float.parseFloat(obj.optString("probability", IdManager.DEFAULT_VERSION_NAME));
            this.errorProbability = Float.parseFloat(obj.optString("error_probability", IdManager.DEFAULT_VERSION_NAME));
        }

        public String getType() {
            return this.type;
        }

        public Pattern getPattern() {
            return this.pattern;
        }

        public float getProbability() {
            return this.probability;
        }

        public float getErrorProbability() {
            return this.errorProbability;
        }

        public JSONObject toJSON() {
            try {
                JSONObject result = new JSONObject();
                result.put(ServerKeys.TYPE, this.type);
                result.put("pattern", this.pattern.pattern());
                result.put("probability", this.probability);
                result.put("error_probability", this.errorProbability);
                return result;
            } catch (Exception e) {
                L.e("DownloadPattern", "JSON build error " + e);
                return null;
            }
        }
    }
}
