package com.vkontakte.android.fragments;

import android.view.View;
import com.vk.music.dto.Playlist;
import com.vk.music.fragment.PlaylistFragment;
import com.vk.music.view.adapter.ItemViewHolder;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
public final /* synthetic */ class ProfileFragment$$Lambda$30 implements ItemViewHolder.ClickListener {
    private static final ProfileFragment$$Lambda$30 instance = new ProfileFragment$$Lambda$30();

    private ProfileFragment$$Lambda$30() {
    }

    public static ItemViewHolder.ClickListener lambdaFactory$() {
        return instance;
    }

    @Override // com.vk.music.view.adapter.ItemViewHolder.ClickListener
    @LambdaForm.Hidden
    public void onClick(View view, Object obj, int i) {
        new PlaylistFragment.Builder((Playlist) obj).go(view.getContext());
    }
}
