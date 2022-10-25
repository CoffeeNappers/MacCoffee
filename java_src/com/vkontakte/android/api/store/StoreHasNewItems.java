package com.vkontakte.android.api.store;

import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.data.ServerKeys;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class StoreHasNewItems extends VKAPIRequest<Response> {
    public StoreHasNewItems() {
        super("store.hasNewItems");
        param(ServerKeys.TYPE, "stickers");
        param("merchant", "google");
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.vkontakte.android.api.VKAPIRequest
    /* renamed from: parse */
    public Response mo1093parse(JSONObject r) throws Exception {
        return new Response(r.getJSONObject(ServerKeys.RESPONSE));
    }

    /* loaded from: classes2.dex */
    public static class Response {
        public final int globalPromotion;
        public final String stickersVersionHash;
        public final int storeNewItems;

        public Response(JSONObject jsonObject) {
            this.globalPromotion = jsonObject.optInt("global_promotion");
            this.storeNewItems = jsonObject.optInt("store_new_items");
            this.stickersVersionHash = jsonObject.optString("stickers_version_hash");
        }
    }
}
