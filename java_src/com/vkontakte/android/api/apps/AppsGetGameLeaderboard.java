package com.vkontakte.android.api.apps;

import android.os.Parcel;
import android.os.Parcelable;
import android.util.SparseArray;
import com.facebook.GraphRequest;
import com.vkontakte.android.UserProfile;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.auth.VKAccountManager;
import com.vkontakte.android.data.ApiApplication;
import com.vkontakte.android.data.GameLeaderboard;
import com.vkontakte.android.data.ServerKeys;
import com.vkontakte.android.fragments.gifts.ProfileGiftsFragment;
import java.util.ArrayList;
import org.json.JSONArray;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class AppsGetGameLeaderboard extends VKAPIRequest<LeaderboardData> {

    /* loaded from: classes2.dex */
    public static class LeaderboardData implements Parcelable {
        public static final Parcelable.Creator<LeaderboardData> CREATOR = new Parcelable.Creator<LeaderboardData>() { // from class: com.vkontakte.android.api.apps.AppsGetGameLeaderboard.LeaderboardData.1
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // android.os.Parcelable.Creator
            /* renamed from: createFromParcel */
            public LeaderboardData mo601createFromParcel(Parcel source) {
                return new LeaderboardData(source);
            }

            /* JADX WARN: Can't rename method to resolve collision */
            @Override // android.os.Parcelable.Creator
            /* renamed from: newArray */
            public LeaderboardData[] mo602newArray(int size) {
                return new LeaderboardData[size];
            }
        };
        public ApiApplication apiApplication;
        public boolean haveCurrentUserInLeaderboard;
        public ArrayList<GameLeaderboard> leaderboard;
        public int userLevelOrPointsCurrent;
        public int userLevelOrPointsMax;

        public LeaderboardData(ApiApplication apiApplication, ArrayList<GameLeaderboard> leaderboard, int userLevelOrPointsMax, boolean haveCurrentUserInLeaderboard) {
            this.apiApplication = apiApplication;
            this.leaderboard = leaderboard;
            this.userLevelOrPointsMax = userLevelOrPointsMax;
            this.haveCurrentUserInLeaderboard = haveCurrentUserInLeaderboard;
        }

        public LeaderboardData(Parcel in) {
            this.apiApplication = (ApiApplication) in.readParcelable(ApiApplication.class.getClassLoader());
            this.leaderboard = in.createTypedArrayList(GameLeaderboard.CREATOR);
            this.userLevelOrPointsCurrent = in.readInt();
            this.haveCurrentUserInLeaderboard = in.readInt() == 1;
        }

        @Override // android.os.Parcelable
        public int describeContents() {
            return 0;
        }

        @Override // android.os.Parcelable
        public void writeToParcel(Parcel dest, int flags) {
            int i = 0;
            dest.writeParcelable(this.apiApplication, 0);
            dest.writeTypedList(this.leaderboard);
            dest.writeInt(this.userLevelOrPointsCurrent);
            if (this.haveCurrentUserInLeaderboard) {
                i = 1;
            }
            dest.writeInt(i);
        }
    }

    public AppsGetGameLeaderboard(int appId) {
        super("execute.getGameLeaderboard");
        param("app_id", appId);
        param(GraphRequest.FIELDS_PARAM, "online,photo_100,photo_50,photo_200,sex");
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.vkontakte.android.api.VKAPIRequest
    /* renamed from: parse */
    public LeaderboardData mo1093parse(JSONObject r) throws Exception {
        ArrayList<GameLeaderboard> leaderboards = new ArrayList<>();
        SparseArray<UserProfile> profiles = new SparseArray<>();
        JSONObject response = r.getJSONObject(ServerKeys.RESPONSE);
        int userLevelOrPointsMax = r.optInt("points", r.optInt("level", 0));
        ApiApplication apiApplication = new ApiApplication(response.getJSONObject("app"));
        JSONObject jsonLeaderboard = response.getJSONObject("leaderboard");
        JSONArray jsonProfiles = jsonLeaderboard.getJSONArray("profiles");
        for (int i = 0; i < jsonProfiles.length(); i++) {
            UserProfile up = new UserProfile(jsonProfiles.getJSONObject(i));
            profiles.append(up.uid, up);
        }
        UserProfile currentUser = new UserProfile(response.getJSONObject(ProfileGiftsFragment.Extra.User));
        JSONArray jsonLeaderboardItems = jsonLeaderboard.getJSONArray(ServerKeys.ITEMS);
        boolean haveCurrentUserInLeaderboard = false;
        for (int i2 = 0; i2 < jsonLeaderboardItems.length(); i2++) {
            GameLeaderboard glToAdd = new GameLeaderboard(jsonLeaderboardItems.getJSONObject(i2), profiles);
            leaderboards.add(glToAdd);
            glToAdd.place = i2 + 1;
            if (VKAccountManager.isCurrentUser(glToAdd.userId)) {
                haveCurrentUserInLeaderboard = true;
            }
        }
        if (!haveCurrentUserInLeaderboard && userLevelOrPointsMax > 0) {
            GameLeaderboard leaderboardOfCurrentUser = new GameLeaderboard(currentUser, userLevelOrPointsMax, apiApplication.leaderboardType == 2);
            leaderboardOfCurrentUser.place = leaderboards.size() + 1;
            leaderboards.add(leaderboardOfCurrentUser);
        }
        return new LeaderboardData(apiApplication, leaderboards, userLevelOrPointsMax, haveCurrentUserInLeaderboard);
    }
}
