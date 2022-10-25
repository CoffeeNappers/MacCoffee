package com.vkontakte.android.api.video;

import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.data.ServerKeys;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class VideoIsAdded extends VKAPIRequest<Boolean> {
    public VideoIsAdded(int targetID, int ownerID, int videoID) {
        super("execute.isVideoAdded");
        param("taget_id", targetID);
        param("owner_id", ownerID);
        param("video_id", videoID);
        param("func_v", 2);
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.vkontakte.android.api.VKAPIRequest
    /* renamed from: parse */
    public Boolean mo1093parse(JSONObject r) throws Exception {
        boolean z = false;
        if (r.optInt(ServerKeys.RESPONSE, 0) > 0) {
            z = true;
        }
        return Boolean.valueOf(z);
    }
}
