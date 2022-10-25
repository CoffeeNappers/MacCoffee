package com.vkontakte.android.ui;

import android.content.Context;
import android.view.View;
import android.widget.AdapterView;
import com.vkontakte.android.functions.VoidF1;
import com.vkontakte.android.ui.ListDialog;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
public final /* synthetic */ class ListDialog$CreateNewMessageDialog$$Lambda$1 implements AdapterView.OnItemClickListener {
    private final VoidF1 arg$1;
    private final Context arg$2;

    private ListDialog$CreateNewMessageDialog$$Lambda$1(VoidF1 voidF1, Context context) {
        this.arg$1 = voidF1;
        this.arg$2 = context;
    }

    public static AdapterView.OnItemClickListener lambdaFactory$(VoidF1 voidF1, Context context) {
        return new ListDialog$CreateNewMessageDialog$$Lambda$1(voidF1, context);
    }

    @Override // android.widget.AdapterView.OnItemClickListener
    @LambdaForm.Hidden
    public void onItemClick(AdapterView adapterView, View view, int i, long j) {
        ListDialog.CreateNewMessageDialog.lambda$showNewDialogs$0(this.arg$1, this.arg$2, adapterView, view, i, j);
    }
}
