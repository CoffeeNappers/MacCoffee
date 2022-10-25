package com.vkontakte.android.data;

import android.content.ContentValues;
import android.database.Cursor;
import android.os.Parcel;
import android.os.Parcelable;
import android.text.TextUtils;
import android.util.SparseArray;
import com.facebook.share.internal.ShareConstants;
import com.vkontakte.android.Log;
import com.vkontakte.android.UserProfile;
import com.vkontakte.android.data.db.Table;
import java.util.ArrayList;
import java.util.Arrays;
import me.grishka.appkit.utils.V;
import org.json.JSONArray;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class GameRequest implements Parcelable, ServerKeys {
    public static final String COLUMN_APP_ID = "app_id";
    private static final String COLUMN_DATE = "date";
    private static final String COLUMN_KEY = "key";
    private static final String COLUMN_NAME = "name";
    private static final String COLUMN_TEXT = "text";
    private static final String COLUMN_TYPE = "type";
    private static final String COLUMN_UNREAD = "unread";
    public static final String TABLE = "game_requests";
    public static final int TYPE_INVITE = 1;
    public static final int TYPE_REQUEST = 2;
    public ApiApplication apiApplication;
    public String appGenre;
    public int appId;
    public String appPackage;
    public String appTitle;
    public String appUrl;
    public boolean fromDb;
    public int[] fromIds;
    public long id;
    public String key;
    public String name;
    private Object tag;
    public String text;
    public int time;
    public int type;
    public boolean unread;
    public ArrayList<UserProfile> userProfiles;
    public int[] userProfilesId;
    private static final String COLUMN_APP_GENRE = "app_genre";
    private static final String COLUMN_APP_TITLE = "app_title";
    private static final String COLUMN_APP_URL = "app_url";
    private static final String COLUMN_APP_PACKAGE = "app_package";
    private static final String COLUMN_FROM_IDS = "from_ids";
    private static final String COLUMN_USER_PROFILE_IDS = "user_profile_ids";
    public static final String[] COLUMNS = {"_id", "type", "text", "name", "unread", "app_id", COLUMN_APP_GENRE, COLUMN_APP_TITLE, COLUMN_APP_URL, COLUMN_APP_PACKAGE, "key", COLUMN_FROM_IDS, COLUMN_USER_PROFILE_IDS, "date"};
    public static final Parcelable.Creator<GameRequest> CREATOR = new Parcelable.Creator<GameRequest>() { // from class: com.vkontakte.android.data.GameRequest.1
        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        /* renamed from: createFromParcel */
        public GameRequest mo962createFromParcel(Parcel source) {
            return new GameRequest(source);
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        /* renamed from: newArray */
        public GameRequest[] mo963newArray(int size) {
            return new GameRequest[size];
        }
    };

    public Object getTag() {
        return this.tag;
    }

    public void setTag(Object tag) {
        this.tag = tag;
    }

    public GameRequest() {
        this.id = 0L;
        this.fromDb = false;
    }

    public GameRequest(JSONObject o, SparseArray<UserProfile> users, SparseArray<ApiApplication> apps) {
        this.id = 0L;
        this.fromDb = false;
        try {
            this.appId = o.getInt("app_id");
            this.apiApplication = apps.get(this.appId);
            this.appTitle = this.apiApplication.title;
            this.appGenre = this.apiApplication.genre;
            this.appUrl = this.apiApplication.icon.getImageByWidth(V.dp(48.0f)).url;
            this.appPackage = this.apiApplication.packageName;
            this.text = o.getString("text");
            String tp = o.getString("type");
            if (ShareConstants.WEB_DIALOG_RESULT_PARAM_REQUEST_ID.equals(tp)) {
                this.type = 2;
            } else if ("invite".equals(tp)) {
                this.type = 1;
            }
            JSONArray fromJson = o.optJSONArray(ServerKeys.FROM);
            if (fromJson != null) {
                int length = fromJson.length();
                this.fromIds = new int[length];
                this.userProfilesId = new int[length];
                int[] fromTimes = new int[length];
                for (int i = 0; i < length; i++) {
                    JSONObject from = fromJson.getJSONObject(i);
                    this.fromIds[i] = from.optInt("id");
                    if (i == 0) {
                        this.key = from.optString("key");
                    }
                    int userId = from.optInt(ServerKeys.FROM_ID);
                    this.userProfilesId[i] = userId;
                    fromTimes[i] = from.optInt("date");
                }
                this.time = getElderDate(fromTimes);
            }
            this.name = o.optString("name");
            this.unread = o.optInt("unread") == 1;
        } catch (Exception x) {
            Log.w("vk", x);
        }
        fillUserProfiles(users);
    }

    public void fillUserProfiles(SparseArray<UserProfile> users) {
        int[] iArr;
        this.userProfiles = new ArrayList<>();
        for (int i : this.userProfilesId) {
            UserProfile userProfile = users.get(i);
            if (userProfile != null) {
                this.userProfiles.add(userProfile);
            }
        }
    }

    public boolean equals(Object o) {
        if (o instanceof GameRequest) {
            GameRequest r = (GameRequest) o;
            return this.type == r.type && this.appId == r.appId && TextUtils.equals(this.text, r.text) && TextUtils.equals(this.name, r.name) && Arrays.equals(this.fromIds, r.fromIds);
        }
        return false;
    }

    public int hashCode() {
        return this.type + (this.appId * 3) + hashArray(this.fromIds);
    }

    private int hashArray(int[] ids) {
        if (ids == null) {
            return 0;
        }
        int ret = 0;
        for (int i : ids) {
            ret += i;
        }
        return ret;
    }

    private static int getElderDate(int[] fromTimes) {
        int time = 0;
        if (fromTimes != null) {
            for (int l : fromTimes) {
                if (l > time) {
                    time = l;
                }
            }
        }
        return time;
    }

    public GameRequest(Parcel parcel) {
        boolean z = true;
        this.id = 0L;
        this.fromDb = false;
        this.type = parcel.readInt();
        this.text = parcel.readString();
        this.name = parcel.readString();
        this.unread = parcel.readByte() != 0;
        this.appId = parcel.readInt();
        this.appGenre = parcel.readString();
        this.appTitle = parcel.readString();
        this.appUrl = parcel.readString();
        this.appPackage = parcel.readString();
        this.fromIds = parcel.createIntArray();
        this.key = parcel.readString();
        this.userProfilesId = parcel.createIntArray();
        this.userProfiles = parcel.createTypedArrayList(UserProfile.CREATOR);
        this.fromDb = parcel.readByte() == 0 ? false : z;
        this.time = parcel.readInt();
        this.apiApplication = (ApiApplication) parcel.readParcelable(ApiApplication.class.getClassLoader());
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel parcel, int flags) {
        byte b = 1;
        parcel.writeInt(this.type);
        parcel.writeString(this.text);
        parcel.writeString(this.name);
        parcel.writeByte(this.unread ? (byte) 1 : (byte) 0);
        parcel.writeInt(this.appId);
        parcel.writeString(this.appGenre);
        parcel.writeString(this.appTitle);
        parcel.writeString(this.appUrl);
        parcel.writeString(this.appPackage);
        parcel.writeIntArray(this.fromIds);
        parcel.writeString(this.key);
        parcel.writeIntArray(this.userProfilesId);
        parcel.writeTypedList(this.userProfiles);
        if (!this.fromDb) {
            b = 0;
        }
        parcel.writeByte(b);
        parcel.writeInt(this.time);
        parcel.writeParcelable(this.apiApplication, flags);
    }

    @Override // android.os.Parcelable
    public int describeContents() {
        return 0;
    }

    public GameRequest(Cursor cursor) {
        boolean z = false;
        this.id = 0L;
        this.fromDb = false;
        this.id = cursor.getLong(0);
        this.type = cursor.getInt(1);
        this.text = cursor.getString(2);
        this.name = cursor.getString(3);
        this.unread = cursor.getInt(4) != 0 ? true : z;
        this.appId = cursor.getInt(5);
        this.appGenre = cursor.getString(6);
        this.appTitle = cursor.getString(7);
        this.appUrl = cursor.getString(8);
        this.appPackage = cursor.getString(9);
        this.key = cursor.getString(10);
        this.fromIds = stringToIntArray(cursor.getString(11));
        this.userProfilesId = stringToIntArray(cursor.getString(12));
        this.time = cursor.getInt(13);
        this.fromDb = true;
    }

    public ContentValues toContentValues() {
        ContentValues cv = new ContentValues();
        if (this.id > 0) {
            cv.put("_id", Long.valueOf(this.id));
        }
        cv.put("type", Integer.valueOf(this.type));
        cv.put("text", this.text);
        cv.put("name", this.name);
        cv.put("unread", Integer.valueOf(this.unread ? 1 : 0));
        cv.put("app_id", Integer.valueOf(this.appId));
        cv.put(COLUMN_APP_GENRE, this.appGenre);
        cv.put(COLUMN_APP_TITLE, this.appTitle);
        cv.put(COLUMN_APP_URL, this.appUrl);
        cv.put(COLUMN_APP_PACKAGE, this.appPackage);
        cv.put("key", this.key);
        cv.put(COLUMN_FROM_IDS, intArrayToString(this.fromIds));
        cv.put(COLUMN_USER_PROFILE_IDS, intArrayToString(this.userProfilesId));
        cv.put("date", Integer.valueOf(this.time));
        return cv;
    }

    public static String createSql() {
        return new Table(TABLE).withIntegerColumn("_id").setPrimaryKey().setAutoincrement().withIntegerColumn("type").withTextColumn("text").withTextColumn("name").withIntegerColumn("unread").withIntegerColumn("app_id").withTextColumn(COLUMN_APP_GENRE).withTextColumn(COLUMN_APP_TITLE).withTextColumn(COLUMN_APP_URL).withTextColumn(COLUMN_APP_PACKAGE).withTextColumn("key").withTextColumn(COLUMN_FROM_IDS).withTextColumn(COLUMN_USER_PROFILE_IDS).withIntegerColumn("date").createSql();
    }

    private static String intArrayToString(int[] array) {
        if (array == null) {
            return null;
        }
        if (array.length == 0) {
            return "";
        }
        StringBuilder sb = new StringBuilder(array.length * 6);
        sb.append(array[0]);
        for (int i = 1; i < array.length; i++) {
            sb.append(",");
            sb.append(array[i]);
        }
        return sb.toString();
    }

    private static int[] stringToIntArray(String str) {
        if (str == null) {
            return null;
        }
        if (str.equals("")) {
            return new int[0];
        }
        String[] strings = str.split(",");
        int[] ret = new int[strings.length];
        for (int i = 0; i < strings.length; i++) {
            ret[i] = Integer.parseInt(strings[i]);
        }
        return ret;
    }
}
