package com.vkontakte.android.api.store;

import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.data.PurchasesManager;
import com.vkontakte.android.data.ServerKeys;
import com.vkontakte.android.data.orm.StickerStockItem;
import com.vkontakte.android.functions.F1;
import com.vkontakte.android.stickers.Stickers;
import java.util.ArrayList;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class GetStickerStockItemByStickerId extends VKAPIRequest<StickerStockItem> {
    public GetStickerStockItemByStickerId(int stickerId) {
        super("store.getStockItemByStickerId");
        param("sticker_id", stickerId);
        param("merchant", "google");
        param("no_inapp", !PurchasesManager.canUseInApps() ? 1 : 0);
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.vkontakte.android.api.VKAPIRequest
    /* renamed from: parse */
    public StickerStockItem mo1093parse(JSONObject source) throws Exception {
        JSONObject responseObj = source.getJSONObject(ServerKeys.RESPONSE);
        StickerStockItem item = new StickerStockItem(responseObj, 0);
        ArrayList arrayList = new ArrayList(1);
        arrayList.add(item);
        Stickers.get().fillLocalInfo(arrayList, new F1<StickerStockItem, StickerStockItem>() { // from class: com.vkontakte.android.api.store.GetStickerStockItemByStickerId.1
            @Override // com.vkontakte.android.functions.F1
            public StickerStockItem f(StickerStockItem item2) {
                return item2;
            }
        });
        return item;
    }
}
