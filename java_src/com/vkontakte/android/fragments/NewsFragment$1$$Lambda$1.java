package com.vkontakte.android.fragments;

import android.content.Intent;
import com.vkontakte.android.fragments.NewsFragment;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class NewsFragment$1$$Lambda$1 implements Runnable {
    private final NewsFragment.AnonymousClass1 arg$1;
    private final Intent arg$2;

    private NewsFragment$1$$Lambda$1(NewsFragment.AnonymousClass1 anonymousClass1, Intent intent) {
        this.arg$1 = anonymousClass1;
        this.arg$2 = intent;
    }

    public static Runnable lambdaFactory$(NewsFragment.AnonymousClass1 anonymousClass1, Intent intent) {
        return new NewsFragment$1$$Lambda$1(anonymousClass1, intent);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        this.arg$1.lambda$onReceive$0(this.arg$2);
    }
}
