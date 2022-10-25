package com.vkontakte.android.api.photos;

import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.data.ServerKeys;
import io.fabric.sdk.android.services.events.EventsFilesManager;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class PhotosGetInfo extends VKAPIRequest<Result> {

    /* loaded from: classes2.dex */
    public static class Result {
        public boolean canComment;
        public int comments;
        public boolean liked;
        public int likes;
        public int reposts;
        public int tags;
    }

    public PhotosGetInfo(int oid, int pid, String akey) {
        super("photos.getById");
        param("photos", oid + EventsFilesManager.ROLL_OVER_FILE_NAME_SEPARATOR + pid + ((akey == null || akey.length() <= 0) ? "" : EventsFilesManager.ROLL_OVER_FILE_NAME_SEPARATOR + akey));
        param("extended", 1);
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.vkontakte.android.api.VKAPIRequest
    /* renamed from: parse */
    public Result mo1093parse(JSONObject o) {
        boolean z = true;
        try {
            JSONObject p = o.getJSONArray(ServerKeys.RESPONSE).getJSONObject(0);
            Result r = new Result();
            r.likes = p.getJSONObject(ServerKeys.LIKES).getInt(ServerKeys.COUNT);
            r.comments = p.getJSONObject("comments").getInt(ServerKeys.COUNT);
            r.reposts = p.getJSONObject("reposts").getInt(ServerKeys.COUNT);
            r.tags = p.getJSONObject("tags").getInt(ServerKeys.COUNT);
            r.liked = p.getJSONObject(ServerKeys.LIKES).getInt(ServerKeys.USER_LIKES) == 1;
            if (p.optInt(ServerKeys.CAN_COMMENT, 1) != 1) {
                z = false;
            }
            r.canComment = z;
            return r;
        } catch (Exception e) {
            return null;
        }
    }
}
