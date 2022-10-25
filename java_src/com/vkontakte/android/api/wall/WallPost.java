package com.vkontakte.android.api.wall;

import com.facebook.share.internal.ShareConstants;
import com.vkontakte.android.Log;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.data.ServerKeys;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class WallPost extends VKAPIRequest<Integer> {
    public WallPost(int ownerID, int postID) {
        super("wall.post");
        param(ShareConstants.WEB_DIALOG_RESULT_PARAM_POST_ID, postID).param("owner_id", ownerID);
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.vkontakte.android.api.VKAPIRequest
    /* renamed from: parse */
    public Integer mo1093parse(JSONObject o) {
        try {
            return Integer.valueOf(o.getJSONObject(ServerKeys.RESPONSE).getInt(ShareConstants.WEB_DIALOG_RESULT_PARAM_POST_ID));
        } catch (Exception x) {
            Log.w("vk", x);
            return null;
        }
    }
}
