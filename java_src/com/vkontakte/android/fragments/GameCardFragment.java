package com.vkontakte.android.fragments;

import android.app.Activity;
import android.app.NotificationManager;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.graphics.drawable.Drawable;
import android.os.Bundle;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.v4.content.LocalBroadcastManager;
import android.text.TextUtils;
import android.view.GestureDetector;
import android.view.LayoutInflater;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;
import android.widget.Toast;
import com.vk.imageloader.view.VKImageView;
import com.vkontakte.android.GCMBroadcastReceiver;
import com.vkontakte.android.GameCardActivity;
import com.vkontakte.android.NewsEntry;
import com.vkontakte.android.R;
import com.vkontakte.android.VKApplication;
import com.vkontakte.android.api.APIUtils;
import com.vkontakte.android.api.SimpleCallback;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.api.apps.AppsGetGamePage;
import com.vkontakte.android.api.apps.SDKAppSendRequest;
import com.vkontakte.android.api.wall.WallGet;
import com.vkontakte.android.data.ApiApplication;
import com.vkontakte.android.data.GameFeedEntry;
import com.vkontakte.android.data.GameRequest;
import com.vkontakte.android.data.Games;
import com.vkontakte.android.data.db.Database;
import com.vkontakte.android.navigation.ArgKeys;
import com.vkontakte.android.navigation.Navigate;
import com.vkontakte.android.ui.CardItemDecorator;
import com.vkontakte.android.ui.drawables.RequestBgDrawable;
import com.vkontakte.android.ui.holder.RecyclerHolder;
import com.vkontakte.android.ui.holder.RecyclerSectionAdapter;
import com.vkontakte.android.ui.holder.commons.BackgroundHolder;
import com.vkontakte.android.ui.holder.commons.LoaderHolder;
import com.vkontakte.android.ui.holder.commons.TitleHolder;
import com.vkontakte.android.ui.holder.gamepage.GameButtonShowAll;
import com.vkontakte.android.ui.holder.gamepage.GameFeedHolder;
import com.vkontakte.android.ui.holder.gamepage.GameIconButtonHolder;
import com.vkontakte.android.ui.holder.gamepage.GameInfoHolder;
import com.vkontakte.android.ui.holder.gamepage.GameInviteHolder;
import com.vkontakte.android.ui.holder.gamepage.GameLeaderboardHolder;
import com.vkontakte.android.ui.holder.gamepage.GameNewsTitle;
import com.vkontakte.android.ui.holder.gamepage.GameRequestHolder;
import com.vkontakte.android.utils.Utils;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import me.grishka.appkit.utils.MergeRecyclerAdapter;
import me.grishka.appkit.utils.V;
import me.grishka.appkit.views.UsableRecyclerView;
/* loaded from: classes2.dex */
public class GameCardFragment extends PostListFragment {
    public static final int INVITE_RESULT = 3903;
    private static final String KEY_APP = "app";
    private static final String KEY_APP_INDEX = "app_index_in_list";
    @Nullable
    private ApiApplication apiApplication;
    private TextView buttonPlay;
    private ArrayList<WeakReference<RequestBgDrawable>> drawablesList;
    private int fixedPostId;
    private Adapter gameAdapter;
    private int groupId;
    private IOnListViewCreated iOnListViewCreated;
    private VKImageView imageViewIcon;
    private String nextFrom;
    private BroadcastReceiver receiver;
    private BroadcastReceiver receiverDeleteRequest;
    private BroadcastReceiver receiverReloadInstalled;
    private TextView textViewGenre;
    private TextView textViewName;

    /* loaded from: classes2.dex */
    public interface IOnListViewCreated {
        void onRecycleViewCreated(UsableRecyclerView usableRecyclerView, int i);
    }

