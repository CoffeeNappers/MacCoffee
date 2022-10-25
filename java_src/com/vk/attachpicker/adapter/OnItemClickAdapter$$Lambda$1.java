package com.vk.attachpicker.adapter;

import android.support.v7.widget.RecyclerView;
import android.view.View;
import java.lang.invoke.LambdaForm;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final /* synthetic */ class OnItemClickAdapter$$Lambda$1 implements View.OnClickListener {
    private final OnItemClickAdapter arg$1;
    private final RecyclerView.ViewHolder arg$2;

    private OnItemClickAdapter$$Lambda$1(OnItemClickAdapter onItemClickAdapter, RecyclerView.ViewHolder viewHolder) {
        this.arg$1 = onItemClickAdapter;
        this.arg$2 = viewHolder;
    }

    public static View.OnClickListener lambdaFactory$(OnItemClickAdapter onItemClickAdapter, RecyclerView.ViewHolder viewHolder) {
        return new OnItemClickAdapter$$Lambda$1(onItemClickAdapter, viewHolder);
    }

    @Override // android.view.View.OnClickListener
    @LambdaForm.Hidden
    public void onClick(View view) {
        this.arg$1.lambda$wrapHolder$0(this.arg$2, view);
    }
}
