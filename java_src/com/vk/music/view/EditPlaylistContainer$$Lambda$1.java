package com.vk.music.view;

import com.vkontakte.android.functions.VoidF;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class EditPlaylistContainer$$Lambda$1 implements VoidF {
    private final EditPlaylistContainer arg$1;

    private EditPlaylistContainer$$Lambda$1(EditPlaylistContainer editPlaylistContainer) {
        this.arg$1 = editPlaylistContainer;
    }

    public static VoidF lambdaFactory$(EditPlaylistContainer editPlaylistContainer) {
        return new EditPlaylistContainer$$Lambda$1(editPlaylistContainer);
    }

    @Override // com.vkontakte.android.functions.VoidF
    @LambdaForm.Hidden
    public void f() {
        EditPlaylistContainer.access$lambda$0(this.arg$1);
    }
}
