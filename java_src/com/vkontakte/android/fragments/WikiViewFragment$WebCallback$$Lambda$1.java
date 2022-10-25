package com.vkontakte.android.fragments;

import com.vkontakte.android.fragments.WikiViewFragment;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class WikiViewFragment$WebCallback$$Lambda$1 implements Runnable {
    private final WikiViewFragment.WebCallback arg$1;
    private final String[] arg$2;
    private final int arg$3;

    private WikiViewFragment$WebCallback$$Lambda$1(WikiViewFragment.WebCallback webCallback, String[] strArr, int i) {
        this.arg$1 = webCallback;
        this.arg$2 = strArr;
        this.arg$3 = i;
    }

    public static Runnable lambdaFactory$(WikiViewFragment.WebCallback webCallback, String[] strArr, int i) {
        return new WikiViewFragment$WebCallback$$Lambda$1(webCallback, strArr, i);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        this.arg$1.lambda$openPhotos$0(this.arg$2, this.arg$3);
    }
}
