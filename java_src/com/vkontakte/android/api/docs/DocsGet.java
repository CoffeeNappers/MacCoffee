package com.vkontakte.android.api.docs;

import com.vkontakte.android.api.Document;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.data.ServerKeys;
import com.vkontakte.android.data.VKList;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class DocsGet extends VKAPIRequest<VKList<Document>> {
    public DocsGet(int oid, int offset, int count) {
        super("docs.get");
        param("owner_id", oid).param("offset", offset).param(ServerKeys.COUNT, count);
    }

    public DocsGet(int oid, int offset, int count, int typeId) {
        super("docs.get");
        param("owner_id", oid).param("offset", offset).param(ServerKeys.COUNT, count);
        if (typeId > 0) {
            param(ServerKeys.TYPE, typeId);
        }
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.vkontakte.android.api.VKAPIRequest
    /* renamed from: parse */
    public VKList<Document> mo1093parse(JSONObject o) {
        try {
            return new VKList<>(o.getJSONObject(ServerKeys.RESPONSE), Document.class);
        } catch (Exception e) {
            return null;
        }
    }
}
