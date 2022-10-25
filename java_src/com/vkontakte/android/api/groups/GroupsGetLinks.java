package com.vkontakte.android.api.groups;

import com.facebook.GraphRequest;
import com.vkontakte.android.Global;
import com.vkontakte.android.Log;
import com.vkontakte.android.UserProfile;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.data.ServerKeys;
import java.util.ArrayList;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class GroupsGetLinks extends VKAPIRequest<List<UserProfile>> {
    public GroupsGetLinks(int gid) {
        super("groups.getById");
        param(GraphRequest.FIELDS_PARAM, "links");
        param("group_id", gid);
    }

    @Override // com.vkontakte.android.api.VKAPIRequest
    /* renamed from: parse  reason: collision with other method in class */
    public List<UserProfile> mo1093parse(JSONObject o) {
        try {
            ArrayList<UserProfile> result = new ArrayList<>();
            JSONArray links = o.getJSONArray(ServerKeys.RESPONSE).getJSONObject(0).optJSONArray("links");
            if (links != null) {
                for (int i = 0; i < links.length(); i++) {
                    JSONObject link = links.getJSONObject(i);
                    UserProfile p = new UserProfile();
                    p.uid = link.getInt("id");
                    p.photo = link.optString(Global.displayDensity > 1.0f ? "photo_100" : "photo_50", null);
                    p.university = link.optString("desc");
                    p.fullName = link.getString("name");
                    p.bdate = link.getString("url");
                    p.online = link.optInt("edit_title");
                    if (p.photo == null) {
                        int size = Global.displayDensity > 1.0f ? 100 : 50;
                        p.photo = p.bdate.contains("//vk.com/") ? "http://vk.com/images/lnkinner" + size + ".gif" : "http://vk.com/images/lnkouter" + size + ".gif";
                    }
                    result.add(p);
                }
                return result;
            }
            return result;
        } catch (Exception x) {
            Log.w("vk", x);
            return null;
        }
    }
}
