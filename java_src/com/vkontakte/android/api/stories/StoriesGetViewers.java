package com.vkontakte.android.api.stories;

import com.facebook.GraphRequest;
import com.vkontakte.android.UserProfile;
import com.vkontakte.android.api.ListAPIRequest;
import com.vkontakte.android.data.ServerKeys;
/* loaded from: classes2.dex */
public class StoriesGetViewers extends ListAPIRequest<UserProfile> {
    public StoriesGetViewers(int ownerId, int storyId, int offset, int count) {
        super("stories.getViewers", UserProfile.class);
        param("owner_id", ownerId).param("story_id", storyId);
        param("offset", offset).param(ServerKeys.COUNT, count);
        param(GraphRequest.FIELDS_PARAM, "name,screen_name,photo_50,photo_100,photo_200,sex,verified,can_write_private_message");
        param(ServerKeys.PHOTO_SIZES, 1);
        param("extended", 1);
    }
}
