package com.vk.music.view;

import android.view.View;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class EditPlaylistContainer$$Lambda$5 implements View.OnClickListener {
    private final EditPlaylistContainer arg$1;

    private EditPlaylistContainer$$Lambda$5(EditPlaylistContainer editPlaylistContainer) {
        this.arg$1 = editPlaylistContainer;
    }

    public static View.OnClickListener lambdaFactory$(EditPlaylistContainer editPlaylistContainer) {
        return new EditPlaylistContainer$$Lambda$5(editPlaylistContainer);
    }

    @Override // android.view.View.OnClickListener
    @LambdaForm.Hidden
    public void onClick(View view) {
        this.arg$1.lambda$null$0(view);
    }
}
