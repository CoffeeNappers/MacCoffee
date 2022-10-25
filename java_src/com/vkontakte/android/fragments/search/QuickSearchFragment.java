package com.vkontakte.android.fragments.search;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import android.animation.ObjectAnimator;
import android.app.Activity;
import android.os.Bundle;
import android.support.v7.widget.RecyclerView;
import android.text.TextUtils;
import android.view.View;
import android.view.ViewGroup;
import android.view.animation.DecelerateInterpolator;
import android.view.inputmethod.InputMethodManager;
import com.fasterxml.jackson.core.util.MinimalPrettyPrinter;
import com.vkontakte.android.R;
import com.vkontakte.android.UserProfile;
import com.vkontakte.android.VKApplication;
import com.vkontakte.android.ViewUtils;
import com.vkontakte.android.api.Group;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.api.execute.SearchGetHints;
import com.vkontakte.android.background.AsyncTask;
import com.vkontakte.android.data.Friends;
import com.vkontakte.android.data.Groups;
import com.vkontakte.android.fragments.base.SegmenterFragment;
import com.vkontakte.android.fragments.friends.SearchIndexer;
import com.vkontakte.android.functions.VoidF1;
import com.vkontakte.android.ui.cardview.CardDrawable;
import com.vkontakte.android.ui.holder.UserHolder;
import com.vkontakte.android.ui.recyclerview.BottomDividerDecoration;
import com.vkontakte.android.ui.recyclerview.CardItemDecoration;
import com.vkontakte.android.ui.util.ListSegmenter;
import com.vkontakte.android.ui.util.SearchSegmenter;
import com.vkontakte.android.ui.util.Segmenter;
import java.util.ArrayList;
import java.util.List;
import me.grishka.appkit.fragments.AppKitFragment;
import me.grishka.appkit.utils.V;
/* loaded from: classes3.dex */
public class QuickSearchFragment extends SegmenterFragment<UserProfile> {
    static final DecelerateInterpolator CONTENT_INTERPOLATOR = new DecelerateInterpolator();
    private VoidF1<UserProfile> mClickHandler;
    private ListSegmenter mData;
    boolean mFoundDomain;
    private String mQuery;
    private SearchSegmenter<UserProfile> mSearchIndexer;
    private boolean mSearchMode;

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ VKAPIRequest lambda$new$0(String q, int offset, int count) {
        return new SearchGetHints(q, offset, count, !this.mFoundDomain);
    }

    public QuickSearchFragment() {
        super(Integer.MAX_VALUE);
        this.mSearchIndexer = new SearchSegmenter(new SearchIndexer.Provider<UserProfile>() { // from class: com.vkontakte.android.fragments.search.QuickSearchFragment.1
            @Override // com.vkontakte.android.fragments.friends.SearchIndexer.Provider
            public char[] getIndexChar(UserProfile from) {
                char[] result;
                char c = ' ';
                if (from.uid > 0) {
                    result = new char[3];
                    result[0] = TextUtils.isEmpty(from.firstName) ? ' ' : Character.toLowerCase(from.firstName.charAt(0));
                    result[1] = TextUtils.isEmpty(from.lastName) ? ' ' : Character.toLowerCase(from.lastName.charAt(0));
                    if (!TextUtils.isEmpty(from.domain)) {
                        c = Character.toLowerCase(from.domain.charAt(0));
                    }
                    result[2] = c;
                } else {
                    String[] words = from.fullName.split(MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR);
                    result = new char[words.length + 1];
                    if (!TextUtils.isEmpty(from.domain)) {
                        c = Character.toLowerCase(from.domain.charAt(0));
                    }
                    result[0] = c;
                    for (int i = 0; i < words.length; i++) {
                        if (words[i].length() != 0) {
                            result[i + 1] = Character.toLowerCase(words[i].charAt(0));
                        }
                    }
                }
                return result;
            }

            @Override // com.vkontakte.android.fragments.friends.SearchIndexer.Provider
            public boolean matches(String q, UserProfile item) {
                return item.uid > 0 ? (item.domain != null && item.domain.equals(q)) || item.fullName.toLowerCase().startsWith(q) || item.firstName.toLowerCase().startsWith(q) || item.lastName.toLowerCase().startsWith(q) : (item.domain != null && item.domain.equals(q)) || item.fullName.toLowerCase().indexOf(q) > -1;
            }

            @Override // com.vkontakte.android.fragments.friends.SearchIndexer.Provider
            public int priority(String query, UserProfile item) {
                if (item.domain == null || !item.domain.equals(query)) {
                    return item.uid <= 0 ? 0 : 1;
                }
                QuickSearchFragment.this.mFoundDomain = true;
                return Integer.MAX_VALUE;
            }

            @Override // com.vkontakte.android.fragments.friends.SearchIndexer.Provider
            public boolean hasPriority() {
                return true;
            }
        }, QuickSearchFragment$$Lambda$1.lambdaFactory$(this), 50).setGlobalTitle(VKApplication.context.getString(R.string.search_results));
        this.mData = new ListSegmenter();
        this.mClickHandler = QuickSearchFragment$$Lambda$2.lambdaFactory$(this);
        Bundle args = new Bundle();
        args.putBoolean(AppKitFragment.EXTRA_IS_TAB, true);
        setArguments(args);
    }

