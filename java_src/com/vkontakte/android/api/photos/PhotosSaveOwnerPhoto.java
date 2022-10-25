package com.vkontakte.android.api.photos;

import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.data.ServerKeys;
import io.fabric.sdk.android.services.settings.SettingsJsonConstants;
/* loaded from: classes2.dex */
public class PhotosSaveOwnerPhoto extends VKAPIRequest<Void> {
    public PhotosSaveOwnerPhoto(int ownerID, String server, String photosList, String hash) {
        super("photos.saveOwnerPhoto");
        if (ownerID < 0) {
            param("owner_id", ownerID);
        }
        param("server", server).param("photo", photosList).param(SettingsJsonConstants.ICON_HASH_KEY, hash);
        param(ServerKeys.PHOTO_SIZES, 1);
    }
}
