package com.vkontakte.android.api.messages;

import android.text.TextUtils;
import com.facebook.GraphRequest;
import com.vkontakte.android.Global;
import com.vkontakte.android.Log;
import com.vkontakte.android.Message;
import com.vkontakte.android.UserProfile;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.data.Parser;
import com.vkontakte.android.data.ServerKeys;
import com.vkontakte.android.data.VKList;
import java.util.ArrayList;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class MessagesSearch extends VKAPIRequest<Result> {

    /* loaded from: classes2.dex */
    public static class Result {
        public ArrayList<UserProfile> chats;
        public VKList<Message> msgs;
    }

    public MessagesSearch(String q, int offset, int count) {
        super("messages.search");
        param("q", q);
        param("offset", offset).param(ServerKeys.COUNT, count).param(ServerKeys.PHOTO_SIZES, 1);
        param(GraphRequest.FIELDS_PARAM, "first_name,last_name,photo_100,photo_50");
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.vkontakte.android.api.VKAPIRequest
    /* renamed from: parse */
    public Result mo1093parse(JSONObject o) {
        try {
            final ArrayList<UserProfile> chats = new ArrayList<>();
            VKList<Message> msgs = new VKList<>(o.getJSONObject(ServerKeys.RESPONSE), new Parser<Message>() { // from class: com.vkontakte.android.api.messages.MessagesSearch.1
                /* JADX WARN: Can't rename method to resolve collision */
                @Override // com.vkontakte.android.data.Parser
                /* renamed from: parse */
                public Message mo821parse(JSONObject m) throws JSONException {
                    Message msg = new Message(m);
                    if (msg.peer > 2000000000) {
                        UserProfile p = new UserProfile();
                        p.uid = msg.peer;
                        p.fullName = msg.title;
                        if (m.has("photo_50")) {
                            p.photo = m.getString(Global.displayDensity > 1.0f ? "photo_100" : "photo_50");
                        } else {
                            ArrayList<String> ph = new ArrayList<>();
                            ph.add("M");
                            JSONArray act = m.getJSONArray("chat_active");
                            for (int j = 0; j < Math.min(4, act.length()); j++) {
                                ph.add(act.getString(j));
                            }
                            p.photo = TextUtils.join(",", ph);
                        }
                        chats.add(p);
                    }
                    return msg;
                }
            });
            Result result = new Result();
            result.msgs = msgs;
            result.chats = chats;
            return result;
        } catch (Exception x) {
            Log.w("vk", x);
            return null;
        }
    }
}
