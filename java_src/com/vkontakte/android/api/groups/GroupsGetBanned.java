package com.vkontakte.android.api.groups;

import android.os.Bundle;
import android.os.Parcelable;
import android.util.SparseArray;
import com.facebook.GraphRequest;
import com.google.firebase.analytics.FirebaseAnalytics;
import com.vkontakte.android.Log;
import com.vkontakte.android.UserProfile;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.data.Parser;
import com.vkontakte.android.data.ServerKeys;
import com.vkontakte.android.data.VKList;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class GroupsGetBanned extends VKAPIRequest<VKList<UserProfile>> {
    public GroupsGetBanned(int gid, int offset, int count) {
        super("execute.getGroupBannedUsers");
        param(GraphRequest.FIELDS_PARAM, "photo_100,photo_200,photo_50,first_name_acc,last_name_acc,sex");
        param("group_id", gid).param("offset", offset).param(ServerKeys.COUNT, count);
    }

    public GroupsGetBanned(int gid, int uid) {
        super("execute.getGroupBannedUsers");
        param(GraphRequest.FIELDS_PARAM, "photo_100,photo_200,photo_50,first_name_acc,last_name_acc,sex");
        param("group_id", gid).param("user_id", uid);
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.vkontakte.android.api.VKAPIRequest
    /* renamed from: parse */
    public VKList<UserProfile> mo1093parse(JSONObject o) {
        boolean z = true;
        try {
            final SparseArray<UserProfile> admins = new SparseArray<>();
            JSONArray jadmins = o.getJSONObject(ServerKeys.RESPONSE).getJSONArray("admins");
            for (int i = 0; i < jadmins.length(); i++) {
                UserProfile p = new UserProfile(jadmins.getJSONObject(i));
                admins.put(p.uid, p);
            }
            VKList<UserProfile> res = new VKList<>(o.getJSONObject(ServerKeys.RESPONSE), new Parser<UserProfile>() { // from class: com.vkontakte.android.api.groups.GroupsGetBanned.1
                /* JADX WARN: Can't rename method to resolve collision */
                @Override // com.vkontakte.android.data.Parser
                /* renamed from: parse */
                public UserProfile mo821parse(JSONObject o2) throws JSONException {
                    if (!o2.has("id")) {
                        return null;
                    }
                    UserProfile p2 = new UserProfile(o2);
                    JSONObject ban = o2.getJSONObject("ban_info");
                    p2.extra.putParcelable("ban_admin", (Parcelable) admins.get(ban.getInt("admin_id")));
                    p2.extra.putInt("ban_date", ban.getInt(ServerKeys.DATE));
                    p2.extra.putInt("ban_end_date", ban.getInt(FirebaseAnalytics.Param.END_DATE));
                    p2.extra.putInt("ban_reason", ban.getInt("reason"));
                    p2.extra.putString("ban_comment", ban.getString("comment"));
                    p2.extra.putBoolean("ban_comment_visible", ban.optInt("comment_visible") == 1);
                    return p2;
                }
            });
            if (res.size() == 0 && o.getJSONObject(ServerKeys.RESPONSE).has("is_member")) {
                UserProfile p2 = new UserProfile();
                p2.extra = new Bundle();
                Bundle bundle = p2.extra;
                if (o.getJSONObject(ServerKeys.RESPONSE).getInt("is_member") != 1) {
                    z = false;
                }
                bundle.putBoolean("is_group_member", z);
                res.add(p2);
                return res;
            }
            return res;
        } catch (Exception x) {
            Log.w("vk", x);
            return null;
        }
    }
}
