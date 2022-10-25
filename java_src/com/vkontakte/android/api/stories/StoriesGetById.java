package com.vkontakte.android.api.stories;

import com.facebook.GraphRequest;
import com.vk.stories.model.GetStoriesResponse;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.data.ServerKeys;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class StoriesGetById extends VKAPIRequest<GetStoriesResponse> {
    public StoriesGetById(String id) {
        super("stories.getById");
        param("stories", id);
        param(GraphRequest.FIELDS_PARAM, "name,screen_name,photo_50,photo_100,photo_200,sex,verified,can_write_private_message");
        param(ServerKeys.PHOTO_SIZES, 1);
        param("extended", 1);
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
