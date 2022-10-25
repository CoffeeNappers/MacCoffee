package com.vkontakte.android.api.board;

import com.google.firebase.analytics.FirebaseAnalytics;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.data.ServerKeys;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class BoardCommentLike extends VKAPIRequest<Result> implements ServerKeys {
    private Result result;

    /* loaded from: classes2.dex */
    public static class Result {
        public int commentId;
        public boolean isLiked;
        public int likeCount;
        public int ownerId;

        public Result(int ownerId, int commentId, boolean isLiked) {
            this.ownerId = ownerId;
            this.commentId = commentId;
            this.isLiked = isLiked;
        }
    }

    public BoardCommentLike(boolean isLiked, int ownerId, int commentId) {
        super(isLiked ? "likes.delete" : "likes.add");
        param(ServerKeys.TYPE, "topic_comment").param("owner_id", ownerId).param(FirebaseAnalytics.Param.ITEM_ID, commentId);
        this.result = new Result(ownerId, commentId, !isLiked);
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.vkontakte.android.api.VKAPIRequest
    /* renamed from: parse */
    public Result mo1093parse(JSONObject r) throws Exception {
        try {
            this.result.likeCount = r.getJSONObject(ServerKeys.RESPONSE).optInt(ServerKeys.LIKES, 0);
            return this.result;
        } catch (Exception e) {
            return null;
        }
    }
}
