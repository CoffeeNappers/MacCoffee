package com.vkontakte.android.api.store;

import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.auth.VKAccountManager;
import com.vkontakte.android.data.PurchasesManager;
import com.vkontakte.android.data.ServerKeys;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class StoreBuyProduct extends VKAPIRequest<PurchasesManager.Result> {
    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public StoreBuyProduct(int productID, String type, String referrer) {
        super("store.buyProduct");
        int i = 1;
        param(ServerKeys.TYPE, type);
        param("product_id", productID);
        if (referrer != null && !"".equals(referrer)) {
            param("sticker_referrer", referrer);
        }
        String accessToken = VKAccountManager.getCurrent().getAccessToken();
        accessToken = (accessToken == null || accessToken.length() < 4) ? "0000" : accessToken;
        int guid = productID ^ (((accessToken.charAt(0) | (accessToken.charAt(1) << '\b')) | (accessToken.charAt(2) << 16)) | (accessToken.charAt(3) << 24));
        param("guid", guid);
        param("force_inapp", 0);
        param("no_inapp", PurchasesManager.canUseInApps() ? 0 : i);
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.vkontakte.android.api.VKAPIRequest
    /* renamed from: parse */
    public PurchasesManager.Result mo1093parse(JSONObject source) throws Exception {
        return new PurchasesManager.Result(source.getJSONObject(ServerKeys.RESPONSE));
    }
}
