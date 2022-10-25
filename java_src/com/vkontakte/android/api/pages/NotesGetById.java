package com.vkontakte.android.api.pages;

import com.vkontakte.android.api.Callback;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.data.ServerKeys;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class NotesGetById extends VKAPIRequest<Result> {
    Callback callback;

    /* loaded from: classes2.dex */
    public static class Result {
        public String title;
        public String url;
    }

    public NotesGetById(int oid, int nid) {
        super("notes.getById");
        param("owner_id", oid).param("note_id", nid);
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.vkontakte.android.api.VKAPIRequest
    /* renamed from: parse */
    public Result mo1093parse(JSONObject o) {
        try {
            Result res = new Result();
            res.url = o.getJSONObject(ServerKeys.RESPONSE).optString(ServerKeys.VIEW_URL);
            res.title = o.getJSONObject(ServerKeys.RESPONSE).optString("title");
            return res;
        } catch (Exception e) {
            return null;
        }
    }
}
