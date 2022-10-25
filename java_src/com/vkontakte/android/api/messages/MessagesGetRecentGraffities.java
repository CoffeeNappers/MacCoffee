package com.vkontakte.android.api.messages;

import com.vkontakte.android.api.Document;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.data.ServerKeys;
import com.vkontakte.android.navigation.ArgKeys;
import java.util.ArrayList;
import org.json.JSONArray;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class MessagesGetRecentGraffities extends VKAPIRequest<ArrayList<Document>> {
    public MessagesGetRecentGraffities() {
        super("messages.getRecentGraffities");
        param(ArgKeys.LIMIT, 20);
    }

    @Override // com.vkontakte.android.api.VKAPIRequest
    /* renamed from: parse  reason: collision with other method in class */
    public ArrayList<Document> mo1093parse(JSONObject r) throws Exception {
        ArrayList<Document> documents = new ArrayList<>();
        try {
            JSONArray p = r.getJSONArray(ServerKeys.RESPONSE);
            for (int i = 0; i < p.length(); i++) {
                documents.add(new Document(p.getJSONObject(i)));
            }
        } catch (Exception e) {
        }
        return documents;
    }
}
