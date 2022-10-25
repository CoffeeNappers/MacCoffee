package com.vk.music.view;

import android.view.View;
import com.vk.music.view.adapter.ItemViewHolder;
import com.vkontakte.android.audio.MusicTrack;
import java.lang.invoke.LambdaForm;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final /* synthetic */ class EditPlaylistContainer$$Lambda$3 implements ItemViewHolder.ClickListener {
    private final EditPlaylistContainer arg$1;

    private EditPlaylistContainer$$Lambda$3(EditPlaylistContainer editPlaylistContainer) {
        this.arg$1 = editPlaylistContainer;
    }

    public static ItemViewHolder.ClickListener lambdaFactory$(EditPlaylistContainer editPlaylistContainer) {
        return new EditPlaylistContainer$$Lambda$3(editPlaylistContainer);
    }

    @Override // com.vk.music.view.adapter.ItemViewHolder.ClickListener
    @LambdaForm.Hidden
    public void onClick(View view, Object obj, int i) {
        this.arg$1.lambda$new$2(view, (MusicTrack) obj, i);
    }
}
