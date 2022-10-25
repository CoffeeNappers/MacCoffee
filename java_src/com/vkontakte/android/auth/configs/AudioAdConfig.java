package com.vkontakte.android.auth.configs;

import android.text.TextUtils;
import com.vkontakte.android.audio.player.MediaPlayerHelperI;
import com.vkontakte.android.utils.L;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class AudioAdConfig {
    private final int dayLimit;
    public final String[] sections;
    private final int trackLimit;
    private final Type[] typesAllowed;

    /* loaded from: classes2.dex */
    public enum Type {
        preroll,
        midlroll,
        postroll
    }

    public static AudioAdConfig fromJSONString(String str) {
        if (!TextUtils.isEmpty(str)) {
            try {
                return new AudioAdConfig(str);
            } catch (JSONException e) {
                L.e(e, new Object[0]);
            }
        }
        return null;
    }

    public static boolean isAdAllowed(AudioAdConfig config, Type type, int trackCounter, MediaPlayerHelperI.Refer refer) {
        String[] strArr;
        if (config == null || config.typesAllowed == null || config.sections == null || trackCounter >= config.trackLimit) {
            return false;
        }
        boolean retValue = false;
        Type[] typeArr = config.typesAllowed;
        int length = typeArr.length;
        int i = 0;
        while (true) {
            if (i >= length) {
                break;
            }
            Type t = typeArr[i];
            if (t != type) {
                i++;
            } else {
                retValue = true;
                break;
            }
        }
        if (!retValue) {
            return false;
        }
        String vkCat = refer.getExtStr();
        for (String s : config.sections) {
            if (TextUtils.equals(s, vkCat)) {
                return true;
            }
        }
        return false;
    }

    public AudioAdConfig(String o) throws JSONException {
        this(new JSONObject(o));
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    public AudioAdConfig(JSONObject o) {
        char c;
        if (o == null) {
            this.dayLimit = -1;
            this.trackLimit = -1;
        } else {
            this.dayLimit = o.optInt("day_limit", -1);
            this.trackLimit = o.optInt("track_limit", -1);
        }
        JSONArray jA = o == null ? null : o.optJSONArray("types_allowed");
        if (jA == null) {
            this.typesAllowed = null;
        } else {
            this.typesAllowed = new Type[jA.length()];
            for (int i = 0; i < this.typesAllowed.length; i++) {
                String valueOf = String.valueOf(jA.optString(i));
                switch (valueOf.hashCode()) {
                    case -318297696:
                        if (valueOf.equals("preroll")) {
                            c = 0;
                            break;
                        }
                        c = 65535;
                        break;
                    case 757909789:
                        if (valueOf.equals("postroll")) {
                            c = 2;
                            break;
                        }
                        c = 65535;
                        break;
                    case 1055572677:
                        if (valueOf.equals("midroll")) {
                            c = 1;
                            break;
                        }
                        c = 65535;
                        break;
                    default:
                        c = 65535;
                        break;
                }
                switch (c) {
                    case 0:
                        this.typesAllowed[i] = Type.preroll;
                        break;
                    case 1:
                        this.typesAllowed[i] = Type.midlroll;
                        break;
                    case 2:
                        this.typesAllowed[i] = Type.postroll;
                        break;
                }
            }
        }
        JSONArray jA2 = o == null ? null : o.optJSONArray("sections");
        if (jA2 == null) {
            this.sections = null;
            return;
        }
        this.sections = new String[jA2.length()];
        for (int i2 = 0; i2 < jA2.length(); i2++) {
            this.sections[i2] = jA2.optString(i2);
        }
    }

    public String toJSONString() {
        try {
            JSONObject o = new JSONObject();
            if (this.dayLimit >= 0) {
                o.put("day_limit", this.dayLimit);
            }
            if (this.trackLimit >= 0) {
                o.put("track_limit", this.trackLimit);
            }
            if (this.typesAllowed != null) {
                JSONArray jA = new JSONArray();
                for (int i = 0; i < this.typesAllowed.length; i++) {
                    switch (this.typesAllowed[i]) {
                        case midlroll:
                            jA.put(i, "midroll");
                            break;
                        case preroll:
                            jA.put(i, "preroll");
                            break;
                        case postroll:
                            jA.put(i, "postroll");
                            break;
                    }
                }
                o.put("types_allowed", jA);
            }
            if (this.sections != null) {
                JSONArray jA2 = new JSONArray();
                for (int i2 = 0; i2 < this.sections.length; i2++) {
                    jA2.put(i2, this.sections[i2]);
                }
                o.put("sections", jA2);
            }
            return o.toString();
        } catch (Exception e) {
            return null;
        }
    }
}
