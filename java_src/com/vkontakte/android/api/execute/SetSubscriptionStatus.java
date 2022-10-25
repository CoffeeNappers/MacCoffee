package com.vkontakte.android.api.execute;

import com.vkontakte.android.LongPollService;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.data.ServerKeys;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class SetSubscriptionStatus extends VKAPIRequest<Integer> {
    public static SetSubscriptionStatus createSetSubscriptionStatusAndSendAllStats(int id, boolean subscribe) {
        LongPollService.sendAnalyticsNow();
        return new SetSubscriptionStatus(id, subscribe);
    }

    public SetSubscriptionStatus(int id, boolean subscribe) {
        super("execute.setSubscriptionStatus");
        param("id", id);
        param("subscribe", subscribe ? 1 : 0);
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.vkontakte.android.api.VKAPIRequest
    /* renamed from: parse */
    public Integer mo1093parse(JSONObject o) {
        try {
            return Integer.valueOf(o.getInt(ServerKeys.RESPONSE));
        } catch (Exception e) {
            return -1;
        }
    }
}
