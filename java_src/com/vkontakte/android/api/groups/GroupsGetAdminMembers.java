package com.vkontakte.android.api.groups;

import android.util.SparseArray;
import com.facebook.GraphRequest;
import com.vkontakte.android.Log;
import com.vkontakte.android.UserProfile;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.data.ServerKeys;
import com.vkontakte.android.data.VKList;
import com.vkontakte.android.fragments.money.MoneyTransfersFragment;
import com.vkontakte.android.utils.Utils;
import java.util.Iterator;
import org.json.JSONArray;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class GroupsGetAdminMembers extends VKAPIRequest<VKList<UserProfile>> {
    public GroupsGetAdminMembers(int gid, int offset, int count, String filter, String fields, String sort, String searchQuery) {
        super("execute.getAdminGroupMembers");
        param(GraphRequest.FIELDS_PARAM, fields);
        param("group_id", gid).param("offset", offset).param(ServerKeys.COUNT, count);
        if (filter != null) {
            param(MoneyTransfersFragment.FILTER_ARGUMENT, filter);
        }
        if (sort != null) {
            param("sort", sort);
        }
        if (searchQuery != null) {
            param("q", searchQuery);
        }
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.vkontakte.android.api.VKAPIRequest
    /* renamed from: parse */
    public VKList<UserProfile> mo1093parse(JSONObject o) {
        try {
            SparseArray<String> roles = new SparseArray<>();
            SparseArray<String> titles = new SparseArray<>();
            JSONArray jadmins = o.getJSONObject(ServerKeys.RESPONSE).optJSONArray("admins");
            if (jadmins != null) {
                for (int i = 0; i < jadmins.length(); i++) {
                    JSONObject admin = jadmins.getJSONObject(i);
                    roles.put(admin.getInt("id"), admin.getString("role"));
                }
            }
            JSONArray jcontacts = o.getJSONObject(ServerKeys.RESPONSE).optJSONArray("contacts");
            if (jcontacts != null) {
                for (int i2 = 0; i2 < jcontacts.length(); i2++) {
                    JSONObject contact = jcontacts.getJSONObject(i2);
                    if (contact.has("user_id")) {
                        titles.put(contact.getInt("user_id"), contact.optString("desc"));
                    }
                }
            }
            VKList<UserProfile> res = new VKList<>(o.getJSONObject(ServerKeys.RESPONSE), UserProfile.class);
            Iterator it = res.iterator();
            while (it.hasNext()) {
                UserProfile p = (UserProfile) it.next();
                if (Utils.containsKey(roles, p.uid)) {
                    p.extra.putString("role", roles.get(p.uid));
                }
                if (Utils.containsKey(titles, p.uid)) {
                    p.extra.putString("contact_title", titles.get(p.uid));
                }
            }
            return res;
        } catch (Exception x) {
            Log.w("vk", x);
            return null;
        }
    }
}
