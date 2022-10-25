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
public class GetStockItemByName extends VKAPIRequest<StickerStockItem> {
    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public GetStockItemByName(String name) {
        super("store.getStockItemByName");
        int i = 0;
        param(ServerKeys.TYPE, "stickers");
        param("merchant", "google");
        param("name", name);
        param("force_inapp", 0);
        param("no_inapp", !PurchasesManager.canUseInApps() ? 1 : i);
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.vkontakte.android.api.VKAPIRequest
    /* renamed from: parse */
    public StickerStockItem mo1093parse(JSONObject r) throws Exception {
        StickerStockItem item = new StickerStockItem(r.getJSONObject(ServerKeys.RESPONSE), 0);
        ArrayList arrayList = new ArrayList(1);
        arrayList.add(item);
        Stickers.get().fillLocalInfo(arrayList, new F1<StickerStockItem, StickerStockItem>() { // from class: com.vkontakte.android.api.store.GetStockItemByName.1
            @Override // com.vkontakte.android.functions.F1
            public StickerStockItem f(StickerStockItem item2) {
                return item2;
            }
        });
        return item;
    }
}
