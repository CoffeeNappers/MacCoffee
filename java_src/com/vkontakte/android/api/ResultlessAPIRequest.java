package com.vkontakte.android.api;

import org.json.JSONObject;
/* loaded from: classes2.dex */
public class ResultlessAPIRequest extends VKAPIRequest<Boolean> {
    public ResultlessAPIRequest(String method) {
        super(method);
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.vkontakte.android.api.VKAPIRequest
    /* renamed from: parse */
    public Boolean mo1093parse(JSONObject r) {
        return true;
    }
}
