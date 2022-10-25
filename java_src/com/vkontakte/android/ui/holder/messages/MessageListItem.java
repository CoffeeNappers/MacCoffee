package com.vkontakte.android.ui.holder.messages;

import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.text.Spannable;
import android.text.TextUtils;
import android.text.style.URLSpan;
import com.vkontakte.android.Message;
import com.vkontakte.android.R;
import com.vkontakte.android.VKApplication;
import com.vkontakte.android.attachments.Attachment;
import com.vkontakte.android.attachments.GraffitiAttachment;
import com.vkontakte.android.attachments.ImageAttachment;
import com.vkontakte.android.attachments.StickerAttachment;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
/* loaded from: classes3.dex */
public class MessageListItem {
    public static final int TYPE_BOTTOM = 4;
    public static final int TYPE_FULL = 1;
    public static final int TYPE_GIFT = 7;
    public static final int TYPE_MIDDLE = 3;
    public static final int TYPE_SERVICE = 5;
    public static final int TYPE_TOP = 2;
    public static final int TYPE_UNREAD_SEPARATOR = 6;
    private static volatile long sequence = 0;
    @Nullable
    private List<Attachment> attachments;
    public int fwdLevel;
    public int fwdLevelLast;
    public int fwdLevelNext;
    public String fwdName;
    public int fwdTime;
    public int fwdUid;
    public int groupMessagesTime;
    public boolean hasLinks;
    @Nullable
    private List<ImageAttachment> imageAttachments;
    @Nullable
    private String imageUrl;
    @Nullable
    private String imageUrlFwd;
    public boolean isFailed;
    public boolean isFirst;
    public boolean isLast;
    public boolean isOut;
    public long itemId;
    public int msgId;
    public int peer;
    public boolean readState;
    private WeakReference<ChatMessageHolder> reference;
    public int sender;
    @Nullable
    public CharSequence text;
    public int time;
    public int type;
    public int uid;

    public static <T extends List<MessageListItem>> T processItemIds(T items) {
        int offset = 0;
        int msgId = 0;
        for (int i = 0; i < items.size(); i++) {
            MessageListItem item = (MessageListItem) items.get(i);
            if (item.msgId != 0 && item.msgId != msgId) {
                offset = 0;
                msgId = item.msgId;
            }
            if (item.isTime()) {
                item.itemId = (item.time * 100) + 99;
            } else {
                item.itemId = (msgId * 100) + offset;
                offset++;
            }
        }
        return items;
    }

    public void updateHolder(boolean animate) {
        ChatMessageHolder holder = getHolder();
        if (holder != null && holder.lastItem == this) {
            holder.bind(this, animate);
        }
    }

    @Nullable
    private ChatMessageHolder getHolder() {
        if (this.reference == null) {
            return null;
        }
        return this.reference.get();
    }

    public void setHolder(@NonNull WeakReference<ChatMessageHolder> reference) {
        this.reference = reference;
    }

    public MessageListItem() {
        this.reference = null;
        long j = sequence + 1;
        sequence = j;
        this.itemId = j;
        this.text = "";
        this.sender = 0;
        this.fwdLevelLast = 0;
        this.fwdLevel = 0;
        this.fwdLevelNext = 0;
        this.isFirst = true;
        this.isLast = false;
        this.attachments = null;
        this.imageAttachments = null;
        this.imageUrl = null;
        this.imageUrlFwd = null;
    }

    public boolean isFirstBubbleBg() {
        return ((double) this.peer) > 2.0E9d || this.isFirst;
    }

    public boolean isShowPhoto() {
        return true;
    }

    public MessageListItem(@NonNull Message message) {
        this.reference = null;
        long j = sequence + 1;
        sequence = j;
        this.itemId = j;
        this.text = "";
        this.sender = 0;
        this.fwdLevelLast = 0;
        this.fwdLevel = 0;
        this.fwdLevelNext = 0;
        this.isFirst = true;
        this.isLast = false;
        this.attachments = null;
        this.imageAttachments = null;
        this.imageUrl = null;
        this.imageUrlFwd = null;
        this.isOut = message.out;
        this.msgId = message.id;
        this.peer = message.peer;
        this.readState = message.readState;
        this.uid = message.sender;
        this.time = message.time;
        this.isFailed = message.sendFailed;
        this.sender = message.sender;
    }

