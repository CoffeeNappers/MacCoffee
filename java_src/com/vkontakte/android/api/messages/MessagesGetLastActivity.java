package com.vkontakte.android.api.messages;

import com.facebook.GraphRequest;
import com.vkontakte.android.Global;
import com.vkontakte.android.Log;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.data.ServerKeys;
import io.sentry.marshaller.json.JsonMarshaller;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class MessagesGetLastActivity extends VKAPIRequest<Result> {

    /* loaded from: classes2.dex */
    public static class Result {
        public boolean f;
        public boolean mobile;
        public int online;
        public int time;
    }

    public MessagesGetLastActivity(int uid) {
        super("users.get");
        param(ServerKeys.USER_IDS, uid);
        param(GraphRequest.FIELDS_PARAM, "online,sex,last_seen");
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.vkontakte.android.api.VKAPIRequest
    /* renamed from: parse */
    public Result mo1093parse(JSONObject o) {
        boolean z = false;
        try {
            JSONObject o2 = o.getJSONArray(ServerKeys.RESPONSE).getJSONObject(0);
            int platform = o2.has("last_seen") ? o2.getJSONObject("last_seen").getInt(JsonMarshaller.PLATFORM) : 0;
            Result result = new Result();
            result.time = o2.has("last_seen") ? o2.getJSONObject("last_seen").getInt("time") : 0;
            result.online = Global.getUserOnlineStatus(o2);
            result.f = o2.getInt("sex") == 1;
            if (platform == 1 || platform == 2 || platform == 3 || platform == 4 || platform == 5) {
                z = true;
            }
            result.mobile = z;
            return result;
        } catch (Exception x) {
            Log.w("vk", x);
            return null;
        }
    }
}
