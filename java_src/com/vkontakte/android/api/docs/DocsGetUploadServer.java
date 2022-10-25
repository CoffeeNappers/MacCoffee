package com.vkontakte.android.api.docs;

import android.text.TextUtils;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.data.ServerKeys;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class DocsGetUploadServer extends VKAPIRequest<String> {
    public DocsGetUploadServer(int ownerID, boolean wall) {
        this(ownerID, wall ? "docs.getWallUploadServer" : "docs.getUploadServer", null);
    }

    public DocsGetUploadServer(int ownerID, String type) {
        this(ownerID, "docs.getUploadServer", type);
    }

    public DocsGetUploadServer(int ownerID, String method, String type) {
        super(method);
        if (ownerID < 0) {
            param("group_id", -ownerID);
        }
        if (!TextUtils.isEmpty(type)) {
            param(ServerKeys.TYPE, type);
        }
    }

    @Override // com.vkontakte.android.api.VKAPIRequest
    /* renamed from: parse  reason: collision with other method in class */
    public String mo1093parse(JSONObject o) {
        try {
            return o.getJSONObject(ServerKeys.RESPONSE).getString("upload_url");
        } catch (Exception e) {
            return null;
        }
    }
}
