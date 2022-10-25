package com.vk.music.view.adapter;

import android.support.annotation.NonNull;
import android.view.View;
import android.widget.CheckBox;
import com.vkontakte.android.R;
import com.vkontakte.android.audio.MusicTrack;
import java.util.Collection;
/* loaded from: classes2.dex */
public final class SelectableMusicBinder extends MusicBinder {
    private final Collection<MusicTrack> selection;

    public SelectableMusicBinder(@NonNull Collection<MusicTrack> selection) {
        this.selection = selection;
    }

    @Override // com.vk.music.view.adapter.MusicBinder, com.vk.music.view.adapter.ItemViewHolder.Binder
    @NonNull
    public ViewRefs onCreate(@NonNull View itemView) {
        return super.onCreate(itemView).put(itemView.findViewById(R.id.audio_checkbox));
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.vk.music.view.adapter.MusicBinder, com.vk.music.view.adapter.ItemViewHolder.Binder
    public void onBind(@NonNull ViewRefs refs, @NonNull MusicTrack musicTrack, int position) {
        super.onBind(refs, musicTrack, position);
        ((CheckBox) refs.next()).setChecked(this.selection.contains(musicTrack));
    }
}
