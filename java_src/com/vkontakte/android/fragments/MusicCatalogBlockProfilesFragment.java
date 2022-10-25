package com.vkontakte.android.fragments;

import android.content.Context;
import android.os.Bundle;
import android.support.annotation.Nullable;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import com.vk.music.fragment.MusicFragment;
import com.vk.music.utils.SmallPlayerHelper;
import com.vkontakte.android.UserProfile;
import com.vkontakte.android.api.SimpleListCallback;
import com.vkontakte.android.api.audio.AudioGetCatalogBlockById;
import com.vkontakte.android.navigation.Navigator;
/* loaded from: classes2.dex */
public class MusicCatalogBlockProfilesFragment extends AbsUserListFragment {
    private static final String ARG_CATALOG_BLOCK_ID = "catalogBlockId";
    private static final String ARG_TITLE = "title";
    private SmallPlayerHelper smallPlayerHelper = new SmallPlayerHelper();

    /* loaded from: classes2.dex */
    public static class Builder extends Navigator {
        public Builder(int catalogBlockId) {
            super(MusicCatalogBlockProfilesFragment.class);
            this.args.putInt(MusicCatalogBlockProfilesFragment.ARG_CATALOG_BLOCK_ID, catalogBlockId);
        }

        public Builder title(String title) {
            this.args.putString("title", title);
            return this;
        }
    }

    @Override // me.grishka.appkit.fragments.LoaderFragment, android.app.Fragment
    @Nullable
    public View onCreateView(LayoutInflater inflater, @Nullable ViewGroup container, Bundle savedInstanceState) {
        return this.smallPlayerHelper.onCreateView(super.onCreateView(inflater, container, savedInstanceState));
    }

    @Override // me.grishka.appkit.fragments.BaseRecyclerFragment, me.grishka.appkit.fragments.LoaderFragment, me.grishka.appkit.fragments.AppKitFragment, android.app.DialogFragment, android.app.Fragment
    public void onDestroyView() {
        this.smallPlayerHelper.onDestroyView();
        super.onDestroyView();
    }

    @Override // com.vkontakte.android.fragments.base.GridFragment, com.vkontakte.android.fragments.VKRecyclerFragment, me.grishka.appkit.fragments.AppKitFragment, android.app.Fragment
    public void onViewCreated(View view, Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);
        setTitle(getArguments().getString("title"));
    }

    @Override // com.vkontakte.android.fragments.AbsUserListFragment
    public void onItemClick(UserProfile profile) {
        new MusicFragment.Builder().ownerId(profile.uid).go(getActivity());
    }

    @Override // me.grishka.appkit.fragments.BaseRecyclerFragment
    protected void doLoadData(int offset, int count) {
        int blockId = getArguments().getInt(ARG_CATALOG_BLOCK_ID);
        this.currentRequest = new AudioGetCatalogBlockById.Builder(blockId, offset, count).buildProfiles().setCallback(new SimpleListCallback(this)).exec((Context) getActivity());
    }
}
