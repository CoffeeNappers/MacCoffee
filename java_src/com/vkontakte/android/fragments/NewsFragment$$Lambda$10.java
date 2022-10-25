package com.vkontakte.android.fragments;

import java.lang.invoke.LambdaForm;
import java.util.ArrayList;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final /* synthetic */ class NewsFragment$$Lambda$10 implements Runnable {
    private final NewsFragment arg$1;
    private final ArrayList arg$2;
    private final boolean arg$3;

    private NewsFragment$$Lambda$10(NewsFragment newsFragment, ArrayList arrayList, boolean z) {
        this.arg$1 = newsFragment;
        this.arg$2 = arrayList;
        this.arg$3 = z;
    }

    public static Runnable lambdaFactory$(NewsFragment newsFragment, ArrayList arrayList, boolean z) {
        return new NewsFragment$$Lambda$10(newsFragment, arrayList, z);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        this.arg$1.lambda$null$2(this.arg$2, this.arg$3);
    }
}
