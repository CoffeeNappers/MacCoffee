package com.vkontakte.android.attachments;

import android.view.View;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class WikiAttachment$$Lambda$1 implements View.OnClickListener {
    private final WikiAttachment arg$1;

    private WikiAttachment$$Lambda$1(WikiAttachment wikiAttachment) {
        this.arg$1 = wikiAttachment;
    }

    public static View.OnClickListener lambdaFactory$(WikiAttachment wikiAttachment) {
        return new WikiAttachment$$Lambda$1(wikiAttachment);
    }

    @Override // android.view.View.OnClickListener
    @LambdaForm.Hidden
    public void onClick(View view) {
        this.arg$1.lambda$getViewForList$0(view);
    }
}
