package com.vkontakte.android.api.video;

import android.util.SparseArray;
import com.fasterxml.jackson.core.util.MinimalPrettyPrinter;
import com.vkontakte.android.Global;
import com.vkontakte.android.Log;
import com.vkontakte.android.UserProfile;
import com.vkontakte.android.api.ListAPIRequest;
import com.vkontakte.android.api.VideoAlbum;
import com.vkontakte.android.api.VideoFile;
import com.vkontakte.android.data.Parser;
import com.vkontakte.android.data.ServerKeys;
import com.vkontakte.android.data.VKList;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class VideoGet extends ListAPIRequest<VideoFile> {
    public static VideoGet getBookmarks(int offset, int count) {
        return new VideoGet(0, offset, count, VideoAlbum.ALBUM_ID_BOOKMARKS);
    }

    public static VideoGet getUserVideos(int user_id, int offset, int count) {
        return new VideoGet(user_id, offset, count, VideoAlbum.ALBUM_ID_TAGGED);
    }

    public static VideoGet get(int owner_id, int album_id, int offset, int count) {
        return new VideoGet(owner_id, offset, count, album_id);
    }

    public static VideoGet getUploaded(int owner_id, int offset, int count) {
        return new VideoGet(owner_id, offset, count, -1);
    }

    public static VideoGet getAdded(int owner_id, int offset, int count) {
        return new VideoGet(owner_id, offset, count, -2);
    }

    private VideoGet(int uid, int offset, int count, int album) {
        super("execute.getVideosWithProfiles");
        param("owner_id", uid).param("offset", offset).param(ServerKeys.COUNT, count).param("album_id", album);
        param("extended", 1).param("new_albums", 1);
        param("func_c", 2);
    }

    @Override // com.vkontakte.android.api.ListAPIRequest, com.vkontakte.android.api.VKAPIRequest
    /* renamed from: parse */
    public VKList<VideoFile> mo1093parse(JSONObject o) {
        try {
            JSONArray users = o.getJSONObject(ServerKeys.RESPONSE).optJSONArray("profiles");
            JSONArray groups = o.getJSONObject(ServerKeys.RESPONSE).optJSONArray("groups");
            final SparseArray<UserProfile> profiles = new SparseArray<>();
            if (users != null) {
                for (int i = 0; i < users.length(); i++) {
                    JSONObject ju = users.getJSONObject(i);
                    UserProfile p = new UserProfile();
                    p.uid = ju.getInt("id");
                    p.firstName = ju.getString("first_name");
                    p.lastName = ju.getString("last_name");
                    p.fullName = p.firstName + MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR + p.lastName;
                    p.photo = ju.optString(Global.displayDensity > 1.0f ? "photo_100" : "photo_50");
                    profiles.put(p.uid, p);
                }
            }
            if (groups != null) {
                for (int i2 = 0; i2 < groups.length(); i2++) {
                    JSONObject ju2 = groups.getJSONObject(i2);
                    UserProfile p2 = new UserProfile();
                    p2.uid = -ju2.getInt("id");
                    p2.fullName = ju2.getString("name");
                    p2.photo = ju2.getString(Global.displayDensity > 1.0f ? "photo_100" : "photo_50");
                    profiles.put(p2.uid, p2);
                }
            }
            return new VKList<>(o.getJSONObject(ServerKeys.RESPONSE), new Parser<VideoFile>() { // from class: com.vkontakte.android.api.video.VideoGet.1
                /* JADX WARN: Can't rename method to resolve collision */
                @Override // com.vkontakte.android.data.Parser
                /* renamed from: parse */
                public VideoFile mo821parse(JSONObject o2) throws JSONException {
                    VideoFile v = new VideoFile(o2);
                    if (profiles.indexOfKey(v.oid) >= 0) {
                        v.ownerName = ((UserProfile) profiles.get(v.oid)).fullName;
                        v.ownerPhoto = ((UserProfile) profiles.get(v.oid)).photo;
                    }
                    return v;
                }
            });
        } catch (Exception x) {
            Log.w("vk", x);
            return null;
        }
    }
}
