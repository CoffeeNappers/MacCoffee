package com.vk.attachpicker;

import com.vkontakte.android.functions.F0;
import java.lang.invoke.LambdaForm;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final /* synthetic */ class AttachActivity$$Lambda$14 implements F0 {
    private final AttachActivity arg$1;

    private AttachActivity$$Lambda$14(AttachActivity attachActivity) {
        this.arg$1 = attachActivity;
    }

    public static F0 lambdaFactory$(AttachActivity attachActivity) {
        return new AttachActivity$$Lambda$14(attachActivity);
    }

    @Override // com.vkontakte.android.functions.F0
    @LambdaForm.Hidden
    public Object f() {
        return this.arg$1.lambda$initTabs$13();
    }
}