    public MessageListItem(@NonNull Message message, @NonNull Message.FwdMessage fwdMessage) {
        this(message);
        this.text = fwdMessage.displayableText;
        this.hasLinks = (fwdMessage.displayableText instanceof Spannable) && ((URLSpan[]) ((Spannable) fwdMessage.displayableText).getSpans(0, fwdMessage.displayableText.length() + (-1), URLSpan.class)).length > 0;
        setAttachments(fwdMessage.attachments);
        this.fwdName = "DELETED".equals(fwdMessage.username) ? VKApplication.context.getResources().getString(R.string.loading) : fwdMessage.username;
        this.fwdTime = fwdMessage.time;
        this.fwdUid = fwdMessage.sender;
    }

    public boolean isTime() {
        return this.type == 5 && TextUtils.isEmpty(this.text);
    }

    public void setImageUrl(@Nullable String imageUrl) {
        if (imageUrl == null) {
            imageUrl = "";
        }
        this.imageUrl = imageUrl;
    }

    public void setImageUrlFwd(@Nullable String imageUrlFwd) {
        if (imageUrlFwd == null) {
            imageUrlFwd = "";
        }
        this.imageUrlFwd = imageUrlFwd;
    }

    @Nullable
    public String getImageUrl() {
        return this.imageUrl;
    }

    public void setAttachments(@Nullable List<Attachment> attachments) {
        this.attachments = attachments;
        this.imageAttachments = null;
        if (attachments != null) {
            for (Attachment a : attachments) {
                if (a instanceof ImageAttachment) {
                    if (this.imageAttachments == null) {
                        this.imageAttachments = new ArrayList(attachments.size());
                    }
                    this.imageAttachments.add((ImageAttachment) a);
                }
            }
        }
    }

    public void setAttachment(int index, @NonNull Attachment attachment) {
        getOrCreateAttachments().set(index, attachment);
        setAttachments(getOrCreateAttachments());
    }

    public boolean hasAttachments() {
        return this.attachments != null && !this.attachments.isEmpty();
    }

    @NonNull
    public List<Attachment> getOrCreateAttachments() {
        return this.attachments == null ? Collections.emptyList() : this.attachments;
    }

    @NonNull
    public List<ImageAttachment> getOrCreateImageAttachments() {
        return this.imageAttachments == null ? Collections.emptyList() : this.imageAttachments;
    }

    public boolean isSticker() {
        return this.attachments != null && this.attachments.size() == 1 && (this.attachments.get(0) instanceof StickerAttachment);
    }

    public boolean isGraffiti() {
        return this.attachments != null && this.attachments.size() == 1 && (this.attachments.get(0) instanceof GraffitiAttachment);
    }

    public boolean hasMainPhoto() {
        return this.imageUrl != null && isShowPhoto();
    }

    public int getImageCount() {
        if (!hasMainPhoto() && this.imageUrlFwd == null) {
            return getOrCreateImageAttachments().size();
        }
        if (!hasMainPhoto() || this.imageUrlFwd == null) {
            return getOrCreateImageAttachments().size() + 1;
        }
        return getOrCreateImageAttachments().size() + 2;
    }

    public String getImageUrl(int image) {
        if (image < getOrCreateImageAttachments().size()) {
            return getOrCreateImageAttachments().get(image).getImageURL();
        }
        if (image - getOrCreateImageAttachments().size() == 0 && hasMainPhoto()) {
            return this.imageUrl;
        }
        return this.imageUrlFwd;
    }

    @Nullable
    public String getImageUrlFwd() {
        return this.imageUrlFwd;
    }
}
