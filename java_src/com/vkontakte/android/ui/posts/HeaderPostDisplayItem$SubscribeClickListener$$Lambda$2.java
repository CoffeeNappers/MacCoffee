package com.vkontakte.android.ui.posts;

import com.vkontakte.android.functions.F0;
import com.vkontakte.android.ui.posts.HeaderPostDisplayItem;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class HeaderPostDisplayItem$SubscribeClickListener$$Lambda$2 implements F0 {
    private final HeaderPostDisplayItem.SubscribeClickListener arg$1;

    private HeaderPostDisplayItem$SubscribeClickListener$$Lambda$2(HeaderPostDisplayItem.SubscribeClickListener subscribeClickListener) {
        this.arg$1 = subscribeClickListener;
    }

    public static F0 lambdaFactory$(HeaderPostDisplayItem.SubscribeClickListener subscribeClickListener) {
        return new HeaderPostDisplayItem$SubscribeClickListener$$Lambda$2(subscribeClickListener);
    }

    @Override // com.vkontakte.android.functions.F0
    @LambdaForm.Hidden
    public Object f() {
        return this.arg$1.lambda$new$1();
    }
}
