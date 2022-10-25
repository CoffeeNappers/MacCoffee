package com.my.target.core.communication.js.calls;

import org.json.JSONException;
import org.json.JSONObject;
/* compiled from: AbstractJSCall.java */
/* loaded from: classes2.dex */
public abstract class a implements c {
    private String b;
    private JSONObject c = new JSONObject();
    protected JSONObject a = new JSONObject();

    @Override // com.my.target.core.communication.js.calls.c
    public final String a() {
        return this.b;
    }

    @Override // com.my.target.core.communication.js.calls.c
    public final JSONObject b() {
        return this.c;
    }

    public a(String str) {
        this.b = str;
        try {
            this.c.put("method", str);
            this.c.put("data", this.a);
        } catch (JSONException e) {
        }
    }
}
