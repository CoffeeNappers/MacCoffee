package com.vkontakte.android.ui.posts;

import android.view.View;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class FooterPostDisplayItem$$Lambda$2 implements View.OnClickListener {
    private final FooterPostDisplayItem arg$1;

    private FooterPostDisplayItem$$Lambda$2(FooterPostDisplayItem footerPostDisplayItem) {
        this.arg$1 = footerPostDisplayItem;
    }

    public static View.OnClickListener lambdaFactory$(FooterPostDisplayItem footerPostDisplayItem) {
        return new FooterPostDisplayItem$$Lambda$2(footerPostDisplayItem);
    }

    @Override // android.view.View.OnClickListener
    @LambdaForm.Hidden
    public void onClick(View view) {
        this.arg$1.lambda$new$1(view);
    }
}
