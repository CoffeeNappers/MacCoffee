package com.vk.music.attach.controller;

import android.view.View;
import com.vk.music.attach.controller.Controller;
import com.vk.music.view.adapter.ItemViewHolder;
import com.vkontakte.android.audio.MusicTrack;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
public final /* synthetic */ class AdapterHelper$$Lambda$2 implements ItemViewHolder.ClickListener {
    private final Controller.HostController arg$1;

    private AdapterHelper$$Lambda$2(Controller.HostController hostController) {
        this.arg$1 = hostController;
    }

    public static ItemViewHolder.ClickListener lambdaFactory$(Controller.HostController hostController) {
        return new AdapterHelper$$Lambda$2(hostController);
    }

    @Override // com.vk.music.view.adapter.ItemViewHolder.ClickListener
    @LambdaForm.Hidden
    public void onClick(View view, Object obj, int i) {
        AdapterHelper.lambda$createMusicAdapter$1(this.arg$1, view, (MusicTrack) obj, i);
    }
}
