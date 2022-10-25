package com.vkontakte.android.api.photos;

import com.vkontakte.android.Photo;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.data.ServerKeys;
import com.vkontakte.android.utils.Utils;
import java.util.ArrayList;
import org.json.JSONArray;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class PhotosGetById extends VKAPIRequest<ArrayList<Photo>> {
    public PhotosGetById(ArrayList<String> requestedPhotos) {
        super("photos.getById");
        param("photos", Utils.getCommaSeparated(requestedPhotos));
        param(ServerKeys.PHOTO_SIZES, 1);
    }

    @Override // com.vkontakte.android.api.VKAPIRequest
    /* renamed from: parse  reason: collision with other method in class */
    public ArrayList<Photo> mo1093parse(JSONObject r) throws Exception {
        ArrayList<Photo> result = new ArrayList<>();
        JSONArray array = r.getJSONArray(ServerKeys.RESPONSE);
        for (int i = 0; i < array.length(); i++) {
            result.add(new Photo(array.getJSONObject(i)));
        }
        return result;
    }
}
