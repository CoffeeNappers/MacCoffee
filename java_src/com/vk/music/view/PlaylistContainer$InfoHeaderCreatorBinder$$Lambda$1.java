package com.vk.music.view;

import android.view.View;
import com.vk.music.view.PlaylistContainer;
import java.lang.invoke.LambdaForm;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final /* synthetic */ class PlaylistContainer$InfoHeaderCreatorBinder$$Lambda$1 implements View.OnClickListener {
    private final PlaylistContainer.InfoHeaderCreatorBinder arg$1;

    private PlaylistContainer$InfoHeaderCreatorBinder$$Lambda$1(PlaylistContainer.InfoHeaderCreatorBinder infoHeaderCreatorBinder) {
        this.arg$1 = infoHeaderCreatorBinder;
    }

    public static View.OnClickListener lambdaFactory$(PlaylistContainer.InfoHeaderCreatorBinder infoHeaderCreatorBinder) {
        return new PlaylistContainer$InfoHeaderCreatorBinder$$Lambda$1(infoHeaderCreatorBinder);
    }

    @Override // android.view.View.OnClickListener
    @LambdaForm.Hidden
    public void onClick(View view) {
        this.arg$1.lambda$new$0(view);
    }
}
