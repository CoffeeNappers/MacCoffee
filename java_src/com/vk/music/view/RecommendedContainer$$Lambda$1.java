package com.vk.music.view;

import android.view.View;
import java.lang.invoke.LambdaForm;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final /* synthetic */ class RecommendedContainer$$Lambda$1 implements View.OnClickListener {
    private final RecommendedContainer arg$1;

    private RecommendedContainer$$Lambda$1(RecommendedContainer recommendedContainer) {
        this.arg$1 = recommendedContainer;
    }

    public static View.OnClickListener lambdaFactory$(RecommendedContainer recommendedContainer) {
        return new RecommendedContainer$$Lambda$1(recommendedContainer);
    }

    @Override // android.view.View.OnClickListener
    @LambdaForm.Hidden
    public void onClick(View view) {
        this.arg$1.lambda$new$0(view);
    }
}
