package com.vkontakte.android.api.photos;

import com.facebook.share.internal.ShareConstants;
import com.vkontakte.android.Log;
import com.vkontakte.android.Photo;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.data.ServerKeys;
import io.fabric.sdk.android.services.settings.SettingsJsonConstants;
import java.util.ArrayList;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class PhotosSave extends VKAPIRequest<List<Photo>> {
    public PhotosSave(int albumID, int ownerID, String server, String photosList, String hash, String descr) {
        super("photos.save");
        param("album_id", albumID);
        if (ownerID < 0) {
            param("group_id", -ownerID);
        }
        param("server", server).param("photos_list", photosList).param(SettingsJsonConstants.ICON_HASH_KEY, hash);
        param(ShareConstants.FEED_CAPTION_PARAM, descr);
        param(ServerKeys.PHOTO_SIZES, 1);
    }

    @Override // com.vkontakte.android.api.VKAPIRequest
    /* renamed from: parse  reason: collision with other method in class */
    public List<Photo> mo1093parse(JSONObject o) {
        try {
            ArrayList<Photo> photos = new ArrayList<>();
            JSONArray a = o.getJSONArray(ServerKeys.RESPONSE);
            for (int i = 0; i < a.length(); i++) {
                photos.add(new Photo(a.getJSONObject(i)));
            }
            return photos;
        } catch (Exception x) {
            Log.w("Vk", x);
            return null;
        }
    }
}