    @Override // android.app.DialogFragment, android.app.Fragment
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setRefreshEnabled(false);
    }

    @Override // me.grishka.appkit.fragments.BaseRecyclerFragment, me.grishka.appkit.fragments.AppKitFragment, android.app.Fragment
    public void onAttach(Activity activity) {
        super.onAttach(activity);
        setEmptyText(R.string.quick_search_empty);
    }

    @Override // com.vkontakte.android.fragments.base.SegmenterFragment, com.vkontakte.android.fragments.VKRecyclerFragment, me.grishka.appkit.fragments.AppKitFragment, android.app.Fragment
    public void onViewCreated(View view, Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);
        this.list.addOnScrollListener(new RecyclerView.OnScrollListener() { // from class: com.vkontakte.android.fragments.search.QuickSearchFragment.2
            @Override // android.support.v7.widget.RecyclerView.OnScrollListener
            public void onScrollStateChanged(RecyclerView recyclerView, int newState) {
                InputMethodManager imm = (InputMethodManager) QuickSearchFragment.this.getActivity().getSystemService("input_method");
                imm.hideSoftInputFromWindow(recyclerView.getWindowToken(), 0);
            }
        });
        this.mSearchIndexer.attach(this.list);
        updateList();
        if (!this.loaded) {
            if (((QuickSearchActivity) getActivity()).mHasAnimation) {
                view.postDelayed(QuickSearchFragment$$Lambda$3.lambdaFactory$(this), 150L);
            } else {
                loadData();
            }
        }
        view.setBackgroundDrawable(new CardDrawable(getResources()));
        this.list.addItemDecoration(new BottomDividerDecoration(mo1066getAdapter(), Math.max(1, V.dp(0.5f)), 637534208, V.dp(8.0f)));
    }

    @Override // com.vkontakte.android.fragments.base.SegmenterFragment
    protected Segmenter getSegmenter() {
        return this.mSearchMode ? this.mSearchIndexer : this.mData;
    }

    @Override // com.vkontakte.android.fragments.base.SegmenterFragment
    protected SegmenterFragment<UserProfile>.GridAdapter<UserProfile, ?> createAdapter() {
        return new UsersAdapter();
    }

    @Override // com.vkontakte.android.fragments.base.SegmenterFragment
    protected int getColumnsCount() {
        return 1;
    }

    @Override // me.grishka.appkit.fragments.BaseRecyclerFragment
    protected void doLoadData(int offset, int count) {
        new AsyncTask<Void, Void, List<UserProfile>>() { // from class: com.vkontakte.android.fragments.search.QuickSearchFragment.3
            /* JADX INFO: Access modifiers changed from: protected */
            @Override // com.vkontakte.android.background.AsyncTask
            public List<UserProfile> doInBackground(Void... args) throws Throwable {
                ArrayList<UserProfile> mFriends = new ArrayList<>();
                Friends.getFriends(mFriends);
                for (int i = 0; i < mFriends.size(); i++) {
                    UserProfile item = mFriends.get(i);
                    item.isFriend = true;
                    if (i < 30) {
                        QuickSearchFragment.this.data.add(item);
                    }
                }
                QuickSearchFragment.this.mData.bind(QuickSearchFragment.this.data);
                ArrayList<Group> groups = new ArrayList<>();
                Groups.getGroups(groups);
                for (int i2 = 0; i2 < groups.size(); i2++) {
                    mFriends.add(new UserProfile(groups.get(i2)));
                }
                QuickSearchFragment.this.mSearchIndexer.bind(mFriends);
                QuickSearchFragment.this.preloader.setMoreAvailable(false);
                return null;
            }

            /* JADX INFO: Access modifiers changed from: protected */
            @Override // com.vkontakte.android.background.AsyncTask
            public void onPostExecute(List<UserProfile> userProfiles) {
                QuickSearchFragment.this.updateList();
                QuickSearchFragment.this.dataLoaded();
                QuickSearchFragment.this.refreshDone();
            }
        }.execPool(new Void[0]);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // me.grishka.appkit.fragments.LoaderFragment
    public void showContent() {
        if (this.content != null) {
            AnimatorListenerAdapter listener = new AnimatorListenerAdapter() { // from class: com.vkontakte.android.fragments.search.QuickSearchFragment.4
                @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
                public void onAnimationStart(Animator anim) {
                    QuickSearchFragment.this.content.setVisibility(0);
                    QuickSearchFragment.this.errorView.setVisibility(8);
                    QuickSearchFragment.this.progress.setVisibility(8);
                }

                @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
                public void onAnimationEnd(Animator animation) {
                    QuickSearchActivity activity = (QuickSearchActivity) QuickSearchFragment.this.getActivity();
                    if (activity != null) {
                        activity.showKeyboard();
                    }
                }
            };
            ObjectAnimator alpha = ObjectAnimator.ofFloat(this.content, "alpha", 0.0f, 1.0f);
            ObjectAnimator translate = ObjectAnimator.ofFloat(this.content, "translationY", V.dp(-35.0f), 0.0f);
            alpha.addListener(listener);
            alpha.setInterpolator(CONTENT_INTERPOLATOR);
            alpha.setDuration(300L);
            translate.setDuration(100L);
            translate.setInterpolator(CONTENT_INTERPOLATOR);
            alpha.start();
            translate.start();
        }
    }

    @Override // com.vkontakte.android.fragments.base.SegmenterFragment
    protected CardItemDecoration onCreateCardDecorator() {
        return null;
    }

    public void updateFilter(String query) {
        if (!TextUtils.isEmpty(query)) {
            if (!this.mSearchMode) {
                this.mSearchMode = true;
                updateList();
            }
            this.mQuery = query;
            this.mFoundDomain = false;
            this.mSearchIndexer.search(query);
        } else if (this.mSearchMode) {
            this.mSearchMode = false;
            updateList();
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void openResult(UserProfile profile) {
        ((QuickSearchActivity) getActivity()).openResult(profile.uid, profile.university);
    }

    /* loaded from: classes3.dex */
    private class UsersAdapter extends SegmenterFragment<UserProfile>.GridAdapter<UserProfile, SearchHolder> implements BottomDividerDecoration.Provider {
        private UsersAdapter() {
            super();
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // com.vkontakte.android.fragments.base.SegmenterFragment.GridAdapter
        /* renamed from: createViewHolder */
        public SearchHolder mo1074createViewHolder(ViewGroup parent) {
            return new SearchHolder(parent);
        }

        @Override // com.vkontakte.android.fragments.base.SegmenterFragment.GridAdapter
        public RecyclerView.ViewHolder createHeaderHolder(ViewGroup parent) {
            RecyclerView.ViewHolder holder = super.createHeaderHolder(parent);
            if (QuickSearchFragment.this.scrW >= 600) {
                View view = holder.itemView;
                view.setPadding(view.getPaddingLeft() + V.dp(16.0f), view.getPaddingTop(), view.getPaddingRight() + V.dp(16.0f), view.getPaddingBottom());
            }
            return holder;
        }

        @Override // com.vkontakte.android.fragments.base.SegmenterFragment.GridAdapter
        public int getImagesCountForItem(int position) {
            return 1;
        }

        @Override // com.vkontakte.android.fragments.base.SegmenterFragment.GridAdapter
        public String getImageUrl(int position, int image) {
            return getItem(position).photo;
        }

        @Override // com.vkontakte.android.fragments.base.SegmenterFragment.GridAdapter, com.vkontakte.android.ui.recyclerview.BottomDividerDecoration.Provider
        public boolean drawAfter(int position) {
            return position < getItemCount() + (-1) && getItemViewType(position + 1) == 0;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes3.dex */
    public class SearchHolder extends UserHolder<UserProfile> implements View.OnClickListener {
        private boolean mIsUser;

        public SearchHolder(ViewGroup parent) {
            super(parent, R.layout.quick_search_item, true, false, false);
        }

        @Override // com.vkontakte.android.ui.holder.UserHolder, com.vkontakte.android.ui.holder.RecyclerHolder
        public void onBind(UserProfile item) {
            super.onBind((SearchHolder) item);
            if (item.domain != null && item.domain.equalsIgnoreCase(QuickSearchFragment.this.mQuery)) {
                this.mSubtitle.setText("vk.com/" + item.domain);
            } else {
                this.mSubtitle.setText(item.university);
            }
            this.mSubtitle.setVisibility(((TextUtils.isEmpty(item.university) || item.isFriend) && (item.domain == null || !item.domain.equalsIgnoreCase(QuickSearchFragment.this.mQuery))) ? 8 : 0);
            switch (item.uid) {
                case 0:
                    this.mIsUser = false;
                    this.mImage.setImageResource(ViewUtils.getResFromTheme(getContext(), R.attr.ic_attach_link));
                    return;
                case Integer.MAX_VALUE:
                    this.mIsUser = false;
                    this.mImage.setImageResource(R.drawable.ic_search_advanced);
                    return;
                default:
                    this.mIsUser = true;
                    return;
            }
        }

        @Override // com.vkontakte.android.ui.holder.UserHolder, android.view.View.OnClickListener
        public void onClick(View v) {
            if (QuickSearchFragment.this.mClickHandler != null) {
                QuickSearchFragment.this.mClickHandler.f(getItem());
            }
        }
    }
}
