package com.vk.music.fragment;

import android.os.Bundle;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import com.vk.music.dto.Section;
import com.vk.music.fragment.FragmentDelegateActiveModel;
import com.vk.music.fragment.MusicPromoFragment;
import com.vk.music.model.ActiveModel;
import com.vk.music.model.MusicModel;
import com.vk.music.model.MusicModelCatalogBlock;
import com.vk.music.model.MusicModelImpl;
import com.vk.music.model.TabbedMusicModel;
import com.vk.music.utils.SmallPlayerHelper;
import com.vk.music.view.TabbedMusicContainer;
import com.vk.music.view.ToolbarMusicContainer;
import com.vkontakte.android.auth.VKAccountManager;
import com.vkontakte.android.navigation.Navigator;
/* loaded from: classes2.dex */
public final class MusicFragment extends DelegatingFragment {
    private static final String ARG_CATALOG_BLOCK = "catalogBlock";
    private static final String ARG_OWNER_ID = "ownerId";
    private static final String ARG_OWNER_IMAGE = "ownerImage";
    private static final String ARG_OWNER_NAME_FULL = "ownerNameFull";
    private static final String ARG_OWNER_NAME_GEN = "ownerNameGen";
    private static final String ARG_SECTION = "section";
    private static final int SECTION_RECOMMENDED = 1;
    private SmallPlayerHelper smallPlayerHelper = new SmallPlayerHelper();

    /* loaded from: classes2.dex */
    public static final class Builder extends Navigator {
        public Builder() {
            super(MusicFragment.class);
        }

        public Builder ownerId(int ownerId) {
            this.args.putInt(MusicFragment.ARG_OWNER_ID, ownerId);
            return this;
        }

        public Builder catalogBlockId(Section section) {
            this.args.putParcelable(MusicFragment.ARG_CATALOG_BLOCK, section);
            return this;
        }

        public Builder sectionRecommended() {
            this.args.putInt("section", 1);
            return this;
        }

        public Builder setOwnerImage(String image) {
            this.args.putString(MusicFragment.ARG_OWNER_IMAGE, image);
            return this;
        }

        public Builder setOwnerNameGen(String nameGen) {
            this.args.putString(MusicFragment.ARG_OWNER_NAME_GEN, nameGen);
            return this;
        }

        public Builder setOwnerNameFull(String fullName) {
            this.args.putString(MusicFragment.ARG_OWNER_NAME_FULL, fullName);
            return this;
        }
    }

    @Override // com.vk.music.fragment.DelegatingFragment, android.app.Fragment
    public void onCreate(@Nullable Bundle b) {
        super.onCreate(b);
        boolean needShowMusicPromo = !VKAccountManager.getCurrent().isMusicIntroWasShowed();
        int ownerId = getArguments().getInt(ARG_OWNER_ID, VKAccountManager.getCurrent().getUid());
        if (needShowMusicPromo && VKAccountManager.isCurrentUser(ownerId)) {
            new MusicPromoFragment.Builder().go(getActivity());
        }
    }

    @Override // com.vk.music.fragment.DelegatingFragment
    @NonNull
    protected FragmentDelegate createDelegate() {
        boolean z = true;
        if (getArguments().containsKey(ARG_CATALOG_BLOCK)) {
            Section section = (Section) getArguments().getParcelable(ARG_CATALOG_BLOCK);
            return new FragmentDelegateActiveModel(MusicFragment$$Lambda$1.lambdaFactory$(this), new MusicModelCatalogBlock(section));
        }
        int ownerId = getArguments().getInt(ARG_OWNER_ID, VKAccountManager.getCurrent().getUid());
        if (VKAccountManager.isCurrentUser(ownerId)) {
            FragmentDelegateActiveModel.ViewCreator lambdaFactory$ = MusicFragment$$Lambda$2.lambdaFactory$(this);
            ActiveModel[] activeModelArr = new ActiveModel[1];
            if (getArguments().getInt("section", 0) != 1) {
                z = false;
            }
            activeModelArr[0] = new TabbedMusicModel(z);
            return new FragmentDelegateActiveModel(lambdaFactory$, activeModelArr);
        }
        return new FragmentDelegateActiveModel(MusicFragment$$Lambda$3.lambdaFactory$(this), new MusicModelImpl(ownerId, getArguments().getString(ARG_OWNER_NAME_FULL), getArguments().getString(ARG_OWNER_IMAGE)));
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ View lambda$createDelegate$0(FragmentDelegateActiveModel fd) {
        return new ToolbarMusicContainer(getActivity(), (MusicModel) fd.model(0));
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ View lambda$createDelegate$1(FragmentDelegateActiveModel fd) {
        return new TabbedMusicContainer(getActivity(), (TabbedMusicModel) fd.model(0));
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ View lambda$createDelegate$2(FragmentDelegateActiveModel fd) {
        return new ToolbarMusicContainer(getActivity(), (MusicModel) fd.model(0));
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
}
