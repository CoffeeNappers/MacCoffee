package com.vkontakte.android.api.video;

import android.text.TextUtils;
import com.vkontakte.android.api.ResultlessAPIRequest;
import java.util.List;
/* loaded from: classes2.dex */
public class VideoSetAlbums extends ResultlessAPIRequest {
    public VideoSetAlbums(int targetID, int ownerID, int videoID, List<Integer> addToAlbums, List<Integer> removeFromAlbums) {
        super("execute.setVideoAlbums");
        param("target_id", targetID);
        param("owner_id", ownerID);
        param("video_id", videoID);
        param("add_to_album_ids", TextUtils.join(",", addToAlbums));
        param("remove_from_album_ids", TextUtils.join(",", removeFromAlbums));
        param("func_v", 2);
    }
}
