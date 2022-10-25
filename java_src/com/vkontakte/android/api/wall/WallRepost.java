package com.vkontakte.android.api.wall;

import android.text.TextUtils;
import com.facebook.share.internal.ShareConstants;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.data.ServerKeys;
import com.vkontakte.android.utils.L;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class WallRepost extends VKAPIRequest<Result> {

    /* loaded from: classes2.dex */
    public static class Result {
        public int likes;
        public int postID;
        public int retweets;
    }

    public WallRepost(String object, int gid, String msg, String accessKey, String refer, String track_code) {
        super("wall.repost");
        param("ref", refer);
        param("object", object);
        param("message", msg);
        if (gid != 0) {
            param("group_id", Math.abs(gid));
        }
        if (!TextUtils.isEmpty(track_code)) {
            param("track_code", track_code);
        }
        if (accessKey != null && accessKey.length() > 0) {
            param("access_key", accessKey);
        }
        L.d("wall.repost", refer);
    }

    public WallRepost(String object, int gid, String msg, String refer, String track_code) {
        this(object, gid, msg, null, refer, track_code);
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.vkontakte.android.api.VKAPIRequest
    /* renamed from: parse */
    public Result mo1093parse(JSONObject o) {
        try {
            JSONObject r = o.getJSONObject(ServerKeys.RESPONSE);
            Result res = new Result();
            res.likes = r.getInt("likes_count");
            res.retweets = r.getInt("reposts_count");
            res.postID = r.optInt(ShareConstants.WEB_DIALOG_RESULT_PARAM_POST_ID);
            return res;
        } catch (Exception x) {
            L.e(x, new Object[0]);
            return null;
        }
    }
}
