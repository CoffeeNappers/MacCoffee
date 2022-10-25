package com.vkontakte.android.data;

import android.os.Bundle;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import com.vkontakte.android.utils.Serializer;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONObject;
/* loaded from: classes.dex */
public final class LikeInfo extends Serializer.SerializableAdapter {
    public static final Serializer.Creator<LikeInfo> CREATOR = new Serializer.CreatorAdapter<LikeInfo>() { // from class: com.vkontakte.android.data.LikeInfo.1
        @Override // com.vkontakte.android.utils.Serializer.Creator
        /* renamed from: createFromSerializer */
        public LikeInfo mo1087createFromSerializer(Serializer s) {
            return new LikeInfo(s);
        }

        @Override // android.os.Parcelable.Creator, com.vkontakte.android.utils.Serializer.Creator
        /* renamed from: newArray */
        public LikeInfo[] mo1088newArray(int size) {
            return new LikeInfo[size];
        }
    };
    public static final String DATA_FIRST_NAME = "firstName";
    public static final String DATA_FIRST_NAME_DAT = "firstNameDat";
    public static final String DATA_FRIEND = "friend";
    public static final String DATA_LAST_NAME = "lastName";
    public static final String DATA_LAST_NAME_DAT = "lastNameDat";
    public static final String DATA_MALE = "male";
    public static final String DATA_NAME = "name";
    public static final String DATA_PHOTO = "photo";
    public static final int TYPE_EVENT = 4;
    public static final int TYPE_GROUP = 2;
    public static final int TYPE_PAGE = 3;
    public static final int TYPE_PROFILE = 1;
    private final Bundle data;
    public final int type;

    @Retention(RetentionPolicy.SOURCE)
    /* loaded from: classes.dex */
    public @interface BoolData {
    }

    @Retention(RetentionPolicy.SOURCE)
    /* loaded from: classes.dex */
    public @interface StrData {
    }

    @Retention(RetentionPolicy.SOURCE)
    /* loaded from: classes.dex */
    public @interface Type {
    }

    private LikeInfo(int type, @NonNull Bundle data) {
        this.type = type;
        this.data = data;
    }

    private LikeInfo(Serializer in) {
        this.type = in.readInt();
        this.data = in.readBundle(getClass().getClassLoader());
    }

    @Override // com.vkontakte.android.utils.Serializer.Serializable
    public void serializeTo(Serializer s) {
        s.writeInt(this.type);
        s.writeBundle(this.data);
    }

    @Nullable
    public String getString(String key) {
        return this.data.getString(key);
    }

    public boolean getBoolean(String key) {
        return this.data.getBoolean(key);
    }

    @NonNull
    public static List<LikeInfo> parse(@Nullable JSONArray jLikes) {
        if (jLikes == null) {
            return Collections.emptyList();
        }
        int length = jLikes.length();
        if (length == 0) {
            return Collections.emptyList();
        }
        List<LikeInfo> result = new ArrayList<>();
        for (int i = 0; i < length; i++) {
            JSONObject jLikeInfo = jLikes.optJSONObject(i);
            if (jLikeInfo != null && jLikeInfo.has(ServerKeys.TYPE)) {
                if ("profile".equalsIgnoreCase(jLikeInfo.optString(ServerKeys.TYPE))) {
                    result.add(parseUser(jLikeInfo));
                } else {
                    result.add(parseGroup(jLikeInfo));
                }
            }
        }
        return result;
    }

    @NonNull
    private static LikeInfo parseUser(@NonNull JSONObject jLikeInfo) {
        boolean z = false;
        Bundle data = new Bundle();
        if (jLikeInfo.has("sex")) {
            data.putBoolean(DATA_MALE, jLikeInfo.optInt("sex", 0) == 1);
        }
        if (jLikeInfo.has("is_friend")) {
            if (jLikeInfo.optInt("is_friend", 0) == 1) {
                z = true;
            }
            data.putBoolean(DATA_FRIEND, z);
        }
        if (jLikeInfo.has("photo_50")) {
            data.putString("photo", jLikeInfo.optString("photo_50"));
        }
        if (jLikeInfo.has("first_name")) {
            data.putString(DATA_FIRST_NAME, jLikeInfo.optString("first_name"));
        }
        if (jLikeInfo.has("last_name")) {
            data.putString(DATA_LAST_NAME, jLikeInfo.optString("last_name"));
        }
        if (jLikeInfo.has("first_name_dat")) {
            data.putString(DATA_FIRST_NAME_DAT, jLikeInfo.optString("first_name_dat"));
        }
        if (jLikeInfo.has("last_name_dat")) {
            data.putString(DATA_LAST_NAME_DAT, jLikeInfo.optString("last_name_dat"));
        }
        return new LikeInfo(1, data);
    }

    @NonNull
    private static LikeInfo parseGroup(@NonNull JSONObject jLikeInfo) {
        Bundle data = new Bundle();
        if (jLikeInfo.has("photo_50")) {
            data.putString("photo", jLikeInfo.optString("photo_50"));
        }
        if (jLikeInfo.has("name")) {
            data.putString("name", jLikeInfo.optString("name"));
        }
        String optString = jLikeInfo.optString(ServerKeys.TYPE);
        char c = 65535;
        switch (optString.hashCode()) {
            case 3433103:
                if (optString.equals("page")) {
                    c = 1;
                    break;
                }
                break;
            case 96891546:
                if (optString.equals("event")) {
                    c = 2;
                    break;
                }
                break;
            case 98629247:
                if (optString.equals("group")) {
                    c = 0;
                    break;
                }
                break;
        }
        switch (c) {
            case 0:
                return new LikeInfo(2, data);
            case 1:
                return new LikeInfo(3, data);
            case 2:
                return new LikeInfo(4, data);
            default:
                throw new IllegalArgumentException("Unsupported type: " + jLikeInfo.optString(ServerKeys.TYPE));
        }
    }
}
