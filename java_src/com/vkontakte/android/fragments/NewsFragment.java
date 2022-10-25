package com.vkontakte.android.fragments;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import android.animation.ObjectAnimator;
import android.app.Activity;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.support.annotation.Nullable;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.text.TextUtils;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.view.animation.AccelerateInterpolator;
import android.view.animation.OvershootInterpolator;
import android.widget.CompoundButton;
import android.widget.ImageButton;
import android.widget.Spinner;
import com.facebook.appevents.AppEventsConstants;
import com.facebook.share.internal.ShareConstants;
import com.vk.attachpicker.events.NotificationListener;
import com.vk.core.util.AlertDialogs;
import com.vk.core.util.TimeoutLock;
import com.vk.core.util.ToastUtils;
import com.vk.imageloader.view.VKImageView;
import com.vk.stories.CreateAndEditStoryActivity;
import com.vk.stories.StoriesController;
import com.vk.stories.StoryViewDialog;
import com.vk.stories.model.GetStoriesResponse;
import com.vk.stories.model.StoriesContainer;
import com.vk.stories.model.StoryEntry;
import com.vk.stories.util.StoriesUtil;
import com.vk.stories.view.StoryCirclePreview;
import com.vkontakte.android.Log;
import com.vkontakte.android.NetworkStateReceiver;
import com.vkontakte.android.NewsEntry;
import com.vkontakte.android.NewsfeedList;
import com.vkontakte.android.PostPhotoActivity;
import com.vkontakte.android.R;
import com.vkontakte.android.VKApplication;
import com.vkontakte.android.ViewUtils;
import com.vkontakte.android.api.Callback;
import com.vkontakte.android.api.SimpleCallback;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.api.newsfeed.NewsfeedGet;
import com.vkontakte.android.api.newsfeed.NewsfeedIgnoreItem;
import com.vkontakte.android.attachments.MarketAttachment;
import com.vkontakte.android.auth.VKAccountManager;
import com.vkontakte.android.cache.NewsfeedCache;
import com.vkontakte.android.data.Analytics;
import com.vkontakte.android.data.Posts;
import com.vkontakte.android.data.UserNotification;
import com.vkontakte.android.fragments.PostListFragment;
import com.vkontakte.android.fragments.ProfileFragment;
import com.vkontakte.android.fragments.friends.FriendsImportFragment;
import com.vkontakte.android.fragments.market.GoodFragment;
import com.vkontakte.android.fragments.news.NewPostFragment;
import com.vkontakte.android.media.VideoPools;
import com.vkontakte.android.navigation.ArgKeys;
import com.vkontakte.android.navigation.Navigate;
import com.vkontakte.android.ui.CardItemDecorator;
import com.vkontakte.android.ui.OverlayTextView;
import com.vkontakte.android.ui.adapters.CardMergeAdapter;
import com.vkontakte.android.ui.adapters.NewsSpinnerAdapter;
import com.vkontakte.android.ui.drawable.RecoloredDrawable;
import com.vkontakte.android.ui.holder.RecyclerHolder;
import com.vkontakte.android.ui.posts.HeaderPostDisplayItem;
import com.vkontakte.android.ui.posts.PostDisplayItem;
import com.vkontakte.android.utils.L;
import com.vkontakte.android.utils.VKLiveUtils;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import me.grishka.appkit.api.ErrorResponse;
import me.grishka.appkit.utils.V;
import me.grishka.appkit.views.NavigationSpinner;
import me.grishka.appkit.views.UsableRecyclerView;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class NewsFragment extends PostListFragment implements NavigationSpinner.DropDownWidthHelper, CompoundButton.OnCheckedChangeListener {
    private static int listIDStatic = 0;
    private Animator currentButtonAnim;
    private boolean firstNav;
    private String from;
    private HeaderAdapter headerAdapter;
    private int listID;
    private NewsSpinnerAdapter navAdapter;
    private String newFrom;
    private VKAPIRequest newNewsReq;
    private View newPostsBtn;
    private int previousListIDStatic;
    private StoriesHeaderAdapter storiesHeaderAdapter;
    private final StoryMarkAsSeenListener storyUpdateListener = new StoryMarkAsSeenListener();
    private final StoriesListInvalidateListener storiesListInvalidateListener = new StoriesListInvalidateListener();
    private List<NewsEntry> newNews = new ArrayList();
    private boolean needSetSelection = false;
    private View[] loadingHeaders = new View[2];
    private int newPostsHideBoundary = -1;
    private int newPostsHideThreshold = 3;
    private long lastPreloadTime = -1;
    private boolean clearForNew = false;
    private boolean newPostsButtonPendingVisibility = false;
    private boolean forceNewData = false;
    private int lastPosition = -1;
    private int lastPostId = -1;
    private int lastOwnerId = -1;
    private boolean needScrollToTop = false;
    private boolean wasResumed = false;
    private boolean isFirstNav = false;
    private BroadcastReceiver receiver = new AnonymousClass1();
    private boolean reloadByTime = false;

    public void setFrom(String from) {
        if (from != null) {
            this.preloader.setMoreAvailable(true);
        }
        this.from = from;
    }

    public String getFrom() {
        return this.from;
    }

    /* renamed from: com.vkontakte.android.fragments.NewsFragment$1 */
    /* loaded from: classes2.dex */
    public class AnonymousClass1 extends BroadcastReceiver {
        AnonymousClass1() {
            NewsFragment.this = this$0;
        }

        @Override // android.content.BroadcastReceiver
        public void onReceive(Context context, Intent intent) {
            String valueOf = String.valueOf(intent.getAction());
            char c = 65535;
            switch (valueOf.hashCode()) {
                case -573505202:
                    if (valueOf.equals(UserNotification.ACTION_HIDE_USER_NOTIFICATION)) {
                        c = 1;
                        break;
                    }
                    break;
                case 1081331019:
                    if (valueOf.equals(UserNotification.ACTION_ENABLE_TOP_NEWSFEED)) {
                        c = 0;
                        break;
                    }
                    break;
            }
            switch (c) {
                case 0:
                    NewsFragment.this.onCheckedChanged(null, true);
                    return;
                case 1:
                    Runnable r = NewsFragment$1$$Lambda$1.lambdaFactory$(this, intent);
                    if (intent.getBooleanExtra("isAccepted", false)) {
                        ViewUtils.postDelayed(r, 400L);
                        return;
                    } else {
                        r.run();
                        return;
                    }
                default:
                    return;
            }
        }

        public /* synthetic */ void lambda$onReceive$0(Intent intent) {
            NewsFragment.this.remove(NewsEntry.OWNER_ID_NOTIFICATION, intent.getIntExtra("id", 0));
        }
    }

    @Override // me.grishka.appkit.views.NavigationSpinner.DropDownWidthHelper
    public int getDropDownWidth(NavigationSpinner spinner, int defaultWidth, int screenWidth, int left) {
        if ((spinner.getParent() instanceof View) && screenWidth >= V.dp(320.0f)) {
            return (Math.min(screenWidth, V.dp(480.0f)) - Math.abs(left)) - V.dp(16.0f);
        }
        return defaultWidth;
    }

    public static void onLogout() {
        listIDStatic = 0;
    }

    public static void resetListIdIfNeed(boolean forseUpdate) {
        SharedPreferences sharedPreferences = VKApplication.context.getSharedPreferences(null, 0);
        boolean isTop = NewsfeedCache.isNewsfeedTop();
        long lastUnload = sharedPreferences.getLong("feed_last_unload", System.currentTimeMillis());
        boolean updateByTime = System.currentTimeMillis() - lastUnload > NewsfeedGet.getRefreshTimeout(isTop, 0) && NetworkStateReceiver.isConnected();
        if (updateByTime || forseUpdate) {
            listIDStatic = 0;
        }
    }

    public boolean setList(int id) {
        return setList(id, false);
    }

    public boolean setList(int id, boolean force) {
        if (id == this.listID && !force) {
            return false;
        }
        if (id != -9000) {
            this.listID = id;
        }
        this.data.clear();
        cancelLoading();
        showProgress();
        this.refreshing = true;
        loadData();
        this.newNews.clear();
        this.newPostsHideBoundary = -1;
        updateNewPostsBtn();
        this.needScrollToTop = true;
        if (this.emptyView == null) {
            return true;
        }
        updateEmptyLabel();
        return true;
    }

    private void updateEmptyLabel() {
        switch (this.listID) {
            case -3:
                setEmptyText(R.string.no_news_groups);
                setEmptyButtonText(R.string.empty_find_groups);
                setEmptyButtonVisible(true);
                return;
            case -2:
                setEmptyText(R.string.no_news_friends);
                setEmptyButtonText(R.string.find_friends);
                setEmptyButtonVisible(true);
                return;
            case -1:
                setEmptyText(R.string.no_news_recommendations);
                setEmptyButtonVisible(false);
                return;
            case 0:
                setEmptyText(R.string.no_news_all);
                setEmptyButtonText(R.string.find_friends);
                setEmptyButtonVisible(true);
                return;
            default:
                setEmptyText(R.string.no_news_list);
                setEmptyButtonVisible(false);
                return;
        }
    }

    @Override // me.grishka.appkit.fragments.BaseRecyclerFragment
    protected void onEmptyViewBtnClick() {
        switch (this.listID) {
            case -3:
                Navigate.to(SuggestionsRecommendationsFragment.class, new Bundle(), getActivity());
                return;
            case -2:
            case 0:
                Navigate.to(FriendsImportFragment.class, new Bundle(), getActivity());
                return;
            case -1:
            default:
                return;
        }
    }

    public int getList() {
        return this.listID;
    }

    @Override // com.vkontakte.android.fragments.PostListFragment
    protected String getReferer() {
        return "news";
    }

    @Override // com.vkontakte.android.fragments.PostListFragment
    protected String getListReferrer() {
        switch (this.listID) {
            case -5:
                return "feed_videos";
            case -4:
            default:
                return "feed_" + this.listID;
            case -3:
                return "feed_groups";
            case -2:
                return "feed_friends";
            case -1:
                return "feed_recommendations";
            case 0:
                return NewsfeedCache.isNewsfeedTop() ? "feed_top" : "feed_recent";
        }
    }

    @Override // com.vkontakte.android.fragments.PostListFragment
    protected boolean canAddPost(NewsEntry post) {
        if (!NewsfeedCache.isNewsfeedTop() || this.listID != 0) {
            return post.ownerID == post.userID && this.listID == 0;
        }
        this.lastPreloadTime = 0L;
        return false;
    }

    @Override // com.vkontakte.android.fragments.PostListFragment, com.vkontakte.android.fragments.CardRecyclerFragment, me.grishka.appkit.fragments.BaseRecyclerFragment, me.grishka.appkit.fragments.AppKitFragment, android.app.Fragment
    public void onAttach(Activity act) {
        MarketAttachment.setLastSource(GoodFragment.Builder.Source.feed);
        this.firstNav = true;
        SharedPreferences sharedPreferences = act.getSharedPreferences(null, 0);
        boolean reloadByTempRedirect = sharedPreferences.getBoolean("temp_redirect_state", false);
        boolean redirectNav = getArguments() != null && getArguments().containsKey("list_id");
        if (redirectNav) {
            this.previousListIDStatic = listIDStatic;
            listIDStatic = getArguments().getInt("list_id");
        } else {
            this.listID = sharedPreferences.getInt("feed_list", 0);
        }
        sharedPreferences.edit().putBoolean("temp_redirect_state", redirectNav).apply();
        boolean needReloadList = reloadByTempRedirect || (NetworkStateReceiver.isConnected() && listIDStatic != this.listID);
        if (needReloadList) {
            this.listID = listIDStatic;
            NewsfeedCache.clear();
            Posts.clear();
            if (!redirectNav) {
                sharedPreferences.edit().putInt("feed_list", this.listID).apply();
            }
        }
        if (this.emptyView != null) {
            updateEmptyLabel();
        }
        setHasOptionsMenu(true);
        boolean isTop = NewsfeedCache.isNewsfeedTop();
        long lastUnload = sharedPreferences.getLong("feed_last_unload", System.currentTimeMillis());
        boolean updateByTime = System.currentTimeMillis() - lastUnload > NewsfeedGet.getRefreshTimeout(isTop, this.listID) && NetworkStateReceiver.isConnected();
        if (needReloadList || updateByTime) {
            this.forceNewData = true;
            this.needSetSelection = true;
            this.reloadByTime = true;
            Posts.feedItem = NewsfeedCache.saveFirstShowedIndex(0);
            Posts.feedItemOffset = NewsfeedCache.saveFirstShowedOffset(0);
        }
        if (this.navAdapter == null) {
            this.navAdapter = mo1003onCreateNavigationSpinnerAdapter();
        }
        super.onAttach(act);
        getActivity().registerReceiver(this.receiver, new IntentFilter(UserNotification.ACTION_ENABLE_TOP_NEWSFEED), "com.vkontakte.android.permission.ACCESS_DATA", null);
        getActivity().registerReceiver(this.receiver, new IntentFilter(UserNotification.ACTION_HIDE_USER_NOTIFICATION), "com.vkontakte.android.permission.ACCESS_DATA", null);
    }

    @Override // com.vkontakte.android.fragments.PostListFragment, android.app.Fragment
    public void onResume() {
        super.onResume();
        VideoPools.onResume(getActivity());
        long lastUnload = getActivity().getSharedPreferences(null, 0).getLong("feed_last_unload", System.currentTimeMillis());
        boolean isTop = NewsfeedCache.isNewsfeedTop();
        if (!this.reloadByTime && System.currentTimeMillis() - lastUnload > NewsfeedGet.getRefreshTimeout(isTop, this.listID) && NetworkStateReceiver.isConnected()) {
            setList(this.listID, true);
        } else if (this.wasResumed) {
            preloadIfNeed();
        }
        this.wasResumed = true;
        this.reloadByTime = false;
    }

    private void preloadIfNeed() {
        boolean needPreload = System.currentTimeMillis() - this.lastPreloadTime > 60000 && this.listID != -1;
        if (needPreload) {
            Analytics.updateDeviceID(NewsFragment$$Lambda$1.lambdaFactory$(this));
        }
    }

    public /* synthetic */ void lambda$preloadIfNeed$0() {
        if (NewsfeedCache.hasEntries()) {
            if (getArguments() == null || !getArguments().containsKey("owner_id")) {
                initLastValuesIfNeed(null);
                preloadNew();
            }
        }
    }

    @Override // com.vkontakte.android.fragments.PostListFragment, me.grishka.appkit.fragments.ContainerFragment, android.app.DialogFragment, android.app.Fragment
    public void onDetach() {
        super.onDetach();
        try {
            if (getArguments() != null && getArguments().containsKey("list_id")) {
                listIDStatic = this.previousListIDStatic;
            }
            getActivity().unregisterReceiver(this.receiver);
        } catch (Exception e) {
            L.e(e, new Object[0]);
        }
    }

    @Override // com.vkontakte.android.fragments.PostListFragment, android.app.Fragment
    public void onPause() {
        super.onPause();
        if (this.isFirstNav) {
            this.isFirstNav = false;
        }
        VideoPools.onPause(getActivity());
        getActivity().getSharedPreferences(null, 0).edit().putLong("newsfeed_last_opened", System.currentTimeMillis()).apply();
    }

    @Override // android.widget.CompoundButton.OnCheckedChangeListener
    public void onCheckedChanged(CompoundButton buttonView, boolean isChecked) {
        NewsfeedCache.setNewsfeedTop(Boolean.valueOf(isChecked));
        NewsfeedGet.setStartFromInterestingPending(true);
        setList(0, true);
    }

    /* renamed from: fillSpinnerAdapter */
    public void lambda$null$2(@Nullable List<NewsfeedList> lists, boolean isStartFromInteresting) {
        if (lists != null) {
            this.navAdapter.clear();
        }
        Context context = VKApplication.context;
        if (this.navAdapter.getCount() == 0) {
            this.navAdapter.add(new NewsfeedList(0, context.getString(R.string.newsfeed)), R.drawable.ic_menu_news, context.getString(R.string.start_from_interest), isStartFromInteresting, this);
            this.navAdapter.add(new NewsfeedList(-1, context.getString(R.string.recommendations)), R.drawable.ic_share_24dp);
            boolean[] sectionEnables = {true, true, true};
            int[] strRes = {R.string.friends, R.string.photos, R.string.videos};
            int[] drawRes = {R.drawable.ic_menu_friends, R.drawable.ic_menu_photos, R.drawable.ic_menu_videos};
            int[] ids = {-2, -4, -5};
            for (int i = 0; i < sectionEnables.length; i++) {
                if (sectionEnables[i]) {
                    this.navAdapter.add(new NewsfeedList(ids[i], context.getString(strRes[i])), drawRes[i]);
                }
            }
        }
        for (int i2 = 0; lists != null && i2 < lists.size(); i2++) {
            NewsfeedList item = lists.get(i2);
            boolean isPromo = item.isPromoList();
            if (item.getId() > 0 || isPromo) {
                this.navAdapter.add(item, isPromo ? R.drawable.ic_hot_24dp : R.drawable.ic_list_24dp);
            }
        }
        if (this.navigationSpinner != null) {
            for (int i3 = 0; i3 < this.navAdapter.getCount(); i3++) {
                NewsSpinnerAdapter.Item item2 = this.navAdapter.getItem(i3);
                if (item2 != null && item2.listItem.getId() == this.listID) {
                    setSelectedNavigationItem(i3);
                }
            }
        }
    }

    @Override // com.vkontakte.android.fragments.PostListFragment, com.vkontakte.android.fragments.CardRecyclerFragment, com.vkontakte.android.fragments.VKRecyclerFragment, me.grishka.appkit.fragments.AppKitFragment, android.app.Fragment
    public void onViewCreated(View view, Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);
        if (getToolbar() != null) {
            getToolbar().setOnClickListener(NewsFragment$$Lambda$2.lambdaFactory$(this));
        }
        setSpinnerAdapter(this.navAdapter);
        if (this.navigationSpinner instanceof NavigationSpinner) {
            ((NavigationSpinner) this.navigationSpinner).setDropDownWidthHelper(this);
        }
        new Thread(NewsFragment$$Lambda$3.lambdaFactory$(this)).start();
        this.list.addOnScrollListener(new RecyclerView.OnScrollListener() { // from class: com.vkontakte.android.fragments.NewsFragment.2
            private boolean wasScrollingUp = false;

            {
                NewsFragment.this = this;
            }

            @Override // android.support.v7.widget.RecyclerView.OnScrollListener
            public void onScrolled(RecyclerView recyclerView, int dx, int dy) {
                int position = ((LinearLayoutManager) NewsFragment.this.list.getLayoutManager()).findFirstVisibleItemPosition();
                NewsFragment.this.list.getChildAdapterPosition(NewsFragment.this.list.getChildAt(0));
                if (NewsFragment.this.items.size() > position && position >= 0) {
                    NewsFragment.this.lastPosition = position;
                    NewsFragment.this.lastPostId = NewsFragment.this.items.get(NewsFragment.this.lastPosition).postID;
                    NewsFragment.this.lastOwnerId = NewsFragment.this.items.get(NewsFragment.this.lastPosition).postOwnerID;
                }
                if (NewsFragment.this.list.getChildCount() > 0 && NewsFragment.this.newPostsHideBoundary != -1) {
                    boolean scrollingUp = dy < 0;
                    if (scrollingUp != this.wasScrollingUp && scrollingUp) {
                        NewsFragment.this.newPostsHideBoundary = Math.max(0, (position - NewsFragment.this.newPostsHideThreshold) - 1);
                    }
                    this.wasScrollingUp = scrollingUp;
                    if (position != 0 || NewsFragment.this.clearForNew) {
                        if (position > NewsFragment.this.newPostsHideBoundary + NewsFragment.this.newPostsHideThreshold) {
                            NewsFragment.this.setNewPostsBtnVisible(false);
                            return;
                        } else if (position <= NewsFragment.this.newPostsHideBoundary + NewsFragment.this.newPostsHideThreshold) {
                            NewsFragment.this.setNewPostsBtnVisible(true);
                            return;
                        } else {
                            return;
                        }
                    }
                    NewsFragment.this.setNewPostsBtnVisible(false);
                    NewsFragment.this.newPostsHideBoundary = -1;
                }
            }
        });
        ViewGroup loaderContent = (ViewGroup) this.contentView.findViewById(R.id.loading);
        View[] viewArr = this.loadingHeaders;
        View view2 = new HeaderHolder(loaderContent).itemView;
        viewArr[0] = view2;
        loaderContent.addView(view2);
        ViewGroup errorContent = (ViewGroup) this.contentView.findViewById(R.id.error);
        View[] viewArr2 = this.loadingHeaders;
        View view3 = new HeaderHolder(errorContent).itemView;
        viewArr2[1] = view3;
        errorContent.addView(view3);
        syncLoadingHeaderState();
    }

    @Override // com.vkontakte.android.fragments.PostListFragment
    public /* synthetic */ void lambda$onViewCreated$1(View v) {
        if (this.list != null) {
            this.list.scrollToPosition(0);
        }
        if (this.storiesHeaderAdapter != null) {
            this.storiesHeaderAdapter.scrollToBegin();
        }
    }

    public /* synthetic */ void lambda$onViewCreated$3() {
        ArrayList<NewsfeedList> newsfeedLists = NewsfeedCache.getLists();
        boolean isStartFromInteresting = NewsfeedCache.isNewsfeedTop();
        Activity activity = getActivity();
        if (activity != null) {
            activity.runOnUiThread(NewsFragment$$Lambda$10.lambdaFactory$(this, newsfeedLists, isStartFromInteresting));
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // me.grishka.appkit.fragments.LoaderFragment
    public void showProgress() {
        syncLoadingHeaderState();
        super.showProgress();
    }

    @Override // me.grishka.appkit.fragments.BaseRecyclerFragment, me.grishka.appkit.fragments.LoaderFragment
    public void onError(ErrorResponse error) {
        syncLoadingHeaderState();
        super.onError(error);
    }

    private void syncLoadingHeaderState() {
        View[] viewArr;
        for (View loadingHeader : this.loadingHeaders) {
            if (loadingHeader != null) {
                switch (loadingHeader.getVisibility()) {
                    case 0:
                        if (this.listID != 0) {
                            loadingHeader.setVisibility(8);
                            break;
                        } else {
                            continue;
                        }
                    case 4:
                    case 8:
                        if (this.listID == 0) {
                            loadingHeader.setVisibility(0);
                            break;
                        } else {
                            continue;
                        }
                }
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // me.grishka.appkit.fragments.AppKitFragment
    public void setSelectedNavigationItem(int position) {
        super.setSelectedNavigationItem(position);
        this.navAdapter.setSelectedItem(position);
    }

    @Override // me.grishka.appkit.fragments.LoaderFragment, android.app.Fragment
    public View onCreateView(LayoutInflater inflater, ViewGroup parent, Bundle state) {
        View v = super.onCreateView(inflater, parent, state);
        updateEmptyLabel();
        if (this.needSetSelection) {
            this.needSetSelection = false;
            ((LinearLayoutManager) this.list.getLayoutManager()).scrollToPositionWithOffset(Posts.feedItem, Posts.feedItemOffset);
        }
        this.newPostsBtn = inflater.inflate(R.layout.news_button_fresh, parent, false);
        this.newPostsBtn.setVisibility(8);
        ((OverlayTextView) this.newPostsBtn.findViewById(16908313)).setOverlay(R.drawable.highlight_new_posts);
        this.newPostsBtn.setOnClickListener(NewsFragment$$Lambda$4.lambdaFactory$(this));
        this.contentWrap.addView(this.newPostsBtn);
        updateNewPostsBtn();
        return v;
    }

    public /* synthetic */ void lambda$onCreateView$4(View v1) {
        Analytics.track("user_action").addParam(ShareConstants.WEB_DIALOG_PARAM_ACTION_TYPE, "fresh_news").addParam("action_param", "click").commit();
        showNew(true);
    }

    @Override // com.vkontakte.android.fragments.PostListFragment
    protected boolean canHideFromFeed() {
        return this.listID == 0 || this.listID == -2 || this.listID == -3 || this.listID == -1;
    }

    @Override // com.vkontakte.android.fragments.PostListFragment
    protected boolean canHideNotInterestingFromFeed(NewsEntry entry) {
        return NewsfeedIgnoreItem.canIgnore(entry);
    }

    @Override // com.vkontakte.android.fragments.PostListFragment, com.vkontakte.android.fragments.CardRecyclerFragment, me.grishka.appkit.fragments.BaseRecyclerFragment, me.grishka.appkit.fragments.LoaderFragment, me.grishka.appkit.fragments.AppKitFragment, android.app.DialogFragment, android.app.Fragment
    public void onDestroyView() {
        Iterator<PostDisplayItem> it = this.items.iterator();
        while (it.hasNext()) {
            PostDisplayItem item = it.next();
            if (item instanceof HeaderPostDisplayItem) {
                ((HeaderPostDisplayItem) item).menuClickListener = null;
            }
        }
        Posts.feed.clear();
        Posts.feed.addAll(this.data);
        Posts.preloadedFeed.clear();
        Posts.preloadedFeed.addAll(this.preloadedData);
        Posts.feedItem = NewsfeedCache.saveFirstShowedIndex(((LinearLayoutManager) this.list.getLayoutManager()).findFirstVisibleItemPosition());
        Posts.feedItemOffset = NewsfeedCache.saveFirstShowedOffset(this.list.getChildCount() > 0 ? this.list.getChildAt(0).getTop() : 0);
        Posts.feedFrom = getFrom();
        Posts.newNews = this.newNews;
        Posts.newNewsFrom = this.newFrom;
        Posts.feedClearForNew = this.clearForNew;
        this.newPostsBtn = null;
        for (int i = 0; i < this.loadingHeaders.length; i++) {
            this.loadingHeaders[i] = null;
        }
        super.onDestroyView();
    }

    @Override // android.app.Fragment
    public void onCreateOptionsMenu(Menu menu, MenuInflater inflater) {
        inflater.inflate(R.menu.newsfeed, menu);
    }

    @Override // android.app.Fragment
    public boolean onOptionsItemSelected(MenuItem item) {
        if (item.getItemId() == R.id.search) {
            Navigate.to(NewsSearchFragment.class, new Bundle(), getActivity());
            return true;
        }
        return false;
    }

    public void updateNewPostsBtn() {
        if (this.newPostsBtn != null) {
            boolean curState = this.newPostsButtonPendingVisibility;
            boolean newState = this.newNews.size() > 0 || this.newPostsHideBoundary != -1;
            if (curState != newState) {
                L.e(Boolean.valueOf(newState));
                setNewPostsBtnVisible(newState);
            }
        }
    }

    public void setNewPostsBtnVisible(boolean visible) {
        if (this.newPostsButtonPendingVisibility != visible) {
            if (this.currentButtonAnim != null) {
                this.currentButtonAnim.cancel();
                this.currentButtonAnim = null;
            }
            this.newPostsButtonPendingVisibility = visible;
            if (visible) {
                Analytics.track("user_action").addParam(ShareConstants.WEB_DIALOG_PARAM_ACTION_TYPE, "fresh_news").addParam("action_param", "show").commit();
                this.newPostsBtn.setVisibility(0);
                if (this.newPostsBtn.getTranslationY() == 0.0f) {
                    this.newPostsBtn.setTranslationY(-this.newPostsBtn.getBottom());
                }
                this.currentButtonAnim = ObjectAnimator.ofFloat(this.newPostsBtn, "translationY", 0.0f).setDuration(400L);
                this.currentButtonAnim.setInterpolator(new OvershootInterpolator());
                this.currentButtonAnim.addListener(new AnimatorListenerAdapter() { // from class: com.vkontakte.android.fragments.NewsFragment.3
                    {
                        NewsFragment.this = this;
                    }

                    @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
                    public void onAnimationEnd(Animator animation) {
                        NewsFragment.this.currentButtonAnim = null;
                    }
                });
                this.currentButtonAnim.start();
                return;
            }
            this.currentButtonAnim = ObjectAnimator.ofFloat(this.newPostsBtn, "translationY", -this.newPostsBtn.getBottom()).setDuration(200L);
            this.currentButtonAnim.setInterpolator(new AccelerateInterpolator());
            this.currentButtonAnim.addListener(new AnimatorListenerAdapter() { // from class: com.vkontakte.android.fragments.NewsFragment.4
                {
                    NewsFragment.this = this;
                }

                @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
                public void onAnimationEnd(Animator animation) {
                    NewsFragment.this.currentButtonAnim = null;
                    ViewUtils.setVisibility(NewsFragment.this.newPostsBtn, 8);
                }
            });
            this.currentButtonAnim.start();
        }
    }

    public void showNew(boolean fromButton) {
        Analytics.track("user_action").addParam(ShareConstants.WEB_DIALOG_PARAM_ACTION_TYPE, "feed_load_new").addParam("action_param", "click").commit();
        if (this.clearForNew && this.lastPreloadTime > 0 && System.currentTimeMillis() - this.lastPreloadTime > 30000 && !NewsfeedCache.isNewsfeedTop()) {
            setList(this.listID, true);
        } else if (this.clearForNew) {
            if (this.newNews.size() == 0) {
                updateNewPostsBtn();
                return;
            }
            this.data.clear();
            this.preloadedData.clear();
            this.items.clear();
            this.data.addAll(this.newNews.subList(0, Math.min(10, this.newNews.size())));
            onAppendItems(this.data);
            if (this.newNews.size() > 10) {
                this.preloadedData.addAll(this.newNews.subList(10, this.newNews.size()));
            }
            updateList();
            this.list.postDelayed(NewsFragment$$Lambda$5.lambdaFactory$(this), 200L);
            setFrom(NewsfeedCache.saveFrom(this.newFrom));
            ArrayList<NewsEntry> forCache = new ArrayList<>();
            forCache.addAll(this.newNews);
            this.newNews.clear();
            new Thread(NewsFragment$$Lambda$6.lambdaFactory$(forCache)).start();
            this.newPostsHideBoundary = -1;
            updateNewPostsBtn();
        } else {
            this.list.scrollToPosition(0);
            this.newPostsHideBoundary = -1;
            if (fromButton) {
                this.newPostsButtonPendingVisibility = true;
            }
            updateNewPostsBtn();
        }
    }

    public /* synthetic */ void lambda$showNew$5() {
        if (this.list != null) {
            this.list.scrollToPosition(0);
        }
    }

    @Override // com.vkontakte.android.fragments.PostListFragment, android.app.DialogFragment, android.app.Fragment
    public void onCreate(Bundle state) {
        super.onCreate(state);
        this.isFirstNav = state == null && getArguments() != null && !getArguments().getBoolean("_from_left_menu");
        if (this.isFirstNav) {
            Posts.feedItemOffset = 0;
            Posts.feedItem = 0;
            NewsfeedCache.saveFirstShowedIndex(0);
            NewsfeedCache.saveFirstShowedOffset(0);
        }
        StoriesController.notificationCenter().addListener(100, this.storyUpdateListener);
        StoriesController.notificationCenter().addListener(101, this.storiesListInvalidateListener);
    }

    @Override // com.vkontakte.android.fragments.PostListFragment, me.grishka.appkit.fragments.LoaderFragment, android.app.Fragment
    public void onDestroy() {
        StoriesController.notificationCenter().removeListener(this.storyUpdateListener);
        StoriesController.notificationCenter().removeListener(this.storiesListInvalidateListener);
        super.onDestroy();
    }

    public void preloadNew() {
        UsableRecyclerView.ViewHolder holder;
        UsableRecyclerView list = this.list;
        Activity act = getActivity();
        if ((this.errorView == null || this.errorView.getVisibility() != 0) && !this.refreshing && act != null && list != null) {
            act.runOnUiThread(NewsFragment$$Lambda$7.lambdaFactory$(this));
            int currentPos = -1;
            String firstPostID = null;
            NewsEntry first = this.data.size() > 0 ? (NewsEntry) this.data.get(0) : null;
            if (first != null) {
                switch (first.type) {
                    case 0:
                    case 12:
                        firstPostID = String.format(Locale.US, "wall%d_%d", Integer.valueOf(first.ownerID), Integer.valueOf(first.postID));
                        break;
                    case 1:
                        firstPostID = String.format(Locale.US, "photo%d_%d", Integer.valueOf(first.ownerID), Integer.valueOf(first.postID));
                        break;
                    case 6:
                        firstPostID = String.format(Locale.US, "addedphoto%d", Integer.valueOf(first.ownerID));
                        break;
                    case 7:
                        firstPostID = String.format(Locale.US, "taggedphoto%d", Integer.valueOf(first.ownerID));
                        break;
                }
            }
            if (list.getChildCount() > 0 && (holder = list.mo1205getChildViewHolder(list.getChildAt(0))) != null && (holder instanceof PostListFragment.PostDisplayItemViewHolder)) {
                PostDisplayItem item = ((PostListFragment.PostDisplayItemViewHolder) holder).item;
                int i = 0;
                while (true) {
                    if (i < this.data.size()) {
                        if (((NewsEntry) this.data.get(i)).ownerID != item.postOwnerID || ((NewsEntry) this.data.get(i)).postID != item.postID) {
                            i++;
                        } else {
                            currentPos = i;
                        }
                    }
                }
            }
            int listId = this.listID;
            String promoId = getPromoIdByRedirect();
            this.newNewsReq = new NewsfeedGet("", NewsfeedCache.isNewsfeedTop() ? 20 : 25, this.listID, promoId == null ? this.navAdapter.getPromoId(listId) : promoId, Boolean.valueOf(NewsfeedCache.isNewsfeedTop()), this.lastPosition, this.lastOwnerId, this.lastPostId, getNewsfeedAwayTime(), false, getListReferrer()).param("current_first_post", firstPostID).param("current_pos", currentPos + "").setCallback(new AnonymousClass5(listId, list)).exec((Context) act);
        }
    }

    /* renamed from: com.vkontakte.android.fragments.NewsFragment$5 */
    /* loaded from: classes2.dex */
    public class AnonymousClass5 implements Callback<NewsfeedGet.Response> {
        final /* synthetic */ UsableRecyclerView val$list;
        final /* synthetic */ int val$listId;

        AnonymousClass5(int i, UsableRecyclerView usableRecyclerView) {
            NewsFragment.this = this$0;
            this.val$listId = i;
            this.val$list = usableRecyclerView;
        }

        @Override // com.vkontakte.android.api.Callback
        public void success(NewsfeedGet.Response rnews) {
            final int offset;
            final int position;
            int i;
            int position2;
            Activity activity = NewsFragment.this.getActivity();
            if (activity != null) {
                activity.getSharedPreferences(null, 0).edit().putLong("feed_last_unload", System.currentTimeMillis()).apply();
            }
            NewsFragment.this.onStoriesLoaded(rnews.stories);
            NewsFragment.this.newNewsReq = null;
            NewsFragment.this.newFrom = rnews.from();
            NewsFragment.this.newNews.clear();
            NewsfeedCache.setLists(rnews.lists, true);
            if (this.val$listId == 0) {
                NewsfeedCache.setNewsfeedTop(rnews.isSmartNews);
            }
            NewsFragment.this.lambda$null$2(rnews.lists, NewsfeedCache.isNewsfeedTop());
            boolean hasNewNotifications = false;
            List<NewsEntry> userNotifications = null;
            if (this.val$listId == 0) {
                ArrayList arrayList = new ArrayList();
                ArrayList<NewsEntry> newNotifications = new ArrayList<>();
                for (int i2 = 0; i2 < NewsFragment.this.data.size(); i2++) {
                    if (((NewsEntry) NewsFragment.this.data.get(i2)).type == 15) {
                        arrayList.add(NewsFragment.this.data.get(i2));
                    }
                }
                if (rnews.notifications == null) {
                    newNotifications.addAll(arrayList);
                } else {
                    for (int i3 = 0; i3 < rnews.notifications.size(); i3++) {
                        if (rnews.notifications.get(i3).type == 15) {
                            newNotifications.add(rnews.notifications.get(i3));
                        }
                    }
                }
                if (arrayList.size() == newNotifications.size()) {
                    for (int i4 = 0; i4 < arrayList.size(); i4++) {
                        NewsEntry last = (NewsEntry) arrayList.get(i4);
                        NewsEntry newN = newNotifications.get(i4);
                        if (last.ownerID != newN.ownerID || last.postID != newN.postID) {
                            hasNewNotifications = true;
                            break;
                        }
                    }
                } else {
                    hasNewNotifications = true;
                }
                userNotifications = rnews.notifications != null ? rnews.notifications : arrayList;
            }
            final int notificationCount = userNotifications == null ? 0 : userNotifications.size();
            int numNew = 0;
            boolean found = false;
            if (!hasNewNotifications) {
                if (!rnews.isSmartNews.booleanValue()) {
                    NewsEntry lastFirstItem = null;
                    int lastFirstItemIndex = -1;
                    int i5 = 0;
                    while (true) {
                        if (i5 >= NewsFragment.this.data.size()) {
                            break;
                        } else if (((NewsEntry) NewsFragment.this.data.get(i5)).type != 15) {
                            lastFirstItemIndex = i5;
                            lastFirstItem = (NewsEntry) NewsFragment.this.data.get(i5);
                            break;
                        } else {
                            i5++;
                        }
                    }
                    int lastFirstItemIndexInNew = -1;
                    for (int i6 = 0; i6 < rnews.size(); i6++) {
                        NewsEntry e = (NewsEntry) rnews.get(i6);
                        if (lastFirstItem != null && e.type == lastFirstItem.type && e.postID == lastFirstItem.postID && e.ownerID == lastFirstItem.ownerID) {
                            lastFirstItemIndexInNew = i6;
                        }
                    }
                    if (lastFirstItemIndex >= 0 && lastFirstItemIndexInNew >= 0) {
                        found = true;
                        while (true) {
                            lastFirstItemIndex++;
                            if (lastFirstItemIndex >= NewsFragment.this.data.size()) {
                                break;
                            }
                            lastFirstItemIndexInNew++;
                            if (lastFirstItemIndexInNew >= rnews.size()) {
                                break;
                            }
                            NewsEntry entryInLast = null;
                            while (lastFirstItemIndex < NewsFragment.this.data.size() && ((entryInLast = (NewsEntry) NewsFragment.this.data.get(lastFirstItemIndex)) == null || NewsEntry.isTypeAd(entryInLast.type) || entryInLast.type == 13)) {
                                lastFirstItemIndex++;
                            }
                            if (lastFirstItemIndex >= NewsFragment.this.data.size()) {
                                break;
                            }
                            NewsEntry entryInNew = null;
                            while (lastFirstItemIndexInNew < rnews.size() && ((entryInNew = (NewsEntry) rnews.get(lastFirstItemIndexInNew)) == null || NewsEntry.isTypeAd(entryInNew.type) || entryInNew.type == 13)) {
                                lastFirstItemIndexInNew++;
                            }
                            if (lastFirstItemIndexInNew >= rnews.size()) {
                                break;
                            } else if (entryInLast == null || entryInNew == null || (entryInLast.type == entryInNew.type && entryInLast.postID == entryInNew.postID && entryInLast.ownerID == entryInNew.ownerID)) {
                            }
                        }
                    }
                } else {
                    found = false;
                }
                boolean foundWhileMerge = false;
                for (int i7 = 0; i7 < rnews.size(); i7++) {
                    NewsEntry e2 = (NewsEntry) rnews.get(i7);
                    int j = 0;
                    while (true) {
                        if (j >= NewsFragment.this.data.size()) {
                            break;
                        }
                        NewsEntry ne = (NewsEntry) NewsFragment.this.data.get(j);
                        if (!found || e2.type == 15 || e2.type != ne.type || e2.postID != ne.postID || e2.ownerID != ne.ownerID) {
                            j++;
                        } else {
                            Log.i("vk", "Found intersection, numNew=" + numNew);
                            foundWhileMerge = true;
                            break;
                        }
                    }
                    if (foundWhileMerge) {
                        break;
                    }
                    numNew++;
                    NewsFragment.this.newNews.add(e2);
                }
            }
            LinearLayoutManager layoutManager = (LinearLayoutManager) (this.val$list == null ? Integer.valueOf(numNew) : this.val$list.getLayoutManager());
            boolean savePosition = layoutManager == null || layoutManager.findFirstCompletelyVisibleItemPosition() != 0;
            if (hasNewNotifications) {
                L.e(new Object[0]);
                if (rnews.notifications != null) {
                    NewsFragment.this.newNews.addAll(rnews.notifications);
                }
                NewsFragment.this.newNews.addAll(rnews);
                NewsFragment.this.clearForNew = true;
                NewsFragment.this.newPostsHideBoundary = -1;
                NewsFragment.this.showNew(false);
                return;
            }
            if (numNew > 0 && !found) {
                L.e(new Object[0]);
                if (userNotifications != null) {
                    NewsFragment.this.newNews.addAll(0, userNotifications);
                }
                NewsFragment.this.clearForNew = true;
                if (this.val$list.getChildCount() > 0) {
                    position2 = ((LinearLayoutManager) this.val$list.getLayoutManager()).findFirstVisibleItemPosition();
                } else {
                    position2 = 0;
                }
                NewsFragment.this.newPostsHideBoundary = savePosition ? Math.max(position2 - 1, 0) : -1;
                if (!savePosition) {
                    NewsFragment.this.showNew(false);
                    return;
                }
            } else if (numNew > 0) {
                L.e(new Object[0]);
                if (this.val$list.getChildCount() > 0) {
                    position = ((LinearLayoutManager) this.val$list.getLayoutManager()).findFirstVisibleItemPosition();
                    offset = this.val$list.getChildAt(0).getTop();
                } else {
                    offset = 0;
                    position = 0;
                }
                NewsFragment.this.data.addAll(notificationCount, NewsFragment.this.newNews);
                int cnt = NewsFragment.this.items.size();
                NewsFragment.this.onPrependItems(NewsFragment.this.newNews, notificationCount);
                final int addedCount = NewsFragment.this.items.size() - cnt;
                NewsFragment.this.newPostsHideBoundary = position + addedCount;
                NewsFragment.this.updateList();
                ArrayList<NewsEntry> forCache = new ArrayList<>();
                forCache.addAll(NewsFragment.this.newNews);
                NewsFragment.this.newNews.clear();
                NewsFragment.this.clearForNew = false;
                new Thread(NewsFragment$5$$Lambda$1.lambdaFactory$(forCache)).start();
                this.val$list.getViewTreeObserver().addOnPreDrawListener(new ViewTreeObserver.OnPreDrawListener() { // from class: com.vkontakte.android.fragments.NewsFragment.5.1
                    {
                        AnonymousClass5.this = this;
                    }

                    @Override // android.view.ViewTreeObserver.OnPreDrawListener
                    public boolean onPreDraw() {
                        UsableRecyclerView list = NewsFragment.this.list;
                        if (list != null && list.getViewTreeObserver() != null) {
                            list.getViewTreeObserver().removeOnPreDrawListener(this);
                            LinearLayoutManager layoutManager2 = (LinearLayoutManager) list.getLayoutManager();
                            if (layoutManager2 != null && notificationCount <= position && layoutManager2.findFirstCompletelyVisibleItemPosition() != 0) {
                                layoutManager2.scrollToPositionWithOffset(position + addedCount, offset);
                                return false;
                            }
                            return false;
                        }
                        return false;
                    }
                });
            }
            NewsFragment.this.lastPreloadTime = System.currentTimeMillis();
            if (numNew > 0) {
                Analytics.track("user_action").addParam(ShareConstants.WEB_DIALOG_PARAM_ACTION_TYPE, "feed_load_new").addParam("action_param", "show").commit();
            }
            NewsFragment newsFragment = NewsFragment.this;
            if (savePosition) {
                i = NewsFragment.this.newPostsHideBoundary;
            } else {
                i = -1;
            }
            newsFragment.newPostsHideBoundary = i;
            NewsFragment.this.updateNewPostsBtn();
        }

        @Override // com.vkontakte.android.api.Callback
        public void fail(VKAPIRequest.VKErrorResponse error) {
            NewsFragment.this.newNewsReq = null;
        }
    }

    private void initLastValuesIfNeed(@Nullable ArrayList<NewsEntry> e) {
        if (this.lastPosition < 0 && this.lastPostId < 0 && this.lastOwnerId < 0) {
            if (e == null) {
                e = NewsfeedCache.get();
            }
            int firstShowedIndex = NewsfeedCache.getFirstShowedIndex();
            Posts.feedItem = firstShowedIndex;
            this.lastPosition = firstShowedIndex;
            Posts.feedItemOffset = NewsfeedCache.getFirstShowedOffset();
            if (this.lastPosition >= 0 && e != null && this.lastPosition < e.size()) {
                this.lastPostId = e.get(this.lastPosition).postID;
                this.lastOwnerId = e.get(this.lastPosition).ownerID;
            }
        }
    }

    @Override // me.grishka.appkit.fragments.BaseRecyclerFragment
    protected void doLoadData(final int offset, int count) {
        if (offset == 0 && !this.refreshing && this.data.size() == 0 && !this.forceNewData) {
            if (Posts.feed.size() > 0) {
                this.data.addAll(Posts.feed);
                onAppendItems(Posts.feed);
                this.preloadedData.addAll(Posts.preloadedFeed);
                updateList();
                this.loaded = true;
                this.preloader.setMoreAvailable(true);
                this.dataLoading = false;
                showContent();
                if (this.list != null) {
                    ((LinearLayoutManager) this.list.getLayoutManager()).scrollToPositionWithOffset(Posts.feedItem, Posts.feedItemOffset);
                } else {
                    this.needSetSelection = true;
                }
                setFrom(NewsfeedCache.saveFrom(Posts.feedFrom));
                this.newNews = Posts.newNews;
                this.newFrom = Posts.newNewsFrom;
                this.clearForNew = Posts.feedClearForNew;
                preloadIfNeed();
                return;
            } else if (NewsfeedCache.hasEntries()) {
                new Thread(NewsFragment$$Lambda$8.lambdaFactory$(this)).start();
                return;
            }
        }
        this.forceNewData = false;
        final int listId = this.listID;
        String promoId = getPromoIdByRedirect();
        this.currentRequest = new NewsfeedGet(offset == 0 ? AppEventsConstants.EVENT_PARAM_VALUE_NO : getFrom(), count, this.listID, promoId == null ? this.navAdapter.getPromoId(listId) : promoId, Boolean.valueOf(NewsfeedCache.isNewsfeedTop()), this.lastPosition, this.lastOwnerId, this.lastPostId, getNewsfeedAwayTime(), offset == 0, getListReferrer()).setCallback(new SimpleCallback<NewsfeedGet.Response>(this) { // from class: com.vkontakte.android.fragments.NewsFragment.6
            {
                NewsFragment.this = this;
            }

            @Override // com.vkontakte.android.api.Callback
            public void success(NewsfeedGet.Response news) {
                boolean z = true;
                Activity activity = NewsFragment.this.getActivity();
                if (activity != null) {
                    activity.getSharedPreferences(null, 0).edit().putLong("feed_last_unload", System.currentTimeMillis()).apply();
                }
                if (offset == 0) {
                    if (news.notifications != null && listId == 0) {
                        news.addAll(0, news.notifications);
                    }
                    NewsfeedCache.replace(news);
                }
                NewsFragment.this.setFrom(NewsfeedCache.saveFrom(news.from()));
                NewsfeedCache.setLists(news.lists, true);
                if (listId == 0) {
                    NewsfeedCache.setNewsfeedTop(news.isSmartNews);
                }
                NewsFragment.this.lambda$null$2(news.lists, NewsfeedCache.isNewsfeedTop());
                NewsFragment newsFragment = NewsFragment.this;
                if (TextUtils.isEmpty(NewsFragment.this.getFrom())) {
                    z = false;
                }
                newsFragment.onDataLoaded(news, z);
                if (NewsFragment.this.needScrollToTop && NewsFragment.this.list != null) {
                    NewsFragment.this.list.scrollToPosition(0);
                    NewsFragment.this.needScrollToTop = false;
                }
                NewsFragment.this.onStoriesLoaded(news.stories);
            }

            @Override // com.vkontakte.android.api.SimpleCallback, com.vkontakte.android.api.Callback
            public void fail(VKAPIRequest.VKErrorResponse error) {
                super.fail(error);
            }
        }).exec((Context) getActivity());
    }

    public /* synthetic */ void lambda$doLoadData$8() {
        ArrayList<NewsEntry> e = NewsfeedCache.get();
        ArrayList<NewsfeedList> newsfeedLists = NewsfeedCache.getLists();
        boolean isStartFromInteresting = NewsfeedCache.isNewsfeedTop();
        setFrom(NewsfeedCache.getFrom());
        Posts.feedItem = NewsfeedCache.getFirstShowedIndex();
        Posts.feedItemOffset = NewsfeedCache.getFirstShowedOffset();
        Activity activity = getActivity();
        if (activity != null) {
            activity.runOnUiThread(NewsFragment$$Lambda$9.lambdaFactory$(this, newsfeedLists, isStartFromInteresting, e));
        }
    }

    public /* synthetic */ void lambda$null$7(ArrayList newsfeedLists, boolean isStartFromInteresting, ArrayList e) {
        lambda$null$2(newsfeedLists, isStartFromInteresting);
        onDataLoaded(e, true);
        if (this.list != null) {
            ((LinearLayoutManager) this.list.getLayoutManager()).scrollToPositionWithOffset(Posts.feedItem, Posts.feedItemOffset);
        } else {
            this.needSetSelection = true;
        }
        preloadIfNeed();
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // me.grishka.appkit.fragments.BaseRecyclerFragment
    public void cancelLoading() {
        super.cancelLoading();
        if (this.newNewsReq != null) {
            this.newNewsReq.cancel();
            this.newNewsReq = null;
        }
    }

    @Override // me.grishka.appkit.fragments.BaseRecyclerFragment, android.support.v4.widget.SwipeRefreshLayout.OnRefreshListener
    public void onRefresh() {
        if (this.newNewsReq != null) {
            this.newNewsReq.cancel();
            this.newNewsReq = null;
        }
        this.newNews.clear();
        this.newPostsHideBoundary = -1;
        updateNewPostsBtn();
        super.onRefresh();
    }

    @Override // me.grishka.appkit.fragments.AppKitFragment
    protected boolean onSpinnerItemSelected(int position) {
        if (this.firstNav) {
            this.firstNav = false;
            return false;
        }
        if (this.navAdapter != null) {
            this.navAdapter.setSelectedItem(position);
            NewsSpinnerAdapter.Item item = this.navAdapter.getItem(position);
            if (item == null) {
                return false;
            }
            int id = item.listItem.getId();
            if (getArguments() != null && !getArguments().containsKey("list_id")) {
                listIDStatic = id;
                getActivity().getSharedPreferences(null, 0).edit().putInt("feed_list", id).apply();
            }
            setList(id);
        }
        return true;
    }

    @Override // com.vkontakte.android.fragments.VKRecyclerFragment, me.grishka.appkit.fragments.AppKitFragment
    /* renamed from: onCreateNavigationSpinnerAdapter */
    public NewsSpinnerAdapter mo1003onCreateNavigationSpinnerAdapter() {
        return new NewsSpinnerAdapter(getActivity());
    }

    @Override // me.grishka.appkit.fragments.AppKitFragment
    protected Spinner onCreateNavigationSpinner(LayoutInflater inflater) {
        Spinner spinner = (Spinner) inflater.inflate(R.layout.navigation_spinner_news, (ViewGroup) null);
        spinner.setPadding(V.dp(-50.0f), 0, 0, 0);
        return spinner;
    }

    public static int getNewsfeedAwayTime() {
        long lastTime = VKApplication.context.getSharedPreferences(null, 0).getLong("newsfeed_last_opened", 0L);
        if (lastTime > 0) {
            return ((int) (System.currentTimeMillis() - lastTime)) / 1000;
        }
        return -1;
    }

    @Override // com.vkontakte.android.fragments.PostListFragment, me.grishka.appkit.fragments.BaseRecyclerFragment
    /* renamed from: getAdapter */
    public UsableRecyclerView.Adapter mo1066getAdapter() {
        if (this.storiesHeaderAdapter == null) {
            this.storiesHeaderAdapter = new StoriesHeaderAdapter();
            loadStoriesSync();
        }
        if (this.headerAdapter == null) {
            this.headerAdapter = new HeaderAdapter(VKAccountManager.getCurrent().getPhoto());
        }
        if (this.adapter == null) {
            CardMergeAdapter cardMergeAdapter = new CardMergeAdapter(this.headerAdapter, this.storiesHeaderAdapter, new PostListFragment.NewsAdapter());
            this.adapter = cardMergeAdapter;
            return cardMergeAdapter;
        }
        return this.adapter;
    }

    @Override // com.vkontakte.android.fragments.PostListFragment
    protected int getPostsOffset() {
        return this.headerAdapter.getItemCount() + this.storiesHeaderAdapter.getItemCount();
    }

    private String getPromoIdByRedirect() {
        Bundle args = getArguments();
        if (args == null) {
            return null;
        }
        String string = args.getString("feed_id");
        args.remove("feed_id");
        return string;
    }

    private void loadStoriesSync() {
        GetStoriesResponse r = StoriesController.getCachedStories();
        setStoriesResponse(r);
    }

    public void onStoriesLoaded(GetStoriesResponse storiesResponse) {
        if (storiesResponse != null) {
            StoriesController.setCachedStories(storiesResponse.originalJsonObject);
            setStoriesResponse(storiesResponse);
        }
    }

    private void setStoriesResponse(GetStoriesResponse storiesResponse) {
        if (storiesResponse == null) {
            storiesResponse = new GetStoriesResponse((JSONObject) null);
        }
        if (storiesResponse.storiesResponse != null) {
            ArrayList<StoriesContainer> loadedStories = new ArrayList<>();
            loadedStories.addAll(storiesResponse.storiesResponse);
            ArrayList<StoriesContainer> loadedStories2 = StoriesController.postProcessDisplayStoryList(loadedStories);
            storiesResponse.storiesResponse.clear();
            storiesResponse.storiesResponse.addAll(loadedStories2);
        }
        this.storiesHeaderAdapter.setGetStoriesResponse(storiesResponse);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes2.dex */
    public class StoryMarkAsSeenListener implements NotificationListener<StoryEntry> {
        StoryMarkAsSeenListener() {
            NewsFragment.this = this$0;
        }

        @Override // com.vk.attachpicker.events.NotificationListener
        public void onNotification(int eventType, int eventId, StoryEntry eventArgs) {
            GetStoriesResponse r;
            if (eventArgs != null && NewsFragment.this.storiesHeaderAdapter != null && (r = NewsFragment.this.storiesHeaderAdapter.getStoriesResponse) != null && r.storiesResponse != null) {
                if (r.originalJsonObject != null) {
                    StoriesController.markStoryInJsonAsSeen(r.originalJsonObject, eventArgs);
                }
                for (int j = 0; j < r.storiesResponse.size(); j++) {
                    StoriesContainer sc = r.storiesResponse.get(j);
                    if (sc.hasValidStories()) {
                        for (int i = 0; i < sc.storyEntries.size(); i++) {
                            StoryEntry se = sc.storyEntries.get(i);
                            if (eventArgs.equals(se)) {
                                se.seen = true;
                                NewsFragment.this.storiesHeaderAdapter.notifyDataSetChanged();
                                return;
                            }
                        }
                        continue;
                    }
                }
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes2.dex */
    public class StoriesListInvalidateListener implements NotificationListener<ArrayList<StoriesContainer>> {
        StoriesListInvalidateListener() {
            NewsFragment.this = this$0;
        }

        @Override // com.vk.attachpicker.events.NotificationListener
        public void onNotification(int eventType, int eventId, ArrayList<StoriesContainer> eventArgs) {
            if (eventArgs != null && NewsFragment.this.storiesHeaderAdapter != null) {
                NewsFragment.this.storiesHeaderAdapter.setGetStoriesResponse(eventArgs);
            }
        }
    }

    /* loaded from: classes2.dex */
    public class StoriesHolder extends RecyclerHolder<StoriesContainer> implements UsableRecyclerView.Clickable, UsableRecyclerView.LongClickable {
        private final StoriesAdapter adapter;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public StoriesHolder(RecyclerView recyclerView, StoriesAdapter adapter) {
            super(new StoryCirclePreview(this$0.getActivity()), recyclerView);
            NewsFragment.this = this$0;
            this.adapter = adapter;
        }

        @Override // com.vkontakte.android.ui.holder.RecyclerHolder
        public void onBind(StoriesContainer item) {
            ((StoryCirclePreview) this.itemView).setStory(item);
        }

        @Override // me.grishka.appkit.views.UsableRecyclerView.Clickable
        public void onClick() {
            StoriesContainer container = ((StoryCirclePreview) this.itemView).getStory();
            if (container != null) {
                Activity activity = NewsFragment.this.getActivity();
                if (activity != null) {
                    StoriesContainer sc = ((StoryCirclePreview) this.itemView).getStory();
                    if (sc == null || (sc.myStory() && !sc.hasValidStories())) {
                        Intent intent = new Intent(NewsFragment.this.getActivity(), CreateAndEditStoryActivity.class);
                        NewsFragment.this.startActivity(intent);
                        return;
                    }
                    ArrayList<StoriesContainer> storiesContainers = container.hasNewStories() ? StoriesUtil.filterStoriesWithNewContent(NewsFragment.this.storiesHeaderAdapter.getStoriesResponse.storiesResponse) : StoriesUtil.filterStories(NewsFragment.this.storiesHeaderAdapter.getStoriesResponse.storiesResponse);
                    if (storiesContainers != null && StoriesUtil.findStoryByAuthorId(storiesContainers, container.getAuthorId()) != null) {
                        StoryViewDialog storyViewDialog = new StoryViewDialog(NewsFragment.this.getActivity(), storiesContainers, container.getAuthorId(), new StoryViewDialog.AnimationDataProvider() { // from class: com.vkontakte.android.fragments.NewsFragment.StoriesHolder.1
                            {
                                StoriesHolder.this = this;
                            }

                            @Override // com.vk.stories.StoryViewDialog.AnimationDataProvider
                            public View getAnimationTargetView(int uid) {
                                ViewGroup parent = StoriesHolder.this.getParent();
                                if (parent != null) {
                                    for (int i = 0; i < parent.getChildCount(); i++) {
                                        StoryCirclePreview preview = (StoryCirclePreview) parent.getChildAt(i);
                                        if (preview != null && preview.getStory() != null && preview.getStory().getAuthorId() == uid) {
                                            return preview.getStoryImageView();
                                        }
                                    }
                                    return null;
                                }
                                return null;
                            }

                            @Override // com.vk.stories.StoryViewDialog.AnimationDataProvider
                            public void scrollStoriesListToAuthorId(int uid) {
                                StoriesHolder.this.adapter.scrollStoriesListToAuthorId(uid);
                            }
                        });
                        storyViewDialog.show();
                    }
                }
            }
        }

        @Override // me.grishka.appkit.views.UsableRecyclerView.LongClickable
        public boolean onLongClick() {
            StoriesContainer sc = ((StoryCirclePreview) this.itemView).getStory();
            if (sc != null && !sc.myStory() && sc.hasValidStories() && !sc.isPromo()) {
                int currentStoryId = sc.getAuthorId();
                AlertDialogs.AlertDialogBuilder builder = AlertDialogs.buildListActionDialog(NewsFragment.this.getActivity());
                builder.action(sc.getAuthorId() > 0 ? R.string.open_profile : R.string.open_community, NewsFragment$StoriesHolder$$Lambda$1.lambdaFactory$(this, sc));
                builder.action(R.string.hide_from_stories, NewsFragment$StoriesHolder$$Lambda$2.lambdaFactory$(this, currentStoryId));
                builder.show();
                return true;
            }
            return false;
        }

        public /* synthetic */ void lambda$onLongClick$0(StoriesContainer sc) {
            new ProfileFragment.Builder(sc.getAuthorId()).go(NewsFragment.this.getActivity());
        }

        public /* synthetic */ void lambda$onLongClick$1(final int currentStoryId) {
            StoriesController.banUser(currentStoryId, NewsFragment.this.getActivity(), new Callback<GetStoriesResponse>() { // from class: com.vkontakte.android.fragments.NewsFragment.StoriesHolder.2
                {
                    StoriesHolder.this = this;
                }

                @Override // com.vkontakte.android.api.Callback
                public void success(GetStoriesResponse result) {
                    ToastUtils.showToast(currentStoryId > 0 ? R.string.user_has_been_hidden_from_stories : R.string.community_has_been_hidden_from_stories);
                }

                @Override // com.vkontakte.android.api.Callback
                public void fail(VKAPIRequest.VKErrorResponse error) {
                    ToastUtils.showToast((int) R.string.error_hide_from_stories);
                }
            });
        }
    }

    /* loaded from: classes2.dex */
    public class StoriesAdapter extends UsableRecyclerView.Adapter<StoriesHolder> {
        private final RecyclerView recyclerView;
        private final ArrayList<StoriesContainer> stories = new ArrayList<>();

        public StoriesAdapter(RecyclerView recyclerView) {
            NewsFragment.this = this$0;
            this.recyclerView = recyclerView;
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        /* renamed from: onCreateViewHolder */
        public StoriesHolder mo1206onCreateViewHolder(ViewGroup parent, int viewType) {
            return new StoriesHolder(this.recyclerView, this);
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        public void onBindViewHolder(StoriesHolder holder, int position) {
            holder.bind(this.stories.get(position));
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        public int getItemCount() {
            return this.stories.size();
        }

        @Override // me.grishka.appkit.views.UsableRecyclerView.Adapter, me.grishka.appkit.preloading.PrefetchInfoProvider
        public int getImageCountForItem(int position) {
            return 1;
        }

        @Override // me.grishka.appkit.views.UsableRecyclerView.Adapter, me.grishka.appkit.preloading.PrefetchInfoProvider
        public String getImageURL(int position, int image) {
            return this.stories.get(position).getAuthorAvatarUrl();
        }

        public void clear() {
            this.stories.clear();
            notifyDataSetChanged();
        }

        public void setStories(ArrayList<StoriesContainer> response) {
            this.stories.clear();
            this.stories.addAll(response);
            notifyDataSetChanged();
        }

        public void scrollStoriesListToAuthorId(int uid) {
            if (NewsFragment.this.list != null) {
                NewsFragment.this.list.scrollToPosition(0);
            }
            for (int i = 0; i < this.stories.size(); i++) {
                if (this.stories.get(i).getAuthorId() == uid) {
                    this.recyclerView.scrollToPosition(i);
                    return;
                }
            }
        }
    }

    /* loaded from: classes2.dex */
    public class HeaderHolder extends RecyclerHolder<String> {
        private final TimeoutLock clickLock;
        final ImageButton imageButton;
        final VKImageView imageView;
        private View newHeader;
        private View oldHeader;
        private View storyButton;
        private View streamButton;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public HeaderHolder(ViewGroup container) {
            super((int) R.layout.news_write_new_post, container);
            NewsFragment.this = this$0;
            this.clickLock = new TimeoutLock(300L);
            this.oldHeader = $(R.id.ll_header_old);
            this.newHeader = $(R.id.ll_header_new);
            this.imageView = (VKImageView) $(16908294);
            this.imageButton = (ImageButton) $(16908313);
            this.imageButton.setImageDrawable(new RecoloredDrawable(ViewUtils.getDrawable(container.getContext(), R.drawable.ic_menu_photos), -5591373));
            this.imageButton.setOnClickListener(NewsFragment$HeaderHolder$$Lambda$1.lambdaFactory$(this));
            if (!this$0.isTablet) {
                this.itemView.setBackgroundColor(-1);
            }
            this.oldHeader.setOnClickListener(NewsFragment$HeaderHolder$$Lambda$2.lambdaFactory$(this));
            this.storyButton = $(R.id.fl_create_story);
            this.storyButton.setOnClickListener(NewsFragment$HeaderHolder$$Lambda$3.lambdaFactory$(this));
            this.streamButton = $(R.id.fl_create_live);
            this.streamButton.setOnClickListener(NewsFragment$HeaderHolder$$Lambda$4.lambdaFactory$(this));
            $(R.id.fl_create_post).setOnClickListener(NewsFragment$HeaderHolder$$Lambda$5.lambdaFactory$(this));
            onBind((String) null);
        }

        public /* synthetic */ void lambda$new$0(View v) {
            NewsFragment.this.startActivity(new Intent(NewsFragment.this.getActivity(), PostPhotoActivity.class).putExtra(ArgKeys.UID, VKAccountManager.getCurrent().getUid()));
        }

        public /* synthetic */ void lambda$new$1(View v) {
            new NewPostFragment.Builder().go(NewsFragment.this.getActivity());
        }

        public /* synthetic */ void lambda$new$2(View v) {
            if (!this.clickLock.isLocked()) {
                this.clickLock.lock();
                Intent intent = new Intent(NewsFragment.this.getActivity(), CreateAndEditStoryActivity.class);
                NewsFragment.this.startActivity(intent);
            }
        }

        public /* synthetic */ void lambda$new$3(View v) {
            if (!this.clickLock.isLocked()) {
                this.clickLock.lock();
                VKLiveUtils.startStream(getContext());
            }
        }

        public /* synthetic */ void lambda$new$4(View v) {
            if (!this.clickLock.isLocked()) {
                this.clickLock.lock();
                new NewPostFragment.Builder().go(NewsFragment.this.getActivity());
            }
        }

        @Override // com.vkontakte.android.ui.holder.RecyclerHolder
        public void onBind(String item) {
            int i = 0;
            boolean stream = VKAccountManager.getCurrent().isVkLiveStreamAvailable();
            boolean stories = VKAccountManager.getCurrent().isStoriesAvailable();
            if (stories || stream) {
                this.oldHeader.setVisibility(8);
                this.newHeader.setVisibility(0);
                this.storyButton.setVisibility(stories ? 0 : 8);
                View view = this.streamButton;
                if (!stream) {
                    i = 8;
                }
                view.setVisibility(i);
                return;
            }
            this.oldHeader.setVisibility(0);
            this.newHeader.setVisibility(8);
            this.imageView.load(item);
        }
    }

    /* loaded from: classes2.dex */
    public class HeaderAdapter extends UsableRecyclerView.Adapter<HeaderHolder> implements CardItemDecorator.Provider {
        final String url;

        public HeaderAdapter(String url) {
            NewsFragment.this = this$0;
            this.url = url;
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        /* renamed from: onCreateViewHolder */
        public HeaderHolder mo1206onCreateViewHolder(ViewGroup parent, int viewType) {
            return new HeaderHolder(parent);
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        public void onBindViewHolder(HeaderHolder holder, int position) {
            holder.bind(this.url);
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        public int getItemCount() {
            return NewsFragment.this.listID == 0 ? 1 : 0;
        }

        @Override // com.vkontakte.android.ui.CardItemDecorator.Provider
        public int getBlockType(int position) {
            return NewsFragment.this.isTablet ? 6 : 4;
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        public int getItemViewType(int position) {
            return 47984585;
        }

        @Override // me.grishka.appkit.views.UsableRecyclerView.Adapter, me.grishka.appkit.preloading.PrefetchInfoProvider
        public int getImageCountForItem(int position) {
            return 1;
        }

        @Override // me.grishka.appkit.views.UsableRecyclerView.Adapter, me.grishka.appkit.preloading.PrefetchInfoProvider
        public String getImageURL(int position, int image) {
            return this.url;
        }
    }

    /* loaded from: classes2.dex */
    public class StoriesHeaderHolder extends RecyclerHolder<ArrayList<StoriesContainer>> {
        private final StoriesAdapter storiesAdapter;
        private final UsableRecyclerView storiesRecyclerView;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public StoriesHeaderHolder(ViewGroup container) {
            super((int) R.layout.news_stories_header, container);
            NewsFragment.this = this$0;
            this.storiesRecyclerView = (UsableRecyclerView) $(R.id.rv_stories);
            this.storiesRecyclerView.setLayoutManager(new LinearLayoutManager(this.storiesRecyclerView.getContext(), 0, false));
            this.storiesAdapter = new StoriesAdapter(this.storiesRecyclerView);
            this.storiesRecyclerView.setAdapter(this.storiesAdapter);
        }

        @Override // com.vkontakte.android.ui.holder.RecyclerHolder
        public void onBind(ArrayList<StoriesContainer> item) {
            if (item == null || item.size() == 0) {
                this.storiesRecyclerView.setVisibility(8);
                this.storiesAdapter.clear();
                return;
            }
            this.storiesAdapter.setStories(item);
            this.storiesRecyclerView.setVisibility(0);
        }

        public void scrollToBegin() {
            this.storiesRecyclerView.scrollToPosition(0);
        }
    }

    /* loaded from: classes2.dex */
    public class StoriesHeaderAdapter extends UsableRecyclerView.Adapter<StoriesHeaderHolder> implements CardItemDecorator.Provider {
        private GetStoriesResponse getStoriesResponse;
        private boolean scrollToBegin;

        public StoriesHeaderAdapter() {
            NewsFragment.this = this$0;
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        /* renamed from: onCreateViewHolder */
        public StoriesHeaderHolder mo1206onCreateViewHolder(ViewGroup parent, int viewType) {
            return new StoriesHeaderHolder(parent);
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        public void onBindViewHolder(StoriesHeaderHolder holder, int position) {
            holder.bind(this.getStoriesResponse == null ? null : this.getStoriesResponse.storiesResponse);
            if (this.scrollToBegin) {
                holder.scrollToBegin();
                this.scrollToBegin = false;
            }
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        public int getItemCount() {
            return (VKAccountManager.getCurrent().isStoriesAvailable() && NewsFragment.this.listID == 0 && this.getStoriesResponse != null && this.getStoriesResponse.storiesResponse != null && this.getStoriesResponse.storiesResponse.size() > 0) ? 1 : 0;
        }

        @Override // com.vkontakte.android.ui.CardItemDecorator.Provider
        public int getBlockType(int position) {
            return 7;
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        public int getItemViewType(int position) {
            return 479825;
        }

        @Override // me.grishka.appkit.views.UsableRecyclerView.Adapter, me.grishka.appkit.preloading.PrefetchInfoProvider
        public int getImageCountForItem(int position) {
            return 0;
        }

        @Override // me.grishka.appkit.views.UsableRecyclerView.Adapter, me.grishka.appkit.preloading.PrefetchInfoProvider
        public String getImageURL(int position, int image) {
            return null;
        }

        public void setGetStoriesResponse(GetStoriesResponse getStoriesResponse) {
            this.getStoriesResponse = getStoriesResponse;
            scrollToBegin();
        }

        public void setGetStoriesResponse(ArrayList<StoriesContainer> stories) {
            if (this.getStoriesResponse != null) {
                this.getStoriesResponse.storiesResponse.clear();
                this.getStoriesResponse.storiesResponse.addAll(stories);
                scrollToBegin();
            }
        }

        public void scrollToBegin() {
            this.scrollToBegin = true;
            notifyDataSetChanged();
        }
    }

    @Override // com.vkontakte.android.fragments.PostListFragment
    protected int convertItemsIndexToReal(int index) {
        int i = 0;
        int storiesCount = this.storiesHeaderAdapter == null ? 0 : this.storiesHeaderAdapter.getItemCount();
        int i2 = index + storiesCount;
        if (this.listID == 0) {
            i = 1;
        }
        return i + i2;
    }
}
