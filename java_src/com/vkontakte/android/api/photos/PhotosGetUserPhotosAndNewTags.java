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
public class PhotosGetUserPhotosAndNewTags extends VKAPIRequest<Result> {

    /* loaded from: classes2.dex */
    public static class Result {
        public VKList<TaggedPhoto> newTags;
        public VKList<Photo> photos;
        public SparseArray<UserProfile> profiles;
    }

    public PhotosGetUserPhotosAndNewTags(int offset, int count) {
        super("execute.getUserPhotosAndNewTags");
        param("offset", offset).param(ServerKeys.COUNT, count).param("extended", 1).param("sort", "desc").param(ServerKeys.PHOTO_SIZES, 1);
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.vkontakte.android.api.VKAPIRequest
    /* renamed from: parse */
    public Result mo1093parse(JSONObject r) throws Exception {
        Result result = new Result();
        result.photos = new VKList<>(r.getJSONObject(ServerKeys.RESPONSE), Photo.class);
        if (r.getJSONObject(ServerKeys.RESPONSE).has("new_tags")) {
            result.profiles = new SparseArray<>();
            result.newTags = new VKList<>(r.getJSONObject(ServerKeys.RESPONSE).getJSONObject("new_tags"), TaggedPhoto.class);
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
        }
        return result;
    }
}
