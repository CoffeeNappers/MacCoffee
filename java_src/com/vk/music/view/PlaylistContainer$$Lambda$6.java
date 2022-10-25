package com.vk.music.view;

import android.view.View;
import java.lang.invoke.LambdaForm;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final /* synthetic */ class PlaylistContainer$$Lambda$6 implements View.OnClickListener {
    private final PlaylistContainer arg$1;

    private PlaylistContainer$$Lambda$6(PlaylistContainer playlistContainer) {
        this.arg$1 = playlistContainer;
    }

    public static View.OnClickListener lambdaFactory$(PlaylistContainer playlistContainer) {
        return new PlaylistContainer$$Lambda$6(playlistContainer);
    }

    @Override // android.view.View.OnClickListener
    @LambdaForm.Hidden
    public void onClick(View view) {
        this.arg$1.lambda$null$2(view);
    }
}
