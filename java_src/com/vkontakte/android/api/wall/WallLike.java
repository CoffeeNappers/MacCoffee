package com.vkontakte.android.api.wall;

import com.google.firebase.analytics.FirebaseAnalytics;
import com.vk.webapp.ReportAppInputData;
import com.vkontakte.android.NewsEntry;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.api.board.BoardComment;
import com.vkontakte.android.data.Good;
import com.vkontakte.android.data.ServerKeys;
import com.vkontakte.android.utils.L;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class WallLike extends VKAPIRequest<Result> {

    /* loaded from: classes2.dex */
    public static class Result {
        public int likes;
        public int postID;
        public int retweets;
    }

    public static WallLike market(Good good) {
        return (WallLike) new WallLike(good.user_likes != 0 ? "likes.add" : "likes.delete").param(ServerKeys.TYPE, ReportAppInputData.REPORT_TYPE_MARKET).param(FirebaseAnalytics.Param.ITEM_ID, good.id).param("owner_id", good.owner_id);
    }

    public static WallLike market(BoardComment comment, int owner_id) {
        return (WallLike) new WallLike(!comment.isLiked() ? "likes.add" : "likes.delete").param(ServerKeys.TYPE, ReportAppInputData.REPORT_TYPE_MARKET_COMMENT).param(FirebaseAnalytics.Param.ITEM_ID, comment.getId()).param("owner_id", owner_id);
    }

    public static WallLike newsEntry(NewsEntry e, boolean liked, String akey) {
        WallLike wallLike = new WallLike(liked, e.ownerID, e.postID, false, e.type, 0, akey);
        if (e.hasTrackCode()) {
            wallLike.param("track_code", e.getTrackCode());
        }
        return wallLike;
    }

    private WallLike(String method) {
        super(method);
    }

    /* JADX WARN: Illegal instructions before constructor call */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public WallLike(boolean r6, int r7, int r8, boolean r9, int r10, int r11, java.lang.String r12) {
        /*
            r5 = this;
            r4 = 1
            if (r10 != 0) goto Lf7
            if (r6 == 0) goto Lf2
            java.lang.String r1 = "wall.addLike"
        L8:
            r5.<init>(r1)
            r1 = 12
            if (r10 != r1) goto L3e
            java.lang.String r1 = "owner_id"
            com.vkontakte.android.api.VKAPIRequest r1 = r5.param(r1, r7)
            java.lang.String r2 = "post_id"
            com.vkontakte.android.api.VKAPIRequest r1 = r1.param(r2, r8)
            java.lang.String r2 = "type"
            java.lang.String r3 = "post_ads"
            com.vkontakte.android.api.VKAPIRequest r1 = r1.param(r2, r3)
            java.lang.String r2 = "owner_id"
            com.vkontakte.android.api.VKAPIRequest r1 = r1.param(r2, r7)
            java.lang.String r2 = "item_id"
            r1.param(r2, r8)
            if (r6 == 0) goto L3e
            if (r9 == 0) goto L3e
            java.lang.String r1 = "need_publish"
            r5.param(r1, r4)
        L3e:
            if (r10 != 0) goto L57
            java.lang.String r1 = "owner_id"
            com.vkontakte.android.api.VKAPIRequest r1 = r5.param(r1, r7)
            java.lang.String r2 = "post_id"
            r1.param(r2, r8)
            if (r6 == 0) goto L57
            if (r9 == 0) goto L57
            java.lang.String r1 = "need_publish"
            r5.param(r1, r4)
        L57:
            if (r10 != r4) goto L7e
            java.lang.String r1 = "type"
            java.lang.String r2 = "photo"
            com.vkontakte.android.api.VKAPIRequest r1 = r5.param(r1, r2)
            java.lang.String r2 = "owner_id"
            com.vkontakte.android.api.VKAPIRequest r1 = r1.param(r2, r7)
            java.lang.String r2 = "item_id"
            r1.param(r2, r8)
            if (r12 == 0) goto L7e
            int r1 = r12.length()
            if (r1 <= 0) goto L7e
            java.lang.String r1 = "access_key"
            r5.param(r1, r12)
        L7e:
            r1 = 2
            if (r10 != r1) goto La6
            java.lang.String r1 = "type"
            java.lang.String r2 = "video"
            com.vkontakte.android.api.VKAPIRequest r1 = r5.param(r1, r2)
            java.lang.String r2 = "owner_id"
            com.vkontakte.android.api.VKAPIRequest r1 = r1.param(r2, r7)
            java.lang.String r2 = "item_id"
            r1.param(r2, r8)
            if (r12 == 0) goto La6
            int r1 = r12.length()
            if (r1 <= 0) goto La6
            java.lang.String r1 = "access_key"
            r5.param(r1, r12)
        La6:
            r1 = 5
            if (r10 != r1) goto Ld7
            java.lang.String r0 = ""
            switch(r11) {
                case 1: goto L103;
                case 2: goto L107;
                case 3: goto Laf;
                case 4: goto L10b;
                default: goto Laf;
            }
        Laf:
            java.lang.String r1 = "type"
            java.lang.StringBuilder r2 = new java.lang.StringBuilder
            r2.<init>()
            java.lang.StringBuilder r2 = r2.append(r0)
            java.lang.String r3 = "comment"
            java.lang.StringBuilder r2 = r2.append(r3)
            java.lang.String r2 = r2.toString()
            com.vkontakte.android.api.VKAPIRequest r1 = r5.param(r1, r2)
            java.lang.String r2 = "owner_id"
            com.vkontakte.android.api.VKAPIRequest r1 = r1.param(r2, r7)
            java.lang.String r2 = "item_id"
            r1.param(r2, r8)
        Ld7:
            r1 = 4
            if (r10 != r1) goto Lf1
            java.lang.String r1 = "type"
            java.lang.String r2 = "topic"
            com.vkontakte.android.api.VKAPIRequest r1 = r5.param(r1, r2)
            java.lang.String r2 = "owner_id"
            com.vkontakte.android.api.VKAPIRequest r1 = r1.param(r2, r7)
            java.lang.String r2 = "item_id"
            r1.param(r2, r8)
        Lf1:
            return
        Lf2:
            java.lang.String r1 = "wall.deleteLike"
            goto L8
        Lf7:
            if (r6 == 0) goto Lfe
            java.lang.String r1 = "likes.add"
            goto L8
        Lfe:
            java.lang.String r1 = "likes.delete"
            goto L8
        L103:
            java.lang.String r0 = "photo_"
            goto Laf
        L107:
            java.lang.String r0 = "video_"
            goto Laf
        L10b:
            java.lang.String r0 = "topic_"
            goto Laf
        */
        throw new UnsupportedOperationException("Method not decompiled: com.vkontakte.android.api.wall.WallLike.<init>(boolean, int, int, boolean, int, int, java.lang.String):void");
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.vkontakte.android.api.VKAPIRequest
    /* renamed from: parse */
    public Result mo1093parse(JSONObject o) {
        try {
            int likes = o.getJSONObject(ServerKeys.RESPONSE).getInt(ServerKeys.LIKES);
            Result res = new Result();
            res.likes = likes;
            res.retweets = o.getJSONObject(ServerKeys.RESPONSE).optInt("reposts", -1);
            res.postID = o.getJSONObject(ServerKeys.RESPONSE).optInt("reposted_post_id", -1);
            return res;
        } catch (Exception x) {
            L.e(x, new Object[0]);
            return null;
        }
    }
}
