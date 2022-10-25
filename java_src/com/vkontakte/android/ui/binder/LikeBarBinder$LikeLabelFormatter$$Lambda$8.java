package com.vkontakte.android.ui.binder;

import com.vkontakte.android.data.LikeInfo;
import com.vkontakte.android.functions.F1;
import com.vkontakte.android.ui.binder.LikeBarBinder;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class LikeBarBinder$LikeLabelFormatter$$Lambda$8 implements F1 {
    private static final LikeBarBinder$LikeLabelFormatter$$Lambda$8 instance = new LikeBarBinder$LikeLabelFormatter$$Lambda$8();

    private LikeBarBinder$LikeLabelFormatter$$Lambda$8() {
    }

    public static F1 lambdaFactory$() {
        return instance;
    }

    @Override // com.vkontakte.android.functions.F1
    @LambdaForm.Hidden
    public Object f(Object obj) {
        return LikeBarBinder.LikeLabelFormatter.lambda$static$7((LikeInfo) obj);
    }
}
