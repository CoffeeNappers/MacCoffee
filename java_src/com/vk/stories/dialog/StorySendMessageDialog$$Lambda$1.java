package com.vk.stories.dialog;

import android.view.View;
import java.lang.invoke.LambdaForm;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final /* synthetic */ class StorySendMessageDialog$$Lambda$1 implements View.OnClickListener {
    private final StorySendMessageDialog arg$1;

    private StorySendMessageDialog$$Lambda$1(StorySendMessageDialog storySendMessageDialog) {
        this.arg$1 = storySendMessageDialog;
    }

    public static View.OnClickListener lambdaFactory$(StorySendMessageDialog storySendMessageDialog) {
        return new StorySendMessageDialog$$Lambda$1(storySendMessageDialog);
    }

    @Override // android.view.View.OnClickListener
    @LambdaForm.Hidden
    public void onClick(View view) {
        this.arg$1.lambda$new$0(view);
    }
}
