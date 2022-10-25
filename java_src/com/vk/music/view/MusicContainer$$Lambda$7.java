package com.vk.music.view;

import android.view.View;
import com.vk.music.view.adapter.ItemViewHolder;
import com.vkontakte.android.audio.MusicTrack;
import java.lang.invoke.LambdaForm;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final /* synthetic */ class MusicContainer$$Lambda$7 implements ItemViewHolder.ClickListener {
    private final MusicContainer arg$1;

    private MusicContainer$$Lambda$7(MusicContainer musicContainer) {
        this.arg$1 = musicContainer;
    }

    public static ItemViewHolder.ClickListener lambdaFactory$(MusicContainer musicContainer) {
        return new MusicContainer$$Lambda$7(musicContainer);
    }

    @Override // com.vk.music.view.adapter.ItemViewHolder.ClickListener
    @LambdaForm.Hidden
    public void onClick(View view, Object obj, int i) {
        this.arg$1.lambda$new$5(view, (MusicTrack) obj, i);
    }
}
