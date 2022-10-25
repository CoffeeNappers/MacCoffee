package com.vkontakte.android;

import android.widget.CompoundButton;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class WelcomeActivity$$Lambda$1 implements CompoundButton.OnCheckedChangeListener {
    private final WelcomeActivity arg$1;

    private WelcomeActivity$$Lambda$1(WelcomeActivity welcomeActivity) {
        this.arg$1 = welcomeActivity;
    }

    public static CompoundButton.OnCheckedChangeListener lambdaFactory$(WelcomeActivity welcomeActivity) {
        return new WelcomeActivity$$Lambda$1(welcomeActivity);
    }

    @Override // android.widget.CompoundButton.OnCheckedChangeListener
    @LambdaForm.Hidden
    public void onCheckedChanged(CompoundButton compoundButton, boolean z) {
        this.arg$1.lambda$onCreate$0(compoundButton, z);
    }
}
