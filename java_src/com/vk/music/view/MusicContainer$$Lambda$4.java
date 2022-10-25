package com.vk.music.view;

import android.view.ViewGroup;
import com.vkontakte.android.functions.F1;
import java.lang.invoke.LambdaForm;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final /* synthetic */ class MusicContainer$$Lambda$4 implements F1 {
    private final MusicContainer arg$1;

    private MusicContainer$$Lambda$4(MusicContainer musicContainer) {
        this.arg$1 = musicContainer;
    }

    public static F1 lambdaFactory$(MusicContainer musicContainer) {
        return new MusicContainer$$Lambda$4(musicContainer);
    }

    @Override // com.vkontakte.android.functions.F1
    @LambdaForm.Hidden
    public Object f(Object obj) {
        return this.arg$1.lambda$new$2((ViewGroup) obj);
    }
}
