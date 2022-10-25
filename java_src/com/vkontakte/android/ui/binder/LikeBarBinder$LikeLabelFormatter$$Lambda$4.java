package com.vkontakte.android.ui.binder;

import com.vkontakte.android.data.LikeInfo;
import com.vkontakte.android.functions.Predicate;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class LikeBarBinder$LikeLabelFormatter$$Lambda$4 implements Predicate {
    private static final LikeBarBinder$LikeLabelFormatter$$Lambda$4 instance = new LikeBarBinder$LikeLabelFormatter$$Lambda$4();

    private LikeBarBinder$LikeLabelFormatter$$Lambda$4() {
    }

    public static Predicate lambdaFactory$() {
        return instance;
    }

    @Override // com.vkontakte.android.functions.Predicate
    @LambdaForm.Hidden
    public boolean f(Object obj) {
        boolean z;
        z = ((LikeInfo) obj).getBoolean(LikeInfo.DATA_FRIEND);
        return z;
    }
}
