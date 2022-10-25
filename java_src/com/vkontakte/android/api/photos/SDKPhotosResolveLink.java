package com.vkontakte.android.api.photos;

import com.vkontakte.android.api.Callback;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.data.ServerKeys;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class SDKPhotosResolveLink extends VKAPIRequest<String> {
    Callback callback;
    int width;

    public SDKPhotosResolveLink(String photo_id, int width) {
        super("photos.getById");
        this.width = width;
        param("photos", photo_id);
        param("extended", 0);
        param(ServerKeys.PHOTO_SIZES, 0);
    }

    @Override // com.vkontakte.android.api.VKAPIRequest
    /* renamed from: parse  reason: collision with other method in class */
    public String mo1093parse(JSONObject o) {
        try {
            JSONObject p = o.getJSONArray(ServerKeys.RESPONSE).getJSONObject(0);
            return p.optString("photo_" + this.width);
        } catch (Exception e) {
            return null;
        }
    }
}
