package com.my.target.core.communication.js.calls;

import org.json.JSONException;
import org.json.JSONObject;
/* compiled from: JSUpdateBannersCall.java */
/* loaded from: classes2.dex */
public final class f extends a {
    public f(JSONObject jSONObject) {
        super("updateBanners");
        try {
            this.a.put("bannersJSON", jSONObject);
        } catch (JSONException e) {
        }
    }
}
