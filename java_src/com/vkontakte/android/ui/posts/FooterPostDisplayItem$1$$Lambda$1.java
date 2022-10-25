package com.vkontakte.android.ui.posts;

import android.view.View;
import com.vkontakte.android.ui.posts.FooterPostDisplayItem;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class FooterPostDisplayItem$1$$Lambda$1 implements Runnable {
    private final FooterPostDisplayItem.AnonymousClass1 arg$1;
    private final View arg$2;

    private FooterPostDisplayItem$1$$Lambda$1(FooterPostDisplayItem.AnonymousClass1 anonymousClass1, View view) {
        this.arg$1 = anonymousClass1;
        this.arg$2 = view;
    }

    public static Runnable lambdaFactory$(FooterPostDisplayItem.AnonymousClass1 anonymousClass1, View view) {
        return new FooterPostDisplayItem$1$$Lambda$1(anonymousClass1, view);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        this.arg$1.lambda$success$0(this.arg$2);
    }
}
