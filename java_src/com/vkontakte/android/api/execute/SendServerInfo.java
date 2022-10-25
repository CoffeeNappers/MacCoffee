package com.vkontakte.android.api.execute;

import com.vkontakte.android.api.VKAPIRequest;
/* loaded from: classes2.dex */
public class SendServerInfo extends VKAPIRequest<Result> {

    /* loaded from: classes2.dex */
    public static class Result {
        public boolean adv_success;
        public boolean custom_events_success;
        public boolean events_success;
        public boolean online_success;
    }

    public SendServerInfo() {
        super("execute.sendServerInfo");
    }
}
