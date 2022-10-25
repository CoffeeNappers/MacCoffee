package com.vkontakte.android.api.photos;

import com.vkontakte.android.Log;
import com.vkontakte.android.Photo;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.attachments.PhotoAttachment;
import com.vkontakte.android.data.ServerKeys;
import io.fabric.sdk.android.services.settings.SettingsJsonConstants;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class PhotosSaveMessagesPhoto extends VKAPIRequest<PhotoAttachment> {
    public PhotosSaveMessagesPhoto(String server, String photo, String hash) {
        super("photos.saveMessagesPhoto");
        param("server", server).param("photo", photo).param(SettingsJsonConstants.ICON_HASH_KEY, hash);
        param(ServerKeys.PHOTO_SIZES, 1);
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.vkontakte.android.api.VKAPIRequest
    /* renamed from: parse */
    public PhotoAttachment mo1093parse(JSONObject o) {
        try {
            return new PhotoAttachment(new Photo(o.getJSONArray(ServerKeys.RESPONSE).getJSONObject(0)));
        } catch (Exception x) {
            Log.w("Vk", x);
            return null;
        }
    }
}
