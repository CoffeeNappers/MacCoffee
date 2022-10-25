package com.vkontakte.android.api.photos;

import com.vkontakte.android.PhotoTag;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.data.ServerKeys;
import java.util.ArrayList;
import org.json.JSONArray;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class PhotosGetTags extends VKAPIRequest<ArrayList<PhotoTag>> {
    public PhotosGetTags(int oid, int pid, String accessKey) {
        super("photos.getTags");
        param("owner_id", oid).param("photo_id", pid);
        if (accessKey != null) {
            param("access_key", accessKey);
        }
    }

    @Override // com.vkontakte.android.api.VKAPIRequest
    /* renamed from: parse  reason: collision with other method in class */
    public ArrayList<PhotoTag> mo1093parse(JSONObject o) {
        try {
            ArrayList<PhotoTag> tags = new ArrayList<>();
            JSONArray r = o.getJSONArray(ServerKeys.RESPONSE);
            for (int i = 0; i < r.length(); i++) {
                JSONObject j = r.getJSONObject(i);
                PhotoTag t = new PhotoTag();
                t.id = j.getInt("id");
                t.userID = j.getInt("user_id");
                t.x1 = j.getDouble("x");
                t.y1 = j.getDouble("y");
                t.x2 = j.getDouble("x2");
                t.y2 = j.getDouble("y2");
                t.userName = j.getString("tagged_name");
                tags.add(t);
            }
            return tags;
        } catch (Exception e) {
            return null;
        }
    }
}
