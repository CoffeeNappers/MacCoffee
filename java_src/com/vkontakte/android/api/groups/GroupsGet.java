package com.vkontakte.android.api.groups;

import android.support.annotation.NonNull;
import com.facebook.GraphRequest;
import com.vkontakte.android.Log;
import com.vkontakte.android.api.Group;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.auth.VKAccountManager;
import com.vkontakte.android.data.ServerKeys;
import com.vkontakte.android.fragments.money.MoneyTransfersFragment;
import java.util.ArrayList;
import org.json.JSONArray;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class GroupsGet extends VKAPIRequest<ArrayList<Group>> {
    public GroupsGet(int uid) {
        super("execute.groupsGet");
        param("user_id", uid);
        param("extended", 1);
        param(GraphRequest.FIELDS_PARAM, "start_date,members_count,verified,screen_name,activity");
    }

    public GroupsGet(@NonNull String filter) {
        super("execute.groupsGet");
        param("user_id", VKAccountManager.getCurrent().getUid());
        param("extended", 1);
        param(MoneyTransfersFragment.FILTER_ARGUMENT, filter);
    }

    @Override // com.vkontakte.android.api.VKAPIRequest
    /* renamed from: parse  reason: collision with other method in class */
    public ArrayList<Group> mo1093parse(JSONObject o) {
        try {
            ArrayList<Group> result = new ArrayList<>();
            JSONArray a = o.getJSONObject(ServerKeys.RESPONSE).getJSONArray(ServerKeys.ITEMS);
            if (a != null) {
                for (int i = 0; i < a.length(); i++) {
                    JSONObject gr = a.getJSONObject(i);
                    Group g = new Group(gr);
                    result.add(g);
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
