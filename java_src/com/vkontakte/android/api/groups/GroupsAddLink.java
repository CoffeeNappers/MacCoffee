package com.vkontakte.android.api.groups;

import com.vkontakte.android.Global;
import com.vkontakte.android.Log;
import com.vkontakte.android.UserProfile;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.data.ServerKeys;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class GroupsAddLink extends VKAPIRequest<UserProfile> {
    public GroupsAddLink(int gid, String url, String desc) {
        super("groups.addLink");
        param("group_id", gid);
        param("link", url);
        param("text", desc);
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.vkontakte.android.api.VKAPIRequest
    /* renamed from: parse */
    public UserProfile mo1093parse(JSONObject o) {
        try {
            JSONObject r = o.getJSONObject(ServerKeys.RESPONSE);
            UserProfile p = new UserProfile();
            p.uid = r.getInt("id");
            p.fullName = r.getString("name");
            p.university = r.optString("desc");
            p.photo = r.optString(Global.displayDensity > 1.0f ? "photo_100" : "photo_50", null);
            p.bdate = r.getString("url");
            p.online = r.optInt("edit_title");
            if (p.photo == null) {
                int size = Global.displayDensity > 1.0f ? 100 : 50;
                p.photo = p.bdate.contains("//vk.com/") ? "http://vk.com/images/lnkinner" + size + ".gif" : "http://vk.com/images/lnkouter" + size + ".gif";
                return p;
            }
            return p;
        } catch (Exception x) {
            Log.w("vk", x);
            return null;
        }
    }
}
