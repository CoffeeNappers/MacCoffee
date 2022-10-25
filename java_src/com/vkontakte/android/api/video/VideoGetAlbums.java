package com.vkontakte.android.api.video;

import com.vkontakte.android.api.ListAPIRequest;
import com.vkontakte.android.api.VideoAlbum;
import com.vkontakte.android.data.ServerKeys;
/* loaded from: classes2.dex */
public class VideoGetAlbums extends ListAPIRequest<VideoAlbum> {
    public VideoGetAlbums(int oid, int offset, int count) {
        super("video.getAlbums", VideoAlbum.class);
        param("owner_id", oid).param(ServerKeys.COUNT, count).param("offset", offset).param("extended", 1);
    }
}
