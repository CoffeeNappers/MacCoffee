package com.vkontakte.android.api.gifts;

import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.api.models.GiftItem;
import com.vkontakte.android.data.ServerKeys;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class GiftsDelete extends VKAPIRequest<Boolean> {
    public GiftsDelete(GiftItem item) {
        super("gifts.delete");
        param("id", item.id);
        param("gift_hash", item.giftHash);
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.vkontakte.android.api.VKAPIRequest
    /* renamed from: parse */
    public Boolean mo1093parse(JSONObject r) throws Exception {
        boolean z = true;
        if (r.optInt(ServerKeys.RESPONSE) != 1) {
            z = false;
        }
        return Boolean.valueOf(z);
    }
}
