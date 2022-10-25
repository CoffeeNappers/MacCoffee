package com.vkontakte.android.api;

import com.vkontakte.android.Log;
import org.json.JSONException;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class Order {
    public static final String STATUS_CHARGED = "charged";
    public static final String STATUS_WAIT = "wait";
    public int orderId;
    public String status;

    public Order(JSONObject jsonObject) {
        try {
            this.orderId = jsonObject.getInt("order_id");
            this.status = jsonObject.getString("status");
        } catch (JSONException exc) {
            Log.w("vk", "Error parsing Order: " + jsonObject, exc);
        }
    }
}
