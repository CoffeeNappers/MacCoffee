package com.google.firebase.appindexing.builders;

import android.support.annotation.NonNull;
/* loaded from: classes2.dex */
public final class ConversationBuilder extends IndexableBuilder<ConversationBuilder> {
    /* JADX INFO: Access modifiers changed from: package-private */
    public ConversationBuilder() {
        super("Conversation");
    }

    public ConversationBuilder setId(@NonNull String str) {
        return put("id", str);
    }
}
