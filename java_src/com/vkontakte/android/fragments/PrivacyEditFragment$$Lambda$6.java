package com.vkontakte.android.fragments;

import android.app.AlertDialog;
import android.view.View;
import com.vkontakte.android.fragments.PrivacyEditFragment;
import java.lang.invoke.LambdaForm;
import java.util.ArrayList;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final /* synthetic */ class PrivacyEditFragment$$Lambda$6 implements View.OnClickListener {
    private final PrivacyEditFragment arg$1;
    private final boolean[] arg$2;
    private final boolean[] arg$3;
    private final ArrayList arg$4;
    private final PrivacyEditFragment.UserListAdapter arg$5;
    private final AlertDialog arg$6;

    private PrivacyEditFragment$$Lambda$6(PrivacyEditFragment privacyEditFragment, boolean[] zArr, boolean[] zArr2, ArrayList arrayList, PrivacyEditFragment.UserListAdapter userListAdapter, AlertDialog alertDialog) {
        this.arg$1 = privacyEditFragment;
        this.arg$2 = zArr;
        this.arg$3 = zArr2;
        this.arg$4 = arrayList;
        this.arg$5 = userListAdapter;
        this.arg$6 = alertDialog;
    }

    public static View.OnClickListener lambdaFactory$(PrivacyEditFragment privacyEditFragment, boolean[] zArr, boolean[] zArr2, ArrayList arrayList, PrivacyEditFragment.UserListAdapter userListAdapter, AlertDialog alertDialog) {
        return new PrivacyEditFragment$$Lambda$6(privacyEditFragment, zArr, zArr2, arrayList, userListAdapter, alertDialog);
    }

    @Override // android.view.View.OnClickListener
    @LambdaForm.Hidden
    public void onClick(View view) {
        this.arg$1.lambda$showListOfCategories$5(this.arg$2, this.arg$3, this.arg$4, this.arg$5, this.arg$6, view);
    }
}
