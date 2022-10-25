package com.vkontakte.android.api;

import com.vkontakte.android.Log;
import com.vkontakte.android.data.Parser;
import com.vkontakte.android.data.ServerKeys;
import com.vkontakte.android.data.VKList;
import org.json.JSONException;
import org.json.JSONObject;
/* loaded from: classes.dex */
public class ListAPIRequest<I> extends VKAPIRequest<VKList<I>> {
    protected Class<I> itemType;
    protected Parser<I> parser;

    public ListAPIRequest(String method, Parser<I> parser) {
        super(method);
        this.parser = parser;
    }

    public ListAPIRequest(String method, Class<I> itemType) {
        super(method);
        this.itemType = itemType;
    }

    public ListAPIRequest(String method) {
        super(method);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void setParser(Parser<I> p) {
        this.itemType = null;
        this.parser = p;
    }

    @Override // com.vkontakte.android.api.VKAPIRequest
    /* renamed from: parse */
    public VKList<I> mo1093parse(JSONObject r) throws JSONException {
        try {
            if (this.itemType != null) {
                return new VKList<>(getArrayObject(r), this.itemType);
            }
            if (this.parser != null) {
                return new VKList<>(getArrayObject(r), this.parser);
            }
            throw new IllegalStateException("Can't parse because there's no parser");
        } catch (Exception x) {
            Log.w("vk", "Error parsing response", x);
            return null;
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public JSONObject getArrayObject(JSONObject r) throws JSONException {
        return r.getJSONObject(ServerKeys.RESPONSE);
    }
}
