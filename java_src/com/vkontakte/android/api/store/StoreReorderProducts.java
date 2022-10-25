package com.vkontakte.android.api.store;

import com.vkontakte.android.api.ResultlessAPIRequest;
import com.vkontakte.android.data.ServerKeys;
/* loaded from: classes2.dex */
public class StoreReorderProducts extends ResultlessAPIRequest {
    public StoreReorderProducts(int id, int before, int after) {
        super("store.reorderProducts");
        param("product_id", id);
        param(ServerKeys.TYPE, "stickers");
        if (before != -1) {
            param("before", before);
        }
        if (after != -1) {
            param("after", after);
        }
    }
}
