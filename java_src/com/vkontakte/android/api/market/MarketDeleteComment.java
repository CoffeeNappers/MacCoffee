package com.vkontakte.android.api.market;

import com.vkontakte.android.api.ResultlessAPIRequest;
/* loaded from: classes2.dex */
public class MarketDeleteComment extends ResultlessAPIRequest {
    public MarketDeleteComment(int ownerId, int itemId) {
        super("market.deleteComment");
        param("owner_id", ownerId).param("comment_id", itemId);
    }
}
