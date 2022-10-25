package com.vkontakte.android.fragments.market;

import android.view.View;
import com.vkontakte.android.data.Good;
import com.vkontakte.android.ui.holder.RecyclerSectionAdapter;
import java.lang.invoke.LambdaForm;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final /* synthetic */ class GoodFragment$$Lambda$12 implements View.OnClickListener {
    private final GoodFragment arg$1;
    private final RecyclerSectionAdapter.Data arg$2;
    private final Good arg$3;

    private GoodFragment$$Lambda$12(GoodFragment goodFragment, RecyclerSectionAdapter.Data data, Good good) {
        this.arg$1 = goodFragment;
        this.arg$2 = data;
        this.arg$3 = good;
    }

    public static View.OnClickListener lambdaFactory$(GoodFragment goodFragment, RecyclerSectionAdapter.Data data, Good good) {
        return new GoodFragment$$Lambda$12(goodFragment, data, good);
    }

    @Override // android.view.View.OnClickListener
    @LambdaForm.Hidden
    public void onClick(View view) {
        this.arg$1.lambda$createGoodDataList$12(this.arg$2, this.arg$3, view);
    }
}
