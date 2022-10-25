package com.vkontakte.android.api.wall;

import com.vkontakte.android.api.ResultlessAPIRequest;
/* loaded from: classes2.dex */
public class WallSubscribe extends ResultlessAPIRequest {
    public WallSubscribe(int ownerID, boolean subscribe) {
        super(subscribe ? "wall.subscribe" : "wall.unsubscribe");
        param("owner_id", ownerID);
    }
}
