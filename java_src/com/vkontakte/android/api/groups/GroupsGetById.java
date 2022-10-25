package com.vkontakte.android.api.groups;

import android.util.Log;
import com.facebook.GraphRequest;
import com.vkontakte.android.api.Group;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.data.ServerKeys;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class GroupsGetById extends VKAPIRequest<Group> {
    public GroupsGetById(int gid) {
        super("groups.getById");
        param("group_id", gid);
        param(GraphRequest.FIELDS_PARAM, "start_date,can_message,is_messages_blocked");
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.vkontakte.android.api.VKAPIRequest
    /* renamed from: parse */
    public Group mo1093parse(JSONObject r) throws Exception {
        try {
            return new Group(r.getJSONArray(ServerKeys.RESPONSE).getJSONObject(0));
        } catch (Exception e) {
            Log.d("vk", "error", e);
            return (Group) super.mo1093parse(r);
        }
    }
}
