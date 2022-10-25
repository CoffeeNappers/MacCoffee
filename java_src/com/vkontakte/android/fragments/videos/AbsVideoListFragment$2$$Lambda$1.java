package com.vkontakte.android.fragments.videos;

import com.vkontakte.android.fragments.videos.AbsVideoListFragment;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class AbsVideoListFragment$2$$Lambda$1 implements Runnable {
    private final AbsVideoListFragment.AnonymousClass2 arg$1;

    private AbsVideoListFragment$2$$Lambda$1(AbsVideoListFragment.AnonymousClass2 anonymousClass2) {
        this.arg$1 = anonymousClass2;
    }

    public static Runnable lambdaFactory$(AbsVideoListFragment.AnonymousClass2 anonymousClass2) {
        return new AbsVideoListFragment$2$$Lambda$1(anonymousClass2);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        this.arg$1.lambda$success$0();
    }
}
