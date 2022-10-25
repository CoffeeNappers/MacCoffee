package com.vkontakte.android.data;

import java.lang.reflect.Constructor;
import me.grishka.appkit.api.PaginatedList;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class VKList<T> extends PaginatedList<T> {
    protected int more;
    protected int total;

    public VKList() {
        this.more = 1;
    }

    public VKList(JSONObject obj, Class<T> cls) throws JSONException {
        this(obj, new ReflectionParser(cls));
    }

    public VKList(JSONObject obj, Parser<T> parser) throws JSONException {
        this.more = 1;
        this.total = obj.optInt(ServerKeys.COUNT, 0);
        this.more = obj.optInt("more", 0);
        JSONArray items = obj.optJSONArray(ServerKeys.ITEMS);
        if (items != null) {
            for (int i = 0; i < items.length(); i++) {
                JSONObject item = items.getJSONObject(i);
                T t = parser.mo821parse(item);
                if (t != null) {
                    add(t);
                }
            }
        }
    }

    @Override // me.grishka.appkit.api.PaginatedList
    public int total() {
        return this.total;
    }

    public int more() {
        return this.more;
    }

    public void setTotal(int t) {
        this.total = t;
    }

    /* loaded from: classes2.dex */
    public static class ReflectionParser<T> extends Parser<T> {
        private Constructor<T> jsonConstructor;

        public ReflectionParser(Class<T> cls) {
            try {
                this.jsonConstructor = cls.getConstructor(JSONObject.class);
            } catch (NoSuchMethodException x) {
                throw new RuntimeException("Parameter class should have constructor accepting JSONObject", x);
            }
        }

        @Override // com.vkontakte.android.data.Parser
        /* renamed from: parse */
        public T mo821parse(JSONObject o) throws JSONException {
            try {
                return this.jsonConstructor.newInstance(o);
            } catch (Exception x) {
                throw new RuntimeException("Error instantiating item using constructor " + this.jsonConstructor, x);
            }
        }
    }
}
