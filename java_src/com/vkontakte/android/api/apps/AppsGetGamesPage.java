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
import com.vkontakte.android.data.Friends;
import com.vkontakte.android.data.GameFeedEntry;
import com.vkontakte.android.data.GameGenre;
import com.vkontakte.android.data.GameRequest;
import com.vkontakte.android.data.ServerKeys;
import io.fabric.sdk.android.services.common.AbstractSpiCall;
import io.sentry.marshaller.json.JsonMarshaller;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class AppsGetGamesPage extends VKAPIRequest<Result> implements Comparator<ApiApplication>, ServerKeys {
    private static final String KEY_ACTIVITY = "activity";
    private static final String KEY_APPS = "apps";
    private static final String KEY_CATALOG = "catalog";
    private static final String KEY_CATALOG_FEATURED = "catalogFeatured";
    private static final String KEY_CATALOG_HTML5 = "catalogHtml5";
    private static final String KEY_CATALOG_MY = "catalogMy";
    private static final String KEY_CATALOG_MY_HTML5 = "catalogMyHtml5";
    private static final String KEY_CATALOG_NEW = "catalogNew";
    private static final String KEY_FRIENDS = "friends";
    private static final String KEY_PROFILES = "profiles";
    private static final String KEY_REQUESTS_ANDROID = "requestsAndroid";
    private static final String KEY_REQUESTS_HTML5 = "requestsHtml";
    private static final String KEY_SECTIONS = "sections";

    /* loaded from: classes2.dex */
    public static class Result {
        @NonNull
        public final ArrayList<GameRequest> invites = new ArrayList<>();
        @NonNull
        public final ArrayList<GameRequest> requests = new ArrayList<>();
        @NonNull
        public final ArrayList<GameFeedEntry> feed = new ArrayList<>();
        @NonNull
        public final ArrayList<ApiApplication> myCatalog = new ArrayList<>();
        @NonNull
        public final ArrayList<ApiApplication> myCatalogHtml5 = new ArrayList<>();
        @NonNull
        public final ArrayList<ApiApplication> html5Catalog = new ArrayList<>();
        @NonNull
        public final ArrayList<ApiApplication> newCatalog = new ArrayList<>();
        @NonNull
        public final ArrayList<ApiApplication> featuredCatalog = new ArrayList<>();
        @NonNull
        public final ArrayList<ApiApplication> catalog = new ArrayList<>();
        @NonNull
        public final ArrayList<GameGenre> genres = new ArrayList<>();
        public final ArrayList<GameRequest> invitesAndRequests = new ArrayList<>();
    }

    public AppsGetGamesPage() {
        super("execute.getGamesPage");
        param("func_v", 4);
        param(JsonMarshaller.PLATFORM, AbstractSpiCall.ANDROID_CLIENT_TYPE);
        param(GraphRequest.FIELDS_PARAM, "online,photo_100,photo_200,photo_50,sex");
    }

    @Override // com.vkontakte.android.api.VKAPIRequest
    /* renamed from: parse */
    public Result mo1093parse(JSONObject o) {
        try {
            Result result = new Result();
            SparseArray<UserProfile> profiles = new SparseArray<>();
            SparseArray<ApiApplication> applications = new SparseArray<>();
            JSONObject o2 = o.getJSONObject(ServerKeys.RESPONSE);
            parseCatalog(o2, result.myCatalog, KEY_CATALOG_MY);
            parseCatalog(o2, result.myCatalogHtml5, KEY_CATALOG_MY_HTML5);
            parseCatalog(o2, result.html5Catalog, KEY_CATALOG_HTML5);
            parseCatalog(o2, result.newCatalog, KEY_CATALOG_NEW);
            parseCatalog(o2, result.featuredCatalog, KEY_CATALOG_FEATURED);
            parseCatalog(o2, result.catalog, KEY_CATALOG);
            parseProfiles(o2, profiles, KEY_REQUESTS_ANDROID);
            parseProfiles(o2, profiles, KEY_REQUESTS_HTML5);
            parseProfiles(o2, profiles, KEY_ACTIVITY);
            parseApplications(o2, applications, KEY_REQUESTS_ANDROID);
            parseApplications(o2, applications, KEY_REQUESTS_HTML5);
            parseApplications(o2, applications, KEY_ACTIVITY);
            SparseArray<Integer> countRequest = new SparseArray<>();
            JSONArray requestsJsonAndroid = APIUtils.unwrapArray(o2, KEY_REQUESTS_ANDROID).array;
            JSONArray requestsJsonHtml = APIUtils.unwrapArray(o2, KEY_REQUESTS_HTML5).array;
            ArrayList<GameRequest> allRequestsAndInvites = getAllRequestsAndInvites(requestsJsonAndroid, requestsJsonHtml, profiles, applications);
            ArrayList<GameRequest> unreadInvitesAndRequests = new ArrayList<>();
            ArrayList<GameRequest> readInvitesAndRequests = new ArrayList<>();
            for (int i = 0; i < allRequestsAndInvites.size(); i++) {
                GameRequest request = allRequestsAndInvites.get(i);
                if (request.type == 1) {
                    result.invites.add(request);
                } else {
                    if (request.appId != 0) {
                        int count = countRequest.get(request.appId, 0).intValue();
                        countRequest.append(request.appId, Integer.valueOf(count + 1));
                    }
                    result.requests.add(request);
                }
                if (request.unread) {
                    unreadInvitesAndRequests.add(request);
                } else {
                    readInvitesAndRequests.add(request);
                }
            }
            result.invitesAndRequests.addAll(unreadInvitesAndRequests);
            result.invitesAndRequests.addAll(readInvitesAndRequests);
            for (int i2 = 0; i2 < countRequest.size(); i2++) {
                setNotificationCountToAppInList(result.myCatalog, countRequest.keyAt(i2), countRequest.valueAt(i2).intValue());
                setNotificationCountToAppInList(result.newCatalog, countRequest.keyAt(i2), countRequest.valueAt(i2).intValue());
            }
            Collections.sort(result.myCatalog, this);
            Collections.sort(result.newCatalog, this);
            JSONArray feedsJson = APIUtils.unwrapArray(o2, KEY_ACTIVITY).array;
            for (int i3 = 0; i3 < feedsJson.length(); i3++) {
                GameFeedEntry gfe = new GameFeedEntry(feedsJson.getJSONObject(i3), profiles, applications);
                if (gfe.user != null && gfe.app != null) {
                    result.feed.add(gfe);
                }
            }
            JSONArray genresArray = APIUtils.unwrapArray(o2, KEY_SECTIONS).array;
            for (int i4 = 0; i4 < genresArray.length(); i4++) {
                GameGenre genre = new GameGenre(genresArray.getJSONObject(i4));
                result.genres.add(genre);
            }
            return result;
        } catch (Exception x) {
            Log.w("vk", x);
            return null;
        }
    }

    private ArrayList<GameRequest> getAllRequestsAndInvites(JSONArray requestsJsonAndroid, JSONArray requestsJsonHtml, SparseArray<UserProfile> profiles, SparseArray<ApiApplication> applications) throws JSONException {
        Comparator comparator;
        ArrayList<GameRequest> allRequests = new ArrayList<>();
        for (int i = 0; i < requestsJsonAndroid.length(); i++) {
            allRequests.add(new GameRequest(requestsJsonAndroid.getJSONObject(i), profiles, applications));
        }
        for (int i2 = 0; i2 < requestsJsonHtml.length(); i2++) {
            allRequests.add(new GameRequest(requestsJsonHtml.getJSONObject(i2), profiles, applications));
        }
        comparator = AppsGetGamesPage$$Lambda$1.instance;
        Collections.sort(allRequests, comparator);
        return allRequests;
    }

    public static /* synthetic */ int lambda$getAllRequestsAndInvites$0(GameRequest gr1, GameRequest gr2) {
        return gr1.time - gr2.time;
    }

    private static void setNotificationCountToAppInList(List<ApiApplication> apps, int id, int count) {
        for (ApiApplication app : apps) {
            if (app.id == id) {
                app.notificationCount = count;
                return;
            }
        }
    }

    @Override // java.util.Comparator
    public int compare(ApiApplication lhs, ApiApplication rhs) {
        if (lhs.notificationCount == 0 && rhs.notificationCount == 0) {
            return 0;
        }
        return lhs.notificationCount < rhs.notificationCount ? 1 : -1;
    }

    private static void parseCatalog(@NonNull JSONObject o, @NonNull List<ApiApplication> catalog, @NonNull String key) throws JSONException {
        JSONArrayWithCount jsonArrayWithCount = APIUtils.unwrapArray(o, key);
        if (jsonArrayWithCount != null) {
            JSONArray catalogJson = jsonArrayWithCount.array;
            for (int i = 0; i < catalogJson.length(); i++) {
                ApiApplication app = new ApiApplication(catalogJson.getJSONObject(i));
                JSONArray friendsIds = catalogJson.getJSONObject(i).optJSONArray("friends");
                if (friendsIds != null) {
                    for (int j = 0; j < friendsIds.length(); j++) {
                        int id = friendsIds.getInt(j);
                        UserProfile user = Friends.get(id);
                        if (user != null) {
                            app.friendsPhotos.add(user.photo);
                        }
                    }
                    app.friends = friendsIds.length();
                }
                catalog.add(app);
            }
        }
    }

    public static void parseApplications(@NonNull JSONObject o, @NonNull SparseArray<ApiApplication> apps, @NonNull String key) throws JSONException {
        if (o.has(key) && !o.isNull(key)) {
            JSONArray apps1 = o.getJSONObject(key).getJSONArray(KEY_APPS);
            for (int i = 0; i < apps1.length(); i++) {
                ApiApplication app = new ApiApplication(apps1.getJSONObject(i));
                apps.put(app.id, app);
            }
        }
    }

    public static void parseProfiles(@NonNull JSONObject o, @NonNull SparseArray<UserProfile> profiles, @NonNull String key) throws JSONException {
        if (o.has(key) && !o.isNull(key)) {
            JSONArray profiles1 = o.getJSONObject(key).getJSONArray(KEY_PROFILES);
            for (int i = 0; i < profiles1.length(); i++) {
                UserProfile p = new UserProfile(profiles1.getJSONObject(i));
                profiles.put(p.uid, p);
            }
        }
    }
}
