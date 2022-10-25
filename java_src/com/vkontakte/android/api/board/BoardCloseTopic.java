package com.vkontakte.android.api.board;

import com.vkontakte.android.api.ResultlessAPIRequest;
/* loaded from: classes2.dex */
public class BoardCloseTopic extends ResultlessAPIRequest {
    public BoardCloseTopic(int gid, int tid, boolean closed) {
        super(closed ? "board.closeTopic" : "board.openTopic");
        param("group_id", gid).param("topic_id", tid);
    }
}
