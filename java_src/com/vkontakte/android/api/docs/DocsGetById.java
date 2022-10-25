package com.vkontakte.android.api.docs;

import android.text.TextUtils;
import com.vkontakte.android.api.Document;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.data.ServerKeys;
import io.fabric.sdk.android.services.events.EventsFilesManager;
import org.json.JSONArray;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class DocsGetById extends VKAPIRequest<Document> {
    public DocsGetById(int oid, int did, String accessKey) {
        super("docs.getById");
        String key = TextUtils.isEmpty(accessKey) ? "" : EventsFilesManager.ROLL_OVER_FILE_NAME_SEPARATOR + accessKey;
        param("docs", oid + EventsFilesManager.ROLL_OVER_FILE_NAME_SEPARATOR + did + key);
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.vkontakte.android.api.VKAPIRequest
    /* renamed from: parse */
    public Document mo1093parse(JSONObject o) {
        try {
            JSONArray a = o.getJSONArray(ServerKeys.RESPONSE);
            return new Document(a.getJSONObject(0));
        } catch (Exception e) {
            return null;
        }
    }
}
