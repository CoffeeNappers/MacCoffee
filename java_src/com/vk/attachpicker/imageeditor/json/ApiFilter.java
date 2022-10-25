package com.vk.attachpicker.imageeditor.json;

import com.google.android.exoplayer2.text.ttml.TtmlNode;
import java.util.ArrayList;
import org.json.JSONArray;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class ApiFilter {
    public static final float DEFAULT_BRIGHTNESS = 0.0f;
    public static final float DEFAULT_CONTRAST = 0.0f;
    public static final float DEFAULT_ENHANCE = 0.0f;
    public static final float DEFAULT_FADE = 0.0f;
    public static final float DEFAULT_SATURATION = 0.0f;
    public static final float DEFAULT_TEMPERATURE = 0.0f;
    public static final float DEFAULT_TINT = 0.0f;
    public final int[] blueCurve;
    public final float brightness;
    public final ArrayList<ApiColorPreference> colors;
    public final float contrast;
    public final float enhance;
    public final float fade;
    public final int[] greenCurve;
    public final int[] redCurve;
    public final int[] rgbCurve;
    public final float saturation;
    public final float temperature;
    public final float tint;

    public ApiFilter() {
        this.colors = new ArrayList<>();
        this.enhance = 0.0f;
        this.brightness = 0.0f;
        this.contrast = 0.0f;
        this.saturation = 0.0f;
        this.fade = 0.0f;
        this.temperature = 0.0f;
        this.tint = 0.0f;
        this.redCurve = new int[]{0, 64, 128, 192, 255};
        this.greenCurve = new int[]{0, 64, 128, 192, 255};
        this.blueCurve = new int[]{0, 64, 128, 192, 255};
        this.rgbCurve = new int[]{0, 64, 128, 192, 255};
    }

    public ApiFilter(JSONObject jo) {
        this.colors = new ArrayList<>();
        jo = jo == null ? new JSONObject() : jo;
        this.enhance = (float) jo.optDouble("enh", 0.0d);
        this.brightness = (float) jo.optDouble(TtmlNode.TAG_BR, 0.0d);
        this.contrast = (float) jo.optDouble("con", 0.0d);
        this.saturation = (float) jo.optDouble("sat", 0.0d);
        this.fade = (float) jo.optDouble("fade", 0.0d);
        this.temperature = (float) jo.optDouble("tem", 0.0d);
        this.tint = (float) jo.optDouble("tint", 0.0d);
        optColorsFronJson(jo);
        this.redCurve = optCurveFromJson(jo, "red_curve");
        this.greenCurve = optCurveFromJson(jo, "green_curve");
        this.blueCurve = optCurveFromJson(jo, "blue_curve");
        this.rgbCurve = optCurveFromJson(jo, "rgb_curve");
    }

    private int[] optCurveFromJson(JSONObject jo, String name) {
        JSONArray ja = jo.optJSONArray(name);
        return (ja == null || ja.length() != 5) ? new int[]{0, 64, 128, 192, 255} : new int[]{ja.optInt(0, 0), ja.optInt(1, 64), ja.optInt(2, 128), ja.optInt(3, 192), ja.optInt(4, 255)};
    }

    private void optColorsFronJson(JSONObject jo) {
        JSONArray ja = jo.optJSONArray("col");
        if (ja != null && ja.length() != 0) {
            for (int i = 0; i < ja.length(); i++) {
                this.colors.add(new ApiColorPreference(ja.optJSONObject(i)));
            }
        }
    }
}
