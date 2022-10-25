package com.vkontakte.android.fragments;

import android.app.Activity;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.Bundle;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.v4.content.LocalBroadcastManager;
import android.view.View;
import android.view.ViewGroup;
import com.vkontakte.android.R;
import com.vkontakte.android.VKApplication;
import com.vkontakte.android.api.SimpleCallback;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.api.apps.AppsGetGamesPage;
import com.vkontakte.android.api.apps.CatalogLoader;
import com.vkontakte.android.auth.VKAccountManager;
import com.vkontakte.android.data.Analytics;
import com.vkontakte.android.data.ApiApplication;
import com.vkontakte.android.data.CatalogInfo;
import com.vkontakte.android.data.GameFeedEntry;
import com.vkontakte.android.data.GameGenre;
import com.vkontakte.android.data.GameRequest;
import com.vkontakte.android.data.Games;
import com.vkontakte.android.navigation.ArgKeys;
import com.vkontakte.android.navigation.Navigate;
import com.vkontakte.android.ui.drawables.RequestBgDrawable;
import com.vkontakte.android.ui.holder.RecyclerHolder;
import com.vkontakte.android.ui.holder.RecyclerSectionAdapter;
import com.vkontakte.android.ui.holder.commons.BackgroundHolder;
import com.vkontakte.android.ui.holder.commons.TitleHolder;
import com.vkontakte.android.ui.holder.gamepage.GameBannersHolder;
import com.vkontakte.android.ui.holder.gamepage.GameButtonShowAll;
import com.vkontakte.android.ui.holder.gamepage.GameFeedHolder;
import com.vkontakte.android.ui.holder.gamepage.GameGenresHolder;
import com.vkontakte.android.ui.holder.gamepage.GameHorHolder;
import com.vkontakte.android.ui.holder.gamepage.GameInviteHolder;
import com.vkontakte.android.ui.widget.SubPagerOfList;
import com.vkontakte.android.ui.widget.ViewPagerInfinite;
import com.vkontakte.android.utils.Utils;
import io.fabric.sdk.android.services.common.AbstractSpiCall;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.Iterator;
/* loaded from: classes2.dex */
public class GamesFragment extends CardRecyclerFragment<RecyclerSectionAdapter.Data> implements GameHorHolder.OnNeedLoadNextPage {
    static final int INDEX_HTML5_CATALOG = 0;
    static final int INDEX_MY_CATALOG = 1;
    static final int INDEX_NEW_CATALOG = 2;
    private Adapter adapter;
    private CatalogLoader catalogLoaderHtml5;
    private CatalogLoader catalogLoaderMy;
    private CatalogLoader catalogLoaderNew;
    private ArrayList<WeakReference<RequestBgDrawable>> drawablesList;
    private GameBannersHolder gameBannersHolder;
    private BroadcastReceiver receiver1;
    private BroadcastReceiver receiver2;
    private BroadcastReceiver receiverDeleteRequest;

    public static Bundle createArgs(@Nullable String vs) {
        return Utils.writeString(new Bundle(), ArgKeys.VISIT_SOURCE, vs);
    }

