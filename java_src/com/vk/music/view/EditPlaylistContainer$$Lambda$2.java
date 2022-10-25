package com.vk.music.view;

import android.view.ViewGroup;
import com.vkontakte.android.functions.F1;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class EditPlaylistContainer$$Lambda$2 implements F1 {
    private final EditPlaylistContainer arg$1;

    private EditPlaylistContainer$$Lambda$2(EditPlaylistContainer editPlaylistContainer) {
        this.arg$1 = editPlaylistContainer;
    }

    public static F1 lambdaFactory$(EditPlaylistContainer editPlaylistContainer) {
        return new EditPlaylistContainer$$Lambda$2(editPlaylistContainer);
    }

    @Override // com.vkontakte.android.functions.F1
    @LambdaForm.Hidden
    public Object f(Object obj) {
        return this.arg$1.lambda$new$1((ViewGroup) obj);
    }
}