    public GameCardFragment() {
        super(R.layout.game_card_fragment);
        this.drawablesList = new ArrayList<>();
        this.groupId = 0;
        this.nextFrom = null;
        this.gameAdapter = new Adapter(new View.OnClickListener() { // from class: com.vkontakte.android.fragments.GameCardFragment.1
            {
                GameCardFragment.this = this;
            }

            @Override // android.view.View.OnClickListener
            public void onClick(View v) {
                GameCardFragment.this.gameAdapter.showAllRequest = true;
                GameCardFragment.this.gameAdapter.fillRequests();
                GameCardFragment.this.gameAdapter.build();
            }
        }, this);
        this.iOnListViewCreated = null;
        this.receiver = new BroadcastReceiver() { // from class: com.vkontakte.android.fragments.GameCardFragment.2
            {
                GameCardFragment.this = this;
            }

            @Override // android.content.BroadcastReceiver
            public void onReceive(Context context, Intent intent) {
                if (Games.ACTION_RELOAD_REQUESTS.equals(intent.getAction())) {
                    if (!GameCardFragment.this.loaded) {
                        GameCardFragment.this.loadData();
                    }
                    GameCardFragment.this.doLoadData();
                }
            }
        };
        this.receiverDeleteRequest = new BroadcastReceiver() { // from class: com.vkontakte.android.fragments.GameCardFragment.3
            {
                GameCardFragment.this = this;
            }

            @Override // android.content.BroadcastReceiver
            public void onReceive(Context context, Intent intent) {
                if (Games.ACTION_DELETE_REQUEST_ALL.equals(intent.getAction())) {
                    Activity activity = GameCardFragment.this.getActivity();
                    if (GameCardFragment.this.adapter != null && GameCardFragment.this.gameAdapter.data != null && activity != null) {
                        GameCardFragment.this.gameAdapter.removeRequests(Games.getRequestFromIntent(intent), GameCardFragment.this.getActivity());
                        GameCardFragment.this.gameAdapter.build();
                    }
                }
            }
        };
        this.receiverReloadInstalled = new BroadcastReceiver() { // from class: com.vkontakte.android.fragments.GameCardFragment.4
            {
                GameCardFragment.this = this;
            }

            @Override // android.content.BroadcastReceiver
            public void onReceive(Context context, Intent intent) {
                if (Games.ACTION_RELOAD_INSTALLED.equals(intent.getAction())) {
                    GameCardFragment.this.onRefresh();
                }
            }
        };
    }

    @Override // com.vkontakte.android.fragments.PostListFragment, android.app.Fragment
    public void onResume() {
        super.onResume();
        NotificationManager nm = (NotificationManager) getActivity().getSystemService("notification");
        nm.cancel(GCMBroadcastReceiver.ID_GAME_NOTIFICATION);
    }

    @Override // com.vkontakte.android.fragments.PostListFragment, android.app.Fragment
    public void onActivityResult(int reqCode, int resultCode, Intent data) {
        if (reqCode == 3903 && resultCode == -1) {
            Bundle b = data.getExtras();
            new SDKAppSendRequest(b.getInt(ArgKeys.UID), null, null, getApplication().id).setCallback(new SimpleCallback<Integer>() { // from class: com.vkontakte.android.fragments.GameCardFragment.5
                {
                    GameCardFragment.this = this;
                }

                @Override // com.vkontakte.android.api.Callback
                public void success(Integer result) {
                    Activity activity = GameCardFragment.this.getActivity();
                    if (activity != null) {
                        Toast.makeText(GameCardFragment.this.getActivity(), (int) R.string.invitation_sent, 0).show();
                    }
                }

                @Override // com.vkontakte.android.api.SimpleCallback, com.vkontakte.android.api.Callback
                public void fail(VKAPIRequest.VKErrorResponse error) {
                    super.fail(error);
                    Activity activity = GameCardFragment.this.getActivity();
                    if (activity != null) {
                        APIUtils.showErrorToast(activity, error.getCode(), error.message);
                    }
                }
            }).wrapProgress(getActivity()).exec((Context) getActivity());
            return;
        }
        super.onActivityResult(reqCode, resultCode, data);
    }

