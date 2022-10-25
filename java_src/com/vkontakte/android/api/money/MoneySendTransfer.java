package com.vkontakte.android.api.money;

import android.text.TextUtils;
import com.facebook.internal.ServerProtocol;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.auth.VKAccountManager;
import com.vkontakte.android.data.ServerKeys;
import com.vkontakte.android.utils.L;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class MoneySendTransfer extends VKAPIRequest<String> {
    public MoneySendTransfer(int receiverId, int amount, String message) {
        super("money.sendTransfer");
        param("receiver_id", receiverId);
        param(ServerKeys.AMOUNT, amount);
        param("message", message);
        String currency = VKAccountManager.getCurrent().monetTransfersCurrency;
        if (!TextUtils.isEmpty(currency)) {
            param("currency", currency);
        }
    }

    @Override // com.vkontakte.android.api.VKAPIRequest
    /* renamed from: parse  reason: collision with other method in class */
    public String mo1093parse(JSONObject o) {
        try {
            return o.getJSONObject(ServerKeys.RESPONSE).getString(ServerProtocol.DIALOG_PARAM_REDIRECT_URI);
        } catch (Exception x) {
            L.e(x, new Object[0]);
            return null;
        }
    }
}
