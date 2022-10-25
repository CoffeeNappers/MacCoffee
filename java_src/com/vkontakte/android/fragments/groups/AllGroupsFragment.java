package com.vkontakte.android.fragments.groups;

import android.os.Bundle;
import android.support.annotation.Nullable;
import android.text.TextUtils;
import android.view.View;
import android.view.ViewGroup;
import com.vkontakte.android.R;
import com.vkontakte.android.VKApplication;
import com.vkontakte.android.api.Group;
import com.vkontakte.android.auth.VKAccountManager;
import com.vkontakte.android.data.Groups;
import com.vkontakte.android.fragments.ProfileFragment;
import com.vkontakte.android.fragments.base.SegmenterFragment;
import com.vkontakte.android.fragments.friends.SearchIndexer;
import com.vkontakte.android.functions.VoidF1;
import com.vkontakte.android.ui.holder.GroupHolder;
import com.vkontakte.android.ui.util.ListSegmenter;
import com.vkontakte.android.ui.util.SearchSegmenter;
import com.vkontakte.android.ui.util.Segmenter;
import java.util.ArrayList;
/* loaded from: classes2.dex */
public class AllGroupsFragment extends SegmenterFragment<Group> {
    public static final String USER_ID = "user_id";
    private ListSegmenter mData;
    private boolean mGlobalSearchEnabled;
    private SearchSegmenter<Group> mSearchIndexer;
    private boolean mSearchMode;
    private VoidF1<Group> mSelectionListener;
    private int mUserId;

    public AllGroupsFragment() {
        SearchSegmenter.Generator generator;
        SearchIndexer.SimpleProvider<Group> simpleProvider = new SearchIndexer.SimpleProvider<Group>() { // from class: com.vkontakte.android.fragments.groups.AllGroupsFragment.1
            @Override // com.vkontakte.android.fragments.friends.SearchIndexer.Provider
            public char[] getIndexChar(Group from) {
                return from != null ? from.getIndexChars() : new char[]{0};
            }

            @Override // com.vkontakte.android.fragments.friends.SearchIndexer.Provider
            public boolean matches(String q, Group item) {
                return item.matches(q);
            }
        };
        generator = AllGroupsFragment$$Lambda$1.instance;
        this.mSearchIndexer = new SearchSegmenter(simpleProvider, generator, 50).setGlobalTitle(VKApplication.context.getString(R.string.search_global));
        this.mData = new ListSegmenter();
        this.mGlobalSearchEnabled = true;
    }

    public static AllGroupsFragment newInstance(int userId) {
        AllGroupsFragment fragment = new AllGroupsFragment();
        Bundle args = new Bundle();
        args.putInt("user_id", userId);
        fragment.setArguments(args);
        return fragment;
    }

    @Override // android.app.DialogFragment, android.app.Fragment
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        this.mUserId = getArguments().getInt("user_id");
        setRefreshEnabled(VKAccountManager.isCurrentUser(this.mUserId));
    }

    public void setGlobalSearch(boolean enabled) {
        this.mGlobalSearchEnabled = enabled;
    }

    @Override // me.grishka.appkit.fragments.BaseRecyclerFragment, android.support.v4.widget.SwipeRefreshLayout.OnRefreshListener
    public void onRefresh() {
        Groups.reload(true);
    }

    @Override // com.vkontakte.android.fragments.base.SegmenterFragment, com.vkontakte.android.fragments.VKRecyclerFragment, me.grishka.appkit.fragments.AppKitFragment, android.app.Fragment
    public void onViewCreated(View view, Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);
        this.mSearchIndexer.attach(this.list);
        updateList();
        if (this.loaded) {
            dataLoaded();
        }
    }

    @Override // com.vkontakte.android.fragments.base.SegmenterFragment
    protected Segmenter getSegmenter() {
        return this.mSearchMode ? this.mSearchIndexer : this.mData;
    }

    @Override // com.vkontakte.android.fragments.base.SegmenterFragment
    protected SegmenterFragment<Group>.GridAdapter<Group, ?> createAdapter() {
        return new Adapter();
    }

    @Override // com.vkontakte.android.fragments.base.SegmenterFragment
    protected int getColumnsCount() {
        return this.isTablet ? 2 : 1;
    }

    @Override // me.grishka.appkit.fragments.BaseRecyclerFragment
    protected void doLoadData(int offset, int count) {
        this.preloader.setMoreAvailable(false);
    }

    public void setData(ArrayList<Group> data) {
        this.mSearchMode = false;
        this.data.clear();
        this.data.addAll(data);
        this.mData.clear();
        this.mData.bind(data);
        this.mSearchIndexer.clear();
        this.mSearchIndexer.bind(this.data);
        mo1066getAdapter().setData(this.mData);
        this.loaded = true;
        if (this.list != null) {
            updateList();
            dataLoaded();
            refreshDone();
        }
    }

    public void updateFilter(String query) {
        if (!TextUtils.isEmpty(query)) {
            if (!this.mSearchMode) {
                this.mSearchMode = true;
                updateList();
                setRefreshEnabled(false);
            }
            this.mSearchIndexer.search(query, this.mGlobalSearchEnabled);
        } else if (this.mSearchMode) {
            this.mSearchMode = false;
            updateList();
            setRefreshEnabled(true);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes2.dex */
    public class Adapter extends SegmenterFragment<Group>.GridAdapter<Group, GroupHolder> {
        private VoidF1<Group> mClickListener;

        private Adapter() {
            super();
            this.mClickListener = AllGroupsFragment$Adapter$$Lambda$1.lambdaFactory$(this);
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public /* synthetic */ void lambda$new$0(Group group) {
            if (AllGroupsFragment.this.mSelectionListener != null) {
                AllGroupsFragment.this.mSelectionListener.f(group);
            } else {
                AllGroupsFragment.this.openGroupDetails(group);
            }
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // com.vkontakte.android.fragments.base.SegmenterFragment.GridAdapter
        /* renamed from: createViewHolder */
        public GroupHolder mo1074createViewHolder(ViewGroup parent) {
            return new GroupHolder(parent).onClick(this.mClickListener);
        }

        @Override // com.vkontakte.android.fragments.base.SegmenterFragment.GridAdapter
        public int getImagesCountForItem(int position) {
            return 1;
        }

        @Override // com.vkontakte.android.fragments.base.SegmenterFragment.GridAdapter
        public String getImageUrl(int position, int image) {
            return getItem(position).photo;
        }
    }

    public void openGroupDetails(Group group) {
        new ProfileFragment.Builder(-group.id).go(getActivity());
    }

    public AllGroupsFragment setSelectionListener(@Nullable VoidF1<Group> l) {
        this.mSelectionListener = l;
        return this;
    }
}