    public GamesFragment() {
        super(1);
        this.gameBannersHolder = null;
        this.drawablesList = new ArrayList<>();
        this.receiver1 = new BroadcastReceiver() { // from class: com.vkontakte.android.fragments.GamesFragment.1
            {
                GamesFragment.this = this;
            }

            @Override // android.content.BroadcastReceiver
            public void onReceive(Context context, Intent intent) {
                if (Games.ACTION_RELOAD_REQUESTS.equals(intent.getAction())) {
                    GamesFragment.this.refresh();
                }
            }
        };
        this.receiver2 = new BroadcastReceiver() { // from class: com.vkontakte.android.fragments.GamesFragment.2
            {
                GamesFragment.this = this;
            }

            @Override // android.content.BroadcastReceiver
            public void onReceive(Context context, Intent intent) {
                if (Games.ACTION_RELOAD_INSTALLED.equals(intent.getAction())) {
                    GamesFragment.this.refresh();
                }
            }
        };
        this.receiverDeleteRequest = new BroadcastReceiver() { // from class: com.vkontakte.android.fragments.GamesFragment.3
            {
                GamesFragment.this = this;
            }

            @Override // android.content.BroadcastReceiver
            public void onReceive(Context context, Intent intent) {
                if (Games.ACTION_DELETE_REQUEST.equals(intent.getAction())) {
                    Activity activity = GamesFragment.this.getActivity();
                    if (GamesFragment.this.adapter != null && GamesFragment.this.adapter.data != null && activity != null) {
                        GamesFragment.this.adapter.removeInvites(Games.getRequestFromIntent(intent), GamesFragment.this.getActivity(), Utils.readString(GamesFragment.this.getArguments(), ArgKeys.VISIT_SOURCE, "direct"));
                        GamesFragment.this.adapter.build();
                    }
                    GamesFragment.this.adapter.clearNotificationOnApp(Games.getRequestFromIntent(intent).appId);
                }
            }
        };
        this.adapter = null;
        this.catalogLoaderHtml5 = null;
        this.catalogLoaderMy = null;
        this.catalogLoaderNew = null;
    }

    @Override // android.app.Fragment
    public void onResume() {
        super.onResume();
        if (this.gameBannersHolder != null) {
            this.gameBannersHolder.getInfiniteViewPager().onResume();
        }
    }

    @Override // android.app.Fragment
    public void onPause() {
        if (this.gameBannersHolder != null) {
            this.gameBannersHolder.getInfiniteViewPager().onPause();
        }
        super.onPause();
    }

    @Override // android.app.DialogFragment, android.app.Fragment
    public void onCreate(Bundle b) {
        super.onCreate(b);
        LocalBroadcastManager.getInstance(getActivity()).registerReceiver(this.receiverDeleteRequest, new IntentFilter(Games.ACTION_DELETE_REQUEST));
        VKApplication.context.registerReceiver(this.receiver1, new IntentFilter(Games.ACTION_RELOAD_REQUESTS), "com.vkontakte.android.permission.ACCESS_DATA", null);
        VKApplication.context.registerReceiver(this.receiver2, new IntentFilter(Games.ACTION_RELOAD_INSTALLED), "com.vkontakte.android.permission.ACCESS_DATA", null);
        Analytics.track("games_visit").addParam("visit_source", Utils.readString(getArguments(), ArgKeys.VISIT_SOURCE, "direct")).commit();
    }

    @Override // me.grishka.appkit.fragments.LoaderFragment, android.app.Fragment
    public void onDestroy() {
        LocalBroadcastManager.getInstance(getActivity()).unregisterReceiver(this.receiverDeleteRequest);
        try {
            VKApplication.context.unregisterReceiver(this.receiver1);
            VKApplication.context.unregisterReceiver(this.receiver2);
        } catch (Exception e) {
        }
        super.onDestroy();
    }

    @Override // com.vkontakte.android.fragments.CardRecyclerFragment, me.grishka.appkit.fragments.BaseRecyclerFragment, me.grishka.appkit.fragments.AppKitFragment, android.app.Fragment
    public void onAttach(Activity act) {
        super.onAttach(act);
        setTitle(R.string.games);
        setHasOptionsMenu(true);
    }

