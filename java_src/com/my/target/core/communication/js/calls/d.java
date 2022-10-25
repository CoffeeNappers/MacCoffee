package com.my.target.core.communication.js.calls;

import com.facebook.internal.ServerProtocol;
import org.json.JSONException;
import org.json.JSONObject;
/* compiled from: JSInitCall.java */
/* loaded from: classes2.dex */
public final class d extends a {
    public d(JSONObject jSONObject) {
        super("init");
        try {
            this.a.put("bannersJSON", jSONObject);
            this.a.put(ServerProtocol.FALLBACK_DIALOG_PARAM_VERSION, 20);
        } catch (JSONException e) {
        }
    }
}
