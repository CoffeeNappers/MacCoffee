package com.vkontakte.android.api.masks;

import com.facebook.appevents.AppEventsConstants;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.data.ServerKeys;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class MasksGetById extends VKAPIRequest<MasksResponse> {
    public MasksGetById(String maskIds) {
        super("masks.getById");
        param("mask_ids", maskIds);
        param("extended", AppEventsConstants.EVENT_PARAM_VALUE_YES);
    }

    public MasksGetById(String maskIds, double latitude, double longitude) {
        this(maskIds);
        param("latitude", String.valueOf(latitude));
        param("longitude", String.valueOf(longitude));
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.vkontakte.android.api.VKAPIRequest
    /* renamed from: parse */
    public MasksResponse mo1093parse(JSONObject r) throws Exception {
        return new MasksResponse(r.getJSONObject(ServerKeys.RESPONSE));
    }
}
