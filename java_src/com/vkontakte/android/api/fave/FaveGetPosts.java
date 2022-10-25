package com.vkontakte.android.api.fave;

import android.util.SparseArray;
import android.util.SparseBooleanArray;
import com.fasterxml.jackson.core.util.MinimalPrettyPrinter;
import com.vkontakte.android.Global;
import com.vkontakte.android.Log;
import com.vkontakte.android.NewsEntry;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.data.Parser;
import com.vkontakte.android.data.ServerKeys;
import com.vkontakte.android.data.VKList;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class FaveGetPosts extends VKAPIRequest<VKList<NewsEntry>> {
    public FaveGetPosts(int offset, int count) {
        super("fave.getPosts");
        param(ServerKeys.PHOTO_SIZES, 1);
        param("offset", offset).param(ServerKeys.COUNT, count);
        param("extended", 1);
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.vkontakte.android.api.VKAPIRequest
    /* renamed from: parse */
    public VKList<NewsEntry> mo1093parse(JSONObject o) {
        try {
            JSONArray profiles1 = o.getJSONObject(ServerKeys.RESPONSE).optJSONArray("profiles");
            JSONArray profiles2 = o.getJSONObject(ServerKeys.RESPONSE).optJSONArray("groups");
            final SparseArray<String> names = new SparseArray<>();
            final SparseArray<String> photos = new SparseArray<>();
            final SparseBooleanArray f = new SparseBooleanArray();
            if (profiles1 != null) {
                for (int i = 0; i < profiles1.length(); i++) {
                    int uid = profiles1.getJSONObject(i).getInt("id");
                    names.put(uid, profiles1.getJSONObject(i).getString("first_name") + MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR + profiles1.getJSONObject(i).getString("last_name"));
                    photos.put(uid, profiles1.getJSONObject(i).getString(Global.displayDensity > 1.0f ? "photo_100" : "photo_50"));
                    f.put(uid, profiles1.getJSONObject(i).getInt("sex") == 1);
                }
            }
            if (profiles2 != null) {
                for (int i2 = 0; i2 < profiles2.length(); i2++) {
                    int uid2 = -profiles2.getJSONObject(i2).getInt("id");
                    names.put(uid2, profiles2.getJSONObject(i2).getString("name"));
                    photos.put(uid2, profiles2.getJSONObject(i2).getString(Global.displayDensity > 1.0f ? "photo_100" : "photo_50"));
                }
            }
            return new VKList<>(o.getJSONObject(ServerKeys.RESPONSE), new Parser<NewsEntry>() { // from class: com.vkontakte.android.api.fave.FaveGetPosts.1
                /* JADX WARN: Can't rename method to resolve collision */
                @Override // com.vkontakte.android.data.Parser
                /* renamed from: parse */
                public NewsEntry mo821parse(JSONObject o2) throws JSONException {
                    return new NewsEntry(o2, null, names, photos, f);
                }
            });
        } catch (Exception x) {
            Log.w("vk", x);
            return null;
        }
    }
}
