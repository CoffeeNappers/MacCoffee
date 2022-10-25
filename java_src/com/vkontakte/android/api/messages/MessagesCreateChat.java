package com.vkontakte.android.api.messages;

import android.text.TextUtils;
import com.vkontakte.android.UserProfile;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.data.ServerKeys;
import java.util.ArrayList;
import java.util.Iterator;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class MessagesCreateChat extends VKAPIRequest<Integer> {
    public MessagesCreateChat(ArrayList<UserProfile> users, String title) {
        super("messages.createChat");
        ArrayList<Integer> uids = new ArrayList<>();
        Iterator<UserProfile> it = users.iterator();
        while (it.hasNext()) {
            UserProfile p = it.next();
            uids.add(Integer.valueOf(p.uid));
        }
        param(ServerKeys.USER_IDS, TextUtils.join(",", uids));
        if (title != null) {
            param("title", title);
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
