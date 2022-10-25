package com.vkontakte.android.api.store;

import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.data.PurchasesManager;
import com.vkontakte.android.data.ServerKeys;
import com.vkontakte.android.data.Subscription;
import com.vkontakte.android.utils.L;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class GetSubscription extends VKAPIRequest<Subscription> {
    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public GetSubscription(int id) {
        super("store.getStockItems");
        int i = 1;
        param("product_ids", id);
        param(ServerKeys.TYPE, "subscriptions");
        param("force_inapp", 1);
        param("merchant", "google");
        param("no_inapp", PurchasesManager.canUseInApps() ? 0 : i);
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.vkontakte.android.api.VKAPIRequest
    /* renamed from: parse */
    public Subscription mo1093parse(JSONObject r) throws Exception {
        try {
            return new Subscription(r.getJSONObject(ServerKeys.RESPONSE).getJSONArray(ServerKeys.ITEMS).getJSONObject(0));
        } catch (Exception e) {
            L.e(e, new Object[0]);
            return null;
        }
    }
}
