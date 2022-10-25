package com.vkontakte.android.fragments.userlist;

import android.content.Context;
import android.os.Bundle;
import android.support.v7.widget.RecyclerView;
import android.text.TextUtils;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;
import com.tonicartos.superslim.GridSLM;
import com.vkontakte.android.R;
import com.vkontakte.android.UserProfile;
import com.vkontakte.android.api.SimpleListCallback;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.api.groups.GroupsGetMembers;
import com.vkontakte.android.api.users.UsersSearch;
import com.vkontakte.android.data.VKList;
import com.vkontakte.android.fragments.ProfileFragment;
import com.vkontakte.android.fragments.base.SegmenterFragment;
import com.vkontakte.android.fragments.friends.SearchIndexer;
import com.vkontakte.android.fragments.money.MoneyTransfersFragment;
import com.vkontakte.android.functions.VoidF1;
import com.vkontakte.android.ui.holder.RecyclerHolder;
import com.vkontakte.android.ui.holder.UserHolder;
import com.vkontakte.android.ui.recyclerview.CardItemDecoration;
import com.vkontakte.android.ui.recyclerview.FastScroller;
import com.vkontakte.android.ui.util.SearchSegmenter;
import com.vkontakte.android.ui.util.SectionSegmenter;
import com.vkontakte.android.ui.util.Segmenter;
import me.grishka.appkit.utils.V;
import me.grishka.appkit.views.UsableRecyclerView;
/* loaded from: classes3.dex */
public class GroupMembersListFragment extends SegmenterFragment<UserProfile> {
    private static final int USERS_PER_PAGE = 50;
    private FastScroller fastScroller;
    private final VoidF1<UserProfile> mClickListener;
    private final SectionSegmenter mIndexer;
    private SearchSegmenter<UserProfile> mSearchIndexer;
    private boolean mSearchMode;

    public GroupMembersListFragment() {
        super(50);
        this.mIndexer = new SectionSegmenter();
        this.mClickListener = GroupMembersListFragment$$Lambda$1.lambdaFactory$(this);
        setListLayoutId(R.layout.friends_list);
    }

