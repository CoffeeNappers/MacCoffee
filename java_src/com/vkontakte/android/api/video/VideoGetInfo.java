package com.vkontakte.android.api.video;

import com.vkontakte.android.Log;
import com.vkontakte.android.UserProfile;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.data.ServerKeys;
import com.vkontakte.android.fragments.AuthCheckFragment;
import java.util.ArrayList;
import java.util.Locale;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class VideoGetInfo extends VKAPIRequest<Result> {
    private static final String CODE = "return {l:API.likes.getList({type:\"video\",item_id:%1$d,owner_id:%2$d,count:1}).count,il:API.likes.isLiked({type:\"video\",item_id:%1$d,owner_id:%2$d})};";

    /* loaded from: classes2.dex */
    public static class Result {
        public boolean isLiked;
        public int myTagID;
        public int numLikes;
        public ArrayList<UserProfile> tags;
    }

    public VideoGetInfo(int oid, int vid) {
        super("execute");
        param(AuthCheckFragment.KEY_CODE, String.format(Locale.US, CODE, Integer.valueOf(vid), Integer.valueOf(oid)));
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.vkontakte.android.api.VKAPIRequest
    /* renamed from: parse */
    public Result mo1093parse(JSONObject o) {
        boolean z = true;
        try {
            ArrayList<UserProfile> t = new ArrayList<>();
            Result r = new Result();
            r.tags = t;
            r.numLikes = o.getJSONObject(ServerKeys.RESPONSE).getInt("l");
            if (o.getJSONObject(ServerKeys.RESPONSE).getJSONObject("il").getInt("liked") != 1) {
                z = false;
            }
            r.isLiked = z;
            r.myTagID = -1;
            return r;
        } catch (Exception x) {
            Log.w("vk", x);
            return null;
        }
    }
}
