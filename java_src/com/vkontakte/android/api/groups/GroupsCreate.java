package com.vkontakte.android.api.groups;

import com.vkontakte.android.Log;
import com.vkontakte.android.api.Group;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.data.ServerKeys;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class GroupsCreate extends VKAPIRequest<Group> {
    public GroupsCreate(String title, String type, int subtype) {
        super("groups.create");
        param("title", title).param(ServerKeys.TYPE, type).param("subtype", subtype);
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.vkontakte.android.api.VKAPIRequest
    /* renamed from: parse */
    public Group mo1093parse(JSONObject r) {
        try {
            Group result = new Group(r.getJSONObject(ServerKeys.RESPONSE));
            result.members_count = 1;
            return result;
        } catch (Exception x) {
            Log.w("vk", x);
            return null;
        }
    }
}
