package com.vkontakte.android.api.wall;

import android.text.TextUtils;
import android.util.SparseArray;
import com.facebook.GraphRequest;
import com.fasterxml.jackson.core.util.MinimalPrettyPrinter;
import com.vkontakte.android.Global;
import com.vkontakte.android.Log;
import com.vkontakte.android.NewsEntry;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.data.ServerKeys;
import org.json.JSONArray;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class WallGetById extends VKAPIRequest<NewsEntry[]> {
    public String gphoto;
    public String gtitle;

    public WallGetById(String[] idsArray) {
        super("wall.getById");
        param("posts", TextUtils.join(",", idsArray));
        param("extended", 1).param(GraphRequest.FIELDS_PARAM, "photo_100,photo_50,sex,video_files");
        param(ServerKeys.PHOTO_SIZES, 1);
    }

    @Override // com.vkontakte.android.api.VKAPIRequest
    /* renamed from: parse  reason: collision with other method in class */
    public NewsEntry[] mo1093parse(JSONObject o) {
        try {
            JSONArray items = o.getJSONObject(ServerKeys.RESPONSE).optJSONArray(ServerKeys.ITEMS);
            JSONArray profiles = o.getJSONObject(ServerKeys.RESPONSE).optJSONArray("profiles");
            JSONArray groups = o.getJSONObject(ServerKeys.RESPONSE).optJSONArray("groups");
            if (items == null) {
                return new NewsEntry[0];
            }
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
                    int uid2 = -groups.getJSONObject(i2).getInt("id");
                    names.put(uid2, groups.getJSONObject(i2).getString("name"));
                    photos.put(uid2, groups.getJSONObject(i2).getString(Global.displayDensity > 1.0f ? "photo_100" : "photo_50"));
                }
            }
            return doParse(names, photos, items);
        } catch (Exception x) {
            Log.w("vk", x);
            return null;
        }
    }

    private NewsEntry[] doParse(SparseArray<String> names, SparseArray<String> photos, JSONArray items) throws Exception {
        NewsEntry[] result = new NewsEntry[items.length()];
        for (int i = 0; i < items.length(); i++) {
            result[i] = new NewsEntry(items.getJSONObject(i), null, names, photos);
        }
        return result;
    }
}
