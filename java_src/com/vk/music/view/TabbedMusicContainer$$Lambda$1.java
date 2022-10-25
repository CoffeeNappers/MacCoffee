package com.vk.music.view;

import android.view.View;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class TabbedMusicContainer$$Lambda$1 implements View.OnClickListener {
    private final TabbedMusicContainer arg$1;

    private TabbedMusicContainer$$Lambda$1(TabbedMusicContainer tabbedMusicContainer) {
        this.arg$1 = tabbedMusicContainer;
    }

    public static View.OnClickListener lambdaFactory$(TabbedMusicContainer tabbedMusicContainer) {
        return new TabbedMusicContainer$$Lambda$1(tabbedMusicContainer);
    }

    @Override // android.view.View.OnClickListener
    @LambdaForm.Hidden
    public void onClick(View view) {
        this.arg$1.lambda$new$0(view);
    }
}
