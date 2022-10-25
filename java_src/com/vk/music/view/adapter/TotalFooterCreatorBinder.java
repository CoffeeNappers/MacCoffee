package com.vk.music.view.adapter;

import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;
import com.vk.core.util.CollectionUtils;
import com.vk.core.util.Resourcer;
import com.vk.music.formatter.PlaylistFormatter;
import com.vkontakte.android.R;
import com.vkontakte.android.audio.MusicTrack;
import com.vkontakte.android.functions.F1;
import com.vkontakte.android.functions.VoidF;
import java.util.List;
/* loaded from: classes2.dex */
public class TotalFooterCreatorBinder implements F1<View, ViewGroup>, VoidF {
    private final Interactor interactor;
    TextView total;

    /* loaded from: classes2.dex */
    public interface Interactor {
        @NonNull
        LayoutInflater getLayoutInflater();

        @Nullable
        List<MusicTrack> getMusicTracks();

        @NonNull
        Resourcer getResourcer();
    }

    public TotalFooterCreatorBinder(@NonNull Interactor interactor) {
        this.interactor = interactor;
    }

    @Override // com.vkontakte.android.functions.F1
    public View f(ViewGroup viewGroup) {
        TextView textView = (TextView) this.interactor.getLayoutInflater().inflate(R.layout.music_playlist_footer, viewGroup, false);
        this.total = textView;
        return textView;
    }

    @Override // com.vkontakte.android.functions.VoidF
    public void f() {
        List<MusicTrack> musicTracks = this.interactor.getMusicTracks();
        if (!CollectionUtils.isEmpty(musicTracks)) {
            int totalDuration = 0;
            for (MusicTrack musicTrack : musicTracks) {
                totalDuration += musicTrack.duration;
            }
            this.total.setText(PlaylistFormatter.formatTotalSongsDuration(this.interactor.getResourcer(), musicTracks.size(), totalDuration));
        }
    }
}
