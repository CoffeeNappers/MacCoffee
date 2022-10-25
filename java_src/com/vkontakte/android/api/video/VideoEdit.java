package com.vkontakte.android.api.video;

import com.vkontakte.android.api.ResultlessAPIRequest;
import com.vkontakte.android.api.VideoFile;
import com.vkontakte.android.data.ServerKeys;
/* loaded from: classes2.dex */
public class VideoEdit extends ResultlessAPIRequest {
    public VideoEdit(VideoFile video, String newName, String newDescription, String privacy, String commentsPrivacy) {
        super("video.edit");
        param("owner_id", video.oid);
        param("video_id", video.vid);
        param("name", newName);
        param("desc", newDescription);
        param(ServerKeys.PRIVACY_VIEW, privacy);
        param(ServerKeys.PRIVACY_COMMENT, commentsPrivacy);
    }
}
