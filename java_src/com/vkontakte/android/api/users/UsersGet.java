package com.vkontakte.android.api.users;

import android.text.TextUtils;
import com.facebook.GraphRequest;
import com.fasterxml.jackson.core.util.MinimalPrettyPrinter;
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
public class UsersGet extends VKAPIRequest<ArrayList<UserProfile>> {
    public UsersGet(int[] uids, String[] fields) {
        super("execute.getUsersAndGroups");
        ArrayList<Integer> users = new ArrayList<>();
        ArrayList<Integer> groups = new ArrayList<>();
        for (int uid : uids) {
            if (uid > 0 || uid < -2000000000) {
                users.add(Integer.valueOf(uid));
            } else {
                groups.add(Integer.valueOf(-uid));
            }
        }
        param(GraphRequest.FIELDS_PARAM, TextUtils.join(",", fields)).param(ServerKeys.USER_IDS, TextUtils.join(",", users));
        param("group_ids", TextUtils.join(",", groups));
    }

    public UsersGet(List<Integer> uids, String[] fields) {
        super("execute.getUsersAndGroups");
        ArrayList<Integer> users = new ArrayList<>();
        ArrayList<Integer> groups = new ArrayList<>();
        for (Integer num : uids) {
            int uid = num.intValue();
            if (uid > 0 || uid < -2000000000) {
                users.add(Integer.valueOf(uid));
            } else {
                groups.add(Integer.valueOf(-uid));
            }
        }
        param(GraphRequest.FIELDS_PARAM, TextUtils.join(",", fields)).param(ServerKeys.USER_IDS, TextUtils.join(",", users));
        param("group_ids", TextUtils.join(",", groups));
    }

    /* JADX WARN: Illegal instructions before constructor call */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public UsersGet(java.util.List<java.lang.Integer> r5, int r6) {
        /*
            r4 = this;
            r0 = 4
            java.lang.String[] r1 = new java.lang.String[r0]
            r2 = 0
            float r0 = com.vkontakte.android.Global.displayDensity
            r3 = 1065353216(0x3f800000, float:1.0)
            int r0 = (r0 > r3 ? 1 : (r0 == r3 ? 0 : -1))
            if (r0 <= 0) goto L2a
            java.lang.String r0 = "photo_medium_rec"
        Lf:
            r1[r2] = r0
            r0 = 1
            java.lang.String r2 = "is_friend"
            r1[r0] = r2
            r0 = 2
            java.lang.String r2 = "sex"
            r1[r0] = r2
            r0 = 3
            java.lang.String r2 = "domain"
            r1[r0] = r2
            r4.<init>(r5, r1)
            switch(r6) {
                case 1: goto L2e;
                case 2: goto L38;
                case 3: goto L42;
                case 4: goto L4c;
                case 5: goto L56;
                default: goto L29;
            }
        L29:
            return
        L2a:
            java.lang.String r0 = "photo_rec"
            goto Lf
        L2e:
            java.lang.String r0 = "name_case"
            java.lang.String r1 = "gen"
            r4.param(r0, r1)
            goto L29
        L38:
            java.lang.String r0 = "name_case"
            java.lang.String r1 = "dat"
            r4.param(r0, r1)
            goto L29
        L42:
            java.lang.String r0 = "name_case"
            java.lang.String r1 = "acc"
            r4.param(r0, r1)
            goto L29
        L4c:
            java.lang.String r0 = "name_case"
            java.lang.String r1 = "ins"
            r4.param(r0, r1)
            goto L29
        L56:
            java.lang.String r0 = "name_case"
            java.lang.String r1 = "abl"
            r4.param(r0, r1)
            goto L29
        */
        throw new UnsupportedOperationException("Method not decompiled: com.vkontakte.android.api.users.UsersGet.<init>(java.util.List, int):void");
    }

    public UsersGet fields(String... fields) {
        param(GraphRequest.FIELDS_PARAM, TextUtils.join(",", fields));
        return this;
    }

    @Override // com.vkontakte.android.api.VKAPIRequest
    /* renamed from: parse  reason: collision with other method in class */
    public ArrayList<UserProfile> mo1093parse(JSONObject o) {
        try {
            JSONArray r = o.getJSONObject(ServerKeys.RESPONSE).getJSONArray("users");
            JSONArray gr = o.getJSONObject(ServerKeys.RESPONSE).getJSONArray("groups");
            ArrayList<UserProfile> result = new ArrayList<>();
            for (int i = 0; i < r.length(); i++) {
                JSONObject jp = r.getJSONObject(i);
                UserProfile p = new UserProfile();
                p.firstName = jp.getString("first_name");
                p.lastName = jp.getString("last_name");
                p.fullName = p.firstName + MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR + p.lastName;
                p.photo = jp.getString(Global.displayDensity > 1.0f ? "photo_medium_rec" : "photo_rec");
                if (jp.has("is_friend")) {
                    p.isFriend = jp.getInt("is_friend") == 1;
                }
                if (jp.has("sex")) {
                    p.f = jp.getInt("sex") == 1;
                }
                if (jp.has("domain")) {
                    p.domain = jp.getString("domain");
                }
                p.uid = jp.getInt("id");
                result.add(p);
            }
            for (int i2 = 0; i2 < gr.length(); i2++) {
                JSONObject jp2 = gr.getJSONObject(i2);
                UserProfile p2 = new UserProfile();
                p2.fullName = jp2.getString("name");
                p2.photo = jp2.getString(Global.displayDensity > 1.0f ? "photo_100" : "photo_50");
                p2.uid = -jp2.getInt("id");
                result.add(p2);
            }
            return result;
        } catch (Exception x) {
            Log.w("vk", x);
            return null;
        }
    }
}
