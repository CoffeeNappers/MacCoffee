package com.vkontakte.android.ui.binder;

import com.vkontakte.android.data.LikeInfo;
import com.vkontakte.android.functions.Predicate;
import com.vkontakte.android.ui.binder.LikeBarBinder;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class LikeBarBinder$LikeLabelFormatter$$Lambda$2 implements Predicate {
    private static final LikeBarBinder$LikeLabelFormatter$$Lambda$2 instance = new LikeBarBinder$LikeLabelFormatter$$Lambda$2();

    private LikeBarBinder$LikeLabelFormatter$$Lambda$2() {
    }

    public static Predicate lambdaFactory$() {
        return instance;
    }

    @Override // com.vkontakte.android.functions.Predicate
    @LambdaForm.Hidden
    public boolean f(Object obj) {
        return LikeBarBinder.LikeLabelFormatter.lambda$static$1((LikeInfo) obj);
    }
}
