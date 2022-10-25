package com.vkontakte.android.api.store;

import com.facebook.share.internal.ShareConstants;
import com.vkontakte.android.api.APIUtils;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.data.PurchasesManager;
import com.vkontakte.android.data.ServerKeys;
import com.vkontakte.android.data.orm.StickerStockItem;
import com.vkontakte.android.functions.F1;
import com.vkontakte.android.stickers.Stickers;
import java.util.ArrayList;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class StoreGetPurchases extends VKAPIRequest<List<StickerStockItem>> {
    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public StoreGetPurchases() {
        super("execute.getStickerProducts");
        int i = 0;
        param(ServerKeys.TYPE, "stickers");
        param(ShareConstants.WEB_DIALOG_PARAM_FILTERS, "purchased");
        param("merchant", "google");
        param("func_v", 2);
        param("force_inapp", 0);
        param("no_inapp", !PurchasesManager.canUseInApps() ? 1 : i);
    }

    @Override // com.vkontakte.android.api.VKAPIRequest
    /* renamed from: parse */
    public List<StickerStockItem> mo1093parse(JSONObject source) throws Exception {
        F1 f1;
        JSONArray array = APIUtils.unwrapArray(source.getJSONObject(ServerKeys.RESPONSE), "stickers").array;
        ArrayList arrayList = new ArrayList(array.length());
        for (int i = 0; i < array.length(); i++) {
            try {
                arrayList.add(new StickerStockItem(array.getJSONObject(i), i));
            } catch (JSONException e) {
            }
        }
        Stickers stickers = Stickers.get();
        f1 = StoreGetPurchases$$Lambda$1.instance;
        stickers.fillLocalInfo(arrayList, f1);
        return arrayList;
    }

    public static /* synthetic */ StickerStockItem lambda$parse$0(StickerStockItem item) {
        return item;
    }
}
