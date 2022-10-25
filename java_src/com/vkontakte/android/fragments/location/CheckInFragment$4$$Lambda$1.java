package com.vkontakte.android.fragments.location;

import com.vkontakte.android.fragments.location.CheckInFragment;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class CheckInFragment$4$$Lambda$1 implements Runnable {
    private final CheckInFragment.AnonymousClass4 arg$1;

    private CheckInFragment$4$$Lambda$1(CheckInFragment.AnonymousClass4 anonymousClass4) {
        this.arg$1 = anonymousClass4;
    }

    public static Runnable lambdaFactory$(CheckInFragment.AnonymousClass4 anonymousClass4) {
        return new CheckInFragment$4$$Lambda$1(anonymousClass4);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        this.arg$1.lambda$onPostExecute$0();
    }
}
