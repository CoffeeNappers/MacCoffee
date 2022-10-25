package com.vkontakte.android.ui.posts;

import android.view.View;
import com.vkontakte.android.ui.posts.ShitBlockPostDisplayItem;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class ShitBlockPostDisplayItem$ViewHolder$$Lambda$1 implements Runnable {
    private final ShitBlockPostDisplayItem.ViewHolder arg$1;
    private final View arg$2;

    private ShitBlockPostDisplayItem$ViewHolder$$Lambda$1(ShitBlockPostDisplayItem.ViewHolder viewHolder, View view) {
        this.arg$1 = viewHolder;
        this.arg$2 = view;
    }

    public static Runnable lambdaFactory$(ShitBlockPostDisplayItem.ViewHolder viewHolder, View view) {
        return new ShitBlockPostDisplayItem$ViewHolder$$Lambda$1(viewHolder, view);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        this.arg$1.lambda$onTouch$0(this.arg$2);
    }
}
