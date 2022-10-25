package com.vkontakte.android.api.polls;

import com.vkontakte.android.Log;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.attachments.PollAttachment;
import com.vkontakte.android.data.ServerKeys;
import java.util.Collection;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class PollsCreate extends VKAPIRequest<PollAttachment> {
    public PollsCreate(String question, List<String> options, int oid, boolean anonym) {
        super("polls.create");
        param("question", question);
        param("is_anonymous", anonym ? 1 : 0);
        param("owner_id", oid);
        param("add_answers", new JSONArray((Collection) options).toString());
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
