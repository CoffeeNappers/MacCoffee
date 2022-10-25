package com.vkontakte.android.api.messages;

import com.facebook.GraphRequest;
import com.vkontakte.android.Log;
import com.vkontakte.android.Message;
import com.vkontakte.android.api.APIUtils;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.data.Parser;
import com.vkontakte.android.data.ServerKeys;
import com.vkontakte.android.data.VKList;
import java.util.Collections;
import java.util.Vector;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class MessagesGetHistory extends VKAPIRequest {
    public static final String METHOD_NAME = "messages.getHistory";

    /* loaded from: classes2.dex */
    public static class Result {
        public VKList<Message> msgs;
        public int offset;
        public int unread;
    }

    public MessagesGetHistory(int uid, int offset, int count, int msgID) {
        super(METHOD_NAME);
        param("peer_id", uid).param("offset", offset).param(ServerKeys.COUNT, count).param(ServerKeys.PHOTO_SIZES, 1);
        param(GraphRequest.FIELDS_PARAM, "first_name,last_name,photo_100,photo_50");
        if (msgID > 0 && offset <= 0) {
            param("start_message_id", msgID);
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // com.vkontakte.android.api.VKAPIRequest
    /* renamed from: parse */
    public Object mo1093parse(JSONObject o) {
        Result result;
        try {
            JSONArray a = APIUtils.unwrapArray(o, ServerKeys.RESPONSE).array;
            if (a != null || this.callback == null) {
                VKList<Message> msgs = new VKList<>(o.getJSONObject(ServerKeys.RESPONSE), new Parser<Message>() { // from class: com.vkontakte.android.api.messages.MessagesGetHistory.1
                    /* JADX WARN: Can't rename method to resolve collision */
                    @Override // com.vkontakte.android.data.Parser
                    /* renamed from: parse */
                    public Message mo821parse(JSONObject jm) throws JSONException {
                        return new Message(jm);
                    }
                });
                Collections.reverse(msgs);
                Result res = new Result();
                res.msgs = msgs;
                res.offset = o.getJSONObject(ServerKeys.RESPONSE).optInt("skipped");
                res.unread = o.getJSONObject(ServerKeys.RESPONSE).optInt(ServerKeys.UNREAD);
                result = res;
            } else {
                result = new Object[]{0, new Vector()};
            }
            return result;
        } catch (Exception x) {
            Log.w("vk", x);
            return null;
        }
    }
}
