package com.vkontakte.android.fragments.messages;

import android.app.Activity;
import android.view.KeyEvent;
import android.widget.TextView;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class ChatMembersFragment$$Lambda$1 implements TextView.OnEditorActionListener {
    private final ChatMembersFragment arg$1;
    private final Activity arg$2;

    private ChatMembersFragment$$Lambda$1(ChatMembersFragment chatMembersFragment, Activity activity) {
        this.arg$1 = chatMembersFragment;
        this.arg$2 = activity;
    }

    public static TextView.OnEditorActionListener lambdaFactory$(ChatMembersFragment chatMembersFragment, Activity activity) {
        return new ChatMembersFragment$$Lambda$1(chatMembersFragment, activity);
    }

    @Override // android.widget.TextView.OnEditorActionListener
    @LambdaForm.Hidden
    public boolean onEditorAction(TextView textView, int i, KeyEvent keyEvent) {
        return this.arg$1.lambda$onAttach$0(this.arg$2, textView, i, keyEvent);
    }
}
