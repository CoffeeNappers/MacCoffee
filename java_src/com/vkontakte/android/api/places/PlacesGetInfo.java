package com.vkontakte.android.api.places;

import com.vkontakte.android.GeoPlace;
import com.vkontakte.android.Log;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.data.ServerKeys;
import java.util.ArrayList;
import org.json.JSONArray;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class PlacesGetInfo extends VKAPIRequest<Result> {

    /* loaded from: classes2.dex */
    public static class Result {
        public String groupPhoto;
        public String groupStatus;
        public GeoPlace place;
        public ArrayList<String> userPhotos;
    }

    public PlacesGetInfo(int placeID) {
        super("execute.getPlaceInfoNew");
        param("place_id", placeID);
        param("func_v", 2);
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.vkontakte.android.api.VKAPIRequest
    /* renamed from: parse */
    public Result mo1093parse(JSONObject o) {
        try {
            JSONObject r = o.getJSONObject(ServerKeys.RESPONSE);
            GeoPlace place = new GeoPlace(r.getJSONObject("place"));
            ArrayList<String> photos = new ArrayList<>();
            JSONArray arr = r.getJSONArray("user_photos");
            for (int i = 0; i < arr.length(); i++) {
                photos.add(arr.getString(i));
            }
            JSONObject g = r.optJSONObject("group");
            Result res = new Result();
            res.place = place;
            res.userPhotos = photos;
            res.groupStatus = g != null ? g.getString("status") : null;
            res.groupPhoto = g != null ? g.getString("photo_100") : null;
            return res;
        } catch (Exception x) {
            Log.w("vk", x);
            return null;
        }
    }
}
