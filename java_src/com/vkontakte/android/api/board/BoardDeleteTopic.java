package com.vkontakte.android.api.board;

import com.vkontakte.android.api.ResultlessAPIRequest;
/* loaded from: classes2.dex */
public class BoardDeleteTopic extends ResultlessAPIRequest {
    public BoardDeleteTopic(int gid, int tid) {
        super("board.deleteTopic");
        param("group_id", gid).param("topic_id", tid);
    }
}
