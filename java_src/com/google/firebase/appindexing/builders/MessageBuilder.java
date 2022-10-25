package com.google.firebase.appindexing.builders;

import android.support.annotation.NonNull;
import com.google.android.c2dm.C2DMessaging;
import com.google.android.gms.common.internal.zzaa;
import java.util.Date;
/* loaded from: classes2.dex */
public final class MessageBuilder extends IndexableBuilder<MessageBuilder> {
    /* JADX INFO: Access modifiers changed from: package-private */
    public MessageBuilder() {
        super("Message");
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public MessageBuilder(String str) {
        super(str);
    }

    public MessageBuilder setDateRead(@NonNull Date date) {
        zzaa.zzy(date);
        return put("dateRead", date.getTime());
    }

    public MessageBuilder setDateReceived(@NonNull Date date) {
        zzaa.zzy(date);
        return put("dateReceived", date.getTime());
    }

    public MessageBuilder setDateSent(@NonNull Date date) {
        zzaa.zzy(date);
        return put("dateSent", date.getTime());
    }

    public MessageBuilder setIsPartOf(@NonNull ConversationBuilder... conversationBuilderArr) {
        return put("isPartOf", conversationBuilderArr);
    }

    public MessageBuilder setMessageAttachment(@NonNull DigitalDocumentBuilder... digitalDocumentBuilderArr) {
        return put("messageAttachment", digitalDocumentBuilderArr);
    }

    public MessageBuilder setRecipient(@NonNull PersonBuilder... personBuilderArr) {
        return put("recipient", personBuilderArr);
    }

    public MessageBuilder setSender(@NonNull PersonBuilder personBuilder) {
        return put(C2DMessaging.EXTRA_SENDER, personBuilder);
    }

    public MessageBuilder setText(@NonNull String str) {
        return put("text", str);
    }
}
