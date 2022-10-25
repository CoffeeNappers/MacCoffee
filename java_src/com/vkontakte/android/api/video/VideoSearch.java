package com.vkontakte.android.api.video;

import android.util.SparseArray;
import com.facebook.appevents.AppEventsConstants;
import com.facebook.share.internal.ShareConstants;
import com.fasterxml.jackson.core.util.MinimalPrettyPrinter;
import com.vkontakte.android.Global;
import com.vkontakte.android.Log;
import com.vkontakte.android.UserProfile;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.api.VideoFile;
import com.vkontakte.android.data.Parser;
import com.vkontakte.android.data.ServerKeys;
import com.vkontakte.android.data.VKList;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class VideoSearch extends VKAPIRequest<VKList<VideoFile>> {
    public VideoSearch(String q, int offset, int count, boolean hd, int length, boolean safe, int sort) {
        super("execute.searchVideosWithProfiles");
        param("q", q);
        param("offset", offset).param(ServerKeys.COUNT, count);
        param("hd", hd ? AppEventsConstants.EVENT_PARAM_VALUE_YES : AppEventsConstants.EVENT_PARAM_VALUE_NO);
        if (length > 0) {
            param(ShareConstants.WEB_DIALOG_PARAM_FILTERS, length == 1 ? "short" : "long");
        }
        param("adult", safe ? AppEventsConstants.EVENT_PARAM_VALUE_NO : AppEventsConstants.EVENT_PARAM_VALUE_YES);
        param("sort", sort + "");
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.vkontakte.android.api.VKAPIRequest
    /* renamed from: parse */
    public VKList<VideoFile> mo1093parse(JSONObject o) {
        try {
            JSONArray u = o.getJSONObject(ServerKeys.RESPONSE).optJSONArray("profiles");
            JSONArray groups = o.getJSONObject(ServerKeys.RESPONSE).optJSONArray("groups");
            final SparseArray<String> names = new SparseArray<>();
            final SparseArray<String> photos = new SparseArray<>();
            if (u != null) {
                for (int i = 0; i < u.length(); i++) {
                    int uid = u.getJSONObject(i).getInt("id");
                    names.put(uid, u.getJSONObject(i).getString("first_name") + MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR + u.getJSONObject(i).getString("last_name"));
                    photos.put(uid, u.getJSONObject(i).getString(Global.displayDensity > 1.0f ? "photo_100" : "photo_50"));
                }
            }
            if (groups != null) {
                for (int i2 = 0; i2 < groups.length(); i2++) {
                    JSONObject ju = groups.getJSONObject(i2);
                    UserProfile p = new UserProfile();
                    p.uid = -ju.getInt("id");
                    p.fullName = ju.getString("name");
                    p.photo = ju.getString(Global.displayDensity > 1.0f ? "photo_100" : "photo_50");
                    names.put(p.uid, p.fullName);
                    photos.put(p.uid, p.photo);
                }
            }
            return new VKList<>(o.getJSONObject(ServerKeys.RESPONSE), new Parser<VideoFile>() { // from class: com.vkontakte.android.api.video.VideoSearch.1
                /* JADX WARN: Can't rename method to resolve collision */
                @Override // com.vkontakte.android.data.Parser
                /* renamed from: parse */
                public VideoFile mo821parse(JSONObject o2) throws JSONException {
                    VideoFile v = new VideoFile(o2);
                    v.ownerName = (String) names.get(v.oid);
                    v.ownerPhoto = (String) photos.get(v.oid);
                    return v;
                }
            });
        } catch (Exception x) {
            Log.w("vk", x);
            return null;
        }
    }
}
