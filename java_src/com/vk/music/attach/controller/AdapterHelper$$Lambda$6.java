package com.vk.music.attach.controller;

import android.view.View;
import com.vkontakte.android.functions.VoidF;
import java.lang.invoke.LambdaForm;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final /* synthetic */ class AdapterHelper$$Lambda$6 implements View.OnClickListener {
    private final VoidF arg$1;

    private AdapterHelper$$Lambda$6(VoidF voidF) {
        this.arg$1 = voidF;
    }

    public static View.OnClickListener lambdaFactory$(VoidF voidF) {
        return new AdapterHelper$$Lambda$6(voidF);
    }

    @Override // android.view.View.OnClickListener
    @LambdaForm.Hidden
    public void onClick(View view) {
        this.arg$1.f();
    }
}
