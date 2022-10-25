package com.vk.music.fragment;

import android.os.Bundle;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import com.vk.core.util.Resourcer;
import com.vk.music.dto.Playlist;
import com.vk.music.model.PlaylistsModel;
import com.vk.music.model.PlaylistsModelImpl;
import com.vk.music.utils.SmallPlayerHelper;
import com.vk.music.view.PlaylistsContainer;
import com.vkontakte.android.R;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.api.audio.AudioGetCatalogBlockById;
import com.vkontakte.android.api.audio.AudioGetPlaylists;
import com.vkontakte.android.auth.VKAccountManager;
import com.vkontakte.android.data.VKList;
import com.vkontakte.android.navigation.Navigator;
/* loaded from: classes2.dex */
public final class PlaylistsFragment extends DelegatingFragment implements PlaylistsModelImpl.RequestCreator<VKList<Playlist>> {
    private static final String ARG_CATALOG_BLOCK_ID = "catalogBlockId";
    private static final String ARG_OWNER_ID = "ownerId";
    private static final String ARG_SELECT = "select";
    private static final String ARG_SELECT_MY = "selectMy";
    private static final String ARG_TITLE = "title";
    private SmallPlayerHelper smallPlayerHelper = new SmallPlayerHelper();

    /* loaded from: classes2.dex */
    public static class Builder extends Navigator {
        public Builder() {
            super(PlaylistsFragment.class);
        }

        public Builder ownerId(int ownerId) {
            this.args.putInt(PlaylistsFragment.ARG_OWNER_ID, ownerId);
            return this;
        }

        public Builder catalogBlockId(int catalogBlockId) {
            this.args.putInt(PlaylistsFragment.ARG_CATALOG_BLOCK_ID, catalogBlockId);
            return this;
        }

        public Builder title(String title) {
            this.args.putString("title", title);
            return this;
        }

        public Builder select(boolean val) {
            this.args.putBoolean("select", val);
            return this;
        }

        public Builder selectMy(boolean val) {
            select(val);
            this.args.putBoolean(PlaylistsFragment.ARG_SELECT_MY, val);
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
        boolean isCurrentUser = VKAccountManager.isCurrentUser(args.getInt(ARG_OWNER_ID, VKAccountManager.getCurrent().getUid()));
        boolean containsBlockId = args.containsKey(ARG_CATALOG_BLOCK_ID);
        PlaylistsModelImpl.Builder builder = new PlaylistsModelImpl.Builder(this).currentUser(isCurrentUser).canAddPlaylist(isCurrentUser && !containsBlockId).selectMode(args.getBoolean("select")).title(args.getString("title", Resourcer.of(getActivity()).str(R.string.music_playlists_filter_label_all)));
        return new FragmentDelegateActiveModel(PlaylistsFragment$$Lambda$1.lambdaFactory$(this), builder.build());
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ View lambda$createDelegate$0(FragmentDelegateActiveModel fd) {
        return new PlaylistsContainer(getActivity(), (PlaylistsModel) fd.model(0));
    }

    @Override // com.vk.music.model.PlaylistsModelImpl.RequestCreator
    public VKAPIRequest<VKList<Playlist>> createLoadRequest(@NonNull PlaylistsModelImpl model, int offset, int count) {
        Bundle args = getArguments();
        if (args.containsKey(ARG_CATALOG_BLOCK_ID)) {
            return new AudioGetCatalogBlockById.Builder(args.getInt(ARG_CATALOG_BLOCK_ID), offset, count).buildPlaylists();
        }
        int ownerId = args.getInt(ARG_OWNER_ID, VKAccountManager.getCurrent().getUid());
        AudioGetPlaylists.Builder builder = new AudioGetPlaylists.Builder(ownerId);
        if (args.getBoolean(ARG_SELECT_MY)) {
            builder.filter(AudioGetPlaylists.Filter.owned);
        } else {
            builder.filter(AudioGetPlaylists.Filter.all);
        }
        return builder.offset(offset).count(count).build();
    }
}
