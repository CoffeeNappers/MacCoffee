package com.vkontakte.android.data;

import java.lang.reflect.Method;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class PersistentAPIRequest {
    public JSONObject args;
    public Method callback;
    public int id;
    public String method;
    public JSONObject userdata;

    public String toString() {
        return "PersistentAPIRequest {id=" + this.id + ", method=" + this.method + ", callback=" + this.callback + ", args=" + this.args + ", userdata=" + this.userdata + "}";
    }
}
