package com.my.tracker.utils;

import android.text.TextUtils;
import org.json.JSONException;
import org.json.JSONObject;
/* compiled from: EventUtils.java */
/* loaded from: classes2.dex */
public final class b {
    public static boolean a(String str) {
        return TextUtils.isEmpty(str) || "{}".equals(str);
    }

    /* compiled from: EventUtils.java */
    /* renamed from: com.my.tracker.utils.b$b  reason: collision with other inner class name */
    /* loaded from: classes2.dex */
    public static class C0239b {
        public JSONObject a;

        public C0239b(String str) {
            if (!TextUtils.isEmpty(str)) {
                try {
                    this.a = new JSONObject(str);
                } catch (JSONException e) {
                    com.my.tracker.a.a("JSON exception serializing event");
                }
            }
            if (this.a == null) {
                this.a = new JSONObject();
            }
        }

        public final C0239b a(String str, String str2) {
            try {
                this.a.putOpt(str, str2);
            } catch (JSONException e) {
                com.my.tracker.a.a("JSON exception add string to event params");
            }
            return this;
        }

        public final String toString() {
            return this.a.toString();
        }
    }

    /* compiled from: EventUtils.java */
    /* loaded from: classes2.dex */
    public static class a {
        public JSONObject a;

        public a(String str) {
            if (!TextUtils.isEmpty(str)) {
                try {
                    this.a = new JSONObject(str);
                } catch (JSONException e) {
                    com.my.tracker.a.a("JSON exception deserializing event");
                }
            }
        }

        public final String a(String str) {
            if (this.a == null) {
                return null;
            }
            return this.a.optString(str);
        }
    }
}
