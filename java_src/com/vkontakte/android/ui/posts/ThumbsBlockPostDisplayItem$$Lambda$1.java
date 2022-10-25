package com.vkontakte.android.ui.posts;

import android.view.View;
import java.lang.invoke.LambdaForm;
import java.util.ArrayList;
/* loaded from: classes.dex */
final /* synthetic */ class ThumbsBlockPostDisplayItem$$Lambda$1 implements View.OnClickListener {
    private final ThumbsBlockPostDisplayItem arg$1;
    private final int arg$2;
    private final ArrayList arg$3;
    private final View arg$4;

    private ThumbsBlockPostDisplayItem$$Lambda$1(ThumbsBlockPostDisplayItem thumbsBlockPostDisplayItem, int i, ArrayList arrayList, View view) {
        this.arg$1 = thumbsBlockPostDisplayItem;
        this.arg$2 = i;
        this.arg$3 = arrayList;
        this.arg$4 = view;
    }

    public static View.OnClickListener lambdaFactory$(ThumbsBlockPostDisplayItem thumbsBlockPostDisplayItem, int i, ArrayList arrayList, View view) {
        return new ThumbsBlockPostDisplayItem$$Lambda$1(thumbsBlockPostDisplayItem, i, arrayList, view);
    }

    @Override // android.view.View.OnClickListener
    @LambdaForm.Hidden
    public void onClick(View view) {
        this.arg$1.lambda$onBindView$0(this.arg$2, this.arg$3, this.arg$4, view);
    }
}
