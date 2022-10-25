package com.vkontakte.android.ui;

import android.app.Dialog;
import android.view.View;
import android.widget.AdapterView;
import com.vkontakte.android.ui.animation.RevealLinearLayout;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
public final /* synthetic */ class ListDialog$$Lambda$2 implements AdapterView.OnItemClickListener {
    private final AdapterView.OnItemClickListener arg$1;
    private final RevealLinearLayout arg$2;
    private final Dialog arg$3;

    private ListDialog$$Lambda$2(AdapterView.OnItemClickListener onItemClickListener, RevealLinearLayout revealLinearLayout, Dialog dialog) {
        this.arg$1 = onItemClickListener;
        this.arg$2 = revealLinearLayout;
        this.arg$3 = dialog;
    }

    public static AdapterView.OnItemClickListener lambdaFactory$(AdapterView.OnItemClickListener onItemClickListener, RevealLinearLayout revealLinearLayout, Dialog dialog) {
        return new ListDialog$$Lambda$2(onItemClickListener, revealLinearLayout, dialog);
    }

    @Override // android.widget.AdapterView.OnItemClickListener
    @LambdaForm.Hidden
    public void onItemClick(AdapterView adapterView, View view, int i, long j) {
        ListDialog.lambda$show$1(this.arg$1, this.arg$2, this.arg$3, adapterView, view, i, j);
    }
}
