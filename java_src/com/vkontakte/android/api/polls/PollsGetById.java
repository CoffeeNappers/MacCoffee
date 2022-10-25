package com.vkontakte.android.api.polls;

import com.vkontakte.android.Log;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.attachments.PollAttachment;
import com.vkontakte.android.data.ServerKeys;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class PollsGetById extends VKAPIRequest<PollAttachment> {
    public PollsGetById(int ownerID, int pollID) {
        super("polls.getById");
        param("owner_id", ownerID).param("poll_id", pollID);
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.vkontakte.android.api.VKAPIRequest
    /* renamed from: parse */
    public PollAttachment mo1093parse(JSONObject o) {
        try {
            return new PollAttachment(o.getJSONObject(ServerKeys.RESPONSE));
        } catch (Exception x) {
            Log.w("vk", x);
            return null;
        }
    }
}
