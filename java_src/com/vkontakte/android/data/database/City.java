package com.vkontakte.android.data.database;

import com.google.android.exoplayer2.text.ttml.TtmlNode;
import com.vkontakte.android.Log;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class City {
    public String area;
    public int id;
    public boolean important;
    public String region;
    public String title;

    public City() {
    }

    public City(JSONObject o) {
        boolean z = true;
        try {
            this.id = o.getInt("id");
            this.title = o.getString("title");
            this.area = o.optString("area");
            this.region = o.optString(TtmlNode.TAG_REGION);
            this.important = o.optInt("important") != 1 ? false : z;
        } catch (Exception x) {
            Log.w("vk", "Error parsing city", x);
        }
    }

    public String toString() {
        return this.title;
    }
}
