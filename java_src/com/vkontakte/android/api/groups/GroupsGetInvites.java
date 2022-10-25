package com.vkontakte.android.api.groups;

import android.util.SparseArray;
import com.facebook.GraphRequest;
import com.facebook.appevents.AppEventsConstants;
import com.vkontakte.android.UserProfile;
import com.vkontakte.android.api.Group;
import com.vkontakte.android.api.GroupInvitation;
import com.vkontakte.android.api.ListAPIRequest;
import com.vkontakte.android.data.Parser;
import com.vkontakte.android.data.ServerKeys;
import com.vkontakte.android.data.VKList;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class GroupsGetInvites extends ListAPIRequest<GroupInvitation> {
    private SparseArray<UserProfile> inviters;

    public GroupsGetInvites(int offset, int count) {
        super("groups.getInvites");
        this.inviters = new SparseArray<>();
        param("offset", offset);
        param(ServerKeys.COUNT, count);
        param("extended", AppEventsConstants.EVENT_PARAM_VALUE_YES);
        param(GraphRequest.FIELDS_PARAM, "start_date,members_count,verified");
        setParser(new Parser<GroupInvitation>() { // from class: com.vkontakte.android.api.groups.GroupsGetInvites.1
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // com.vkontakte.android.data.Parser
            /* renamed from: parse */
            public GroupInvitation mo821parse(JSONObject o) throws JSONException {
                GroupInvitation inv = new GroupInvitation();
                inv.group = new Group(o);
                inv.size = o.getInt(ServerKeys.MEMBERS_COUNT);
                inv.inviter = (UserProfile) GroupsGetInvites.this.inviters.get(o.getInt("invited_by"));
                return inv;
            }
        });
    }

    @Override // com.vkontakte.android.api.ListAPIRequest, com.vkontakte.android.api.VKAPIRequest
    /* renamed from: parse */
    public VKList<GroupInvitation> mo1093parse(JSONObject o) throws JSONException {
        JSONArray users = o.getJSONObject(ServerKeys.RESPONSE).getJSONArray("profiles");
        for (int i = 0; i < users.length(); i++) {
            UserProfile p = new UserProfile(users.getJSONObject(i));
            this.inviters.put(p.uid, p);
        }
        return super.mo1093parse(o);
    }
}
