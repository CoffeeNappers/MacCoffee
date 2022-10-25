package com.vkontakte.android.api.store;

import com.vkontakte.android.api.ResultlessAPIRequest;
import com.vkontakte.android.data.ServerKeys;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class StoreSetActive extends ResultlessAPIRequest {
    public StoreSetActive(int item, boolean active) {
        super(active ? "store.activateProduct" : "store.deactivateProduct");
        param(ServerKeys.TYPE, "stickers");
        param("product_id", item);
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.vkontakte.android.api.ResultlessAPIRequest, com.vkontakte.android.api.VKAPIRequest
    /* renamed from: parse */
    public Boolean mo1093parse(JSONObject r) {
        return super.mo1093parse(r);
    }
}
