package com.vkontakte.android.api.users;

import android.text.TextUtils;
import android.util.SparseArray;
import com.vkontakte.android.Global;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.data.ServerKeys;
import com.vkontakte.android.utils.L;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class GetOnlines extends VKAPIRequest<SparseArray<Integer>> {
    public GetOnlines(List<Integer> uids) {
        super("execute.getOnlines");
        param(ServerKeys.USER_IDS, TextUtils.join(",", uids));
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.vkontakte.android.api.VKAPIRequest
    /* renamed from: parse */
    public SparseArray<Integer> mo1093parse(JSONObject o) {
        try {
            SparseArray<Integer> result = new SparseArray<>();
            JSONArray a = o.getJSONArray(ServerKeys.RESPONSE);
            for (int i = 0; i < a.length(); i++) {
                JSONObject aa = a.getJSONObject(i);
                result.put(aa.getInt("id"), Integer.valueOf(Global.getUserOnlineStatus(aa)));
            }
            return result;
        } catch (Exception e) {
            L.e(e, new Object[0]);
            return null;
        }
    }
}
