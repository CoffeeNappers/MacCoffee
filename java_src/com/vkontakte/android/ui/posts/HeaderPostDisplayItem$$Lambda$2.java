package com.vkontakte.android.ui.posts;

import android.view.View;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class HeaderPostDisplayItem$$Lambda$2 implements View.OnClickListener {
    private final HeaderPostDisplayItem arg$1;

    private HeaderPostDisplayItem$$Lambda$2(HeaderPostDisplayItem headerPostDisplayItem) {
        this.arg$1 = headerPostDisplayItem;
    }

    public static View.OnClickListener lambdaFactory$(HeaderPostDisplayItem headerPostDisplayItem) {
        return new HeaderPostDisplayItem$$Lambda$2(headerPostDisplayItem);
    }

    @Override // android.view.View.OnClickListener
    @LambdaForm.Hidden
    public void onClick(View view) {
        this.arg$1.lambda$onBindView$1(view);
    }
}
