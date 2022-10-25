package com.vk.music.view;

import android.view.View;
import com.vk.music.model.MusicModel;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class ToolbarMusicContainer$$Lambda$1 implements View.OnClickListener {
    private final MusicModel arg$1;

    private ToolbarMusicContainer$$Lambda$1(MusicModel musicModel) {
        this.arg$1 = musicModel;
    }

    public static View.OnClickListener lambdaFactory$(MusicModel musicModel) {
        return new ToolbarMusicContainer$$Lambda$1(musicModel);
    }

    @Override // android.view.View.OnClickListener
    @LambdaForm.Hidden
    public void onClick(View view) {
        ToolbarMusicContainer.lambda$new$0(this.arg$1, view);
    }
}
