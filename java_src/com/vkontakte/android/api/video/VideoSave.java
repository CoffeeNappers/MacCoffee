package com.vkontakte.android.api.video;

import com.vkontakte.android.Log;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.data.ServerKeys;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class VideoSave extends VKAPIRequest<Result> {

    /* loaded from: classes2.dex */
    public static class Result {
        public String accessKey;
        public int id;
        public String uploadUrl;
    }

    public VideoSave(int ownerID, String name, String descr, boolean isPrivate, boolean isPreview) {
        super("video.save");
        if (ownerID < 0) {
            param("group_id", -ownerID);
        }
        if (name != null) {
            param("name", name);
        }
        if (descr != null) {
            param("description", descr);
        }
        if (isPrivate) {
            param("is_private", 1);
        }
        if (isPreview) {
            param("preview", 1);
        }
    }

    public VideoSave(int ownerID, int album_id, String name, String descr, boolean isPrivate, String link) {
        this(ownerID, name, descr, isPrivate, false);
        param("link", link);
        param("album_id", album_id);
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.vkontakte.android.api.VKAPIRequest
    /* renamed from: parse */
    public Result mo1093parse(JSONObject o) {
        try {
            JSONObject r = o.getJSONObject(ServerKeys.RESPONSE);
            Result res = new Result();
            res.uploadUrl = r.getString("upload_url");
            res.id = r.getInt("video_id");
            res.accessKey = r.optString("access_key");
            return res;
        } catch (Exception x) {
            Log.w("vk", x);
            return null;
        }
    }
}
