package com.vkontakte.android.data;

import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import com.vkontakte.android.utils.L;
import java.util.ArrayList;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public abstract class Parser<T> {
    /* renamed from: parse */
    public abstract T mo821parse(JSONObject jSONObject) throws JSONException;

    @Nullable
    public static <T> ArrayList<T> parseArray(@NonNull JSONObject jObject, @NonNull String key, Parser<T> parser) {
        JSONArray jArray = jObject.optJSONArray(key);
        if (jArray != null) {
            int size = jArray.length();
            ArrayList<T> arrayList = new ArrayList<>(size);
            for (int i = 0; i < size; i++) {
                JSONObject jItem = jArray.optJSONObject(i);
                if (jItem != null) {
                    try {
                        arrayList.add(parser.mo821parse(jItem));
                    } catch (Exception e) {
                        L.e(e, new Object[0]);
                    }
                }
            }
            return arrayList;
        }
        return null;
    }
}
