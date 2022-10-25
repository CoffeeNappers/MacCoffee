package com.vkontakte.android.api.places;

import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.data.ServerKeys;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class PlacesAdd extends VKAPIRequest<Integer> {
    public PlacesAdd(String title, String address, double lat, double lon) {
        super("places.add");
        param("title", title);
        param("address", address);
        param("latitude", lat + "");
        param("longitude", lon + "");
        param(ServerKeys.TYPE, 21);
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.vkontakte.android.api.VKAPIRequest
    /* renamed from: parse */
    public Integer mo1093parse(JSONObject o) {
        try {
            return Integer.valueOf(o.getJSONObject(ServerKeys.RESPONSE).getInt("id"));
        } catch (Exception e) {
            return null;
        }
    }
}
