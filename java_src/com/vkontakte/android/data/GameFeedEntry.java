package com.vkontakte.android.data;

import android.util.SparseArray;
import com.vkontakte.android.Log;
import com.vkontakte.android.UserProfile;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class GameFeedEntry implements ServerKeys {
    public ApiApplication app;
    public int date;
    public int level;
    private Object mTag;
    public String text;
    public Type type;
    public UserProfile user;
    public int value;

    /* loaded from: classes2.dex */
    public enum Type {
        install,
        level,
        score,
        achievement
    }

    public Object getTag() {
        return this.mTag;
    }

    public void setTag(Object mTag) {
        this.mTag = mTag;
    }

    public GameFeedEntry() {
    }

    public GameFeedEntry(JSONObject o, SparseArray<UserProfile> users, SparseArray<ApiApplication> apps) {
        Type[] values;
        try {
            String typeStr = o.getString(ServerKeys.TYPE);
            for (Type type : Type.values()) {
                if (type.name().equals(typeStr)) {
                    this.type = type;
                }
            }
            this.date = o.getInt(ServerKeys.DATE);
            this.text = o.optString("text");
            this.level = o.optInt("level");
            this.value = o.optInt("value");
            this.user = users.get(o.getInt("user_id"));
            this.app = apps.get(o.getInt("app_id"));
        } catch (Exception x) {
            Log.w("vk", x);
        }
    }
}
