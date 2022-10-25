package com.vkontakte.android.fragments;

import android.view.View;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class MaterialPreferenceToolbarFragment$$Lambda$1 implements View.OnClickListener {
    private final MaterialPreferenceToolbarFragment arg$1;

    private MaterialPreferenceToolbarFragment$$Lambda$1(MaterialPreferenceToolbarFragment materialPreferenceToolbarFragment) {
        this.arg$1 = materialPreferenceToolbarFragment;
    }

    public static View.OnClickListener lambdaFactory$(MaterialPreferenceToolbarFragment materialPreferenceToolbarFragment) {
        return new MaterialPreferenceToolbarFragment$$Lambda$1(materialPreferenceToolbarFragment);
    }

    @Override // android.view.View.OnClickListener
    @LambdaForm.Hidden
    public void onClick(View view) {
        this.arg$1.lambda$onCreateView$0(view);
    }
}
