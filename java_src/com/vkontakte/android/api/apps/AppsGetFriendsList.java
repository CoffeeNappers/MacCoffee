package com.vkontakte.android.api.apps;

import com.facebook.GraphRequest;
import com.vkontakte.android.Global;
import com.vkontakte.android.Log;
import com.vkontakte.android.UserProfile;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.data.ServerKeys;
import com.vkontakte.android.data.VKList;
import org.json.JSONArray;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class AppsGetFriendsList extends VKAPIRequest<VKList<UserProfile>> {
    public AppsGetFriendsList(int appId) {
        super("apps.getFriendsList");
        param(ServerKeys.TYPE, "invite");
        param(ServerKeys.COUNT, 5000);
        param("id", appId);
        param("extended", 1);
        param(GraphRequest.FIELDS_PARAM, (Global.displayDensity > 1.0f ? "photo_medium_rec" : "photo_rec") + ",online,bdate,first_name_gen,last_name_gen,sex");
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.vkontakte.android.api.VKAPIRequest
    /* renamed from: parse */
    public VKList<UserProfile> mo1093parse(JSONObject o) throws Exception {
        try {
            VKList<UserProfile> users = new VKList<>();
            JSONArray a = o.getJSONObject(ServerKeys.RESPONSE).getJSONArray(ServerKeys.ITEMS);
            if (a == null) {
                return null;
            }
            for (int i = 0; i < a.length(); i++) {
                JSONObject obj = a.getJSONObject(i);
                UserProfile p = new UserProfile(obj);
                p.photo = obj.getString(Global.displayDensity > 1.0f ? "photo_medium_rec" : "photo_rec");
                users.add(p);
            }
            return users;
        } catch (Exception e) {
            Log.w("vk", e);
            return null;
        }
    }
}
