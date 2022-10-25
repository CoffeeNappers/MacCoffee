package com.vkontakte.android.ui.posts;

import android.view.View;
import com.vkontakte.android.data.PostInteract;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class HeaderPostDisplayItem$$Lambda$1 implements View.OnClickListener {
    private final HeaderPostDisplayItem arg$1;
    private final PostInteract arg$2;

    private HeaderPostDisplayItem$$Lambda$1(HeaderPostDisplayItem headerPostDisplayItem, PostInteract postInteract) {
        this.arg$1 = headerPostDisplayItem;
        this.arg$2 = postInteract;
    }

    public static View.OnClickListener lambdaFactory$(HeaderPostDisplayItem headerPostDisplayItem, PostInteract postInteract) {
        return new HeaderPostDisplayItem$$Lambda$1(headerPostDisplayItem, postInteract);
    }

    @Override // android.view.View.OnClickListener
    @LambdaForm.Hidden
    public void onClick(View view) {
        this.arg$1.lambda$new$0(this.arg$2, view);
    }
}
