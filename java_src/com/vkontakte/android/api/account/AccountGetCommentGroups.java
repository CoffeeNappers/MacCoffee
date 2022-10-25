package com.vkontakte.android.api.account;

import com.facebook.GraphRequest;
import com.vkontakte.android.api.Group;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.data.Parser;
import com.vkontakte.android.data.ServerKeys;
import com.vkontakte.android.data.VKList;
import org.json.JSONException;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class AccountGetCommentGroups extends VKAPIRequest<VKList<Group>> {
    public AccountGetCommentGroups(String fields) {
        super("account.getCommentGroups");
        if (fields != null && !fields.isEmpty()) {
            param(GraphRequest.FIELDS_PARAM, fields);
        }
    }

    public AccountGetCommentGroups() {
        this("");
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.vkontakte.android.api.VKAPIRequest
    /* renamed from: parse */
    public VKList<Group> mo1093parse(JSONObject r) throws Exception {
        return new VKList<>(r.getJSONObject(ServerKeys.RESPONSE), new Parser<Group>() { // from class: com.vkontakte.android.api.account.AccountGetCommentGroups.1
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // com.vkontakte.android.data.Parser
            /* renamed from: parse */
            public Group mo821parse(JSONObject o) throws JSONException {
                return new Group(o);
            }
        });
    }
}
