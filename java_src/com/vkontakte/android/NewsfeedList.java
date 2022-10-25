package com.vkontakte.android;

import android.text.TextUtils;
import java.util.concurrent.atomic.AtomicInteger;
import org.json.JSONException;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class NewsfeedList {
    private static final AtomicInteger promoCounter = new AtomicInteger(-10);
    private int id;
    private String promoId;
    private String title;

    public NewsfeedList() {
    }

    public NewsfeedList(int id, String title) {
        this.id = id;
        this.title = title;
    }

    public NewsfeedList(String id, String title) {
        this.id = promoCounter.getAndDecrement();
        this.promoId = id;
        this.title = title;
    }

    public NewsfeedList(JSONObject o) throws JSONException {
        Object idObj = o.get("id");
        if (idObj instanceof String) {
            this.promoId = (String) idObj;
            this.id = promoCounter.getAndDecrement();
        } else {
            this.id = ((Integer) idObj).intValue();
        }
        this.title = o.getString("title");
    }

    public int getId() {
        return this.id;
    }

    public String getPromoId() {
        return this.promoId;
    }

    public String getTitle() {
        return this.title;
    }

    public boolean isPromoList() {
        return !TextUtils.isEmpty(this.promoId);
    }

    public static void resetCounter() {
        promoCounter.set(-10);
    }
}
