package com.vkontakte.android.api.messages;

import android.os.Build;
import android.text.TextUtils;
import com.vkontakte.android.Message;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.attachments.GeoAttachment;
import com.vkontakte.android.attachments.StickerAttachment;
import com.vkontakte.android.data.ServerKeys;
import java.util.Iterator;
import java.util.List;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class MessagesSend extends VKAPIRequest<Integer> {
    public static final String METHOD_NAME = "messages.send";

    public MessagesSend(int uid, Message message, List<?> attachments, List<Integer> fwdMessages, GeoAttachment location) {
        super(METHOD_NAME);
        String msg = message.text;
        param("device", Build.BRAND + ":" + Build.MANUFACTURER + ":" + Build.MODEL + ":" + Build.PRODUCT);
        if (uid < 2000000000) {
            param("peer_id", uid);
        } else {
            param("chat_id", uid - 2000000000);
        }
        if (!TextUtils.isEmpty(msg)) {
            param("message", msg);
        }
        if (location != null) {
            param("lat", location.lat + "").param("long", location.lon + "");
        }
        String ref = message.extras.getString("ref");
        if (!TextUtils.isEmpty(ref)) {
            param("ref", ref);
        }
        String refSource = message.extras.getString("ref_source");
        if (!TextUtils.isEmpty(refSource)) {
            param("ref_source", refSource);
        }
        if (attachments != null && attachments.size() > 0) {
            Iterator<?> it = attachments.iterator();
            while (true) {
                if (!it.hasNext()) {
                    break;
                }
                Object att = it.next();
                if (att instanceof StickerAttachment) {
                    StickerAttachment sa = (StickerAttachment) att;
                    param("sticker_id", sa.id);
                    if (!TextUtils.isEmpty(sa.stickerReferrer)) {
                        param("sticker_referrer", sa.stickerReferrer);
                    }
                    attachments.remove(att);
                }
            }
        }
        if (attachments != null && attachments.size() > 0) {
            param("attachment", TextUtils.join(",", attachments));
        }
        if (fwdMessages != null && fwdMessages.size() > 0) {
            param("forward_messages", TextUtils.join(",", fwdMessages));
        }
        message.generateRandomId();
        param("random_id", message.randomId);
    }

    public MessagesSend(int uid, int rid, String text, String attachment) {
        super(METHOD_NAME);
        if (uid < 2000000000) {
            param("peer_id", uid);
        } else {
            param("chat_id", uid - 2000000000);
        }
        param("random_id", rid);
        if (!TextUtils.isEmpty(text)) {
            param("message", text);
        }
        if (!TextUtils.isEmpty(attachment)) {
            param("attachment", attachment);
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
