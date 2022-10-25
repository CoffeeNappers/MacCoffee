package com.vk.music.view;

import java.lang.invoke.LambdaForm;
import me.grishka.appkit.views.DividerItemDecoration;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final /* synthetic */ class RecommendedContainer$$Lambda$2 implements DividerItemDecoration.Provider {
    private final RecommendedContainer arg$1;

    private RecommendedContainer$$Lambda$2(RecommendedContainer recommendedContainer) {
        this.arg$1 = recommendedContainer;
    }

    public static DividerItemDecoration.Provider lambdaFactory$(RecommendedContainer recommendedContainer) {
        return new RecommendedContainer$$Lambda$2(recommendedContainer);
    }

    @Override // me.grishka.appkit.views.DividerItemDecoration.Provider
    @LambdaForm.Hidden
    public boolean needDrawDividerAfter(int i) {
        return this.arg$1.lambda$new$1(i);
    }
}
