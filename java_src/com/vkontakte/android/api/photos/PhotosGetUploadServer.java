package com.vkontakte.android.api.photos;

import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.data.ServerKeys;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class PhotosGetUploadServer extends VKAPIRequest<String> {
    public PhotosGetUploadServer(int albumID, int ownerID) {
        super("photos.getUploadServer");
        param("album_id", albumID);
        if (ownerID < 0) {
            param("group_id", -ownerID);
        }
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
