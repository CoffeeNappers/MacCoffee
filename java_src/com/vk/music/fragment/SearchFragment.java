package com.vk.music.fragment;

import android.os.Bundle;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import com.vk.music.model.SearchModel;
import com.vk.music.utils.SmallPlayerHelper;
import com.vk.music.view.SearchContainer;
import com.vkontakte.android.navigation.Navigator;
/* loaded from: classes2.dex */
public final class SearchFragment extends DelegatingFragment {
    private static final String ARG_OPEN_ARTIST_PAGE = "SearchFragment.arg.openArtistsPage";
    private static final String ARG_OPEN_RESULTS = "SearchFragment.arg.openResults";
    private static final String ARG_QUERY = "SearchFragment.arg.query";
    private SmallPlayerHelper smallPlayerHelper = new SmallPlayerHelper();

    /* loaded from: classes2.dex */
    public static final class Builder extends Navigator {
        public Builder() {
            super(SearchFragment.class);
        }

        public Builder query(@Nullable String val) {
            this.args.putString(SearchFragment.ARG_QUERY, val);
            return this;
        }

        public Builder openResults(boolean val) {
            this.args.putBoolean(SearchFragment.ARG_OPEN_RESULTS, val);
            return this;
        }

        public Builder openArtistPage(boolean val) {
            this.args.putBoolean(SearchFragment.ARG_OPEN_ARTIST_PAGE, val);
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
        return new FragmentDelegateActiveModel(SearchFragment$$Lambda$1.lambdaFactory$(this), new SearchModel(getArguments().getString(ARG_QUERY), getArguments().getBoolean(ARG_OPEN_RESULTS), getArguments().getBoolean(ARG_OPEN_ARTIST_PAGE)));
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ View lambda$createDelegate$0(FragmentDelegateActiveModel fd) {
        return new SearchContainer(getActivity(), (SearchModel) fd.model(0));
    }
}
