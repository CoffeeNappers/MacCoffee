package com.vkontakte.android.api.account;

import com.facebook.appevents.AppEventsConstants;
import com.vkontakte.android.api.ResultlessAPIRequest;
/* loaded from: classes2.dex */
public class AccountSetSilenceMode extends ResultlessAPIRequest {
    public AccountSetSilenceMode(int peer, int time, boolean mute) {
        super("account.setSilenceMode");
        param("time", (time == Integer.MAX_VALUE ? -1 : time) + "");
        param("sound", mute ? AppEventsConstants.EVENT_PARAM_VALUE_NO : AppEventsConstants.EVENT_PARAM_VALUE_YES);
        param("peer_id", peer);
    }

    public AccountSetSilenceMode(int peer, int time) {
        super("account.setSilenceMode");
        param("time", (time == Integer.MAX_VALUE ? -1 : time) + "");
        param("peer_id", peer);
    }
}
