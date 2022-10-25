package com.vkontakte.android.api.newsfeed;

import android.support.annotation.Nullable;
import android.text.TextUtils;
import android.util.SparseArray;
import android.util.SparseBooleanArray;
import com.facebook.GraphRequest;
import com.facebook.appevents.AppEventsConstants;
import com.facebook.share.internal.ShareConstants;
import com.vk.stories.model.GetStoriesResponse;
import com.vkontakte.android.Global;
import com.vkontakte.android.NewsEntry;
import com.vkontakte.android.NewsfeedList;
import com.vkontakte.android.TimeUtils;
import com.vkontakte.android.VKApplication;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.attachments.Attachment;
import com.vkontakte.android.attachments.ShitAttachment;
import com.vkontakte.android.data.Analytics;
import com.vkontakte.android.data.ServerKeys;
import com.vkontakte.android.data.UserNotification;
import com.vkontakte.android.data.VKFromList;
import com.vkontakte.android.navigation.ArgKeys;
import com.vkontakte.android.statistics.StatisticUrl;
import com.vkontakte.android.utils.L;
import com.vkontakte.android.utils.Utils;
import io.fabric.sdk.android.services.events.EventsFilesManager;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Vector;
import org.json.JSONArray;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class NewsfeedGet extends VKAPIRequest<Response> implements ServerKeys {
    private static final String FEED_TYPE_RECENT = "recent";
    private static final String FEED_TYPE_TOP = "top";
    public static final int LIST_ID_FRIENDS = -2;
    public static final int LIST_ID_GROUPS = -3;
    public static final int LIST_ID_NEWS = 0;
    public static final int LIST_ID_PHOTOS = -4;
    public static final int LIST_ID_RECOMMENDATION = -1;
    public static final int LIST_ID_VIDEOS = -5;
    public static final int LIST_PROMO_SECTION = -10;
    public static final String METHOD_NAME = "execute.getNewsfeedSmart";
    private static final long REFRESH_TIMEOUT_DEFAULT = 600000;
    final String from;
    final String listRefer;
    final String promoList;

    /* loaded from: classes2.dex */
    public static class Response extends VKFromList<NewsEntry> {
        public Boolean isSmartNews;
        @Nullable
        public List<NewsfeedList> lists;
        @Nullable
        public List<NewsEntry> notifications;
        @Nullable
        public GetStoriesResponse stories;

        public Response(String from) {
            super(from);
            this.lists = null;
            this.notifications = null;
        }
    }

    public NewsfeedGet(String from, int count, int list) {
        this(from, count, list, null, null, -1, -1, -1, -1, false, null);
    }

    public NewsfeedGet(String from, int count, int list, String promoList, Boolean isSmartNews, int position, int lastPostOwnerId, int lastPostId, int awayTimeSec, boolean forceNotification, String listRefer) {
        super(METHOD_NAME);
        this.from = from;
        this.listRefer = listRefer;
        param("func_v", 2);
        param("connection_type", Utils.getConnectionType());
        param("connection_subtype", Utils.getConnectionSubtype());
        param("user_options", Utils.getUserOptions());
        param(ServerKeys.START_FROM, from);
        param(ServerKeys.COUNT, count);
        param(GraphRequest.FIELDS_PARAM, "id,first_name,first_name_dat,last_name,last_name_dat,sex,screen_name,photo_50,photo_100,online,video_files");
        if (forceNotification) {
            param("forced_notifications", 1);
        }
        switch (list) {
            case -5:
                param("extended", 1);
                break;
            case -4:
                param("return_banned", 1);
                break;
            case -1:
                param("feed_type", "recommended");
                break;
        }
        switch (list) {
            case -5:
                param(ShareConstants.WEB_DIALOG_PARAM_FILTERS, "video");
                break;
            case -4:
                param(ShareConstants.WEB_DIALOG_PARAM_FILTERS, "photo,photo_tag,wall_photo");
                break;
            default:
                param(ShareConstants.WEB_DIALOG_PARAM_FILTERS, Utils.getNewsFilterParams(ArgKeys.POST, "photo", "photo_tag", "friends_recomm", "app_widget", "ads_app", "ads_site", "ads_post", "ads_app_slider", "ads_app_video", "ads_post_pretty_cards"));
                break;
        }
        switch (list) {
            case -4:
                param("source_ids", "friends,following");
                break;
            case -3:
                param("source_ids", "groups,pages");
                break;
            case -2:
                param("source_ids", "friends,following");
                break;
            default:
                if (list > 0) {
                    param("source_ids", ArgKeys.LIST + list);
                    break;
                }
                break;
        }
        if (list == 0 && isSmartNews != null) {
            if (!TextUtils.equals(from, AppEventsConstants.EVENT_PARAM_VALUE_NO)) {
                param("feed_type", isSmartNews.booleanValue() ? FEED_TYPE_TOP : FEED_TYPE_RECENT);
            } else if (isStartFromInterestingPending()) {
                param("forced_feed_type", isSmartNews.booleanValue() ? FEED_TYPE_TOP : FEED_TYPE_RECENT);
            }
            if (position >= 0) {
                param("update_position", String.valueOf(position));
            }
            if (lastPostId >= 0 && lastPostOwnerId != 0) {
                param("update_post", lastPostOwnerId + EventsFilesManager.ROLL_OVER_FILE_NAME_SEPARATOR + lastPostId);
            }
            if (awayTimeSec >= 0) {
                param("update_away_time", String.valueOf(awayTimeSec));
            }
        }
        if (list != 0) {
            param("is_not_newsfeed", 1);
        }
        this.promoList = promoList;
        if (promoList != null) {
            param("feed_id", promoList);
        }
        param(ServerKeys.PHOTO_SIZES, 1);
        int last = VKApplication.context.getSharedPreferences(null, 0).getInt(UserNotification.LAST_GET_NOTIFY_APP, 0);
        if (last != 0) {
            param("last_request_notification_sec", (int) ((System.currentTimeMillis() / 1000) - last));
        }
        param("device_info", Utils.getDeviceInfo());
        param("app_package_id", VKApplication.context.getPackageName());
    }

    private static boolean isStartFromInterestingPending() {
        return VKApplication.context.getSharedPreferences(null, 0).getBoolean("start_from_interesting_pending", false);
    }

    public static void setStartFromInterestingPending(boolean b) {
        VKApplication.context.getSharedPreferences(null, 0).edit().putBoolean("start_from_interesting_pending", b).apply();
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.vkontakte.android.api.VKAPIRequest
    /* renamed from: parse */
    public Response mo1093parse(JSONObject jObj) throws Exception {
        try {
            JSONObject jResponse = jObj.getJSONObject(ServerKeys.RESPONSE);
            long refresh_timeout_recent = jResponse.optLong("refresh_timeout_recent", REFRESH_TIMEOUT_DEFAULT);
            long refresh_timeout_top = jResponse.optLong("refresh_timeout_top", REFRESH_TIMEOUT_DEFAULT);
            long refresh_timeout_recommended = jResponse.optLong("refresh_timeout_recommended", REFRESH_TIMEOUT_DEFAULT);
            VKApplication.context.getSharedPreferences(null, 0).edit().putLong("refresh_timeout_recent", refresh_timeout_recent).putLong("refresh_timeout_top", refresh_timeout_top).putLong("refresh_timeout_recommended", refresh_timeout_recommended).apply();
            Response newsEntries = parseNews(jResponse);
            Response newsEntries2 = parseStories(parseNotifications(parseFeedType(parseLists(newsEntries, jResponse), jResponse), jResponse), jResponse);
            setStartFromInterestingPending(false);
            return newsEntries2;
        } catch (Exception e) {
            L.e("error", jObj);
            return null;
        }
    }

    public static long getRefreshTimeout(boolean isTop, int listId) {
        String preferenceKey;
        switch (listId) {
            case -1:
                preferenceKey = "refresh_timeout_recommended";
                break;
            default:
                if (!isTop) {
                    preferenceKey = "refresh_timeout_recent";
                    break;
                } else {
                    preferenceKey = "refresh_timeout_top";
                    break;
                }
        }
        return VKApplication.context.getSharedPreferences(null, 0).getLong(preferenceKey, REFRESH_TIMEOUT_DEFAULT);
    }

    @Nullable
    Response parseStories(Response newsEntries, JSONObject jResponse) throws Exception {
        if (jResponse.has("stories")) {
            newsEntries.stories = new GetStoriesResponse(jResponse.getJSONObject("stories"));
        }
        return newsEntries;
    }

    @Nullable
    private Response parseNotifications(Response newsEntries, JSONObject jResponse) throws Exception {
        if (jResponse.has("notifications")) {
            VKApplication.context.getSharedPreferences(null, 0).edit().putInt(UserNotification.LAST_GET_NOTIFY_APP, (int) (System.currentTimeMillis() / 1000)).apply();
            if (newsEntries == null) {
                newsEntries = new Response(jResponse.optString("next_from", null));
            }
            List<UserNotification> notifications = UserNotification.parse(jResponse.optJSONObject("notifications"));
            if (notifications != null) {
                newsEntries.notifications = new ArrayList();
                for (int i = 0; i < notifications.size(); i++) {
                    NewsEntry entry = new NewsEntry(notifications.get(i));
                    entry.order_position = i - notifications.size();
                    newsEntries.notifications.add(i, entry);
                }
            }
        }
        return newsEntries;
    }

    @Nullable
    public Response parseFeedType(Response newsEntries, JSONObject jResponse) throws Exception {
        if (jResponse.has("feed_type")) {
            if (newsEntries == null) {
                newsEntries = new Response(jResponse.optString("next_from", null));
            }
            newsEntries.isSmartNews = Boolean.valueOf(TextUtils.equals(jResponse.optString("feed_type", FEED_TYPE_RECENT), FEED_TYPE_TOP));
        }
        return newsEntries;
    }

    @Nullable
    public Response parseLists(Response newsEntries, JSONObject jResponse) throws Exception {
        if (jResponse.has("sections") && !jResponse.isNull("sections")) {
            if (newsEntries == null) {
                newsEntries = new Response(jResponse.optString("next_from", null));
            }
            if (newsEntries.lists == null) {
                newsEntries.lists = new ArrayList();
            }
            JSONArray jsonArray = jResponse.getJSONArray("sections");
            for (int i = 0; i < jsonArray.length(); i++) {
                String type = String.valueOf(jsonArray.getJSONObject(i).optString("name"));
                if (jsonArray.getJSONObject(i).optInt("enabled") == 1) {
                    char c = 65535;
                    switch (type.hashCode()) {
                        case -1237460524:
                            if (type.equals("groups")) {
                                c = 3;
                                break;
                            }
                            break;
                        case -989034367:
                            if (type.equals("photos")) {
                                c = 0;
                                break;
                            }
                            break;
                        case -816678056:
                            if (type.equals("videos")) {
                                c = 1;
                                break;
                            }
                            break;
                        case -600094315:
                            if (type.equals("friends")) {
                                c = 2;
                                break;
                            }
                            break;
                    }
                    switch (c) {
                        case 0:
                            newsEntries.lists.add(new NewsfeedList(-4, type));
                            continue;
                        case 1:
                            newsEntries.lists.add(new NewsfeedList(-5, type));
                            continue;
                        case 2:
                            newsEntries.lists.add(new NewsfeedList(-2, type));
                            continue;
                        case 3:
                            newsEntries.lists.add(new NewsfeedList(-3, type));
                            continue;
                    }
                }
            }
        }
        if (jResponse.has("lists") && !jResponse.isNull("lists")) {
            if (newsEntries == null) {
                newsEntries = new Response(jResponse.optString("next_from", null));
            }
            if (newsEntries.lists == null) {
                newsEntries.lists = new ArrayList();
            }
            NewsfeedList.resetCounter();
            JSONArray jsonArray2 = jResponse.getJSONArray("lists");
            for (int i2 = 0; i2 < jsonArray2.length(); i2++) {
                JSONObject item = jsonArray2.getJSONObject(i2);
                Object id = item.get("id");
                if (id.equals(this.promoList) || (!item.optBoolean("hidden") && !item.optBoolean("is_hidden") && !item.optBoolean("is_unavailable"))) {
                    newsEntries.lists.add(new NewsfeedList(item));
                }
            }
        }
        return newsEntries;
    }

    @Nullable
    public Response parseNews(JSONObject jResponse) throws Exception {
        NewsEntry e;
        try {
            JSONArray jItems = jResponse.optJSONArray(ServerKeys.ITEMS);
            JSONArray jProfiles = jResponse.optJSONArray("profiles");
            JSONArray jGroups = jResponse.optJSONArray("groups");
            Vector<Integer> adminGroups = new Vector<>();
            Response result = new Response(jResponse.optString("next_from", null));
            if (jItems != null) {
                SparseArray<String> userNames = new SparseArray<>();
                SparseArray<String> userPhotos = new SparseArray<>();
                SparseBooleanArray userSex = new SparseBooleanArray();
                if (jProfiles != null) {
                    int length = jProfiles.length();
                    for (int i = 0; i < length; i++) {
                        JSONObject jItem = jProfiles.getJSONObject(i);
                        int uid = jItem.getInt("id");
                        userNames.put(uid, jItem.getString("first_name") + ' ' + jItem.getString("last_name"));
                        userPhotos.put(uid, jItem.getString(Global.displayDensity > 1.0f ? "photo_100" : "photo_50"));
                        userSex.put(uid, jItem.getInt("sex") == 1);
                    }
                }
                if (jGroups != null) {
                    int length2 = jGroups.length();
                    for (int i2 = 0; i2 < length2; i2++) {
                        JSONObject jItem2 = jGroups.getJSONObject(i2);
                        int gid = jItem2.getInt("id");
                        userNames.put(-gid, jItem2.getString("name"));
                        userPhotos.put(-gid, jItem2.getString(Global.displayDensity > 1.0f ? "photo_100" : "photo_50"));
                        if (jItem2.optInt(ArgKeys.IS_ADMIN, 0) == 1) {
                            adminGroups.add(Integer.valueOf(gid));
                        }
                    }
                }
                for (int i3 = 0; i3 < jItems.length(); i3++) {
                    JSONObject jItem3 = jItems.getJSONObject(i3);
                    if ("ads".equals(jItem3.optString(ServerKeys.TYPE))) {
                        e = NewsEntry.parseAd(jItem3, userNames, userPhotos, userSex, adminGroups, this.listRefer);
                        if (e != null) {
                            e.time = result.size() > 0 ? ((NewsEntry) result.get(result.size() - 1)).time + 1 : TimeUtils.getCurrentTime();
                            Iterator<Attachment> it = e.attachments.iterator();
                            while (it.hasNext()) {
                                Attachment att = it.next();
                                if (att instanceof ShitAttachment) {
                                    ShitAttachment ad = (ShitAttachment) att;
                                    for (StatisticUrl url : ad.getStatisticByType("load")) {
                                        Analytics.trackExternal(url);
                                    }
                                    Iterator<ShitAttachment.Card> it2 = ad.cards.iterator();
                                    while (it2.hasNext()) {
                                        ShitAttachment.Card card = it2.next();
                                        for (StatisticUrl url2 : card.getStatisticByType("load")) {
                                            Analytics.trackExternal(url2);
                                        }
                                    }
                                }
                            }
                        }
                    } else if ("friends_recomm".equals(jItem3.optString(ServerKeys.TYPE))) {
                        e = NewsEntry.parseFriendsRecomm(jItem3);
                    } else if ("app_widget".equals(jItem3.optString(ServerKeys.TYPE))) {
                        e = NewsEntry.parseWidget(jItem3);
                    } else {
                        e = new NewsEntry(jItem3, this.listRefer, userNames, userPhotos, userSex);
                        if (e.ownerID < 0 && adminGroups.contains(Integer.valueOf(-e.ownerID))) {
                            e.flags |= 64;
                        }
                    }
                    if (e != null) {
                        result.add(e);
                    }
                }
                return result;
            }
            return result;
        } catch (Exception x) {
            L.e(x, new Object[0]);
            return null;
        }
    }
}
