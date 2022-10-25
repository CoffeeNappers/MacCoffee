package com.vkontakte.android.api.board;

import com.vkontakte.android.api.ResultlessAPIRequest;
/* loaded from: classes2.dex */
public class BoardDeleteComment extends ResultlessAPIRequest {
    public BoardDeleteComment(int gid, int tid, int cid) {
        super("board.deleteComment");
        param("group_id", gid).param("topic_id", tid).param("comment_id", cid);
    }
}
