package com.vkontakte.android.api.video;

import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.data.ServerKeys;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class VideoGetTabs extends VKAPIRequest<Result> {

    /* loaded from: classes2.dex */
    public static class Result {
        public int albumsCount;
        public int uploadedCount;
        public int userVideosCount;
    }

    public VideoGetTabs(int owner_id) {
        super("execute.videoGetTabs");
        param("owner_id", owner_id);
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.vkontakte.android.api.VKAPIRequest
    /* renamed from: parse */
    public Result mo1093parse(JSONObject r) throws Exception {
        JSONObject response = r.getJSONObject(ServerKeys.RESPONSE);
        Result result = new Result();
        result.albumsCount = response.optInt("albums");
        result.userVideosCount = response.optInt("user_videos");
        result.uploadedCount = response.optInt("uploaded");
        return result;
    }
}
