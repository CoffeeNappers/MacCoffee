package com.vkontakte.android.fragments.messages;

import com.vkontakte.android.Message;
import java.lang.invoke.LambdaForm;
import java.util.Comparator;
/* loaded from: classes.dex */
public final /* synthetic */ class ChatFragment$$Lambda$22 implements Comparator {
    private static final ChatFragment$$Lambda$22 instance = new ChatFragment$$Lambda$22();

    private ChatFragment$$Lambda$22() {
    }

    public static Comparator lambdaFactory$() {
        return instance;
    }

    @Override // java.util.Comparator
    @LambdaForm.Hidden
    public int compare(Object obj, Object obj2) {
        return ChatFragment.lambda$forward$22((Message) obj, (Message) obj2);
    }
}
