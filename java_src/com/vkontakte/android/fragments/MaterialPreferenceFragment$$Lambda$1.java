package com.vkontakte.android.fragments;

import java.lang.invoke.LambdaForm;
import me.grishka.appkit.views.DividerItemDecoration;
/* loaded from: classes.dex */
final /* synthetic */ class MaterialPreferenceFragment$$Lambda$1 implements DividerItemDecoration.Provider {
    private final MaterialPreferenceFragment arg$1;

    private MaterialPreferenceFragment$$Lambda$1(MaterialPreferenceFragment materialPreferenceFragment) {
        this.arg$1 = materialPreferenceFragment;
    }

    public static DividerItemDecoration.Provider lambdaFactory$(MaterialPreferenceFragment materialPreferenceFragment) {
        return new MaterialPreferenceFragment$$Lambda$1(materialPreferenceFragment);
    }

    @Override // me.grishka.appkit.views.DividerItemDecoration.Provider
    @LambdaForm.Hidden
    public boolean needDrawDividerAfter(int i) {
        return this.arg$1.lambda$onCreateRecyclerView$0(i);
    }
}
