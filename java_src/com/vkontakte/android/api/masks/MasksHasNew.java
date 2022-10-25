package com.vkontakte.android.api.masks;

import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.data.ServerKeys;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class MasksHasNew extends VKAPIRequest<Integer> {
    public MasksHasNew() {
        super("masks.hasNew");
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.vkontakte.android.api.VKAPIRequest
    /* renamed from: parse */
    public Integer mo1093parse(JSONObject r) throws Exception {
        try {
            return Integer.valueOf(r.getJSONObject(ServerKeys.RESPONSE).getInt("new_masks"));
        } catch (Exception e) {
            return 0;
        }
    }
}
