package com.vkontakte.android.api.docs;

import com.facebook.common.util.UriUtil;
import com.vkontakte.android.Log;
import com.vkontakte.android.api.Document;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.data.ServerKeys;
import org.json.JSONArray;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class DocsSave extends VKAPIRequest<Document> {
    public DocsSave(String file) {
        super("docs.save");
        param(UriUtil.LOCAL_FILE_SCHEME, file);
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.vkontakte.android.api.VKAPIRequest
    /* renamed from: parse */
    public Document mo1093parse(JSONObject o) {
        try {
            JSONArray a = o.getJSONArray(ServerKeys.RESPONSE);
            return new Document(a.getJSONObject(0));
        } catch (Exception x) {
            Log.w("Vk", x);
            return null;
        }
    }
}
