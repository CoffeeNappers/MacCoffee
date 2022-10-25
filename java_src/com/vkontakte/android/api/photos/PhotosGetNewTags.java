package com.vkontakte.android.api.photos;

import android.util.SparseArray;
import com.vkontakte.android.Global;
import com.vkontakte.android.Photo;
import com.vkontakte.android.TaggedPhoto;
import com.vkontakte.android.UserProfile;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.data.ServerKeys;
import com.vkontakte.android.data.VKList;
import org.json.JSONArray;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class PhotosGetNewTags extends VKAPIRequest<Result> {

    /* loaded from: classes2.dex */
    public static class Result {
        public VKList<Photo> photos;
        public SparseArray<UserProfile> profiles;
    }

    public PhotosGetNewTags(int offset, int count) {
        super("execute.getNewPhotoTagsWithProfiles");
        param("offset", offset).param(ServerKeys.COUNT, count).param(ServerKeys.PHOTO_SIZES, 1);
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.vkontakte.android.api.VKAPIRequest
    /* renamed from: parse */
    public Result mo1093parse(JSONObject r) throws Exception {
        Result result = new Result();
        VKList tmp = new VKList(r.getJSONObject(ServerKeys.RESPONSE), TaggedPhoto.class);
        result.photos = tmp;
        result.profiles = new SparseArray<>();
        JSONArray users = r.getJSONObject(ServerKeys.RESPONSE).getJSONArray("users");
        for (int i = 0; i < users.length(); i++) {
            UserProfile p = new UserProfile(users.getJSONObject(i));
            result.profiles.put(p.uid, p);
        }
        JSONArray groups = r.getJSONObject(ServerKeys.RESPONSE).getJSONArray("groups");
        for (int i2 = 0; i2 < groups.length(); i2++) {
            JSONObject jg = groups.getJSONObject(i2);
            UserProfile p2 = new UserProfile();
            p2.uid = -jg.getInt("id");
            p2.photo = jg.getString(Global.displayDensity > 1.0f ? "photo_100" : "photo_50");
            p2.fullName = jg.getString("name");
            result.profiles.put(p2.uid, p2);
        }
        return result;
    }
}
