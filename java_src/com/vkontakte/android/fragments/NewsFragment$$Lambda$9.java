package com.vkontakte.android.fragments;

import java.lang.invoke.LambdaForm;
import java.util.ArrayList;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final /* synthetic */ class NewsFragment$$Lambda$9 implements Runnable {
    private final NewsFragment arg$1;
    private final ArrayList arg$2;
    private final boolean arg$3;
    private final ArrayList arg$4;

    private NewsFragment$$Lambda$9(NewsFragment newsFragment, ArrayList arrayList, boolean z, ArrayList arrayList2) {
        this.arg$1 = newsFragment;
        this.arg$2 = arrayList;
        this.arg$3 = z;
        this.arg$4 = arrayList2;
    }

    public static Runnable lambdaFactory$(NewsFragment newsFragment, ArrayList arrayList, boolean z, ArrayList arrayList2) {
        return new NewsFragment$$Lambda$9(newsFragment, arrayList, z, arrayList2);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        this.arg$1.lambda$null$7(this.arg$2, this.arg$3, this.arg$4);
    }
}
