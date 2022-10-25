package com.vkontakte.android.fragments.attachmentspicker;

import android.app.Activity;
import android.app.Fragment;
import android.app.FragmentManager;
import android.app.FragmentTransaction;
import android.content.Context;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.View;
import android.view.ViewGroup;
import com.vk.attachpicker.SupportExternalToolbarContainer;
import com.vkontakte.android.R;
import com.vkontakte.android.ViewUtils;
import com.vkontakte.android.api.SimpleCallback;
import com.vkontakte.android.api.video.VideoGetTabs;
import com.vkontakte.android.auth.VKAccountManager;
import com.vkontakte.android.fragments.BackListener;
import com.vkontakte.android.fragments.videos.AddedVideosFragment;
import com.vkontakte.android.fragments.videos.SearchVideoListFragment;
import com.vkontakte.android.fragments.videos.TaggedVideosFragment;
import com.vkontakte.android.fragments.videos.UploadedVideosFragment;
import com.vkontakte.android.fragments.videos.VideoAlbumsFragment;
import com.vkontakte.android.ui.SearchViewWrapper;
import java.util.ArrayList;
import java.util.List;
import me.grishka.appkit.fragments.AppKitFragment;
import me.grishka.appkit.fragments.LoaderFragment;
/* loaded from: classes2.dex */
public class PickVKVideoFragment extends LoaderFragment implements SupportExternalToolbarContainer, BackListener {
    private static final String INNER_FRAGMENT_TAG = "INNER_VIDEO_FRAGMENT";
    private AddedVideosFragment mAddedVideosFragment;
    private int mCurrentPos;
    SearchViewWrapper mSearchView;
    List<Fragment> mTabs;
    private TaggedVideosFragment mTaggedVideosFragment;
    List<String> mTitles;
    private UploadedVideosFragment mUploadedVideosFragment;
    private VideoAlbumsFragment mVideoAlbumsFragment;
    private boolean needRecreateInnerFragment;

    public PickVKVideoFragment() {
        super(R.layout.loader_fragment_with_search);
        this.mCurrentPos = -1;
        this.needRecreateInnerFragment = false;
    }

    @Override // me.grishka.appkit.fragments.AppKitFragment
    protected boolean canGoBack() {
        return false;
    }

    @Override // me.grishka.appkit.fragments.AppKitFragment
    public boolean hasNavigationDrawer() {
        return false;
    }

    @Override // me.grishka.appkit.fragments.ContainerFragment, android.app.DialogFragment, android.app.Fragment
    public void onActivityCreated(Bundle state) {
        super.onActivityCreated(state);
        if (!this.loaded) {
            loadData();
        }
    }

    @Override // me.grishka.appkit.fragments.AppKitFragment, android.app.Fragment
    public void onAttach(Activity activity) {
        super.onAttach(activity);
        this.spinnerViewResourceId = R.layout.spinner_view_light;
    }

    @Override // android.app.Fragment
    public void onCreateOptionsMenu(Menu menu, MenuInflater inflater) {
        if (this.mSearchView != null) {
            this.mSearchView.onCreateOptionsMenu(menu);
        }
        super.onCreateOptionsMenu(menu, inflater);
    }

