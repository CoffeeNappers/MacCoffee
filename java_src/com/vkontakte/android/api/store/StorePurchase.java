package com.vkontakte.android.api.store;

import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.data.PurchasesManager;
import com.vkontakte.android.data.ServerKeys;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class StorePurchase extends VKAPIRequest<PurchasesManager.Result> {
    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public StorePurchase(int id, String storeID, String transaction, String token, String type) {
        super("store.purchase");
        int i = 0;
        param(ServerKeys.TYPE, type);
        param("product_id", id);
        param("merchant", "google");
        if (storeID != null) {
            param("merchant_product_id", storeID);
            param("merchant_transaction_id", transaction);
            param("receipt", token);
        }
        param("force_inapp", 0);
        param("no_inapp", !PurchasesManager.canUseInApps() ? 1 : i);
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.vkontakte.android.api.VKAPIRequest
    /* renamed from: parse */
    public PurchasesManager.Result mo1093parse(JSONObject source) throws Exception {
        return new PurchasesManager.Result(source.getJSONObject(ServerKeys.RESPONSE));
    }
}
