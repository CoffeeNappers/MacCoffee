package com.vkontakte.android.api.market;

import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.data.Good;
import com.vkontakte.android.data.ServerKeys;
import com.vkontakte.android.data.VKList;
import com.vkontakte.android.utils.L;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class MarketGet extends VKAPIRequest<VKList<Good>> implements ServerKeys {
    public MarketGet(int uid, int offset, int count, int albumId) {
        this(uid, offset, count);
        param("album_id", albumId);
    }

    public MarketGet(int uid, int offset, int count) {
        super("market.get");
        param("owner_id", uid);
        param("offset", offset);
        param(ServerKeys.COUNT, count);
        param("extended", 1);
        param(ServerKeys.PHOTO_SIZES, 1);
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.vkontakte.android.api.VKAPIRequest
    /* renamed from: parse */
    public VKList<Good> mo1093parse(JSONObject r) throws Exception {
        try {
            return new VKList<>(r.getJSONObject(ServerKeys.RESPONSE), Good.class);
        } catch (Exception e) {
            L.e(e, new Object[0]);
            return null;
        }
    }
}
