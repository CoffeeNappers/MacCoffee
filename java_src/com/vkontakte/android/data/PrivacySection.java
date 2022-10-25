package com.vkontakte.android.data;

import java.util.ArrayList;
import org.json.JSONException;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class PrivacySection {
    public String key;
    public ArrayList<PrivacySetting> settings = new ArrayList<>();
    public String title;

    public PrivacySection() {
    }

    public PrivacySection(JSONObject o) throws JSONException {
        this.title = o.getString("title");
        this.key = o.getString("name");
    }
}
