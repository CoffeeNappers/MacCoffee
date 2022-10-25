package com.vkontakte.android.api.docs;

import com.vkontakte.android.R;
import com.vkontakte.android.VKApplication;
import com.vkontakte.android.api.Document;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.data.ServerKeys;
import com.vkontakte.android.data.VKList;
import java.util.ArrayList;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class DocsGetTypes extends VKAPIRequest<Result> {

    /* loaded from: classes2.dex */
    public static class Result {
        public boolean canAdd;
        public List<DocType> docTypes;
        public VKList<Document> docs;
    }

    public DocsGetTypes(int oid) {
        super("execute.getDocTypes");
        param("owner_id", oid);
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.vkontakte.android.api.VKAPIRequest
    /* renamed from: parse */
    public Result mo1093parse(JSONObject o) {
        boolean z = true;
        try {
            JSONObject response = o.getJSONObject(ServerKeys.RESPONSE);
            Result result = new Result();
            if (response.has("docs")) {
                result.docs = new VKList<>(response.getJSONObject("docs"), Document.class);
            } else {
                result.docs = new VKList<>();
            }
            if (response.optInt("can_add", 1) != 1) {
                z = false;
            }
            result.canAdd = z;
            result.docTypes = new ArrayList();
            result.docTypes.add(new DocType(-1, VKApplication.context.getString(R.string.documents_all), 0));
            JSONArray array = response.optJSONArray(ServerKeys.ITEMS);
            if (array == null) {
                return result;
            }
            for (int i = 0; i < array.length(); i++) {
                result.docTypes.add(new DocType(array.getJSONObject(i)));
            }
            return result;
        } catch (Exception e) {
            return null;
        }
    }

    /* loaded from: classes2.dex */
    public static class DocType {
        public final int count;
        public final int id;
        public final String name;

        public DocType(JSONObject object) throws JSONException {
            this.id = object.getInt("id");
            this.name = object.getString("name");
            this.count = object.getInt(ServerKeys.COUNT);
        }

        public DocType(int id, String name, int count) {
            this.id = id;
            this.name = name;
            this.count = count;
        }
    }
}
