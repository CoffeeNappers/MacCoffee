package com.vk.music.view;

import android.view.View;
import java.lang.invoke.LambdaForm;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final /* synthetic */ class MusicContainer$$Lambda$1 implements View.OnClickListener {
    private final MusicContainer arg$1;

    private MusicContainer$$Lambda$1(MusicContainer musicContainer) {
        this.arg$1 = musicContainer;
    }

    public static View.OnClickListener lambdaFactory$(MusicContainer musicContainer) {
        return new MusicContainer$$Lambda$1(musicContainer);
    }

    @Override // android.view.View.OnClickListener
    @LambdaForm.Hidden
    public void onClick(View view) {
        this.arg$1.lambda$new$0(view);
    }
}
