package com.vkontakte.android.ui.binder;

import com.vkontakte.android.data.LikeInfo;
import com.vkontakte.android.functions.F1;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class LikeBarBinder$LikeLabelFormatter$$Lambda$5 implements F1 {
    private static final LikeBarBinder$LikeLabelFormatter$$Lambda$5 instance = new LikeBarBinder$LikeLabelFormatter$$Lambda$5();

    private LikeBarBinder$LikeLabelFormatter$$Lambda$5() {
    }

    public static F1 lambdaFactory$() {
        return instance;
    }

    @Override // com.vkontakte.android.functions.F1
    @LambdaForm.Hidden
    public Object f(Object obj) {
        String string;
        string = ((LikeInfo) obj).getString(LikeInfo.DATA_FIRST_NAME_DAT);
        return string;
    }
}
