package com.vk.music.attach.controller;

import android.view.LayoutInflater;
import android.view.ViewGroup;
import com.vkontakte.android.functions.F1;
import com.vkontakte.android.functions.VoidF;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
public final /* synthetic */ class AdapterHelper$$Lambda$4 implements F1 {
    private final LayoutInflater arg$1;
    private final VoidF arg$2;

    private AdapterHelper$$Lambda$4(LayoutInflater layoutInflater, VoidF voidF) {
        this.arg$1 = layoutInflater;
        this.arg$2 = voidF;
    }

    public static F1 lambdaFactory$(LayoutInflater layoutInflater, VoidF voidF) {
        return new AdapterHelper$$Lambda$4(layoutInflater, voidF);
    }

    @Override // com.vkontakte.android.functions.F1
    @LambdaForm.Hidden
    public Object f(Object obj) {
        return AdapterHelper.lambda$createErrorAdapter$3(this.arg$1, this.arg$2, (ViewGroup) obj);
    }
}
