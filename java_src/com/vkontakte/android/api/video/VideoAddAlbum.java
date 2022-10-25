package com.vkontakte.android.api.video;

import com.facebook.share.internal.ShareConstants;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.data.ServerKeys;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class VideoAddAlbum extends VKAPIRequest<Integer> {
    public VideoAddAlbum(int ownerID, String title, String privacy) {
        super("video.addAlbum");
        if (ownerID < 0) {
            param("group_id", -ownerID);
        }
        param("title", title);
        param(ShareConstants.WEB_DIALOG_PARAM_PRIVACY, privacy);
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.vkontakte.android.api.VKAPIRequest
    /* renamed from: parse */
    public Integer mo1093parse(JSONObject r) throws Exception {
        return Integer.valueOf(r.getJSONObject(ServerKeys.RESPONSE).getInt("album_id"));
    }
}
