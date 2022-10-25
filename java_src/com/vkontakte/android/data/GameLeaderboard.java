package com.vkontakte.android.data;

import android.os.Parcel;
import android.os.Parcelable;
import android.text.TextUtils;
import android.util.SparseArray;
import com.vkontakte.android.UserProfile;
import org.json.JSONException;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class GameLeaderboard implements Parcelable {
    public final int intValue;
    public boolean isPoints;
    public int place;
    public final int userId;
    public final UserProfile userProfile;
    public static String KEY_USER_ID = "user_id";
    public static String KEY_POINTS = "points";
    public static String KEY_LEVEL = "level";
    public static final Parcelable.Creator<GameLeaderboard> CREATOR = new Parcelable.Creator<GameLeaderboard>() { // from class: com.vkontakte.android.data.GameLeaderboard.1
        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        /* renamed from: createFromParcel */
        public GameLeaderboard mo960createFromParcel(Parcel source) {
            return new GameLeaderboard(source);
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        /* renamed from: newArray */
        public GameLeaderboard[] mo961newArray(int size) {
            return new GameLeaderboard[size];
        }
    };

    public GameLeaderboard(UserProfile userProfile, int pointsOrLevel, boolean isPoints) {
        this.userProfile = userProfile;
        this.userId = userProfile.uid;
        this.intValue = pointsOrLevel;
        this.isPoints = isPoints;
    }

    public GameLeaderboard(JSONObject object, SparseArray<UserProfile> profileSparseArray) throws JSONException {
        this.userId = object.getInt(KEY_USER_ID);
        String points = object.optString(KEY_POINTS);
        String level = object.optString(KEY_LEVEL);
        this.userProfile = profileSparseArray.get(this.userId, UserProfile.EMPTY_USER);
        this.isPoints = false;
        if (!TextUtils.isEmpty(points)) {
            this.intValue = parseInt(points);
            this.isPoints = true;
        } else if (!TextUtils.isEmpty(level)) {
            this.intValue = parseInt(level);
        } else {
            this.intValue = 0;
        }
    }

    public GameLeaderboard(Parcel in) {
        boolean z = true;
        this.userId = in.readInt();
        this.intValue = in.readInt();
        this.isPoints = in.readInt() != 1 ? false : z;
        this.userProfile = (UserProfile) in.readParcelable(UserProfile.class.getClassLoader());
        this.place = in.readInt();
    }

    public int parseInt(String value) {
        try {
            return Integer.parseInt(value);
        } catch (Exception e) {
            return 0;
        }
    }

    @Override // android.os.Parcelable
    public int describeContents() {
        return 0;
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel dest, int flags) {
        dest.writeInt(this.userId);
        dest.writeInt(this.intValue);
        dest.writeInt(this.isPoints ? 1 : 0);
        dest.writeParcelable(this.userProfile, 0);
        dest.writeInt(this.place);
    }
}
