package com.vkontakte.android.ui.posts;

import android.view.View;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class CommentPostDisplayItem$$Lambda$1 implements View.OnClickListener {
    private final CommentPostDisplayItem arg$1;

    private CommentPostDisplayItem$$Lambda$1(CommentPostDisplayItem commentPostDisplayItem) {
        this.arg$1 = commentPostDisplayItem;
    }

    public static View.OnClickListener lambdaFactory$(CommentPostDisplayItem commentPostDisplayItem) {
        return new CommentPostDisplayItem$$Lambda$1(commentPostDisplayItem);
    }

    @Override // android.view.View.OnClickListener
    @LambdaForm.Hidden
    public void onClick(View view) {
        this.arg$1.lambda$onBindView$0(view);
    }
}
