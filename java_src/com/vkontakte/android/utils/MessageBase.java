package com.vkontakte.android.utils;

import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import com.vkontakte.android.Message;
import com.vkontakte.android.attachments.Attachment;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.List;
/* loaded from: classes3.dex */
public class MessageBase {
    public CharSequence displayableText;
    public int id;
    public int sender;
    @Nullable
    public String text;
    public int time;
    @NonNull
    public List<Message.FwdMessage> fwdMessages = Collections.emptyList();
    @NonNull
    public List<Attachment> attachments = Collections.emptyList();

    public void addAttachment(Attachment attachment, int defaultSize) {
        this.attachments = addToList(this.attachments, attachment, defaultSize);
    }

    public void addAttachments(Collection<Attachment> attachments) {
        this.attachments = addToList(this.attachments, attachments);
    }

    public void addFwdMessage(Message.FwdMessage fwdMessage, int defaultSize) {
        this.fwdMessages = addToList(this.fwdMessages, fwdMessage, defaultSize);
    }

    public void addFwdMessages(Collection<Message.FwdMessage> fwdMessages) {
        this.fwdMessages = addToList(this.fwdMessages, fwdMessages);
    }

    private static <T> List<T> addToList(List<T> list, T item, int defaultSize) {
        if (list == Collections.EMPTY_LIST || list == null) {
            list = new ArrayList<>(defaultSize);
        }
        list.add(item);
        return list;
    }

    /* JADX WARN: Multi-variable type inference failed */
    private static <T> List<T> addToList(List<T> list, Collection<T> items) {
        if (items != 0 && !items.isEmpty()) {
            if (list == Collections.EMPTY_LIST || list == null) {
                list = new ArrayList<>();
            }
            list.addAll(items);
        }
        return list;
    }
}
