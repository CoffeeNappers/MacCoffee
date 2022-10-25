package com.vkontakte.android.ui.binder;

import com.vkontakte.android.data.LikeInfo;
import com.vkontakte.android.functions.F1;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class LikeBarBinder$LikeLabelFormatter$$Lambda$7 implements F1 {
    private static final LikeBarBinder$LikeLabelFormatter$$Lambda$7 instance = new LikeBarBinder$LikeLabelFormatter$$Lambda$7();

    private LikeBarBinder$LikeLabelFormatter$$Lambda$7() {
    }

    public static F1 lambdaFactory$() {
        return instance;
    }

    @Override // com.vkontakte.android.functions.F1
    @LambdaForm.Hidden
    public Object f(Object obj) {
        String string;
        string = ((LikeInfo) obj).getString(LikeInfo.DATA_FIRST_NAME);
        return string;
    }
}
