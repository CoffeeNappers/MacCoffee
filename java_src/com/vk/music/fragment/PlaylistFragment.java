package com.vk.music.fragment;

import android.os.Bundle;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import com.vk.music.dto.AlbumLink;
import com.vk.music.dto.Playlist;
import com.vk.music.model.PlaylistModel;
import com.vk.music.model.PlaylistModelImpl;
import com.vk.music.utils.SmallPlayerHelper;
import com.vk.music.view.PlaylistContainer;
import com.vkontakte.android.auth.VKAccountManager;
import com.vkontakte.android.navigation.Navigator;
/* loaded from: classes2.dex */
public final class PlaylistFragment extends DelegatingFragment {
    private static final String ARG_OWNER_ID = "ownerId";
    private static final String ARG_PLAYLIST = "playlist";
    private static final String ARG_PLAYLIST_ACCESS_KEY = "accessKey";
    private static final String ARG_PLAYLIST_ID = "playlistId";
    private static final String ARG_PLAYLIST_TYPE = "playlistType";
    private SmallPlayerHelper smallPlayerHelper = new SmallPlayerHelper();

    /* loaded from: classes2.dex */
    public static final class Builder extends Navigator {
        public Builder(int ownerId, int playlistId) {
            super(PlaylistFragment.class);
            this.args.putInt(PlaylistFragment.ARG_OWNER_ID, ownerId);
            this.args.putInt(PlaylistFragment.ARG_PLAYLIST_ID, playlistId);
        }

        public Builder(@NonNull Playlist playlist) {
            super(PlaylistFragment.class);
            Playlist playlist2 = playlist.getOriginalPlaylist();
            this.args.putInt(PlaylistFragment.ARG_OWNER_ID, playlist2.ownerId);
            this.args.putInt(PlaylistFragment.ARG_PLAYLIST_ID, playlist2.id);
            this.args.putInt(PlaylistFragment.ARG_PLAYLIST_TYPE, playlist2.type);
            accessKey(playlist2.accessKey);
        }

        public Builder(@NonNull AlbumLink link) {
            this(link.ownerId, link.id);
            accessKey(link.accessKey);
        }

        public Builder accessKey(@Nullable String accessKey) {
            this.args.putString(PlaylistFragment.ARG_PLAYLIST_ACCESS_KEY, accessKey);
            return this;
        }
    }

    @Override // com.vk.music.fragment.DelegatingFragment, android.app.Fragment
    @Nullable
    public View onCreateView(LayoutInflater inflater, @Nullable ViewGroup container, Bundle savedInstanceState) {
        return this.smallPlayerHelper.onCreateView(super.onCreateView(inflater, container, savedInstanceState));
    }

    @Override // com.vk.music.fragment.DelegatingFragment, android.app.Fragment
    public void onDestroyView() {
        this.smallPlayerHelper.onDestroyView();
        super.onDestroyView();
    }

    @Override // com.vk.music.fragment.DelegatingFragment
    @NonNull
    protected FragmentDelegate createDelegate() {
        Bundle args = getArguments();
        int playlistType = args.getInt(ARG_PLAYLIST_TYPE);
        PlaylistModel model = new PlaylistModelImpl(args.getInt(ARG_OWNER_ID, VKAccountManager.getCurrent().getUid()), args.getInt(ARG_PLAYLIST_ID), playlistType, (Playlist) args.getParcelable(ARG_PLAYLIST), args.getString(ARG_PLAYLIST_ACCESS_KEY));
        return new FragmentDelegateActiveModel(PlaylistFragment$$Lambda$1.lambdaFactory$(this), model);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ View lambda$createDelegate$0(FragmentDelegateActiveModel fd) {
        return new PlaylistContainer(getActivity(), (PlaylistModel) fd.model(0));
    }
}
