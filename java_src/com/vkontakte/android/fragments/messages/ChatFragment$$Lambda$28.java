package com.vkontakte.android.fragments.messages;

import java.lang.invoke.LambdaForm;
import java.util.ArrayList;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final /* synthetic */ class ChatFragment$$Lambda$28 implements Runnable {
    private final ChatFragment arg$1;
    private final String arg$2;
    private final ArrayList arg$3;
    private final String arg$4;

    private ChatFragment$$Lambda$28(ChatFragment chatFragment, String str, ArrayList arrayList, String str2) {
        this.arg$1 = chatFragment;
        this.arg$2 = str;
        this.arg$3 = arrayList;
        this.arg$4 = str2;
    }

    public static Runnable lambdaFactory$(ChatFragment chatFragment, String str, ArrayList arrayList, String str2) {
        return new ChatFragment$$Lambda$28(chatFragment, str, arrayList, str2);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        this.arg$1.lambda$null$14(this.arg$2, this.arg$3, this.arg$4);
    }
}
