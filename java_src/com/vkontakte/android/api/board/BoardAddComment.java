package com.vkontakte.android.api.board;

import android.text.TextUtils;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.attachments.Attachment;
import com.vkontakte.android.attachments.StickerAttachment;
import com.vkontakte.android.data.ServerKeys;
import java.util.List;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class BoardAddComment extends VKAPIRequest<Integer> {
    public BoardAddComment(int gid, int tid, String text, List<Attachment> atts, String title, boolean fromGroup) {
        super(tid == -1 ? "board.addTopic" : "board.addComment");
        param("group_id", gid).param("topic_id", tid).param("text", text);
        if (fromGroup) {
            param("from_group", 1);
        }
        if (atts != null && !atts.isEmpty()) {
            StringBuilder attachments = new StringBuilder();
            boolean firstTime = true;
            for (Attachment attachment : atts) {
                if (attachment instanceof StickerAttachment) {
                    StickerAttachment att = (StickerAttachment) attachment;
                    param("sticker_id", att.id);
                    if (!TextUtils.isEmpty(att.stickerReferrer)) {
                        param("sticker_referrer", att.stickerReferrer);
                    }
                } else {
                    if (firstTime) {
                        firstTime = false;
                    } else {
                        attachments.append(',');
                    }
                    attachments.append(attachment);
                }
            }
            param("attachments", attachments.toString());
        }
        if (tid == -1) {
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