    @Override // android.app.DialogFragment, android.app.Fragment
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setRefreshEnabled(true);
        int groupId = getArguments().getInt("gid", 0);
        String fromList = getArguments().getString("from_list");
        this.mSearchIndexer = new SearchSegmenter<>(new SearchIndexer.SimpleProvider<UserProfile>() { // from class: com.vkontakte.android.fragments.userlist.GroupMembersListFragment.1
            {
                GroupMembersListFragment.this = this;
            }

            @Override // com.vkontakte.android.fragments.friends.SearchIndexer.Provider
            public char[] getIndexChar(UserProfile from) {
                char c = ' ';
                char[] cArr = new char[2];
                cArr[0] = TextUtils.isEmpty(from.firstName) ? ' ' : Character.toLowerCase(from.firstName.charAt(0));
                if (!TextUtils.isEmpty(from.lastName)) {
                    c = Character.toLowerCase(from.lastName.charAt(0));
                }
                cArr[1] = c;
                return cArr;
            }

            @Override // com.vkontakte.android.fragments.friends.SearchIndexer.Provider
            public boolean matches(String q, UserProfile item) {
                return item.fullName.toLowerCase().startsWith(q) || item.firstName.toLowerCase().startsWith(q) || item.lastName.toLowerCase().startsWith(q);
            }
        }, GroupMembersListFragment$$Lambda$2.lambdaFactory$(fromList, groupId), 50);
        this.mSearchIndexer.setGlobalTitle(getContext().getString(R.string.search_results));
    }

    public static /* synthetic */ VKAPIRequest lambda$onCreate$0(String fromList, int groupId, String q, int offset, int count) {
        return new UsersSearch.SimpleGroupSearch(q, fromList, groupId, offset, count);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.vkontakte.android.fragments.base.SegmenterFragment
    public CardItemDecoration onCreateCardDecorator() {
        CardItemDecoration decorator = new CardItemDecoration(null, !this.isTablet);
        int paddingTop = V.dp(8.0f);
        this.list.setPadding(this.margin + this.padding, paddingTop, this.margin + this.padding, this.padding);
        decorator.setPadding(this.padding, paddingTop, this.padding, this.padding);
        return decorator;
    }

    @Override // com.vkontakte.android.fragments.VKRecyclerFragment, me.grishka.appkit.fragments.BaseRecyclerFragment, me.grishka.appkit.fragments.LoaderFragment
    public View onCreateContentView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        int i = 0;
        View view = super.onCreateContentView(inflater, container, savedInstanceState);
        if (this.scrW >= 600) {
            this.padding = V.dp(12.0f);
        } else if (this.scrW >= 480) {
            this.padding = V.dp(8.0f);
        } else {
            this.padding = 0;
        }
        if (this.scrW >= 924) {
            i = V.dp(Math.max(16, ((this.scrW - 840) - 84) / 2));
        }
        this.margin = i;
        return view;
    }

    @Override // com.vkontakte.android.fragments.base.SegmenterFragment
    protected Segmenter getSegmenter() {
        return this.mSearchMode ? this.mSearchIndexer : this.mIndexer;
    }

    @Override // com.vkontakte.android.fragments.base.SegmenterFragment, com.vkontakte.android.fragments.VKRecyclerFragment, me.grishka.appkit.fragments.AppKitFragment, android.app.Fragment
    public void onViewCreated(View view, Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);
        this.fastScroller = (FastScroller) view.findViewById(R.id.fast_scroller);
        this.fastScroller.setup(this.list, (TextView) view.findViewById(R.id.section_title_popup));
        this.mSearchIndexer.attach(this.list);
        updateList();
        if (this.loaded) {
            dataLoaded();
        }
        setFastScrollerVisibility(false);
    }

    private void setFastScrollerVisibility(boolean visible) {
        boolean z = false;
        if (this.fastScroller != null) {
            this.fastScroller.setVisibility(visible ? 0 : 8);
        }
        if (this.list != null) {
            UsableRecyclerView usableRecyclerView = this.list;
            if (!visible) {
                z = true;
            }
            usableRecyclerView.setVerticalScrollBarEnabled(z);
        }
    }

    @Override // me.grishka.appkit.fragments.BaseRecyclerFragment
    protected void doLoadData(int offset, int count) {
        if (this.mSearchMode) {
            this.dataLoading = false;
            return;
        }
        int gid = getArguments().getInt("gid", 0);
        String filter = getArguments().getString(MoneyTransfersFragment.FILTER_ARGUMENT);
        this.currentRequest = new GroupsGetMembers(gid, offset, count, filter).setCallback(new SimpleListCallback<UserProfile>(this) { // from class: com.vkontakte.android.fragments.userlist.GroupMembersListFragment.2
            {
                GroupMembersListFragment.this = this;
            }

            @Override // com.vkontakte.android.api.SimpleListCallback, com.vkontakte.android.api.Callback
            public void success(VKList<UserProfile> result) {
                super.success((VKList) result);
                GroupMembersListFragment.this.mIndexer.addItems(GroupMembersListFragment.this.data);
                GroupMembersListFragment.this.mSearchIndexer.bind(GroupMembersListFragment.this.data);
                GroupMembersListFragment.this.mo1066getAdapter().notifyDataSetChanged();
            }
        }).exec((Context) getActivity());
    }

    @Override // com.vkontakte.android.fragments.base.SegmenterFragment
    protected SegmenterFragment<UserProfile>.GridAdapter<UserProfile, ?> createAdapter() {
        return new Adapter();
    }

    @Override // com.vkontakte.android.fragments.base.SegmenterFragment
    protected int getColumnsCount() {
        int listWidth = (this.list.getWidth() - this.list.getPaddingLeft()) - this.list.getPaddingRight();
        int columnWidth = this.scrW >= 600 ? V.dp(160.0f) : listWidth;
        return listWidth / columnWidth;
    }

    public void updateFilter(String query) {
        if (!TextUtils.isEmpty(query)) {
            if (!this.mSearchMode) {
                this.mSearchMode = true;
                setRefreshEnabled(false);
                updateDecorator();
                updateList();
                setFastScrollerVisibility(false);
            }
            this.mSearchIndexer.search(query, true);
        } else if (this.mSearchMode) {
            this.mSearchMode = false;
            setRefreshEnabled(true);
            updateDecorator();
            updateList();
            setFastScrollerVisibility(false);
        }
    }

    public void openUserDetails(UserProfile profile) {
        new ProfileFragment.Builder(profile.uid).go(getActivity());
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes3.dex */
    public class Adapter extends SegmenterFragment<UserProfile>.GridAdapter<UserProfile, RecyclerHolder<UserProfile>> {
        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        private Adapter() {
            super();
            GroupMembersListFragment.this = r1;
        }

        @Override // com.vkontakte.android.fragments.base.SegmenterFragment.GridAdapter
        /* renamed from: createViewHolder */
        public RecyclerHolder<UserProfile> mo1074createViewHolder(ViewGroup parent) {
            return UserHolder.simple(parent).onClick(GroupMembersListFragment.this.mClickListener);
        }

        @Override // com.vkontakte.android.fragments.base.SegmenterFragment.GridAdapter
        public int getImagesCountForItem(int position) {
            return 0;
        }

        @Override // com.vkontakte.android.fragments.base.SegmenterFragment.GridAdapter
        public String getImageUrl(int position, int image) {
            return getItem(position).photo;
        }

        @Override // com.vkontakte.android.fragments.base.SegmenterFragment.GridAdapter
        public void bindViewHolder(RecyclerHolder<UserProfile> holder, GridSLM.LayoutParams params, int position) {
            super.bindViewHolder(holder, params, position);
            adjustMultiColumn(params);
        }

        @Override // com.vkontakte.android.fragments.base.SegmenterFragment.GridAdapter
        public RecyclerView.ViewHolder createHeaderHolder(ViewGroup parent) {
            return new RecyclerHolder(new View(parent.getContext())) { // from class: com.vkontakte.android.fragments.userlist.GroupMembersListFragment.Adapter.1
                {
                    Adapter.this = this;
                }

                @Override // com.vkontakte.android.ui.holder.RecyclerHolder
                public void onBind(Object item) {
                }
            };
        }

        @Override // com.vkontakte.android.fragments.base.SegmenterFragment.GridAdapter
        public void bindHeaderHolder(RecyclerView.ViewHolder holder, GridSLM.LayoutParams params, int position) {
        }
    }
}
