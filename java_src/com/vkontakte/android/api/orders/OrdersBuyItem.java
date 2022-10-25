package com.vkontakte.android.api.orders;

import com.vkontakte.android.api.Order;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.data.ServerKeys;
import com.vkontakte.android.stickers.Stickers;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class OrdersBuyItem extends VKAPIRequest<Order> {
    public OrdersBuyItem(int appId, String type, String item, int orderId) {
        super("orders.buyItem");
        param("app_id", appId);
        param(ServerKeys.TYPE, type);
        param(Stickers.EXTRA_ITEM, item);
        if (orderId != 0) {
            param("order_id", orderId);
        }
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.vkontakte.android.api.VKAPIRequest
    /* renamed from: parse */
    public Order mo1093parse(JSONObject r) throws Exception {
        JSONObject response = r.getJSONObject(ServerKeys.RESPONSE);
        Order order = new Order(response);
        return order;
    }
}
