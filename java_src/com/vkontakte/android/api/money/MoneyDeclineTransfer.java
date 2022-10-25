package com.vkontakte.android.api.money;

import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.data.ServerKeys;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class MoneyDeclineTransfer extends VKAPIRequest<Integer> {
    public MoneyDeclineTransfer(int id) {
        super("money.declineTransfer");
        param("id", id);
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.vkontakte.android.api.VKAPIRequest
    /* renamed from: parse */
    public Integer mo1093parse(JSONObject r) throws Exception {
        return Integer.valueOf(r.optInt(ServerKeys.RESPONSE));
    }
}
