package com.vkontakte.android.api.friends;

import com.vkontakte.android.LongPollService;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.data.ServerKeys;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class FriendsAdd extends VKAPIRequest<Integer> {
    public static FriendsAdd createFriendsAddAndSendAllStats(int uid, String message) {
        LongPollService.sendAnalyticsNow();
        return new FriendsAdd(uid, message);
    }

    public FriendsAdd(int uid, String message) {
        super("friends.add");
        param("user_id", uid);
        if (message != null) {
            param("text", message);
        }
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.vkontakte.android.api.VKAPIRequest
    /* renamed from: parse */
    public Integer mo1093parse(JSONObject o) {
        try {
            return Integer.valueOf(o.getInt(ServerKeys.RESPONSE));
        } catch (Exception e) {
            return null;
        }
    }
}
