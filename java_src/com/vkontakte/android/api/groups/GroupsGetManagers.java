package com.vkontakte.android.api.groups;

import android.util.SparseArray;
import com.facebook.GraphRequest;
import com.vkontakte.android.Log;
import com.vkontakte.android.UserProfile;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.data.Parser;
import com.vkontakte.android.data.ServerKeys;
import com.vkontakte.android.data.VKList;
import com.vkontakte.android.fragments.money.MoneyTransfersFragment;
import com.vkontakte.android.utils.Utils;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class GroupsGetManagers extends VKAPIRequest<VKList<UserProfile>> {
    public GroupsGetManagers(int gid, int offset, int count) {
        super("execute.getGroupManagers");
        param(GraphRequest.FIELDS_PARAM, "online,photo_50,photo_200,photo_100,first_name_acc,last_name_acc");
        param("group_id", gid).param("offset", offset).param(ServerKeys.COUNT, count);
        param(MoneyTransfersFragment.FILTER_ARGUMENT, "managers");
        param("sort", "time_desc");
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.vkontakte.android.api.VKAPIRequest
    /* renamed from: parse */
    public VKList<UserProfile> mo1093parse(JSONObject o) {
        try {
            JSONArray jcontacts = o.getJSONObject(ServerKeys.RESPONSE).optJSONArray("contacts");
            final SparseArray<String> contacts = new SparseArray<>();
            if (jcontacts != null) {
                for (int i = 0; i < jcontacts.length(); i++) {
                    JSONObject jc = jcontacts.getJSONObject(i);
                    if (jc.has("user_id")) {
                        contacts.put(jc.getInt("user_id"), jc.optString("desc"));
                    }
                }
            }
            return new VKList<>(o.getJSONObject(ServerKeys.RESPONSE).getJSONObject("managers"), new Parser<UserProfile>() { // from class: com.vkontakte.android.api.groups.GroupsGetManagers.1
                /* JADX WARN: Can't rename method to resolve collision */
                @Override // com.vkontakte.android.data.Parser
                /* renamed from: parse */
                public UserProfile mo821parse(JSONObject o2) throws JSONException {
                    UserProfile p = new UserProfile(o2);
                    p.extra.putString("role", o2.getString("role"));
                    if (Utils.containsKey(contacts, p.uid)) {
                        p.extra.putString("contact_title", (String) contacts.get(p.uid));
                    }
                    return p;
                }
            });
        } catch (Exception x) {
            Log.w("vk", x);
            return null;
        }
    }
}
