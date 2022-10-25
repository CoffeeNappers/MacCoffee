package com.vkontakte.android.api.newsfeed;

import android.util.SparseArray;
import com.facebook.share.internal.ShareConstants;
import com.fasterxml.jackson.core.util.MinimalPrettyPrinter;
import com.vkontakte.android.Global;
import com.vkontakte.android.Log;
import com.vkontakte.android.NewsEntry;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.data.ServerKeys;
import com.vkontakte.android.data.VKFromList;
import com.vkontakte.android.navigation.ArgKeys;
import java.util.Vector;
import org.json.JSONArray;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class NewsfeedGetComments extends VKAPIRequest<VKFromList<NewsEntry>> {
    public NewsfeedGetComments(String from, int count) {
        super("newsfeed.getComments");
        if (from != null) {
            param(ServerKeys.START_FROM, from);
        }
        param(ServerKeys.COUNT, count).param(ShareConstants.WEB_DIALOG_PARAM_FILTERS, "post,photo,topic,video,market").param("last_comments_count", 3);
        param(ServerKeys.PHOTO_SIZES, 1);
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.vkontakte.android.api.VKAPIRequest
    /* renamed from: parse */
    public VKFromList<NewsEntry> mo1093parse(JSONObject o) {
        try {
            JSONArray items = o.getJSONObject(ServerKeys.RESPONSE).optJSONArray(ServerKeys.ITEMS);
            JSONArray profiles = o.getJSONObject(ServerKeys.RESPONSE).optJSONArray("profiles");
            JSONArray groups = o.getJSONObject(ServerKeys.RESPONSE).optJSONArray("groups");
            Vector<Integer> adminGroups = new Vector<>();
            VKFromList<NewsEntry> result = new VKFromList<>(o.getJSONObject(ServerKeys.RESPONSE).optString("next_from", null));
            if (items != null) {
                SparseArray<String> names = new SparseArray<>();
                SparseArray<String> photos = new SparseArray<>();
                if (profiles != null) {
                    for (int i = 0; i < profiles.length(); i++) {
                        int uid = profiles.getJSONObject(i).getInt("id");
                        names.put(uid, profiles.getJSONObject(i).getString("first_name") + MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR + profiles.getJSONObject(i).getString("last_name"));
                        photos.put(uid, profiles.getJSONObject(i).getString(Global.displayDensity > 1.0f ? "photo_100" : "photo_50"));
                    }
                }
                if (groups != null) {
                    for (int i2 = 0; i2 < groups.length(); i2++) {
                        int gid = groups.getJSONObject(i2).getInt("id");
                        names.put(-gid, groups.getJSONObject(i2).getString("name"));
                        photos.put(-gid, groups.getJSONObject(i2).getString(Global.displayDensity > 1.0f ? "photo_100" : "photo_50"));
                        if (groups.getJSONObject(i2).optInt(ArgKeys.IS_ADMIN, 0) == 1) {
                            adminGroups.add(Integer.valueOf(gid));
                        }
                    }
                }
                for (int i3 = 0; i3 < items.length(); i3++) {
                    NewsEntry e = new NewsEntry(items.getJSONObject(i3), null, names, photos);
                    if (e.ownerID < 0 && adminGroups.contains(Integer.valueOf(-e.ownerID))) {
                        e.flags |= 64;
                    }
                    result.add(e);
                }
                return result;
            }
            return result;
        } catch (Exception x) {
            Log.w("vk", x);
            return null;
        }
    }
}
