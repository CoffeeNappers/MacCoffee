package com.vkontakte.android.attachments;

import android.view.View;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class PostAttachment$$Lambda$1 implements View.OnClickListener {
    private final PostAttachment arg$1;

    private PostAttachment$$Lambda$1(PostAttachment postAttachment) {
        this.arg$1 = postAttachment;
    }

    public static View.OnClickListener lambdaFactory$(PostAttachment postAttachment) {
        return new PostAttachment$$Lambda$1(postAttachment);
    }

    @Override // android.view.View.OnClickListener
    @LambdaForm.Hidden
    public void onClick(View view) {
        this.arg$1.lambda$getViewForList$0(view);
    }
}
