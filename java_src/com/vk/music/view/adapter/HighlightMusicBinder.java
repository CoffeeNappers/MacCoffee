package com.vk.music.view.adapter;

import android.support.annotation.NonNull;
import android.view.View;
import android.widget.ImageView;
import com.vkontakte.android.R;
import com.vkontakte.android.audio.MusicTrack;
import com.vkontakte.android.functions.VoidF1;
import java.util.Collection;
/* loaded from: classes2.dex */
public class HighlightMusicBinder extends MusicBinder {
    private final int[] exclusion = {R.id.audio_action};
    private final VoidF1<View> inTrashDecorator;
    private final VoidF1<View> notInTrashDecorator;
    private final Collection<MusicTrack> removed;

    public HighlightMusicBinder(@NonNull Collection<MusicTrack> removed) {
        VoidF1<View> voidF1;
        VoidF1<View> voidF12;
        voidF1 = HighlightMusicBinder$$Lambda$1.instance;
        this.inTrashDecorator = voidF1;
        voidF12 = HighlightMusicBinder$$Lambda$2.instance;
        this.notInTrashDecorator = voidF12;
        this.removed = removed;
    }

    @Override // com.vk.music.view.adapter.MusicBinder, com.vk.music.view.adapter.ItemViewHolder.Binder
    @NonNull
    public ViewRefs onCreate(@NonNull View itemView) {
        return super.onCreate(itemView).put(itemView.findViewById(R.id.audio_action));
    }

    @Override // com.vk.music.view.adapter.MusicBinder, com.vk.music.view.adapter.ItemViewHolder.Binder
    public void onBind(@NonNull ViewRefs refs, @NonNull MusicTrack musicTrack, int position) {
        super.onBind(refs, musicTrack, position);
        if (this.removed.contains(musicTrack)) {
            ((ImageView) refs.next()).setImageResource(R.drawable.ic_add_24dp);
            refs.apply(this.exclusion, this.inTrashDecorator);
            return;
        }
        ((ImageView) refs.next()).setImageResource(R.drawable.picker_ic_close_24dp);
        refs.apply(this.exclusion, this.notInTrashDecorator);
    }
}
