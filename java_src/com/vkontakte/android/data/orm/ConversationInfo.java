package com.vkontakte.android.data.orm;

import org.json.JSONException;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class ConversationInfo {
    public final int disabled_until;
    public final boolean mute;
    public final int peer_id;

    public ConversationInfo(JSONObject object) throws JSONException {
        boolean z = false;
        this.peer_id = object.getInt("peer_id");
        this.mute = object.optInt("sound", 0) == 0 ? true : z;
        this.disabled_until = object.getInt("disabled_until");
    }
}
