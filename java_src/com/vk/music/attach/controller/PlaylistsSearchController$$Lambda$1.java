package com.vk.music.attach.controller;

import android.view.View;
import com.vk.music.view.adapter.ItemViewHolder;
import com.vkontakte.android.R;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class PlaylistsSearchController$$Lambda$1 implements ItemViewHolder.Builder.Init {
    private static final PlaylistsSearchController$$Lambda$1 instance = new PlaylistsSearchController$$Lambda$1();

    private PlaylistsSearchController$$Lambda$1() {
    }

    public static ItemViewHolder.Builder.Init lambdaFactory$() {
        return instance;
    }

    @Override // com.vk.music.view.adapter.ItemViewHolder.Builder.Init
    @LambdaForm.Hidden
    public void apply(View view) {
        view.findViewById(R.id.playlist_menu).setVisibility(8);
    }
}
