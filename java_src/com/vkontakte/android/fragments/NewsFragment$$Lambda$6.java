package com.vkontakte.android.fragments;

import java.lang.invoke.LambdaForm;
import java.util.ArrayList;
/* loaded from: classes.dex */
final /* synthetic */ class NewsFragment$$Lambda$6 implements Runnable {
    private final ArrayList arg$1;

    private NewsFragment$$Lambda$6(ArrayList arrayList) {
        this.arg$1 = arrayList;
    }

    public static Runnable lambdaFactory$(ArrayList arrayList) {
        return new NewsFragment$$Lambda$6(arrayList);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        NewsFragment.lambda$showNew$6(this.arg$1);
    }
}
