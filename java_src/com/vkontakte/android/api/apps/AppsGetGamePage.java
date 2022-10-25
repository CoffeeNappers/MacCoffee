package com.vkontakte.android.api.apps;

import android.support.annotation.NonNull;
import android.util.SparseArray;
import com.facebook.GraphRequest;
import com.vkontakte.android.Log;
import com.vkontakte.android.UserProfile;
import com.vkontakte.android.api.APIUtils;
import com.vkontakte.android.api.JSONArrayWithCount;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.data.ApiApplication;
import com.vkontakte.android.data.GameFeedEntry;
import com.vkontakte.android.data.GameLeaderboard;
import com.vkontakte.android.data.GameRequest;
import com.vkontakte.android.data.ServerKeys;
import com.vkontakte.android.data.db.Database;
import io.fabric.sdk.android.services.common.AbstractSpiCall;
import io.sentry.marshaller.json.JsonMarshaller;
import java.util.ArrayList;
import org.json.JSONArray;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class AppsGetGamePage extends VKAPIRequest<Result> implements ServerKeys {
    private static final String KEY_ACTIVITY = "activity";
    private static final String KEY_APPLICATION = "app";
    private static final String KEY_IS_MEMBER = "isMember";
    private static final String KEY_LIDERBOARDS = "liderboards";
    private static final String KEY_PROFILES = "profiles";
    private static final String KEY_REQUESTS = "requests";
    private final int appId;
    private final Database db;

    /* loaded from: classes2.dex */
    public static class Result {
        public final ApiApplication application;
        public boolean isMember;
        @NonNull
        public final ArrayList<UserProfile> userPlayed = new ArrayList<>();
        @NonNull
        public final ArrayList<GameRequest> requestsServerReal = new ArrayList<>();
        @NonNull
        public final ArrayList<GameRequest> requestsServer = new ArrayList<>();
        @NonNull
        public final ArrayList<GameRequest> requestsDb = new ArrayList<>();
        @NonNull
        public final ArrayList<GameFeedEntry> feed = new ArrayList<>();
        @NonNull
        public final ArrayList<GameLeaderboard> gameLeaderboards = new ArrayList<>();

        public Result(ApiApplication application) {
            this.application = application;
        }
    }

    public AppsGetGamePage(int appId, Database db) {
        super("execute.getGamePage");
        param(JsonMarshaller.PLATFORM, AbstractSpiCall.ANDROID_CLIENT_TYPE);
        param(ServerKeys.TYPE, "points");
        this.appId = appId;
        param("app_id", appId);
        param(GraphRequest.FIELDS_PARAM, "online,photo_100,photo_50,photo_200,sex");
        this.db = db;
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.vkontakte.android.api.VKAPIRequest
    /* renamed from: parse */
    public Result mo1093parse(JSONObject o) {
        Result result;
        try {
            JSONObject o2 = o.getJSONObject(ServerKeys.RESPONSE);
            if (o2.has("app") && !o2.isNull("app")) {
                result = new Result(new ApiApplication(o2.getJSONObject("app")));
            } else {
                result = new Result(null);
            }
            if (o2.has(KEY_IS_MEMBER) && !o2.isNull(KEY_IS_MEMBER)) {
                result.isMember = o2.optInt(KEY_IS_MEMBER, 0) != 0 || o2.optBoolean(KEY_IS_MEMBER, false);
            }
            SparseArray<UserProfile> profiles = new SparseArray<>();
            SparseArray<ApiApplication> applications = new SparseArray<>();
            AppsGetGamesPage.parseProfiles(o2, profiles, KEY_REQUESTS);
            AppsGetGamesPage.parseProfiles(o2, profiles, KEY_ACTIVITY);
            JSONArray jsonArray = o2.optJSONArray(KEY_PROFILES);
            if (jsonArray != null) {
                for (int i = 0; i < jsonArray.length(); i++) {
                    UserProfile userProfile = new UserProfile(jsonArray.getJSONObject(i));
                    profiles.put(userProfile.uid, userProfile);
                    result.userPlayed.add(userProfile);
                }
            }
            AppsGetGamesPage.parseApplications(o2, applications, KEY_REQUESTS);
            AppsGetGamesPage.parseApplications(o2, applications, KEY_ACTIVITY);
            result.requestsDb.addAll(this.db.getRequests(this.appId, profiles));
            JSONArrayWithCount arrayWithCount = APIUtils.unwrapArray(o2, KEY_REQUESTS);
            if (arrayWithCount != null) {
                JSONArray requestsJson = arrayWithCount.array;
                for (int i2 = requestsJson.length() - 1; i2 >= 0; i2--) {
                    GameRequest request = new GameRequest(requestsJson.getJSONObject(i2), profiles, applications);
                    if (request.type != 1 && request.appId == result.application.id) {
                        if (!result.requestsDb.contains(request)) {
                            result.requestsServer.add(request);
                        }
                        result.requestsServerReal.add(request);
                    }
                }
            }
            JSONArrayWithCount arrayWithCount2 = APIUtils.unwrapArray(o2, KEY_ACTIVITY);
            if (arrayWithCount2 != null) {
                JSONArray feedsJson = arrayWithCount2.array;
                for (int i3 = 0; i3 < feedsJson.length(); i3++) {
                    GameFeedEntry gfe = new GameFeedEntry(feedsJson.getJSONObject(i3), profiles, applications);
                    if (gfe.user != null && gfe.app != null) {
                        result.feed.add(gfe);
                    }
                }
            }
            if (o2.optJSONObject(KEY_LIDERBOARDS) == null) {
                return result;
            }
            AppsGetGamesPage.parseProfiles(o2, profiles, KEY_LIDERBOARDS);
            JSONArray leaderboardsJson = APIUtils.unwrapArray(o2, KEY_LIDERBOARDS).array;
            for (int i4 = 0; i4 < leaderboardsJson.length(); i4++) {
                result.gameLeaderboards.add(new GameLeaderboard(leaderboardsJson.getJSONObject(i4), profiles));
            }
            return result;
        } catch (Exception x) {
            Log.w("vk", x);
            return null;
        }
    }
}
