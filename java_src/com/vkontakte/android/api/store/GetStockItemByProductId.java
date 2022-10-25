package com.vkontakte.android.api.store;

import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.api.store.GetGiftsStockBalance;
import com.vkontakte.android.data.PurchasesManager;
import com.vkontakte.android.data.ServerKeys;
import com.vkontakte.android.data.Subscription;
import com.vkontakte.android.data.orm.StickerStockItem;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class GetStockItemByProductId extends VKAPIRequest<PurchasesManager.Product> {
    public GetStockItemByProductId() {
        super("store.getStockItemByProductId");
        param("merchant", "google");
    }

    public GetStockItemByProductId type(String type) {
        param(ServerKeys.TYPE, type);
        return this;
    }

    public GetStockItemByProductId productId(int id) {
        param("product_id", id);
        return this;
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.vkontakte.android.api.VKAPIRequest
    /* renamed from: parse */
    public PurchasesManager.Product mo1093parse(JSONObject source) throws Exception {
        JSONObject response = source.getJSONObject(ServerKeys.RESPONSE);
        String type = response.getJSONObject("product").optString(ServerKeys.TYPE);
        String valueOf = String.valueOf(type);
        char c = 65535;
        switch (valueOf.hashCode()) {
            case 112397001:
                if (valueOf.equals("votes")) {
                    c = 1;
                    break;
                }
                break;
            case 1987365622:
                if (valueOf.equals("subscriptions")) {
                    c = 0;
                    break;
                }
                break;
        }
        switch (c) {
            case 0:
                return new Subscription(response);
            case 1:
                return new GetGiftsStockBalance.VotesProduct(response);
            default:
                return new StickerStockItem(response, 0);
        }
    }
}
