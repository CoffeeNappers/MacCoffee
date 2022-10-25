package com.vk.music.utils;

import com.vkontakte.android.ui.XFrameLayout;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class SmallPlayerHelper$$Lambda$1 implements XFrameLayout.OnKeyboardStateChangeListener {
    private final SmallPlayerHelper arg$1;

    private SmallPlayerHelper$$Lambda$1(SmallPlayerHelper smallPlayerHelper) {
        this.arg$1 = smallPlayerHelper;
    }

    public static XFrameLayout.OnKeyboardStateChangeListener lambdaFactory$(SmallPlayerHelper smallPlayerHelper) {
        return new SmallPlayerHelper$$Lambda$1(smallPlayerHelper);
    }

    @Override // com.vkontakte.android.ui.XFrameLayout.OnKeyboardStateChangeListener
    @LambdaForm.Hidden
    public void onKeyboardStateChanged(boolean z) {
        this.arg$1.lambda$onCreateView$0(z);
    }
}