    @Override // com.vkontakte.android.fragments.CardRecyclerFragment, com.vkontakte.android.fragments.VKRecyclerFragment, me.grishka.appkit.fragments.AppKitFragment, android.app.Fragment
    public void onViewCreated(View view, Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);
        if (this.isTablet) {
            this.list.setBackgroundColor(-1315344);
        }
        loadData();
    }

    @Override // me.grishka.appkit.fragments.BaseRecyclerFragment
    /* renamed from: getAdapter */
    public Adapter mo1066getAdapter() {
        if (this.adapter == null) {
            this.adapter = new Adapter();
        }
        return this.adapter;
    }

    @Override // me.grishka.appkit.fragments.BaseRecyclerFragment
    protected void doLoadData(int offset, int count) {
    }

    @Override // me.grishka.appkit.fragments.BaseRecyclerFragment, me.grishka.appkit.fragments.LoaderFragment
    public void doLoadData() {
        this.currentRequest = new AppsGetGamesPage().setCallback(new SimpleCallback<AppsGetGamesPage.Result>(this) { // from class: com.vkontakte.android.fragments.GamesFragment.4
            {
                GamesFragment.this = this;
            }

            @Override // com.vkontakte.android.api.Callback
            public void success(AppsGetGamesPage.Result res) {
                if (GamesFragment.this.isAdded()) {
                    GamesFragment.this.adapter.fillGamePage(res, GamesFragment.this.getActivity(), Utils.readString(GamesFragment.this.getArguments(), ArgKeys.VISIT_SOURCE, "direct"));
                }
                GamesFragment.this.catalogLoaderHtml5 = new CatalogLoader(R.string.htmlgame_htmlgames_title, res.html5Catalog, CatalogInfo.FilterType.html5) { // from class: com.vkontakte.android.fragments.GamesFragment.4.1
                    {
                        AnonymousClass4.this = this;
                    }

                    @Override // com.vkontakte.android.api.apps.CatalogLoader
                    public void onLoadedNextPage(ArrayList<ApiApplication> allData, boolean canLoadMore) {
                        GamesFragment.this.adapter.setHorData(GamesFragment.this.adapter.blockHtml5Catalog, allData);
                    }
                };
                GamesFragment.this.catalogLoaderMy = new CatalogLoader(R.string.installed_games_title, VKAccountManager.getCurrent().htmlGamesEnabled ? res.myCatalogHtml5 : res.myCatalog, CatalogInfo.FilterType.installed, VKAccountManager.getCurrent().htmlGamesEnabled ? "html5" : AbstractSpiCall.ANDROID_CLIENT_TYPE) { // from class: com.vkontakte.android.fragments.GamesFragment.4.2
                    {
                        AnonymousClass4.this = this;
                    }

                    @Override // com.vkontakte.android.api.apps.CatalogLoader
                    public void onLoadedNextPage(ArrayList<ApiApplication> allData, boolean canLoadMore) {
                        GamesFragment.this.adapter.setHorData(GamesFragment.this.adapter.blockMyCatalog, allData);
                    }
                };
                GamesFragment.this.catalogLoaderNew = new CatalogLoader(R.string.new_games_title, res.newCatalog, CatalogInfo.FilterType.filterNew) { // from class: com.vkontakte.android.fragments.GamesFragment.4.3
                    {
                        AnonymousClass4.this = this;
                    }

                    @Override // com.vkontakte.android.api.apps.CatalogLoader
                    public void onLoadedNextPage(ArrayList<ApiApplication> allData, boolean canLoadMore) {
                        GamesFragment.this.adapter.setHorData(GamesFragment.this.adapter.blockNewCatalog, allData);
                    }
                };
                Iterator<ApiApplication> it = res.featuredCatalog.iterator();
                while (it.hasNext()) {
                    ApiApplication app = it.next();
                    app.catalogInfo = new CatalogInfo(R.string.games_banner_title, CatalogInfo.FilterType.featured);
                }
                GamesFragment.this.adapter.build();
                GamesFragment.this.onDataLoaded(GamesFragment.this.adapter.data, false);
                GamesFragment.this.startHidingRequests();
            }

            @Override // com.vkontakte.android.api.SimpleCallback, com.vkontakte.android.api.Callback
            public void fail(VKAPIRequest.VKErrorResponse error) {
                super.fail(error);
            }
        }).exec((Context) getActivity());
    }

    public void startHidingRequests() {
        View view = getView();
        if (view != null) {
            view.postDelayed(GamesFragment$$Lambda$1.lambdaFactory$(this), 2000L);
        }
    }

    public /* synthetic */ void lambda$startHidingRequests$0() {
        if (isResumed()) {
            fadeDrawablesAndHideRequests();
        }
    }

    private void fadeDrawablesAndHideRequests() {
        Games.fadeDrawables(this.drawablesList);
        this.drawablesList.clear();
        if (this.adapter.res != null && this.adapter.res.requests != null && this.adapter.res.requests.size() > 0) {
            ArrayList<GameRequest> toBeMarkedAsRead = new ArrayList<>();
            toBeMarkedAsRead.add(this.adapter.res.requests.get(0));
            Games.markRequestsAsRead(getContext(), toBeMarkedAsRead);
        }
    }

    /* loaded from: classes2.dex */
    public class Adapter extends RecyclerSectionAdapter {
        static final int TYPE_APPS = 7;
        static final int TYPE_BANNERS = 6;
        static final int TYPE_BG = 0;
        static final int TYPE_BUTTON_SHOW_ALL = 3;
        static final int TYPE_FEED = 5;
        static final int TYPE_HORIZONTAL_BLOCK = 4;
        static final int TYPE_REQUEST = 2;
        static final int TYPE_TITLE = 1;
        ArrayList<RecyclerSectionAdapter.Data> blockActivity;
        RecyclerSectionAdapter.Data blockApps;
        RecyclerSectionAdapter.Data blockBanners;
        RecyclerSectionAdapter.Data blockHtml5Catalog;
        RecyclerSectionAdapter.Data blockMyCatalog;
        RecyclerSectionAdapter.Data blockNewCatalog;
        RecyclerSectionAdapter.Data blockPaddingBottom;
        ArrayList<RecyclerSectionAdapter.Data> blockRequests;
        AppsGetGamesPage.Result res;

        private Adapter() {
            GamesFragment.this = r2;
            this.blockRequests = null;
            this.blockMyCatalog = null;
            this.blockHtml5Catalog = null;
            this.blockNewCatalog = null;
            this.blockActivity = null;
            this.blockBanners = null;
            this.blockApps = null;
            this.blockPaddingBottom = null;
            this.res = null;
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        /* renamed from: onCreateViewHolder */
        public RecyclerHolder mo1206onCreateViewHolder(ViewGroup parent, int viewType) {
            Context ctx = parent.getContext();
            String visitSource = Utils.readString(GamesFragment.this.getArguments(), ArgKeys.VISIT_SOURCE, "direct");
            switch (viewType) {
                case 0:
                    return new BackgroundHolder(parent);
                case 1:
                    return TitleHolder.darkGrayTitle(parent);
                case 2:
                    GameInviteHolder inviteHolder = new GameInviteHolder(ctx, visitSource, new RequestBgDrawable());
                    GamesFragment.this.drawablesList.add(new WeakReference(inviteHolder.drawable));
                    return inviteHolder;
                case 3:
                    return new GameButtonShowAll(ctx);
                case 4:
                    return new GameHorHolder(ctx, visitSource);
                case 5:
                    GameFeedHolder holder = new GameFeedHolder(parent, false);
                    holder.setClickInfo(true, Utils.readString(GamesFragment.this.getArguments(), ArgKeys.VISIT_SOURCE, "direct"), "activity");
                    return holder;
                case 6:
                    GamesFragment.this.gameBannersHolder = new GameBannersHolder(ctx, visitSource);
                    ViewPagerInfinite pager = GamesFragment.this.gameBannersHolder.getInfiniteViewPager();
                    if (GamesFragment.this.isResumed()) {
                        pager.onResume();
                    } else {
                        pager.onPause();
                    }
                    return GamesFragment.this.gameBannersHolder;
                case 7:
                    return new GameGenresHolder(parent, visitSource);
                default:
                    return null;
            }
        }

        @Override // me.grishka.appkit.views.UsableRecyclerView.Adapter, me.grishka.appkit.preloading.PrefetchInfoProvider
        public int getImageCountForItem(int position) {
            switch (this.data.get(position).type) {
                case 2:
                case 5:
                    return 2;
                case 3:
                case 4:
                default:
                    return 0;
            }
        }

        void setHorData(@Nullable RecyclerSectionAdapter.Data data, @NonNull ArrayList<ApiApplication> apiApplications) {
            if (data != null && data.object != null) {
                ((GameHorHolder.Ref) data.object).appAdapter.setApiApplications(apiApplications);
            }
        }

        void clearNotificationOnApp(int appId) {
            if (this.blockMyCatalog != null && this.blockMyCatalog.object != null) {
                ((GameHorHolder.Ref) this.blockMyCatalog.object).clearNotificationOnApp(appId);
            }
            if (this.blockNewCatalog != null && this.blockNewCatalog.object != null) {
                ((GameHorHolder.Ref) this.blockNewCatalog.object).clearNotificationOnApp(appId);
            }
        }

        void removeInvites(GameRequest request, @NonNull Activity activity, @NonNull String visitSource) {
            if (this.res != null) {
                this.res.invites.remove(request);
                this.res.requests.remove(request);
                this.res.invitesAndRequests.remove(request);
                fillGameRequest(this.res, activity, visitSource);
            }
        }

        public void build() {
            ArrayList<RecyclerSectionAdapter.Data> data = new ArrayList<>();
            if (this.blockRequests != null && !this.blockRequests.isEmpty()) {
                data.addAll(this.blockRequests);
            }
            if (this.blockHtml5Catalog != null) {
                data.add(this.blockHtml5Catalog);
            }
            if (this.blockMyCatalog != null) {
                data.add(this.blockMyCatalog);
            }
            if (this.blockNewCatalog != null) {
                data.add(this.blockNewCatalog);
            }
            if (this.blockActivity != null && !this.blockActivity.isEmpty()) {
                data.addAll(this.blockActivity);
            }
            if (this.blockBanners != null) {
                data.add(this.blockBanners);
            }
            if (this.blockApps != null) {
                ((SubPagerOfList.ArrayListWithIndex) this.blockApps.object).index = data.size();
                data.add(this.blockApps);
            }
            setData(data);
        }

        private void fillGameRequest(@NonNull AppsGetGamesPage.Result res, @NonNull Activity activity, @NonNull String visitSource) {
            ArrayList<GameRequest> requestsToShow = VKAccountManager.getCurrent().htmlGamesEnabled ? res.invitesAndRequests : res.invites;
            this.blockRequests = new ArrayList<>();
            if (!requestsToShow.isEmpty()) {
                this.blockRequests.add(RecyclerSectionAdapter.Data.middle(1, activity.getResources().getQuantityString(R.plurals.games_invites, requestsToShow.size(), Integer.valueOf(requestsToShow.size()))));
                if (requestsToShow.size() > 1) {
                    this.blockRequests.add(RecyclerSectionAdapter.Data.middle(2, requestsToShow.get(0)));
                    this.blockRequests.add(RecyclerSectionAdapter.Data.middle(0, Integer.valueOf((int) R.drawable.divider_game_feed)));
                    this.blockRequests.add(RecyclerSectionAdapter.Data.bottom(3, new GameButtonShowAll.Ref(R.string.games_show_all_invites, GamesFragment$Adapter$$Lambda$1.lambdaFactory$(requestsToShow, visitSource, activity))));
                    return;
                }
                this.blockRequests.add(RecyclerSectionAdapter.Data.middle(2, requestsToShow.get(0)));
                this.blockRequests.add(this.blockPaddingBottom);
            }
        }

        public void fillGamePage(@NonNull AppsGetGamesPage.Result res, @NonNull Activity activity, @NonNull String visitSource) {
            this.res = res;
            this.blockPaddingBottom = RecyclerSectionAdapter.Data.bottom(0, Integer.valueOf((int) R.drawable.apps_top_padding_white_8));
            fillGameRequest(res, activity, visitSource);
            if (!res.html5Catalog.isEmpty() && VKAccountManager.getCurrent().htmlGamesEnabled) {
                GameHorHolder.Ref data = new GameHorHolder.Ref(R.string.htmlgame_htmlgames_title, 0, GamesFragment.this, res.html5Catalog, new CatalogInfo(R.string.htmlgame_htmlgames_title, CatalogInfo.FilterType.html5), visitSource, true);
                this.blockHtml5Catalog = RecyclerSectionAdapter.Data.middle(4, data);
            }
            ArrayList<ApiApplication> myCatalog = VKAccountManager.getCurrent().htmlGamesEnabled ? res.myCatalogHtml5 : res.myCatalog;
            if (!myCatalog.isEmpty()) {
                String platform = VKAccountManager.getCurrent().htmlGamesEnabled ? "html5" : AbstractSpiCall.ANDROID_CLIENT_TYPE;
                GameHorHolder.Ref data2 = new GameHorHolder.Ref(R.string.installed_games_title, 1, GamesFragment.this, myCatalog, new CatalogInfo(R.string.installed_games_title, CatalogInfo.FilterType.installed, platform), visitSource, true);
                this.blockMyCatalog = RecyclerSectionAdapter.Data.middle(4, data2);
            }
            if (!res.newCatalog.isEmpty()) {
                GameHorHolder.Ref data3 = new GameHorHolder.Ref(R.string.new_games_title, 2, GamesFragment.this, res.newCatalog, new CatalogInfo(R.string.new_games_title, CatalogInfo.FilterType.filterNew), visitSource, false);
                this.blockNewCatalog = RecyclerSectionAdapter.Data.middle(4, data3);
            }
            this.blockActivity = new ArrayList<>();
            if (!res.feed.isEmpty()) {
                this.blockActivity.add(RecyclerSectionAdapter.Data.top(1, Integer.valueOf((int) R.string.games_feed)));
                for (int i = 0; i < res.feed.size(); i++) {
                    GameFeedEntry gameFeedEntry = res.feed.get(i);
                    this.blockActivity.add(RecyclerSectionAdapter.Data.middle(5, gameFeedEntry));
                    this.blockActivity.add(RecyclerSectionAdapter.Data.middle(0, Integer.valueOf((int) R.drawable.divider_game_feed)));
                }
                this.blockActivity.add(RecyclerSectionAdapter.Data.bottom(3, new GameButtonShowAll.Ref(R.string.show_all_feed, GamesFragment$Adapter$$Lambda$2.lambdaFactory$(visitSource, activity))));
            }
            if (!res.featuredCatalog.isEmpty()) {
                this.blockBanners = RecyclerSectionAdapter.Data.top(6, res.featuredCatalog);
            }
            if (!res.genres.isEmpty()) {
                SubPagerOfList.ArrayListWithIndex<GameGenresHolder.GenresData> genresData = new SubPagerOfList.ArrayListWithIndex<>();
                genresData.add(new GameGenresHolder.GenresData(null, res.catalog));
                Iterator<GameGenre> it = res.genres.iterator();
                while (it.hasNext()) {
                    GameGenre genre = it.next();
                    genresData.add(new GameGenresHolder.GenresData(genre, new ArrayList()));
                }
                this.blockApps = RecyclerSectionAdapter.Data.bottom(7, genresData);
            }
        }

        public static /* synthetic */ void lambda$fillGamePage$1(@NonNull String visitSource, @NonNull Activity activity, View v) {
            Navigate.to(GamesFeedFragment.class, GamesFeedFragment.createArgs(visitSource), activity);
        }
    }

    @Override // com.vkontakte.android.ui.holder.gamepage.GameHorHolder.OnNeedLoadNextPage
    public void onNeedLoadNextPage(int index) {
        if (index == 2 && this.catalogLoaderNew != null) {
            this.catalogLoaderNew.forceLoadNextPage();
        }
        if (index == 1 && this.catalogLoaderMy != null) {
            this.catalogLoaderMy.forceLoadNextPage();
        }
        if (index == 0 && this.catalogLoaderHtml5 != null) {
            this.catalogLoaderHtml5.forceLoadNextPage();
        }
    }
}
