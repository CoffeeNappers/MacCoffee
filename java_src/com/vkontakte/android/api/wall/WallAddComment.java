package com.vkontakte.android.api.wall;

import android.text.TextUtils;
import com.facebook.share.internal.ShareConstants;
import com.vkontakte.android.Log;
import com.vkontakte.android.NewsEntry;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.attachments.Attachment;
import com.vkontakte.android.attachments.StickerAttachment;
import com.vkontakte.android.data.ServerKeys;
import com.vkontakte.android.utils.L;
import java.util.ArrayList;
import java.util.List;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class WallAddComment extends VKAPIRequest<Integer> {
    private static final String[] methods = {"wall.addComment", "photos.createComment", "video.createComment", null, "board.addComment"};
    int type;

    public WallAddComment(NewsEntry entry, String text, int replyTo, List<Attachment> attachments, String accessKey, int fromGroupId, String refer) {
        super(methods[entry.type]);
        int ownerID = entry.ownerID;
        int postID = entry.postID;
        this.type = entry.type;
        param("ref", refer);
        if (entry.hasTrackCode()) {
            param("track_code", entry.getTrackCode());
        }
        L.d(methods[this.type], refer);
        replyTo = replyTo == -1 ? 0 : replyTo;
        if (attachments.size() > 0 && (attachments.get(0) instanceof StickerAttachment)) {
            StickerAttachment att = (StickerAttachment) attachments.get(0);
            attachments = new ArrayList<>();
            param("sticker_id", att.id);
            if (!TextUtils.isEmpty(att.stickerReferrer)) {
                param("sticker_referrer", att.stickerReferrer);
            }
        }
        if (this.type == 0) {
            param("owner_id", ownerID).param(ShareConstants.WEB_DIALOG_RESULT_PARAM_POST_ID, postID).param("text", text).param("reply_to_comment", replyTo).param("attachments", TextUtils.join(",", attachments));
        }
        if (this.type == 1) {
            param("owner_id", ownerID).param("photo_id", postID).param("message", text).param("reply_to_comment", replyTo).param("attachments", TextUtils.join(",", attachments));
        }
        if (this.type == 2) {
            param("owner_id", ownerID).param("video_id", postID).param("message", text).param("reply_to_comment", replyTo).param("attachments", TextUtils.join(",", attachments));
        }
        if (this.type == 4) {
            param("group_id", -ownerID).param("topic_id", postID).param("text", text.replaceAll("\\[id(\\d+)\\|([^\\]]+)\\]", "[post" + replyTo + "|$2]")).param("attachments", TextUtils.join(",", attachments));
        }
        if (accessKey != null) {
            param("access_key", accessKey);
        }
        if (fromGroupId != 0) {
            if (this.type == 0) {
                param("from_group", fromGroupId);
            } else {
                param("from_group", 1);
            }
        }
    }

    /* JADX WARN: Can't rename method to resolve collision */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:20:0x0055 -> B:7:0x001a). Please submit an issue!!! */
    @Override // com.vkontakte.android.api.VKAPIRequest
    /* renamed from: parse */
    public Integer mo1093parse(JSONObject o) {
        try {
            if (this.callback != null) {
                if (this.type == 0) {
                    return Integer.valueOf(o.getJSONObject(ServerKeys.RESPONSE).getInt("comment_id"));
                } else if (this.type == 1) {
                    return Integer.valueOf(o.getInt(ServerKeys.RESPONSE));
                } else {
                    if (this.type == 2) {
                        return Integer.valueOf(o.getInt(ServerKeys.RESPONSE));
                    }
                    if (this.type == 4) {
                        return Integer.valueOf(o.getInt(ServerKeys.RESPONSE));
                    }
                }
            }
        } catch (Exception x) {
            Log.w("vk", x);
        }
        return null;
    }
}
