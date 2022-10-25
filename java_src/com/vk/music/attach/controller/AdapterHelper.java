package com.vk.music.attach.controller;

import android.support.annotation.NonNull;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;
import com.vk.music.attach.controller.Controller;
import com.vk.music.view.adapter.IdResolver;
import com.vk.music.view.adapter.ItemAdapter;
import com.vk.music.view.adapter.ItemViewHolder;
import com.vk.music.view.adapter.SelectableMusicBinder;
import com.vk.music.view.adapter.ViewAdapter;
import com.vkontakte.android.R;
import com.vkontakte.android.audio.MusicTrack;
import com.vkontakte.android.functions.VoidF;
/* loaded from: classes2.dex */
class AdapterHelper {
    AdapterHelper() {
    }

    @NonNull
    public static ItemAdapter<MusicTrack> createMusicAdapter(@NonNull LayoutInflater inflater, @NonNull Controller.HostController hostController, int viewType) {
        ItemViewHolder.Builder.Init init;
        IdResolver idResolver;
        ItemAdapter.Builder layout = new ItemAdapter.Builder(inflater).layout(R.layout.music_audio_item5);
        init = AdapterHelper$$Lambda$1.instance;
        ItemAdapter.Builder viewType2 = layout.init(init).binder(new SelectableMusicBinder(hostController.getAttachedTracks())).registerClickListener(AdapterHelper$$Lambda$2.lambdaFactory$(hostController)).viewType(viewType);
        idResolver = AdapterHelper$$Lambda$3.instance;
        return viewType2.resolver(idResolver).build();
    }

    public static /* synthetic */ void lambda$createMusicAdapter$1(@NonNull Controller.HostController hostController, View v, MusicTrack musicTrack, int position) {
        View clickReceiver;
        if (hostController.tryToggleAttached(musicTrack) && (clickReceiver = (View) v.getTag()) != null) {
            clickReceiver.performClick();
        }
    }

    @NonNull
    public static ViewAdapter createLoadingFooterAdapter(@NonNull LayoutInflater inflater, int viewType) {
        return new ViewAdapter(inflater, (int) R.layout.music_footer_loading, viewType);
    }

    @NonNull
    public static ViewAdapter createErrorAdapter(@NonNull LayoutInflater inflater, @NonNull VoidF onRetryClick) {
        return new ViewAdapter(AdapterHelper$$Lambda$4.lambdaFactory$(inflater, onRetryClick), 0);
    }

    public static /* synthetic */ View lambda$createErrorAdapter$3(@NonNull LayoutInflater inflater, @NonNull VoidF onRetryClick, ViewGroup viewGroup) {
        View view = inflater.inflate(R.layout.appkit_error, viewGroup, false);
        view.findViewById(R.id.error_retry).setOnClickListener(AdapterHelper$$Lambda$6.lambdaFactory$(onRetryClick));
        return view;
    }

    @NonNull
    public static ViewAdapter createEmptyAdapter(@NonNull LayoutInflater inflater) {
        return new ViewAdapter(AdapterHelper$$Lambda$5.lambdaFactory$(inflater), 0);
    }

    public static /* synthetic */ View lambda$createEmptyAdapter$4(@NonNull LayoutInflater inflater, ViewGroup viewGroup) {
        View view = inflater.inflate(R.layout.appkit_empty, viewGroup, false);
        ((TextView) view.findViewById(R.id.empty_text)).setText(R.string.music_playlist_empty_text);
        return view;
    }

    @NonNull
    public static ViewAdapter createLoaderAdapter(@NonNull LayoutInflater inflater) {
        return new ViewAdapter(inflater, (int) R.layout.music_loader, 0);
    }
}
