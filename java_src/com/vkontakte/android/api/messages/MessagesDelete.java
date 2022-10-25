package com.vkontakte.android.api.messages;

import android.text.TextUtils;
import com.vkontakte.android.api.ResultlessAPIRequest;
import java.util.List;
/* loaded from: classes2.dex */
public class MessagesDelete extends ResultlessAPIRequest {
    public MessagesDelete(List<Integer> mids) {
        super("messages.delete");
        param("message_ids", TextUtils.join(",", mids));
    }
}