    @Override // me.grishka.appkit.fragments.LoaderFragment, android.app.Fragment
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        View view = super.onCreateView(inflater, container, savedInstanceState);
        view.setBackgroundColor(-1);
        return view;
    }

    @Override // me.grishka.appkit.fragments.AppKitFragment, android.app.Fragment
    public void onViewCreated(View view, Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);
        getToolbar().setVisibility(8);
        boolean haveSpinnerItems = updateSpinnerItems();
        View contentWrap = view.findViewById(R.id.content_wrap);
        View searchWrap = view.findViewById(R.id.search_wrap);
        if (!haveSpinnerItems) {
            setTitle(getString(R.string.videos));
        }
        SearchVideoListFragment tempF = (SearchVideoListFragment) getInnerFragmentManager().findFragmentByTag("searchFragment");
        final SearchVideoListFragment searchFragment = tempF == null ? SearchVideoListFragment.newInstance(true) : tempF;
        boolean shouldAdd = tempF == null;
        this.mSearchView = new SearchViewWrapper(getActivity(), new SearchViewWrapper.SearchListener() { // from class: com.vkontakte.android.fragments.attachmentspicker.PickVKVideoFragment.1
            {
                PickVKVideoFragment.this = this;
            }

            @Override // com.vkontakte.android.ui.SearchViewWrapper.SearchListener
            public void onQueryConfirmed(String query) {
                if (query != null && query.length() > 0) {
                    searchFragment.setQuery(query);
                } else {
                    searchFragment.reset();
                }
            }

            @Override // com.vkontakte.android.ui.SearchViewWrapper.SearchListener
            public void onQuerySubmitted(String query) {
            }

            @Override // com.vkontakte.android.ui.SearchViewWrapper.SearchListener
            public void onQueryChanged(String query) {
            }
        }, SearchViewWrapper.CONFIRM_TIMEOUT);
        this.mSearchView.setStateListener(PickVKVideoFragment$$Lambda$1.lambdaFactory$(searchWrap, contentWrap, searchFragment));
        searchFragment.setSearchView(this.mSearchView);
        if (shouldAdd) {
            getInnerFragmentManager().beginTransaction().add(R.id.search_wrap, searchFragment, "searchFragment").commit();
        }
        setHasOptionsMenu(true);
    }

    public static /* synthetic */ void lambda$onViewCreated$0(View searchWrap, View contentWrap, SearchVideoListFragment searchFragment, boolean expanded) {
        int i = 8;
        ViewUtils.setVisibilityAnimated(searchWrap, expanded ? 0 : 8);
        if (!expanded) {
            i = 0;
        }
        ViewUtils.setVisibilityAnimated(contentWrap, i);
        if (!expanded) {
            searchFragment.reset();
        }
    }

    @Override // com.vkontakte.android.fragments.BackListener
    public boolean onBackPressed() {
        boolean result = false;
        SearchVideoListFragment fragment = (SearchVideoListFragment) getInnerFragmentManager().findFragmentById(R.id.search_wrap);
        if (fragment != null) {
            result = fragment.onBackPressed();
        }
        if (this.mSearchView.isExpanded()) {
            this.mSearchView.setExpanded(false);
            return true;
        }
        return result;
    }

    @Override // me.grishka.appkit.fragments.LoaderFragment
    public View onCreateContentView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        return inflater.inflate(R.layout.fragment_holder, (ViewGroup) null);
    }

    @Override // me.grishka.appkit.fragments.AppKitFragment
    protected boolean onSpinnerItemSelected(int position) {
        if (position != this.mCurrentPos || this.needRecreateInnerFragment) {
            Fragment selectedFragment = this.mTabs.get(position);
            FragmentManager fm = getInnerFragmentManager();
            FragmentTransaction fragmentTransaction = fm.beginTransaction();
            fragmentTransaction.replace(R.id.fragment_holder, selectedFragment, INNER_FRAGMENT_TAG);
            fragmentTransaction.commit();
            this.mCurrentPos = position;
            this.needRecreateInnerFragment = false;
        }
        return true;
    }

    @Override // me.grishka.appkit.fragments.LoaderFragment, me.grishka.appkit.fragments.AppKitFragment, android.app.DialogFragment, android.app.Fragment
    public void onDestroyView() {
        super.onDestroyView();
        Fragment f = getInnerFragmentManager().findFragmentByTag(INNER_FRAGMENT_TAG);
        if (f != null && !getActivity().isFinishing()) {
            getInnerFragmentManager().beginTransaction().remove(f).commitAllowingStateLoss();
        }
        this.needRecreateInnerFragment = true;
    }

    @Override // me.grishka.appkit.fragments.LoaderFragment
    protected void doLoadData() {
        new VideoGetTabs(VKAccountManager.getCurrent().getUid()).setCallback(new SimpleCallback<VideoGetTabs.Result>(this) { // from class: com.vkontakte.android.fragments.attachmentspicker.PickVKVideoFragment.2
            {
                PickVKVideoFragment.this = this;
            }

            @Override // com.vkontakte.android.api.Callback
            public void success(VideoGetTabs.Result result) {
                PickVKVideoFragment.this.mTabs = new ArrayList();
                PickVKVideoFragment.this.mTitles = new ArrayList();
                PickVKVideoFragment.this.mAddedVideosFragment = AddedVideosFragment.newInstance(VKAccountManager.getCurrent().getUid(), true);
                PickVKVideoFragment.this.mAddedVideosFragment.disableRefresh();
                PickVKVideoFragment.this.ensureFragmentProvidesNoToolbar(PickVKVideoFragment.this.mAddedVideosFragment);
                PickVKVideoFragment.this.mTabs.add(PickVKVideoFragment.this.mAddedVideosFragment);
                PickVKVideoFragment.this.mTitles.add(PickVKVideoFragment.this.getString(R.string.video_album_added));
                if (result.uploadedCount > 0) {
                    PickVKVideoFragment.this.mTitles.add(PickVKVideoFragment.this.getString(R.string.video_album_uploaded));
                    PickVKVideoFragment.this.mUploadedVideosFragment = UploadedVideosFragment.newInstance(VKAccountManager.getCurrent().getUid(), true);
                    PickVKVideoFragment.this.mUploadedVideosFragment.disableRefresh();
                    PickVKVideoFragment.this.ensureFragmentProvidesNoToolbar(PickVKVideoFragment.this.mUploadedVideosFragment);
                    PickVKVideoFragment.this.mTabs.add(PickVKVideoFragment.this.mUploadedVideosFragment);
                }
                if (result.userVideosCount > 0) {
                    PickVKVideoFragment.this.mTaggedVideosFragment = TaggedVideosFragment.newInstance(VKAccountManager.getCurrent().getUid(), true);
                    PickVKVideoFragment.this.mTaggedVideosFragment.disableRefresh();
                    PickVKVideoFragment.this.mTabs.add(PickVKVideoFragment.this.mTaggedVideosFragment);
                    PickVKVideoFragment.this.ensureFragmentProvidesNoToolbar(PickVKVideoFragment.this.mTaggedVideosFragment);
                    PickVKVideoFragment.this.mTitles.add(PickVKVideoFragment.this.getString(R.string.videos_of_me));
                }
                if (result.albumsCount > 0) {
                    PickVKVideoFragment.this.mVideoAlbumsFragment = VideoAlbumsFragment.newInstance(VKAccountManager.getCurrent().getUid(), true);
                    PickVKVideoFragment.this.mVideoAlbumsFragment.disableRefresh();
                    PickVKVideoFragment.this.mTabs.add(PickVKVideoFragment.this.mVideoAlbumsFragment);
                    PickVKVideoFragment.this.mTitles.add(PickVKVideoFragment.this.getString(R.string.video_albums));
                    PickVKVideoFragment.this.ensureFragmentProvidesNoToolbar(PickVKVideoFragment.this.mVideoAlbumsFragment);
                }
                PickVKVideoFragment.this.updateSpinnerItems();
                PickVKVideoFragment.this.dataLoaded();
            }
        }).exec((Context) getActivity());
    }

    public boolean updateSpinnerItems() {
        if (this.mTitles != null) {
            setSpinnerItems(this.mTitles);
            if (this.mCurrentPos >= 0) {
                setSelectedNavigationItem(this.mCurrentPos);
            }
            return true;
        }
        return false;
    }

    public void ensureFragmentProvidesNoToolbar(Fragment f) {
        Bundle args = f.getArguments();
        if (args == null) {
            args = new Bundle();
        }
        args.putBoolean(AppKitFragment.EXTRA_IS_TAB, true);
        f.setArguments(args);
    }

    @Override // com.vk.attachpicker.SupportExternalToolbarContainer
    public ViewGroup provideToolbar(Context context) {
        return getToolbar();
    }

    @Override // android.support.v4.widget.SwipeRefreshLayout.OnRefreshListener
    public void onRefresh() {
    }
}
