package com.vkontakte.android.api.money;

import com.vkontakte.android.MoneyTransfer;
import com.vkontakte.android.UserProfile;
import com.vkontakte.android.api.Group;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.data.ServerKeys;
import org.json.JSONException;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class MoneyGetTransfer extends VKAPIRequest<MoneyTransfer> {
    public MoneyGetTransfer(int id, int fromId, int toId) {
        super("execute.moneyGetTransferFull");
        param("id", id);
        param(ServerKeys.FROM_ID, fromId);
        param("to_id", toId);
        param("func_v", 2);
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.vkontakte.android.api.VKAPIRequest
    /* renamed from: parse */
    public MoneyTransfer mo1093parse(JSONObject o) throws JSONException {
        UserProfile peerUser;
        JSONObject response = o.getJSONObject(ServerKeys.RESPONSE);
        MoneyTransfer mt = new MoneyTransfer(response.getJSONObject("transfer"));
        if (response.getBoolean("isPeerGroup")) {
            peerUser = new UserProfile(new Group(response.getJSONObject("peer")));
        } else {
            peerUser = new UserProfile(response.getJSONObject("peer"));
        }
        if (response.getBoolean("toPeer")) {
            mt.toUser = peerUser;
        } else {
            mt.fromUser = peerUser;
        }
        return mt;
    }
}
