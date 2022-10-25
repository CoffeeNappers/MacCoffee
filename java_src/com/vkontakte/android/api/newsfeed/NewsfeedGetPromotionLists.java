package com.vkontakte.android.api.newsfeed;

import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.data.ServerKeys;
import java.util.ArrayList;
import org.json.JSONArray;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class NewsfeedGetPromotionLists extends VKAPIRequest<ArrayList<Item>> {
    public NewsfeedGetPromotionLists() {
        super("newsfeed.getPromotionLists");
    }

    @Override // com.vkontakte.android.api.VKAPIRequest
    /* renamed from: parse  reason: collision with other method in class */
    public ArrayList<Item> mo1093parse(JSONObject r) throws Exception {
        try {
            ArrayList<Item> result = new ArrayList<>();
            JSONObject response = r.getJSONObject(ServerKeys.RESPONSE);
            JSONArray items = response.getJSONArray(ServerKeys.ITEMS);
            for (int i = 0; i < items.length(); i++) {
                JSONObject obj = items.getJSONObject(i);
                result.add(new Item(obj.getString("id"), obj.getString("title"), obj.optBoolean("hidden") || obj.optBoolean("is_hidden")));
            }
            return result;
        } catch (Exception e) {
            return null;
        }
    }

    /* loaded from: classes2.dex */
    public static class Item {
        public boolean hidden;
        public String id;
        public String title;

        public Item(String id, String title, boolean hidden) {
            this.id = id;
            this.title = title;
            this.hidden = hidden;
        }
    }
}
