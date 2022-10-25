package com.vkontakte.android.ui.posts;

import android.view.View;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class FooterPostDisplayItem$$Lambda$1 implements View.OnClickListener {
    private final FooterPostDisplayItem arg$1;
    private final String arg$2;

    private FooterPostDisplayItem$$Lambda$1(FooterPostDisplayItem footerPostDisplayItem, String str) {
        this.arg$1 = footerPostDisplayItem;
        this.arg$2 = str;
    }

    public static View.OnClickListener lambdaFactory$(FooterPostDisplayItem footerPostDisplayItem, String str) {
        return new FooterPostDisplayItem$$Lambda$1(footerPostDisplayItem, str);
    }

    @Override // android.view.View.OnClickListener
    @LambdaForm.Hidden
    public void onClick(View view) {
        this.arg$1.lambda$new$0(this.arg$2, view);
    }
}
