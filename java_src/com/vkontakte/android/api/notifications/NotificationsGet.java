package com.vkontakte.android.api.notifications;

import android.text.TextUtils;
import android.util.SparseArray;
import com.facebook.GraphRequest;
import com.facebook.share.internal.ShareConstants;
import com.fasterxml.jackson.core.util.MinimalPrettyPrinter;
import com.vk.webapp.ReportAppInputData;
import com.vkontakte.android.Global;
import com.vkontakte.android.Log;
import com.vkontakte.android.MoneyTransfer;
import com.vkontakte.android.NewsEntry;
import com.vkontakte.android.R;
import com.vkontakte.android.UserProfile;
import com.vkontakte.android.VKApplication;
import com.vkontakte.android.api.APIUtils;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.api.models.Notification;
import com.vkontakte.android.attachments.VideoAttachment;
import com.vkontakte.android.data.Posts;
import com.vkontakte.android.data.ServerKeys;
import com.vkontakte.android.navigation.ArgKeys;
import com.vkontakte.android.ui.posts.PostDisplayItem;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.json.JSONTokener;
/* loaded from: classes2.dex */
public class NotificationsGet extends VKAPIRequest<Result> {
    private boolean fromCache;
    private boolean mFoundDividers;
    private boolean updateCache;

    /* loaded from: classes2.dex */
    public static class Result {
        public boolean foundDividers = false;
        public List<Notification> n;
        public String newFrom;
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public NotificationsGet(String from, int count, boolean fromCache, boolean foundDividers) {
        super("execute.getNotifications");
        boolean z = true;
        param(ServerKeys.COUNT, count).param(ServerKeys.START_FROM, from);
        String filters = VKApplication.context.getSharedPreferences(null, 0).getString("notifications_filter", "wall,mentions,comments,likes,reposts,followers,friends,market,money_transfers");
        if (filters.contains("money_transfers")) {
            filters.replace("money_transfers", "money_transfer_received,money_transfer_accepted,money_transfer_declined");
        }
        param(ShareConstants.WEB_DIALOG_PARAM_FILTERS, TextUtils.join(",", new String[]{filters.replace('|', ',')}));
        if (filters.length() == 0) {
            param(ShareConstants.WEB_DIALOG_PARAM_FILTERS, "_none");
        }
        param(ServerKeys.PHOTO_SIZES, 1);
        param(GraphRequest.FIELDS_PARAM, "sex,online,photo_50,photo_100,photo_200,first_name_gen,last_name_gen,first_name_dat,last_name_dat");
        this.mFoundDividers = foundDividers;
        if (fromCache || (from != null && from.length() != 0)) {
            z = false;
        }
        this.updateCache = z;
        this.fromCache = fromCache;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.vkontakte.android.api.VKAPIRequest
    public JSONObject doExec() {
        if (this.fromCache) {
            try {
                File f = new File(VKApplication.context.getCacheDir(), "replies_v3");
                if (!f.exists()) {
                    return null;
                }
                FileInputStream s = new FileInputStream(f);
                byte[] d = new byte[(int) f.length()];
                s.read(d);
                s.close();
                JSONObject o = (JSONObject) new JSONTokener(new String(d, "UTF-8")).nextValue();
                if (this.params.get("v").equals(o.optString("v"))) {
                    return o;
                }
                return null;
            } catch (Exception x) {
                Log.w("vk", x);
            }
        }
        return null;
    }

    void makeKosherPost(NewsEntry entry, SparseArray<UserProfile> users) {
        if (entry.userID == 0) {
            entry.userID = entry.ownerID;
        }
        UserProfile profile = users.get(entry.userID);
        if (profile != null) {
            entry.userName = profile.fullName;
            entry.userPhotoURL = profile.photo;
        }
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.vkontakte.android.api.VKAPIRequest
    /* renamed from: parse */
    public Result mo1093parse(JSONObject o) throws JSONException {
        String optString;
        try {
            if (this.updateCache) {
                updateCache(o);
            }
            JSONObject response = o.getJSONObject(ServerKeys.RESPONSE);
            JSONArray items = response.optJSONArray(ServerKeys.ITEMS);
            JSONArray profiles = response.optJSONArray("profiles");
            JSONArray groups = response.optJSONArray("groups");
            int lastView = response.optInt("last_viewed");
            ArrayList<Notification> result = new ArrayList<>();
            SparseArray<UserProfile> users = new SparseArray<>();
            SparseArray<String> names = new SparseArray<>();
            SparseArray<String> photos = new SparseArray<>();
            parseProfiles(profiles, users, names, photos);
            parseGroups(groups, users, names, photos);
            int id = 0;
            for (int i = 0; i < items.length(); i++) {
                JSONObject it = items.getJSONObject(i);
                Notification e = new Notification();
                e.id = id;
                e.date = it.optInt(ServerKeys.DATE);
                e.type = Notification.Type.parse(it.getString(ServerKeys.TYPE));
                switch (e.type.parentType) {
                    case Photo:
                        e.parentPost = NewsEntry.parsePhoto(it.getJSONObject("parent"));
                        makeKosherPost(e.parentPost, users);
                        break;
                    case Video:
                        e.parentPost = NewsEntry.parseVideo(it.getJSONObject("parent"));
                        e.link = ((VideoAttachment) e.parentPost.attachments.get(0)).video.title;
                        makeKosherPost(e.parentPost, users);
                        break;
                    case Post:
                        e.parentPost = new NewsEntry(it.getJSONObject("parent"), null, names, photos);
                        e.link = e.parentPost.displayablePreviewText;
                        makeKosherPost(e.parentPost, users);
                        break;
                    case Topic:
                        e.parentPost = NewsEntry.parseTopic(it.getJSONObject("parent"));
                        break;
                    case Market:
                        e.parentPost = NewsEntry.parseMarket(it.getJSONObject("parent").getJSONObject(ReportAppInputData.REPORT_TYPE_MARKET), null);
                        e.link = e.parentPost.displayablePreviewText;
                        makeKosherPost(e.parentPost, users);
                        break;
                    case Comment:
                        JSONObject parent = it.getJSONObject("parent");
                        e.parentPost = new NewsEntry(parent, null, names, photos);
                        e.parentPost.text = e.parentPost.text.replaceAll("<a href='[^']+'>([^<]+)</a>", "$1");
                        e.link = e.parentPost.displayablePreviewText;
                        makeKosherPost(e.parentPost, users);
                        switch (e.type.grandParentType) {
                            case Photo:
                                e.grandParentPost = NewsEntry.parsePhoto(parent.getJSONObject("photo"));
                                makeKosherPost(e.grandParentPost, users);
                                break;
                            case Video:
                                e.grandParentPost = NewsEntry.parseVideo(parent.getJSONObject("video"));
                                makeKosherPost(e.grandParentPost, users);
                                break;
                            case Post:
                                e.grandParentPost = new NewsEntry(parent.getJSONObject(ArgKeys.POST), null, names, photos);
                                makeKosherPost(e.grandParentPost, users);
                                break;
                            case Topic:
                                e.grandParentPost = NewsEntry.parseTopic(parent.getJSONObject("topic"));
                                makeKosherPost(e.grandParentPost, users);
                                break;
                            case Market:
                                e.grandParentPost = NewsEntry.parseMarket(parent.getJSONObject(ReportAppInputData.REPORT_TYPE_MARKET), null);
                                makeKosherPost(e.grandParentPost, users);
                                break;
                        }
                }
                switch (e.type.feedbackType) {
                    case Users:
                        JSONArray fb = APIUtils.unwrapArray(it, "feedback").array;
                        e.feedBackUsers = new ArrayList();
                        for (int j = 0; j < fb.length(); j++) {
                            e.feedBackUsers.add(users.get(fb.getJSONObject(j).optInt(ServerKeys.FROM_ID)));
                        }
                        break;
                    case Copy:
                        JSONArray fb2 = APIUtils.unwrapArray(it, "feedback").array;
                        e.feedBackUsers = new ArrayList();
                        for (int j2 = 0; j2 < fb2.length(); j2++) {
                            e.feedBackUsers.add(users.get(fb2.getJSONObject(j2).optInt(ServerKeys.FROM_ID)));
                        }
                        break;
                    case Comment:
                        JSONObject feedback = it.getJSONObject("feedback");
                        boolean hasAttach = feedback.has("attachments");
                        e.commentUser = users.get(feedback.optInt(ServerKeys.FROM_ID));
                        e.commentID = feedback.optInt(feedback.has("id") ? "id" : "cid");
                        if (e.type.parentType == Notification.ParentType.Topic) {
                            optString = feedback.optString("text").replaceAll("\\[id(\\d+):bp-(\\d+)_(\\d+)\\|([^\\]]+)\\]", "$4");
                        } else {
                            optString = feedback.optString("text");
                        }
                        e.setText(optString, hasAttach);
                        break;
                    case MoneyTransfer:
                        e.moneyTransfer = new MoneyTransfer(it.getJSONObject("feedback"));
                        UserProfile fromUser = users.get(e.moneyTransfer.from_id);
                        if (fromUser != null) {
                            e.moneyTransfer.fromUser = fromUser;
                        }
                        UserProfile toUser = users.get(e.moneyTransfer.to_id);
                        if (toUser != null) {
                            e.moneyTransfer.toUser = toUser;
                        }
                        e.feedBackUsers = new ArrayList();
                        UserProfile up = users.get(e.moneyTransfer.getPeerId());
                        if (up != null) {
                            e.feedBackUsers.add(users.get(e.moneyTransfer.getPeerId()));
                            break;
                        } else {
                            Log.w("NotificationsGet", "No user profile for user " + e.moneyTransfer.getPeerId());
                            break;
                        }
                    case Post:
                        NewsEntry entry = new NewsEntry(it.getJSONObject("feedback"), null, names, photos);
                        entry.time = e.date;
                        List<PostDisplayItem> postDisplayItems = Posts.buildItems(entry, false, "", true, false, null, true, "", 0);
                        for (int j3 = 0; j3 < postDisplayItems.size(); j3++) {
                            PostDisplayItem item = postDisplayItems.get(j3);
                            Notification notification = new Notification();
                            notification.type = e.type;
                            notification.item = item;
                            notification.date = e.date;
                            notification.parentPost = entry;
                            result.add(notification);
                            id++;
                        }
                        continue;
                }
                if (e.type != Notification.Type.Unknown) {
                    result.add(e);
                    id++;
                } else {
                    Log.e("vk", "Unknown notification type " + e.type);
                }
            }
            Result r = new Result();
            boolean foundNew = false;
            int i2 = 0;
            while (true) {
                if (i2 < result.size()) {
                    Notification entry2 = result.get(i2);
                    if (!this.mFoundDividers) {
                        if (entry2.date > lastView && !foundNew) {
                            foundNew = true;
                            Notification e2 = new Notification();
                            e2.type = Notification.Type.Header;
                            e2.setText(VKApplication.context.getString(R.string.new_replies));
                            result.add(i2, e2);
                            i2++;
                        } else if (entry2.date < lastView) {
                            Notification e3 = new Notification();
                            e3.type = Notification.Type.Header;
                            e3.setText(VKApplication.context.getString(R.string.viewed_replies));
                            r.foundDividers = true;
                            result.add(i2, e3);
                        }
                    }
                    entry2.id = i2;
                    i2++;
                }
            }
            ArrayList<Notification> tmp = new ArrayList<>();
            ArrayList<String> buf = new ArrayList<>();
            Notification curGroup = null;
            for (int i3 = 0; i3 < result.size(); i3++) {
                Notification e4 = result.get(i3);
                if (e4.type.feedbackType != Notification.FeedbackType.Copy && e4.type.feedbackType != Notification.FeedbackType.Users) {
                    if (curGroup != null) {
                        if (curGroup.group == null) {
                            curGroup.group = new ArrayList();
                        }
                        if (curGroup.group.size() > 0) {
                            tmp.add(curGroup);
                        }
                        curGroup = null;
                    }
                    tmp.add(e4);
                } else {
                    if (buf.size() == 2) {
                        buf.remove(0);
                    }
                    String ss = e4.type.feedbackType.ordinal() + "," + e4.type.activity.ordinal() + "," + e4.type.parentType.ordinal();
                    if (e4.feedBackUsers != null) {
                        for (UserProfile p : e4.feedBackUsers) {
                            ss = ss + "," + p.uid;
                        }
                    }
                    buf.add(ss);
                    if (buf.size() == 2 && buf.get(0).equals(buf.get(1))) {
                        if (curGroup == null) {
                            curGroup = new Notification();
                            curGroup.type = Notification.Type.Grouped;
                            curGroup.date = e4.date;
                            curGroup.group = new ArrayList();
                            tmp.add(e4);
                        } else {
                            curGroup.group.add(e4);
                        }
                    } else if (curGroup != null) {
                        if (curGroup.group.size() > 0) {
                            tmp.add(curGroup);
                        }
                        curGroup = null;
                        tmp.add(e4);
                    } else {
                        tmp.add(e4);
                    }
                }
            }
            if (curGroup != null && curGroup.group.size() > 0) {
                tmp.add(curGroup);
            }
            r.n = tmp;
            r.newFrom = response.optString("next_from");
            r.foundDividers = this.mFoundDividers;
            return r;
        } catch (Exception e5) {
            throw new RuntimeException(e5);
        }
    }

    private void parseGroups(JSONArray groups, SparseArray<UserProfile> users, SparseArray<String> names, SparseArray<String> photos) throws JSONException {
        if (groups != null) {
            for (int i = 0; i < groups.length(); i++) {
                int gid = groups.getJSONObject(i).getInt("id");
                names.put(-gid, groups.getJSONObject(i).getString("name"));
                photos.put(-gid, groups.getJSONObject(i).getString(Global.displayDensity > 1.0f ? "photo_100" : "photo_50"));
                UserProfile p = new UserProfile();
                p.uid = -gid;
                p.fullName = groups.getJSONObject(i).getString("name");
                p.photo = groups.getJSONObject(i).getString(Global.displayDensity > 1.0f ? "photo_100" : "photo_50");
                users.put(-gid, p);
            }
        }
    }

    private void parseProfiles(JSONArray profiles, SparseArray<UserProfile> users, SparseArray<String> names, SparseArray<String> photos) throws JSONException {
        if (profiles != null) {
            for (int i = 0; i < profiles.length(); i++) {
                int uid = profiles.getJSONObject(i).getInt("id");
                names.put(uid, profiles.getJSONObject(i).getString("first_name") + MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR + profiles.getJSONObject(i).getString("last_name"));
                photos.put(uid, profiles.getJSONObject(i).getString(Global.displayDensity > 1.0f ? "photo_100" : "photo_50"));
                UserProfile p = new UserProfile();
                p.uid = uid;
                p.firstName = profiles.getJSONObject(i).getString("first_name");
                p.lastName = profiles.getJSONObject(i).getString("last_name");
                p.fullName = p.firstName + MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR + p.lastName;
                p.f = profiles.getJSONObject(i).getInt("sex") == 1;
                p.photo = profiles.getJSONObject(i).getString(Global.displayDensity > 1.0f ? "photo_100" : "photo_50");
                users.put(uid, p);
            }
        }
    }

    private void updateCache(JSONObject o) {
        try {
            o.put("v", this.params.get("v"));
            File f = new File(VKApplication.context.getCacheDir(), "replies");
            if (f.exists()) {
                f.delete();
            }
            f.createNewFile();
            FileOutputStream os = new FileOutputStream(f);
            os.write(o.toString().getBytes("UTF-8"));
            os.close();
        } catch (Exception e) {
        }
    }
}
