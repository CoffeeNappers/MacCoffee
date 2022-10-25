package com.vkontakte.android.api.video;

import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.api.VideoAlbum;
import com.vkontakte.android.data.ServerKeys;
import java.util.ArrayList;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class VideoGetAlbumsByVideo extends VKAPIRequest<Result> {

    /* loaded from: classes2.dex */
    public static class Result {
        public List<Integer> addedAlbums;
        public List<VideoAlbum> userAlbums;
    }

    public VideoGetAlbumsByVideo(int targetID, int ownerID, int videoID) {
        super("execute.getVideoAlbums");
        param("target_id", targetID);
        param("owner_id", ownerID);
        param("video_id", videoID);
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.vkontakte.android.api.VKAPIRequest
    /* renamed from: parse */
    public Result mo1093parse(JSONObject r) throws Exception {
        Result res = new Result();
        res.userAlbums = new ArrayList();
        JSONArray jva = r.getJSONObject(ServerKeys.RESPONSE).getJSONArray("albums");
        for (int i = 0; i < jva.length(); i++) {
            res.userAlbums.add(new VideoAlbum(jva.getJSONObject(i)));
        }
        JSONArray added = r.getJSONObject(ServerKeys.RESPONSE).getJSONArray("added_to");
        res.addedAlbums = new ArrayList();
        for (int i2 = 0; i2 < added.length(); i2++) {
            res.addedAlbums.add(Integer.valueOf(added.getInt(i2)));
        }
        return res;
    }
}
