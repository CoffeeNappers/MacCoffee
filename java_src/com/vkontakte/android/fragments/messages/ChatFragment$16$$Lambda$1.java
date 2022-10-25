package com.vkontakte.android.fragments.messages;

import com.vkontakte.android.fragments.messages.ChatFragment;
import java.lang.invoke.LambdaForm;
import java.util.ArrayList;
/* loaded from: classes.dex */
final /* synthetic */ class ChatFragment$16$$Lambda$1 implements Runnable {
    private final ChatFragment.AnonymousClass16 arg$1;
    private final boolean arg$2;
    private final ArrayList arg$3;
    private final long arg$4;

    private ChatFragment$16$$Lambda$1(ChatFragment.AnonymousClass16 anonymousClass16, boolean z, ArrayList arrayList, long j) {
        this.arg$1 = anonymousClass16;
        this.arg$2 = z;
        this.arg$3 = arrayList;
        this.arg$4 = j;
    }

    public static Runnable lambdaFactory$(ChatFragment.AnonymousClass16 anonymousClass16, boolean z, ArrayList arrayList, long j) {
        return new ChatFragment$16$$Lambda$1(anonymousClass16, z, arrayList, j);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        this.arg$1.lambda$onMessagesLoaded$0(this.arg$2, this.arg$3, this.arg$4);
    }
}
