package com.vkontakte.android.api.messages;

import com.vkontakte.android.Log;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.data.ServerKeys;
import java.util.ArrayList;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class MessagesGetRecentStickers extends VKAPIRequest<List<Integer>> {
    public MessagesGetRecentStickers() {
        super("messages.getRecentStickers");
    }

    @Override // com.vkontakte.android.api.VKAPIRequest
    /* renamed from: parse  reason: collision with other method in class */
    public List<Integer> mo1093parse(JSONObject o) {
        try {
            ArrayList<Integer> res = new ArrayList<>();
            JSONArray arr = o.getJSONObject(ServerKeys.RESPONSE).getJSONArray("sticker_ids");
            for (int i = 0; i < arr.length(); i++) {
                res.add(Integer.valueOf(arr.getInt(i)));
            }
            return res;
        } catch (Exception x) {
            Log.w("vk", x);
            return null;
        }
    }
}
