package com.vk.music.fragment;

import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.view.View;
import com.vk.music.dto.Playlist;
import com.vk.music.model.EditPlaylistModel;
import com.vk.music.view.EditPlaylistContainer;
import com.vkontakte.android.audio.MusicTrack;
import com.vkontakte.android.navigation.Navigator;
import java.util.ArrayList;
import java.util.Collection;
/* loaded from: classes2.dex */
public final class EditPlaylistFragment extends DelegatingFragment {
    private static final String ARG_MUSIC_TRACKS = "EditPlaylistFragment.arg.musicTracks";
    private static final String ARG_OFFSET = "EditPlaylistFragment.arg.offset";
    private static final String ARG_PLAYLIST = "EditPlaylistFragment.arg.playlist";

    /* loaded from: classes2.dex */
    public static class Builder extends Navigator {
        public Builder() {
            super(EditPlaylistFragment.class);
        }

        public Builder playlist(@Nullable Playlist playlist) {
            this.args.putParcelable(EditPlaylistFragment.ARG_PLAYLIST, playlist);
            return this;
        }

        public Builder musicTracks(int offset, @Nullable Collection<MusicTrack> musicTracks) {
            this.args.putInt(EditPlaylistFragment.ARG_OFFSET, offset);
            this.args.putParcelableArrayList(EditPlaylistFragment.ARG_MUSIC_TRACKS, musicTracks != null ? new ArrayList<>(musicTracks) : null);
            return this;
        }
    }

    @Override // com.vk.music.fragment.DelegatingFragment
    @NonNull
    protected FragmentDelegate createDelegate() {
        return new FragmentDelegateActiveModel(EditPlaylistFragment$$Lambda$1.lambdaFactory$(this), new EditPlaylistModelImpl((Playlist) getArguments().getParcelable(ARG_PLAYLIST), getArguments().getInt(ARG_OFFSET), getArguments().getParcelableArrayList(ARG_MUSIC_TRACKS)));
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ View lambda$createDelegate$0(FragmentDelegateActiveModel fd) {
        return new EditPlaylistContainer(getActivity(), (EditPlaylistModel) fd.model(0));
    }
}
