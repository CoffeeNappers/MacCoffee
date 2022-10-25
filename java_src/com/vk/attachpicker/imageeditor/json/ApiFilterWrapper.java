package com.vk.attachpicker.imageeditor.json;

import org.json.JSONObject;
/* loaded from: classes2.dex */
public class ApiFilterWrapper {
    public static final int FILTER_FORMAT_VERSION = 2;
    public static final String FILTER_ORIGINAL = "FILTER_ID_ORIGINAL";
    public final ApiFilter filter;
    public final String id;
    public final String name;
    public final int v;

    public ApiFilterWrapper(String id, String name, ApiFilter filter, int v) {
        this.id = id;
        this.name = name;
        this.filter = filter;
        this.v = v;
    }

    public ApiFilterWrapper(JSONObject jo) {
        jo = jo == null ? new JSONObject() : jo;
        this.id = jo.optString("id", "");
        this.name = jo.optString("name", "");
        this.filter = new ApiFilter(jo.optJSONObject("preset"));
        this.v = jo.optInt("v");
    }

    public String toString() {
        return "ApiFilterWrapper{name='" + this.name + "', id='" + this.id + "'}";
    }
}
