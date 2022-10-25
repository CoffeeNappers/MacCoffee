package com.vkontakte.android;

import android.view.View;
import com.vkontakte.android.ui.XFrameLayout;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class AuthActivity$$Lambda$4 implements XFrameLayout.OnKeyboardStateChangeListener {
    private final View arg$1;
    private final View arg$2;

    private AuthActivity$$Lambda$4(View view, View view2) {
        this.arg$1 = view;
        this.arg$2 = view2;
    }

    public static XFrameLayout.OnKeyboardStateChangeListener lambdaFactory$(View view, View view2) {
        return new AuthActivity$$Lambda$4(view, view2);
    }

    @Override // com.vkontakte.android.ui.XFrameLayout.OnKeyboardStateChangeListener
    @LambdaForm.Hidden
    public void onKeyboardStateChanged(boolean z) {
        AuthActivity.lambda$onCreate$3(this.arg$1, this.arg$2, z);
    }
}
