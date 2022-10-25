package com.vkontakte.android.ui.adapters;

import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import com.vkontakte.android.ui.adapters.NewsSpinnerAdapter;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class NewsSpinnerAdapter$$Lambda$1 implements View.OnClickListener {
    private final AdapterView.OnItemClickListener arg$1;
    private final ViewGroup arg$2;
    private final NewsSpinnerAdapter.DropDownViewHolder arg$3;
    private final int arg$4;

    private NewsSpinnerAdapter$$Lambda$1(AdapterView.OnItemClickListener onItemClickListener, ViewGroup viewGroup, NewsSpinnerAdapter.DropDownViewHolder dropDownViewHolder, int i) {
        this.arg$1 = onItemClickListener;
        this.arg$2 = viewGroup;
        this.arg$3 = dropDownViewHolder;
        this.arg$4 = i;
    }

    public static View.OnClickListener lambdaFactory$(AdapterView.OnItemClickListener onItemClickListener, ViewGroup viewGroup, NewsSpinnerAdapter.DropDownViewHolder dropDownViewHolder, int i) {
        return new NewsSpinnerAdapter$$Lambda$1(onItemClickListener, viewGroup, dropDownViewHolder, i);
    }

    @Override // android.view.View.OnClickListener
    @LambdaForm.Hidden
    public void onClick(View view) {
        NewsSpinnerAdapter.lambda$getDropDownView$0(this.arg$1, this.arg$2, this.arg$3, this.arg$4, view);
    }
}
