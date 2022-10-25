package com.vkontakte.android.api.fave;

import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.data.ServerKeys;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class FaveAddGroup extends VKAPIRequest<Boolean> {
    public FaveAddGroup(int group_id) {
        super("fave.addGroup");
        param("group_id", group_id);
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.vkontakte.android.api.VKAPIRequest
    /* renamed from: parse */
    public Boolean mo1093parse(JSONObject r) throws Exception {
        boolean z = true;
        if (r.optInt(ServerKeys.RESPONSE) != 1) {
            z = false;
        }
        return Boolean.valueOf(z);
    }
}
