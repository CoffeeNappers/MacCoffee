package com.vk.music.view;

import android.view.View;
import com.vk.music.view.adapter.ItemViewHolder;
import com.vkontakte.android.R;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
public final /* synthetic */ class PlaylistsContainer$$Lambda$5 implements ItemViewHolder.Builder.Init {
    private static final PlaylistsContainer$$Lambda$5 instance = new PlaylistsContainer$$Lambda$5();

    private PlaylistsContainer$$Lambda$5() {
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
