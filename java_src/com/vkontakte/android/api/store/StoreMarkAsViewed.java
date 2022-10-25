package com.vkontakte.android.api.store;

import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.data.ServerKeys;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class StoreMarkAsViewed extends VKAPIRequest<Boolean> {
    public static StoreMarkAsViewed markGlobalPromotionAsViewed() {
        return new StoreMarkAsViewed("global_promotion");
    }

    public static StoreMarkAsViewed markNewItemsAsViewed() {
        return new StoreMarkAsViewed("store_new_items");
    }

    private StoreMarkAsViewed(String reset) {
        super("store.markAsViewed");
        param(ServerKeys.TYPE, "stickers");
        param("reset", reset);
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.vkontakte.android.api.VKAPIRequest
    /* renamed from: parse */
    public Boolean mo1093parse(JSONObject r) throws Exception {
        return true;
    }
}