    @Override // com.vkontakte.android.fragments.VKRecyclerFragment, me.grishka.appkit.fragments.BaseRecyclerFragment, me.grishka.appkit.fragments.LoaderFragment
    public View onCreateContentView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        View view = super.onCreateContentView(inflater, container, savedInstanceState);
        if (this.iOnListViewCreated != null) {
            this.iOnListViewCreated.onRecycleViewCreated(this.list, getApplicationIndex());
        }
        return view;
    }

    @Override // com.vkontakte.android.fragments.PostListFragment, android.app.DialogFragment, android.app.Fragment
    public void onCreate(Bundle b) {
        super.onCreate(b);
        LocalBroadcastManager.getInstance(getActivity()).registerReceiver(this.receiverDeleteRequest, new IntentFilter(Games.ACTION_DELETE_REQUEST_ALL));
        VKApplication.context.registerReceiver(this.receiverReloadInstalled, new IntentFilter(Games.ACTION_RELOAD_INSTALLED), "com.vkontakte.android.permission.ACCESS_DATA", null);
        VKApplication.context.registerReceiver(this.receiver, new IntentFilter(Games.ACTION_RELOAD_REQUESTS), "com.vkontakte.android.permission.ACCESS_DATA", null);
    }

    @Override // com.vkontakte.android.fragments.PostListFragment, me.grishka.appkit.fragments.LoaderFragment, android.app.Fragment
    public void onDestroy() {
        LocalBroadcastManager.getInstance(getActivity()).unregisterReceiver(this.receiverDeleteRequest);
        try {
            VKApplication.context.unregisterReceiver(this.receiverReloadInstalled);
            VKApplication.context.unregisterReceiver(this.receiver);
        } catch (Exception e) {
        }
        super.onDestroy();
    }

    @Override // com.vkontakte.android.fragments.PostListFragment, com.vkontakte.android.fragments.CardRecyclerFragment, me.grishka.appkit.fragments.BaseRecyclerFragment, me.grishka.appkit.fragments.LoaderFragment, me.grishka.appkit.fragments.AppKitFragment, android.app.DialogFragment, android.app.Fragment
    public void onDestroyView() {
        super.onDestroyView();
        this.imageViewIcon = null;
        this.textViewName = null;
        this.buttonPlay = null;
        this.textViewGenre = null;
    }

    @Override // com.vkontakte.android.fragments.PostListFragment, com.vkontakte.android.fragments.CardRecyclerFragment, com.vkontakte.android.fragments.VKRecyclerFragment, me.grishka.appkit.fragments.AppKitFragment, android.app.Fragment
    public void onViewCreated(View view, Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);
        getToolbar().setNavigationIcon((Drawable) null);
        getToolbar().setContentInsetsAbsolute(0, 0);
        setRefreshEnabled(false);
        View view2 = view.findViewById(R.id.apps_header);
        GestureDetector gestureDetector = new GestureDetector(getActivity(), new GestureDetector.SimpleOnGestureListener() { // from class: com.vkontakte.android.fragments.GameCardFragment.6
            {
                GameCardFragment.this = this;
            }

            @Override // android.view.GestureDetector.SimpleOnGestureListener, android.view.GestureDetector.OnGestureListener
            public boolean onDown(MotionEvent e) {
                return true;
            }

            @Override // android.view.GestureDetector.SimpleOnGestureListener, android.view.GestureDetector.OnDoubleTapListener
            public boolean onDoubleTap(MotionEvent e) {
                if (GameCardFragment.this.list != null) {
                    GameCardFragment.this.list.smoothScrollToPosition(0);
                    return true;
                }
                return true;
            }
        });
        view2.setOnTouchListener(GameCardFragment$$Lambda$1.lambdaFactory$(gestureDetector));
        this.imageViewIcon = (VKImageView) view2.findViewById(16908294);
        this.textViewName = (TextView) view2.findViewById(16908308);
        this.buttonPlay = (TextView) view2.findViewById(R.id.button_play);
        this.textViewGenre = (TextView) view2.findViewById(16908309);
        view2.findViewById(R.id.button_play).setOnClickListener(GameCardFragment$$Lambda$2.lambdaFactory$(this));
        fillHeader();
    }

    @Override // com.vkontakte.android.fragments.PostListFragment
    public /* synthetic */ void lambda$onViewCreated$1(View v) {
        Games.open(getApplication(), null, getActivity(), Utils.readString(getArguments(), ArgKeys.VISIT_SOURCE, "direct"), Utils.readString(getArguments(), ArgKeys.CLICK_SOURCE, "catalog"));
    }

    @Override // com.vkontakte.android.fragments.PostListFragment
    protected String getReferer() {
        return "wall_game";
    }

    @Override // com.vkontakte.android.fragments.PostListFragment
    protected String getListReferrer() {
        return null;
    }

    @Override // me.grishka.appkit.fragments.BaseRecyclerFragment
    protected void doLoadData(int offset, int count) {
        if (offset == 0) {
            loadInitial(this.refreshing, count);
        } else {
            loadWall(offset, count);
        }
    }

    @Override // com.vkontakte.android.fragments.PostListFragment, me.grishka.appkit.fragments.BaseRecyclerFragment
    /* renamed from: getAdapter */
    public UsableRecyclerView.Adapter mo1066getAdapter() {
        if (this.adapter == null) {
            UsableRecyclerView.Adapter newsAdapter = super.mo1066getAdapter();
            MergeRecyclerAdapterProvider mergeAdapter = new MergeRecyclerAdapterProvider();
            mergeAdapter.addAdapter(this.gameAdapter);
            mergeAdapter.addAdapter(newsAdapter);
            this.adapter = mergeAdapter;
        }
        return this.adapter;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.vkontakte.android.fragments.PostListFragment, me.grishka.appkit.fragments.BaseRecyclerFragment
    public void onDataLoaded(List<NewsEntry> d, boolean more) {
        boolean z = false;
        int sizeAll = this.data != null ? this.data.size() : 0;
        int size = d != null ? d.size() : 0;
        Adapter adapter = this.gameAdapter;
        if (sizeAll + size > 0) {
            z = true;
        }
        adapter.build(z);
        super.onDataLoaded(d, more);
    }

    public ApiApplication getApplication() {
        if (this.apiApplication == null) {
            this.apiApplication = (ApiApplication) getArguments().getParcelable("app");
        }
        return this.apiApplication;
    }

    private int getApplicationIndex() {
        return getArguments().getInt(KEY_APP_INDEX);
    }

    public void setOnListViewCreated(IOnListViewCreated iOnListViewCreated) {
        this.iOnListViewCreated = iOnListViewCreated;
        if (this.list != null && iOnListViewCreated != null) {
            iOnListViewCreated.onRecycleViewCreated(this.list, getApplicationIndex());
        }
    }

    public void fillHeader() {
        if (this.imageViewIcon != null && this.textViewName != null && this.textViewGenre != null && this.buttonPlay != null) {
            if (getApplication().icon != null && !getApplication().icon.sizes.isEmpty()) {
                this.imageViewIcon.load(getApplication().icon.getImageByWidth(V.dp(48.0f)).url);
            }
            this.textViewName.setText(getApplication().title);
            this.textViewGenre.setText(getApplication().genre);
            this.buttonPlay.setText(getApplication().installedOnDevice ? R.string.games_play_header : R.string.games_install_header);
        }
    }

    /* JADX WARN: Type inference failed for: r2v1, types: [com.vkontakte.android.fragments.GameCardFragment$7] */
    public void fadeDrawablesAndHideRequests() {
        Games.fadeDrawables(this.drawablesList);
        final Activity activity = getActivity();
        new Thread() { // from class: com.vkontakte.android.fragments.GameCardFragment.7
            {
                GameCardFragment.this = this;
            }

            @Override // java.lang.Thread, java.lang.Runnable
            public void run() {
                if (GameCardFragment.this.gameAdapter.res != null && activity != null) {
                    List<GameRequest> gameRequests = Database.getInst(activity).getRequests(GameCardFragment.this.gameAdapter.res.application.id, null);
                    Iterator<GameRequest> it = GameCardFragment.this.gameAdapter.res.requestsServer.iterator();
                    while (it.hasNext()) {
                        GameRequest gameRequest = it.next();
                        if (!gameRequests.contains(gameRequest)) {
                            Database.getInst(activity).insertRequest(gameRequest);
                            gameRequest.fromDb = true;
                        }
                    }
                }
            }
        }.start();
        if (this.gameAdapter.res != null && activity != null) {
            Iterator<GameRequest> it = this.gameAdapter.res.requestsServerReal.iterator();
            while (it.hasNext()) {
                GameRequest gameRequest = it.next();
                if (!gameRequest.fromDb) {
                    Games.deleteRequest(activity, gameRequest);
                }
                gameRequest.fromDb = true;
            }
        }
    }

    @Override // com.vkontakte.android.fragments.PostListFragment
    protected int getPostsOffset() {
        if (this.gameAdapter == null) {
            return 0;
        }
        return this.gameAdapter.getItemCount();
    }

    public void startHidingRequest() {
        View view = getView();
        if (view != null) {
            view.postDelayed(GameCardFragment$$Lambda$3.lambdaFactory$(this), 2000L);
        }
    }

    public /* synthetic */ void lambda$startHidingRequest$2() {
        if (isResumed()) {
            fadeDrawablesAndHideRequests();
        }
    }

    public void loadInitial(boolean refresh, final int count) {
        final Activity activity = getActivity();
        ApiApplication application = getApplication();
        this.currentRequest = new AppsGetGamePage(application.id, Database.getInst(getActivity())).setCallback(new SimpleCallback<AppsGetGamePage.Result>(this) { // from class: com.vkontakte.android.fragments.GameCardFragment.8
            {
                GameCardFragment.this = this;
            }

            @Override // com.vkontakte.android.api.Callback
            public void success(AppsGetGamePage.Result res) {
                if (activity instanceof GameCardActivity) {
                    ((GameCardActivity) activity).updateApiAppItem(res.application);
                }
                GameCardFragment.this.apiApplication = res.application;
                GameCardFragment.this.fillHeader();
                GameCardFragment.this.gameAdapter.fillGamePage(res, activity, Utils.readString(GameCardFragment.this.getArguments(), ArgKeys.VISIT_SOURCE, "direct"));
                GameCardFragment.this.gameAdapter.build(GameCardFragment.this.items.size() > 0);
                GameCardFragment.this.updateList();
                GameCardFragment.this.currentRequest = null;
                if (res.application != null) {
                    GameCardFragment.this.groupId = -res.application.author_group;
                    GameCardFragment.this.loadWall(0, count);
                }
                GameCardFragment.this.dataLoaded();
                GameCardFragment.this.startHidingRequest();
            }
        }).exec((Context) getActivity());
    }

    public void loadWall(int _offset, final int count) {
        if (_offset <= 0) {
            this.offset = 0;
            this.nextFrom = null;
        }
        this.currentRequest = new WallGet(this.groupId, this.nextFrom, count, true, getListReferrer()).setCallback(new SimpleCallback<WallGet.Result>(this) { // from class: com.vkontakte.android.fragments.GameCardFragment.9
            {
                GameCardFragment.this = this;
            }

            @Override // com.vkontakte.android.api.Callback
            public void success(WallGet.Result res) {
                if (GameCardFragment.this.getActivity() != null) {
                    if (GameCardFragment.this.refreshing && res.news.size() > 0 && ((NewsEntry) res.news.get(0)).flag(1024)) {
                        GameCardFragment.this.fixedPostId = ((NewsEntry) res.news.get(0)).postID;
                    }
                    Iterator it = res.news.iterator();
                    while (true) {
                        if (!it.hasNext()) {
                            break;
                        }
                        NewsEntry p = (NewsEntry) it.next();
                        if (p.postID == GameCardFragment.this.fixedPostId && !p.flag(1024)) {
                            res.news.remove(p);
                            break;
                        }
                    }
                    GameCardFragment.this.offset += count;
                    if (!GameCardFragment.this.refreshing) {
                        Iterator<NewsEntry> itr = res.news.iterator();
                        while (itr.hasNext()) {
                            NewsEntry e = itr.next();
                            if (!GameCardFragment.removeNewsFromIterator(itr, e, GameCardFragment.this.data)) {
                                GameCardFragment.removeNewsFromIterator(itr, e, GameCardFragment.this.preloadedData);
                            }
                        }
                    }
                    if (TextUtils.isEmpty(res.next_from)) {
                        GameCardFragment.this.nextFrom = null;
                        GameCardFragment.this.onDataLoaded(res.news, false);
                        return;
                    }
                    GameCardFragment.this.nextFrom = res.next_from;
                    GameCardFragment.this.onDataLoaded(res.news, true);
                }
            }

            @Override // com.vkontakte.android.api.SimpleCallback, com.vkontakte.android.api.Callback
            public void fail(VKAPIRequest.VKErrorResponse err) {
                GameCardFragment.this.currentRequest = null;
            }
        }).exec((Context) getActivity());
    }

    public static Bundle createArgs(ApiApplication application, int index, @NonNull String visitSource, @NonNull String clickSource) {
        Bundle bundle = new Bundle();
        bundle.putParcelable("app", application);
        bundle.putInt(KEY_APP_INDEX, index);
        bundle.putString(ArgKeys.VISIT_SOURCE, visitSource);
        bundle.putString(ArgKeys.CLICK_SOURCE, clickSource);
        return bundle;
    }

    public static boolean removeNewsFromIterator(Iterator<NewsEntry> itr, NewsEntry e, Collection<NewsEntry> newsEntries) {
        for (NewsEntry ee : newsEntries) {
            if (e.postID == ee.postID) {
                itr.remove();
                return true;
            }
        }
        return false;
    }

    /* loaded from: classes2.dex */
    public static class Adapter extends RecyclerSectionAdapter {
        static final int TYPE_APP_INFO = 2131755054;
        static final int TYPE_BG = 2131755055;
        static final int TYPE_BUTTON_SHOW_ALL = 2131755056;
        static final int TYPE_FEED_ENTRY_WITHOUT_DATE = 2131755058;
        static final int TYPE_FEED_ENTRY_WITH_DATE = 2131755057;
        static final int TYPE_INVITE = 2131755060;
        static final int TYPE_LEADER_BOARD_ITEM = 2131755061;
        static final int TYPE_LOADER = 2131755062;
        static final int TYPE_NEWS_TITLE = 2131755063;
        static final int TYPE_REQUEST = 2131755064;
        static final int TYPE_SETTING_BUTTON = 2131755065;
        static final int TYPE_SHARE_BUTTON = 2131755066;
        static final int TYPE_TITLE = 2131755059;
        ApiApplication apiApplication;
        GameCardFragment fragment;
        final View.OnClickListener onClickListener;
        RecyclerSectionAdapter.Data blockAppInfo = null;
        RecyclerSectionAdapter.Data blockPaddingBottom = null;
        ArrayList<RecyclerSectionAdapter.Data> blockRequests = null;
        ArrayList<RecyclerSectionAdapter.Data> blockActivity = null;
        ArrayList<RecyclerSectionAdapter.Data> blockSettings = null;
        ArrayList<RecyclerSectionAdapter.Data> blockLeaderboard = null;
        RecyclerSectionAdapter.Data blockNews = null;
        RecyclerSectionAdapter.Data blockLoader = null;
        GameInfoHolder.Ref blockAppInfoRef = null;
        AppsGetGamePage.Result res = null;
        boolean showNews = false;
        boolean showAllRequest = false;

        @Override // android.support.v7.widget.RecyclerView.Adapter
        /* renamed from: onCreateViewHolder */
        public RecyclerHolder mo1206onCreateViewHolder(ViewGroup parent, int viewType) {
            Context ctx = parent.getContext();
            switch (viewType) {
                case R.id.game_card_adapter_appInfo /* 2131755054 */:
                    return new GameInfoHolder(ctx, this);
                case R.id.game_card_adapter_bg /* 2131755055 */:
                    return new BackgroundHolder(parent);
                case R.id.game_card_adapter_buttonShowAll /* 2131755056 */:
                    return new GameButtonShowAll(ctx);
                case R.id.game_card_adapter_feedEntryWithDate /* 2131755057 */:
                    GameFeedHolder holder = new GameFeedHolder(parent, true);
                    holder.setClickInfo(false, Utils.readString(this.fragment.getArguments(), ArgKeys.VISIT_SOURCE, "direct"), Utils.readString(this.fragment.getArguments(), ArgKeys.CLICK_SOURCE, "catalog"));
                    return holder;
                case R.id.game_card_adapter_feedEntryWithoutDate /* 2131755058 */:
                    GameFeedHolder holder2 = new GameFeedHolder(parent, false);
                    holder2.setClickInfo(false, Utils.readString(this.fragment.getArguments(), ArgKeys.VISIT_SOURCE, "direct"), Utils.readString(this.fragment.getArguments(), ArgKeys.CLICK_SOURCE, "catalog"));
                    return holder2;
                case R.id.game_card_adapter_gameBlockTitle /* 2131755059 */:
                    return TitleHolder.darkGrayTitle(parent);
                case R.id.game_card_adapter_invite /* 2131755060 */:
                    GameInviteHolder inviteHolder = new GameInviteHolder(ctx, Utils.readString(this.fragment.getArguments(), ArgKeys.VISIT_SOURCE, "direct"), new RequestBgDrawable());
                    RequestBgDrawable bgDrawable = inviteHolder.drawable;
                    this.fragment.drawablesList.add(new WeakReference(bgDrawable));
                    return inviteHolder;
                case R.id.game_card_adapter_lidearboardItem /* 2131755061 */:
                    return new GameLeaderboardHolder(ctx);
                case R.id.game_card_adapter_loader /* 2131755062 */:
                    return new LoaderHolder(parent);
                case R.id.game_card_adapter_newsTitle /* 2131755063 */:
                    return new GameNewsTitle(ctx);
                case R.id.game_card_adapter_request /* 2131755064 */:
                    GameRequestHolder requestHolder = new GameRequestHolder(ctx, Utils.readString(this.fragment.getArguments(), ArgKeys.VISIT_SOURCE, "direct"), new RequestBgDrawable(), R.layout.apps_req_item);
                    RequestBgDrawable bgDrawableRequest = requestHolder.drawable;
                    this.fragment.drawablesList.add(new WeakReference(bgDrawableRequest));
                    return requestHolder;
                case R.id.game_card_adapter_settingButton /* 2131755065 */:
                    return new GameIconButtonHolder(ctx, true);
                case R.id.game_card_adapter_shareButton /* 2131755066 */:
                    return new GameIconButtonHolder(ctx, false);
                default:
                    return null;
            }
        }

        public Adapter(View.OnClickListener onClickListener, GameCardFragment fragment) {
            this.onClickListener = onClickListener;
            this.fragment = fragment;
        }

        public void removeRequests(GameRequest request, @NonNull Activity activity) {
            if (this.res != null) {
                this.res.requestsServer.remove(request);
                this.res.requestsServerReal.remove(request);
                this.res.requestsDb.remove(request);
                Database.getInst(activity).removeRequest(request);
                fillRequests();
            }
        }

        public void build() {
            build(this.showNews);
        }

        public void build(boolean showNews) {
            this.showNews = showNews;
            ArrayList<RecyclerSectionAdapter.Data> data = new ArrayList<>();
            if (this.blockAppInfo != null) {
                data.add(this.blockAppInfo);
            }
            if (this.blockRequests != null && !this.blockRequests.isEmpty()) {
                data.addAll(this.blockRequests);
            }
            if (this.blockActivity != null && !this.blockActivity.isEmpty()) {
                data.addAll(this.blockActivity);
            }
            if (this.blockLeaderboard != null && !this.blockLeaderboard.isEmpty()) {
                data.addAll(this.blockLeaderboard);
            }
            if (this.blockSettings != null && !this.blockSettings.isEmpty()) {
                data.addAll(this.blockSettings);
            }
            if (showNews && this.blockNews != null) {
                data.add(this.blockNews);
            } else if (this.fragment.items == null || this.fragment.items.isEmpty()) {
                data.add(this.blockLoader);
            }
            setData(data);
        }

        public void fillRequests() {
            this.blockRequests = null;
            int allCount = 0;
            int showedCount = 0;
            if (!this.res.requestsServer.isEmpty()) {
                allCount = 0 + this.res.requestsServer.size();
                this.blockRequests = new ArrayList<>();
                this.blockRequests.add(RecyclerSectionAdapter.Data.top(R.id.game_card_adapter_gameBlockTitle, Integer.valueOf((int) R.string.games_requests_title)));
                for (int i = this.res.requestsServer.size() - 1; i >= 0; i--) {
                    this.blockRequests.add(RecyclerSectionAdapter.Data.middle(R.id.game_card_adapter_request, this.res.requestsServer.get(i)));
                    showedCount++;
                    if (i != 0) {
                        this.blockRequests.add(RecyclerSectionAdapter.Data.middle(R.id.game_card_adapter_bg, Integer.valueOf((int) R.drawable.divider_game_feed)));
                    }
                }
            }
            if (!this.res.requestsDb.isEmpty()) {
                int allCount2 = allCount + this.res.requestsDb.size();
                if (this.blockRequests == null) {
                    this.blockRequests = new ArrayList<>();
                    this.blockRequests.add(RecyclerSectionAdapter.Data.top(R.id.game_card_adapter_gameBlockTitle, Integer.valueOf((int) R.string.games_requests_title)));
                }
                int i2 = this.res.requestsDb.size() - 1;
                while (true) {
                    if ((i2 > this.res.requestsDb.size() - 3 || this.showAllRequest) && i2 >= 0) {
                        if (this.blockRequests.size() > 1) {
                            this.blockRequests.add(RecyclerSectionAdapter.Data.middle(R.id.game_card_adapter_bg, Integer.valueOf((int) R.drawable.divider_game_feed)));
                        }
                        this.blockRequests.add(RecyclerSectionAdapter.Data.middle(R.id.game_card_adapter_request, this.res.requestsDb.get(i2)));
                        showedCount++;
                        i2--;
                    }
                }
                if (!this.showAllRequest && showedCount < allCount2) {
                    this.blockRequests.add(RecyclerSectionAdapter.Data.middle(R.id.game_card_adapter_bg, Integer.valueOf((int) R.drawable.divider_game_feed)));
                    this.blockRequests.add(RecyclerSectionAdapter.Data.bottom(R.id.game_card_adapter_buttonShowAll, new GameButtonShowAll.Ref(R.string.games_show_all_requests, this.onClickListener)));
                    return;
                }
                this.blockRequests.add(this.blockPaddingBottom);
            } else if (this.blockRequests != null) {
                this.blockRequests.add(this.blockPaddingBottom);
            }
        }

        public void fillGamePage(@NonNull AppsGetGamePage.Result res, @NonNull Activity activity, @NonNull String visitSource) {
            this.apiApplication = res.application;
            this.res = res;
            if (res.application != null && !res.application.installed) {
                GameInfoHolder.Ref ref = new GameInfoHolder.Ref(res.application, res.userPlayed);
                this.blockAppInfoRef = ref;
                this.blockAppInfo = RecyclerSectionAdapter.Data.topBottom(R.id.game_card_adapter_appInfo, ref);
            }
            this.blockPaddingBottom = RecyclerSectionAdapter.Data.bottom(R.id.game_card_adapter_bg, Integer.valueOf((int) R.drawable.apps_top_padding_white_8));
            fillRequests();
            if (res.application != null && res.application.installed) {
                this.blockSettings = new ArrayList<>();
                this.blockSettings.add(RecyclerSectionAdapter.Data.top(R.id.game_card_adapter_settingButton, this.fragment));
                this.blockSettings.add(RecyclerSectionAdapter.Data.middle(R.id.game_card_adapter_bg, Integer.valueOf((int) R.drawable.divider_game_match_parent)));
                this.blockSettings.add(RecyclerSectionAdapter.Data.bottom(R.id.game_card_adapter_shareButton, this.fragment));
            }
            if (!res.gameLeaderboards.isEmpty()) {
                this.blockLeaderboard = new ArrayList<>();
                this.blockLeaderboard.add(RecyclerSectionAdapter.Data.top(R.id.game_card_adapter_gameBlockTitle, Integer.valueOf((int) R.string.games_leaderboard_title)));
                for (int i = 0; i < res.gameLeaderboards.size() && i < 5; i++) {
                    this.blockLeaderboard.add(RecyclerSectionAdapter.Data.middle(R.id.game_card_adapter_lidearboardItem, new GameLeaderboardHolder.Data(res.gameLeaderboards.get(i), i + 1)));
                }
                this.blockLeaderboard.add(this.blockPaddingBottom);
            }
            if (!res.feed.isEmpty()) {
                this.blockActivity = new ArrayList<>();
                String title = activity.getResources().getString(R.string.games_feed);
                this.blockActivity.add(RecyclerSectionAdapter.Data.top(R.id.game_card_adapter_gameBlockTitle, title));
                for (int i2 = 0; i2 < res.feed.size(); i2++) {
                    GameFeedEntry gameFeedEntry = res.feed.get(i2);
                    this.blockActivity.add(RecyclerSectionAdapter.Data.middle(R.id.game_card_adapter_feedEntryWithDate, gameFeedEntry));
                    if (i2 < res.feed.size() - 1) {
                        this.blockActivity.add(RecyclerSectionAdapter.Data.middle(R.id.game_card_adapter_bg, Integer.valueOf((int) R.drawable.divider_game_feed)));
                    }
                }
                if (res.feed.size() > 1) {
                    this.blockActivity.add(RecyclerSectionAdapter.Data.middle(R.id.game_card_adapter_bg, Integer.valueOf((int) R.drawable.divider_game_feed)));
                    this.blockActivity.add(RecyclerSectionAdapter.Data.bottom(R.id.game_card_adapter_buttonShowAll, new GameButtonShowAll.Ref(R.string.show_all_feed, GameCardFragment$Adapter$$Lambda$1.lambdaFactory$(this, visitSource, activity))));
                } else {
                    this.blockActivity.add(this.blockPaddingBottom);
                }
            }
            GameNewsTitle.Data data = new GameNewsTitle.Data(this.apiApplication.author_group, res.isMember);
            this.blockNews = RecyclerSectionAdapter.Data.none(R.id.game_card_adapter_newsTitle, data);
            this.blockLoader = RecyclerSectionAdapter.Data.none(R.id.game_card_adapter_loader, data);
        }

        public /* synthetic */ void lambda$fillGamePage$0(@NonNull String visitSource, @NonNull Activity activity, View v) {
            Navigate.to(GamesFeedFragment.class, GamesFeedFragment.createArgs(visitSource, this.apiApplication.id), activity);
        }
    }

    /* loaded from: classes2.dex */
    public static class MergeRecyclerAdapterProvider extends MergeRecyclerAdapter implements CardItemDecorator.Provider {
        MergeRecyclerAdapterProvider() {
        }

        @Override // com.vkontakte.android.ui.CardItemDecorator.Provider
        public int getBlockType(int position) {
            return ((CardItemDecorator.Provider) getAdapterForPosition(position)).getBlockType(getAdapterPosition(position));
        }
    }

    @Override // com.vkontakte.android.fragments.CardRecyclerFragment
    protected CardItemDecorator onCreateCardDecorator() {
        boolean z = true;
        boolean isTabletDecorator = this.scrW >= 924;
        UsableRecyclerView usableRecyclerView = this.list;
        if (isTabletDecorator) {
            z = false;
        }
        CardItemDecorator decorator = new CardItemDecorator(usableRecyclerView, z);
        decorator.setPadding(V.dp(2.0f), V.dp(3.0f), V.dp(8.0f), 0);
        int pad = isTabletDecorator ? V.dp(16.0f) : 0;
        this.list.setPadding(pad, 0, pad, 0);
        return decorator;
    }
}
