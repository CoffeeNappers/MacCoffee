package com.vkontakte.android.api.photos;

import com.vkontakte.android.Global;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.data.ServerKeys;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class PhotosDeleteAvatar extends VKAPIRequest<String> {
    int owner;

    public PhotosDeleteAvatar(int ownerID) {
        super("execute.deleteAvatarNew");
        param("owner_id", ownerID);
        this.owner = ownerID;
    }

    @Override // com.vkontakte.android.api.VKAPIRequest
    /* renamed from: parse  reason: collision with other method in class */
    public String mo1093parse(JSONObject o) {
        String string;
        try {
            if (this.owner > 0) {
                string = o.getJSONObject(ServerKeys.RESPONSE).getString(Global.displayDensity > 1.0f ? "photo_medium_rec" : "photo_rec");
            } else {
                string = o.getJSONObject(ServerKeys.RESPONSE).getString(Global.displayDensity > 1.0f ? "photo_100" : "photo_50");
            }
            return string;
        } catch (Exception e) {
            return null;
        }
    }
}
