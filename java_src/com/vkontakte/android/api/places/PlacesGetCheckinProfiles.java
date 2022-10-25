package com.vkontakte.android.api.places;

import com.facebook.GraphRequest;
import com.vkontakte.android.Log;
import com.vkontakte.android.UserProfile;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.data.ServerKeys;
import com.vkontakte.android.data.VKList;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class PlacesGetCheckinProfiles extends VKAPIRequest<Result> {

    /* loaded from: classes2.dex */
    public static class Result {
        public int newOffset;
        public VKList<UserProfile> users;
    }

    public PlacesGetCheckinProfiles(int placeID, int offset, int count) {
        super("execute.getPlaceCheckinsNew");
        param("place_id", placeID);
        param("offset", offset);
        param(ServerKeys.COUNT, count);
        param("func_v", 2);
        param(GraphRequest.FIELDS_PARAM, "online,photo_100,photo_200,photo_50");
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.vkontakte.android.api.VKAPIRequest
    /* renamed from: parse */
    public Result mo1093parse(JSONObject o) {
        try {
            Result r = new Result();
            r.users = new VKList<>(o.getJSONObject(ServerKeys.RESPONSE), UserProfile.class);
            r.newOffset = o.getJSONObject(ServerKeys.RESPONSE).getInt("new_offset");
            return r;
        } catch (Exception x) {
            Log.w("vk", x);
            return null;
        }
    }
}
