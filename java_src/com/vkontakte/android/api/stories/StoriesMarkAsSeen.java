package com.vkontakte.android.api.stories;

import android.text.TextUtils;
import com.facebook.share.internal.ShareConstants;
import com.vkontakte.android.api.ResultlessAPIRequest;
/* loaded from: classes2.dex */
public class StoriesMarkAsSeen extends ResultlessAPIRequest {
    public StoriesMarkAsSeen(int ownerId, long storyId, String accessKey, String source) {
        super("stories.markSeen");
        param("owner_id", ownerId);
        param("story_id", storyId);
        param(ShareConstants.FEED_SOURCE_PARAM, source);
        if (!TextUtils.isEmpty(accessKey)) {
            param("access_key", accessKey);
        }
    }
}
