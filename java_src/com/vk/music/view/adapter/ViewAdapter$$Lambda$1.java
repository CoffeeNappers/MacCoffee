package com.vk.music.view.adapter;

import android.view.LayoutInflater;
import android.view.ViewGroup;
import com.vkontakte.android.functions.F1;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class ViewAdapter$$Lambda$1 implements F1 {
    private final LayoutInflater arg$1;
    private final int arg$2;

    private ViewAdapter$$Lambda$1(LayoutInflater layoutInflater, int i) {
        this.arg$1 = layoutInflater;
        this.arg$2 = i;
    }

    public static F1 lambdaFactory$(LayoutInflater layoutInflater, int i) {
        return new ViewAdapter$$Lambda$1(layoutInflater, i);
    }

    @Override // com.vkontakte.android.functions.F1
    @LambdaForm.Hidden
    public Object f(Object obj) {
        return ViewAdapter.lambda$new$0(this.arg$1, this.arg$2, (ViewGroup) obj);
    }
}
