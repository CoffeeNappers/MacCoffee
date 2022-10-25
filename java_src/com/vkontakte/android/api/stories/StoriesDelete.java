package com.vkontakte.android.api.stories;

import com.vk.stories.model.GetStoriesResponse;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.data.ServerKeys;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class StoriesDelete extends VKAPIRequest<GetStoriesResponse> {
    public StoriesDelete(int ownerId, long storyId) {
        super("execute.deleteStory");
        param("owner_id", ownerId).param("story_id", storyId);
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.vkontakte.android.api.VKAPIRequest
    /* renamed from: parse */
    public GetStoriesResponse mo1093parse(JSONObject o) {
        try {
            JSONObject a = o.getJSONObject(ServerKeys.RESPONSE);
            return new GetStoriesResponse(a);
        } catch (Exception e) {
            return null;
        }
    }
}
