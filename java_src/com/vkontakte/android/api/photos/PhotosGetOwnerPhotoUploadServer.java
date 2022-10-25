package com.vkontakte.android.api.photos;

import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.data.ServerKeys;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class PhotosGetOwnerPhotoUploadServer extends VKAPIRequest<String> {
    public PhotosGetOwnerPhotoUploadServer(int ownerID) {
        super("photos.getOwnerPhotoUploadServer");
        if (ownerID < 0) {
            param("owner_id", ownerID);
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
