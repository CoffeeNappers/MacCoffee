package com.vkontakte.android.fragments;

import com.vkontakte.android.cache.NewsfeedCache;
import java.lang.invoke.LambdaForm;
import java.util.ArrayList;
/* loaded from: classes.dex */
final /* synthetic */ class NewsFragment$5$$Lambda$1 implements Runnable {
    private final ArrayList arg$1;

    private NewsFragment$5$$Lambda$1(ArrayList arrayList) {
        this.arg$1 = arrayList;
    }

    public static Runnable lambdaFactory$(ArrayList arrayList) {
        return new NewsFragment$5$$Lambda$1(arrayList);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        NewsfeedCache.addToTop(this.arg$1);
    }
}
