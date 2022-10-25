package com.vkontakte.android.attachments;

import android.view.View;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class RepostAttachment$$Lambda$1 implements View.OnClickListener {
    private final RepostAttachment arg$1;

    private RepostAttachment$$Lambda$1(RepostAttachment repostAttachment) {
        this.arg$1 = repostAttachment;
    }

    public static View.OnClickListener lambdaFactory$(RepostAttachment repostAttachment) {
        return new RepostAttachment$$Lambda$1(repostAttachment);
    }

    @Override // android.view.View.OnClickListener
    @LambdaForm.Hidden
    public void onClick(View view) {
        this.arg$1.lambda$getViewForList$0(view);
    }
}
