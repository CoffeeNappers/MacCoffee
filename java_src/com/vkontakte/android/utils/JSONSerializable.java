package com.vkontakte.android.utils;

import android.os.Parcelable;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import com.vkontakte.android.data.UserNotification;
import org.json.JSONException;
import org.json.JSONObject;
/* loaded from: classes.dex */
public interface JSONSerializable extends Parcelable {
    public static final int CLASS_TYPE_USER_NOTIFICATION = 1;

    int getJSONSerializableClassType();

    int getJSONSerializableVersion();

    void serializableToJson(@NonNull JSONObject jSONObject) throws JSONException;

    /* loaded from: classes.dex */
    public static class Factory {
        private static final String CLASS_TYPE = "__class_type";
        private static final String VERSION = "__version";

        @Nullable
        public static JSONSerializable from(@NonNull JSONObject o) throws JSONException {
            switch (o.getInt(CLASS_TYPE)) {
                case 1:
                    return new UserNotification(o, o.getInt(VERSION));
                default:
                    return null;
            }
        }

        @NonNull
        public static JSONObject to(@NonNull JSONSerializable s) throws JSONException {
            JSONObject object = new JSONObject();
            object.put(CLASS_TYPE, s.getJSONSerializableClassType());
            object.put(VERSION, s.getJSONSerializableVersion());
            s.serializableToJson(object);
            return object;
        }
    }
}
