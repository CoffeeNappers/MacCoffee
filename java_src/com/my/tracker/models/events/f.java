package com.my.tracker.models.events;

import android.text.TextUtils;
import com.facebook.internal.NativeProtocol;
import com.google.android.gms.analytics.ecommerce.ProductAction;
import com.vkontakte.android.data.ServerKeys;
import io.sentry.marshaller.json.JsonMarshaller;
import java.util.List;
import org.json.JSONException;
import org.json.JSONObject;
/* compiled from: PurchaseEvent.java */
/* loaded from: classes2.dex */
public final class f extends a {
    public f(String str, List<Long> list) {
        super(ProductAction.ACTION_PURCHASE, list);
        if (str != null) {
            c(str);
        }
    }

    public f(JSONObject jSONObject, JSONObject jSONObject2, String str, String str2) {
        super(ProductAction.ACTION_PURCHASE);
        JSONObject jSONObject3;
        float f = 0.0f;
        try {
            f = Float.valueOf(jSONObject.optString("price_amount_micros")).floatValue() / 1000000.0f;
        } catch (NumberFormatException e) {
            com.my.tracker.a.a("Wrong price in micros in sku details: " + e.getMessage());
        }
        String optString = jSONObject.optString("price_currency_code");
        try {
            if (TextUtils.isEmpty(str2)) {
                jSONObject3 = new JSONObject();
            } else {
                jSONObject3 = new JSONObject(str2);
            }
            jSONObject3.put("revenue", String.valueOf(f));
            jSONObject3.put("currency", optString);
            jSONObject3.put("purchase_data", jSONObject2);
            jSONObject3.put("data_signature", str);
            c(jSONObject3.toString());
        } catch (JSONException e2) {
            com.my.tracker.a.a(e2.getMessage());
        }
    }

    @Override // com.my.tracker.models.events.c
    public final JSONObject k() {
        JSONObject jSONObject = new JSONObject();
        try {
            jSONObject.put(ServerKeys.TYPE, a());
            jSONObject.put(JsonMarshaller.TIMESTAMP, g());
            String e = e();
            if (!TextUtils.isEmpty(e)) {
                jSONObject.put(NativeProtocol.WEB_DIALOG_PARAMS, new JSONObject(e));
            }
        } catch (JSONException e2) {
            com.my.tracker.a.a(e2.getMessage());
        }
        return jSONObject;
    }
}
