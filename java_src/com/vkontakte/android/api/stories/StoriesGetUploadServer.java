package com.vkontakte.android.api.stories;

import android.text.TextUtils;
import com.vk.stories.model.StoryUploadParams;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.data.ServerKeys;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class StoriesGetUploadServer extends VKAPIRequest<String> {
    public static StoriesGetUploadServer getPhotoUploadServer(StoryUploadParams params) {
        return new StoriesGetUploadServer("stories.getPhotoUploadServer", params);
    }

    public static StoriesGetUploadServer getVideoUploadServer(StoryUploadParams params) {
        return new StoriesGetUploadServer("stories.getVideoUploadServer", params);
    }

    public StoriesGetUploadServer(String method, StoryUploadParams params) {
        super(method);
        if (!TextUtils.isEmpty(params.getMaskId())) {
            param("mask_id", params.getMaskId());
        }
        if (params.getSectionId() != null) {
            param("section_id", params.getSectionId().intValue());
        }
        if (params.getLocation() != null) {
            param("latitude", String.valueOf(params.getLocation().getLatitude()));
            param("longitude", String.valueOf(params.getLocation().getLongitude()));
        }
        if (params.getUserIds() != null && params.getUserIds().size() > 0) {
            param(ServerKeys.USER_IDS, TextUtils.join(",", params.getUserIds()));
        }
        if (params.getCameraType() != null) {
            param("camera_type", params.getCameraType().toString());
        }
        param("add_to_news", params.isAddToNews() ? 1 : 0);
    }

    @Override // com.vkontakte.android.api.VKAPIRequest
    /* renamed from: parse  reason: collision with other method in class */
    public String mo1093parse(JSONObject o) {
        try {
            return o.getJSONObject(ServerKeys.RESPONSE).getString("upload_url");
        } catch (Exception e) {
            return null;
        }
    }
}
