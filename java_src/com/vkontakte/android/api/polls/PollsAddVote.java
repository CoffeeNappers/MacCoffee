package com.vkontakte.android.api.polls;

import com.vkontakte.android.api.ResultlessAPIRequest;
/* loaded from: classes2.dex */
public class PollsAddVote extends ResultlessAPIRequest {
    public PollsAddVote(int ownerID, int pollID, int optID, boolean board) {
        super("polls.addVote");
        param("owner_id", ownerID).param("poll_id", pollID).param("answer_id", optID);
        if (board) {
            param("board", 1);
        }
    }
}
