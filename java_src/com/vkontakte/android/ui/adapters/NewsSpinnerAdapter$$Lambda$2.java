package com.vkontakte.android.ui.adapters;

import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.CompoundButton;
import com.vkontakte.android.ui.adapters.NewsSpinnerAdapter;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class NewsSpinnerAdapter$$Lambda$2 implements CompoundButton.OnCheckedChangeListener {
    private final NewsSpinnerAdapter.Item arg$1;
    private final AdapterView.OnItemClickListener arg$2;
    private final ViewGroup arg$3;
    private final NewsSpinnerAdapter.DropDownViewHolder arg$4;
    private final int arg$5;

    private NewsSpinnerAdapter$$Lambda$2(NewsSpinnerAdapter.Item item, AdapterView.OnItemClickListener onItemClickListener, ViewGroup viewGroup, NewsSpinnerAdapter.DropDownViewHolder dropDownViewHolder, int i) {
        this.arg$1 = item;
        this.arg$2 = onItemClickListener;
        this.arg$3 = viewGroup;
        this.arg$4 = dropDownViewHolder;
        this.arg$5 = i;
    }

    public static CompoundButton.OnCheckedChangeListener lambdaFactory$(NewsSpinnerAdapter.Item item, AdapterView.OnItemClickListener onItemClickListener, ViewGroup viewGroup, NewsSpinnerAdapter.DropDownViewHolder dropDownViewHolder, int i) {
        return new NewsSpinnerAdapter$$Lambda$2(item, onItemClickListener, viewGroup, dropDownViewHolder, i);
    }

    @Override // android.widget.CompoundButton.OnCheckedChangeListener
    @LambdaForm.Hidden
    public void onCheckedChanged(CompoundButton compoundButton, boolean z) {
        NewsSpinnerAdapter.lambda$getDropDownView$1(this.arg$1, this.arg$2, this.arg$3, this.arg$4, this.arg$5, compoundButton, z);
    }
}
