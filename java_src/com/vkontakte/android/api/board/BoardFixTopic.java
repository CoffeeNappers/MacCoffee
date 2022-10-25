package com.vkontakte.android.api.board;

import com.vkontakte.android.api.ResultlessAPIRequest;
/* loaded from: classes2.dex */
public class BoardFixTopic extends ResultlessAPIRequest {
    public BoardFixTopic(int gid, int tid, boolean fixed) {
        super(fixed ? "board.fixTopic" : "board.unfixTopic");
        param("group_id", gid).param("topic_id", tid);
    }
}
