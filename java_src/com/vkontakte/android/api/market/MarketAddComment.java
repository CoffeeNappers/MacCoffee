package com.vkontakte.android.api.market;

import android.text.TextUtils;
import com.google.firebase.analytics.FirebaseAnalytics;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.attachments.Attachment;
import com.vkontakte.android.attachments.StickerAttachment;
import com.vkontakte.android.data.ServerKeys;
import com.vkontakte.android.utils.L;
import java.util.List;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class MarketAddComment extends VKAPIRequest<Integer> {
    public MarketAddComment(int ownerId, int itemId, String text, List<Attachment> atts, boolean fromGroup, int replyToComment) {
        super("market.createComment");
        param("owner_id", ownerId).param(FirebaseAnalytics.Param.ITEM_ID, itemId).param("message", text);
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
        if (replyToComment > 0) {
            param("reply_to_comment", replyToComment);
        }
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.vkontakte.android.api.VKAPIRequest
    /* renamed from: parse */
    public Integer mo1093parse(JSONObject o) {
        try {
            return Integer.valueOf(o.getInt(ServerKeys.RESPONSE));
        } catch (Exception x) {
            L.e(x, new Object[0]);
            return null;
        }
    }
}
