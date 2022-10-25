package com.vkontakte.android.api.masks;

import com.facebook.appevents.AppEventsConstants;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.data.ServerKeys;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class MasksGet extends VKAPIRequest<MasksResponse> {
    public MasksGet(int sectionId, int count, int offset) {
        super("masks.get");
        param("section_id", sectionId);
        param(ServerKeys.COUNT, count);
        param("offset", offset);
        param("extended", AppEventsConstants.EVENT_PARAM_VALUE_YES);
    }

    public MasksGet(int sectionId, int count, int offset, double latitude, double longitude) {
        this(sectionId, count, offset);
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
