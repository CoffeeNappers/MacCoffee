package com.vkontakte.android.api.photos;

import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.data.ServerKeys;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class PhotosCopy extends VKAPIRequest<Integer> {
    public PhotosCopy(int oid, int pid, String akey) {
        super("photos.copy");
        param("owner_id", oid);
        param("photo_id", pid);
        if (akey != null) {
            param("access_key", akey);
        }
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.vkontakte.android.api.VKAPIRequest
    /* renamed from: parse */
    public Integer mo1093parse(JSONObject o) {
        try {
            return Integer.valueOf(o.getInt(ServerKeys.RESPONSE));
        } catch (Exception e) {
            return -1;
        }
    }
}
