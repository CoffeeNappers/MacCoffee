package com.my.target.core.communication.js;

import android.webkit.ConsoleMessage;
import com.my.target.core.communication.js.events.d;
import com.my.target.core.communication.js.events.e;
import com.my.target.core.communication.js.events.f;
import com.my.target.core.communication.js.events.g;
import com.my.target.core.communication.js.events.h;
import com.my.target.core.communication.js.events.i;
import com.vk.sharing.attachment.AttachmentInfo;
import com.vkontakte.android.data.ServerKeys;
import java.util.ArrayList;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
/* compiled from: JSEventDeserializer.java */
/* loaded from: classes2.dex */
public final class a {
    public static f a(ConsoleMessage consoleMessage) {
        String message = consoleMessage.message();
        if (message != null && !message.equals("") && message.startsWith("adman://onEvent,")) {
            try {
                return a(new JSONObject(message.substring(16)));
            } catch (JSONException e) {
            }
        }
        return null;
    }

    private static f a(JSONObject jSONObject) throws JSONException {
        int i = 0;
        String str = null;
        String string = jSONObject.getString("event");
        JSONObject jSONObject2 = jSONObject.has("data") ? jSONObject.getJSONObject("data") : null;
        if (string.equals("onError")) {
            if (jSONObject2 != null) {
                String str2 = "jsError";
                if (jSONObject2.has("error")) {
                    str2 = str2 + " error: " + jSONObject2.getString("error");
                }
                if (jSONObject2.has("message")) {
                    str2 = str2 + " message: " + jSONObject2.getString("message");
                }
                return new e(str2);
            }
            return new e();
        } else if (string.equals("onExpand")) {
            if (jSONObject2 != null && jSONObject2.has("width") && jSONObject2.has("height")) {
                return new g(jSONObject2.getInt("width"), jSONObject2.getInt("height"));
            }
            return new g();
        } else if (string.equals("onAdStart")) {
            if (jSONObject2 == null || !jSONObject2.has("format") || !jSONObject2.has("banners")) {
                return null;
            }
            String string2 = jSONObject2.getString("format");
            JSONArray jSONArray = jSONObject2.getJSONArray("banners");
            int length = jSONArray.length();
            String[] strArr = new String[length];
            while (i < length) {
                strArr[i] = jSONArray.getString(i);
                i++;
            }
            return new d(strArr, string2);
        } else if (string.equals("onSizeChange")) {
            if (jSONObject2 != null && jSONObject2.has("width") && jSONObject2.has("height")) {
                return new h(jSONObject2.getInt("width"), jSONObject2.getInt("height"));
            }
            return null;
        } else if (string.equals("onStat")) {
            if (jSONObject2 == null || !jSONObject2.has(AttachmentInfo.DATA_STATS)) {
                return null;
            }
            JSONArray jSONArray2 = jSONObject2.getJSONArray(AttachmentInfo.DATA_STATS);
            int length2 = jSONArray2.length();
            ArrayList arrayList = new ArrayList();
            while (i < length2) {
                arrayList.add(jSONArray2.getString(i));
                i++;
            }
            if (jSONObject2.has(ServerKeys.TYPE)) {
                str = jSONObject2.getString(ServerKeys.TYPE);
            }
            return new i(arrayList, str);
        } else if (string.equals("onAdClick")) {
            if (jSONObject2 == null || !jSONObject2.has("format") || !jSONObject2.has("bannerId")) {
                return null;
            }
            return new com.my.target.core.communication.js.events.c(jSONObject2.getString("bannerId"), jSONObject2.getString("format"));
        } else {
            return new com.my.target.core.communication.js.events.b(string);
        }
    }
}
