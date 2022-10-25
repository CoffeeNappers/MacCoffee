package com.vkontakte.android.ui.widget;

import android.annotation.TargetApi;
import android.app.Activity;
import android.app.Fragment;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.graphics.drawable.Drawable;
import android.os.Bundle;
import android.support.annotation.NonNull;
import android.support.v4.view.ViewCompat;
import android.support.v4.widget.SlidingPaneLayout;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.text.TextUtils;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.view.WindowInsets;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.ProgressBar;
import android.widget.RelativeLayout;
import android.widget.TextView;
import com.facebook.share.internal.ShareConstants;
import com.google.android.exoplayer2.util.MimeTypes;
import com.google.firebase.analytics.FirebaseAnalytics;
import com.vk.core.util.Screen;
import com.vk.emoji.Emoji;
import com.vk.imageloader.transform.BlurPostProcessor;
import com.vk.imageloader.view.VKImageView;
import com.vk.music.fragment.MusicFragment;
import com.vk.music.view.ThumbsImageView;
import com.vkontakte.android.AudioPlayerActivity;
import com.vkontakte.android.Global;
import com.vkontakte.android.LinkParser;
import com.vkontakte.android.Log;
import com.vkontakte.android.LongPollService;
import com.vkontakte.android.NetworkStateReceiver;
import com.vkontakte.android.R;
import com.vkontakte.android.TimeUtils;
import com.vkontakte.android.UserProfile;
import com.vkontakte.android.ViewUtils;
import com.vkontakte.android.api.Group;
import com.vkontakte.android.audio.AudioFacade;
import com.vkontakte.android.audio.MusicTrack;
import com.vkontakte.android.audio.player.PlayerListener;
import com.vkontakte.android.audio.player.PlayerState;
import com.vkontakte.android.audio.player.TrackInfo;
import com.vkontakte.android.auth.VKAccount;
import com.vkontakte.android.auth.VKAccountManager;
import com.vkontakte.android.cache.Cache;
import com.vkontakte.android.data.Analytics;
import com.vkontakte.android.data.Friends;
import com.vkontakte.android.data.Groups;
import com.vkontakte.android.data.Posts;
import com.vkontakte.android.fragments.GamesFragment;
import com.vkontakte.android.fragments.NewsFragment;
import com.vkontakte.android.fragments.PhotosFragment;
import com.vkontakte.android.fragments.ProfileFragment;
import com.vkontakte.android.fragments.SettingsListFragment;
import com.vkontakte.android.fragments.fave.FaveFragment;
import com.vkontakte.android.fragments.feedback.FeedbackFragment;
import com.vkontakte.android.fragments.friends.FriendsFragment;
import com.vkontakte.android.fragments.gifts.BirthdaysFragment;
import com.vkontakte.android.fragments.groups.GroupsFragment;
import com.vkontakte.android.fragments.messages.DialogsFragment;
import com.vkontakte.android.fragments.search.ExtendedSearchFragment;
import com.vkontakte.android.fragments.videos.VideosFragment;
import com.vkontakte.android.navigation.ArgKeys;
import com.vkontakte.android.ui.PhotoStripView;
import com.vkontakte.android.ui.TabletDrawerItemBackgroundDrawable;
import com.vkontakte.android.ui.drawable.PaddingDrawable;
import com.vkontakte.android.ui.drawable.RecoloredDrawable;
import com.vkontakte.android.ui.navigation.NavigationDelegate;
import com.vkontakte.android.utils.L;
import com.vkontakte.android.utils.Utils;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import me.grishka.appkit.utils.V;
import me.grishka.appkit.views.UsableRecyclerView;
import org.slf4j.Marker;
/* loaded from: classes3.dex */
public class MenuListView extends FrameLayout {
    public static MenuListView lastInstance;
    private static CharSequence reminderText = null;
    private MenuAdapter adapter;
    private ProgressBar audioProgress;
    private List<UserProfile> birthdayUsers;
    private int currentItem;
    private float expansion;
    private ArrayList<UserProfile> friends;
    private ArrayList<Group> groups;
    private HeaderViewHolder headerViewHolder;
    private int[] iconsRes;
    private final boolean isTablet;
    public int itemPadding;
    private ArrayList<MenuItem> items;
    private PlayerState lastState;
    public UsableRecyclerView list;
    private PaddingDrawable listSelector;
    private Listener listener;
    @NonNull
    private NavigationDelegate navDelegate;
    private PlayerListener playerListener;
    private View playerView;
    private float prevExpansion;
    private int prevStatusBarHeight;
    private BroadcastReceiver receiver;
    private int statusBarHeight;
    private ViewGroup tabletNavIcon;
    private ThumbsImageView trackImageView;
    private String userName;
    private String userPhoto;
    private String userStatus;

    /* loaded from: classes3.dex */
    public interface Listener {
        void onCommunitySelected(int i, boolean z);

        void onMenuItemSelected(int i, boolean z);

        void onUserSelected(int i, boolean z);
    }

    public MenuListView(Context context, @NonNull NavigationDelegate navDelegate) {
        super(context);
        this.items = new ArrayList<>();
        this.groups = new ArrayList<>();
        this.friends = new ArrayList<>();
        this.birthdayUsers = new ArrayList();
        this.lastState = null;
        this.currentItem = -1;
        this.expansion = 1.0f;
        this.prevExpansion = -1.0f;
        this.prevStatusBarHeight = 0;
        this.iconsRes = new int[]{R.drawable.ic_menu_news, R.drawable.ic_menu_notifications, R.drawable.ic_menu_messages, R.drawable.ic_menu_friends, R.drawable.ic_menu_communities, R.drawable.ic_menu_photos, R.drawable.ic_menu_videos, R.drawable.ic_menu_music, R.drawable.ic_menu_games, R.drawable.ic_menu_bookmarks, R.drawable.ic_menu_global_search, R.drawable.ic_menu_settings};
        this.receiver = new BroadcastReceiver() { // from class: com.vkontakte.android.ui.widget.MenuListView.1
            {
                MenuListView.this = this;
            }

            @Override // android.content.BroadcastReceiver
            public void onReceive(Context context2, Intent intent) {
                String action = intent.getAction();
                char c = 65535;
                switch (action.hashCode()) {
                    case -2048658608:
                        if (action.equals(LongPollService.ACTION_USER_PRESENCE)) {
                            c = 2;
                            break;
                        }
                        break;
                    case -1725246571:
                        if (action.equals(Friends.ACTION_FRIEND_LIST_CHANGED)) {
                            c = 0;
                            break;
                        }
                        break;
                    case -1414915502:
                        if (action.equals(LongPollService.ACTION_COUNTERS_UPDATED)) {
                            c = 6;
                            break;
                        }
                        break;
                    case -172665617:
                        if (action.equals(NetworkStateReceiver.ACTION_GROUPS_UPDATED)) {
                            c = 3;
                            break;
                        }
                        break;
                    case 333377586:
                        if (action.equals(Posts.ACTION_USER_PHOTO_CHANGED)) {
                            c = 4;
                            break;
                        }
                        break;
                    case 611799995:
                        if (action.equals(Friends.ACTION_FRIEND_REQUESTS_CHANGED)) {
                            c = 7;
                            break;
                        }
                        break;
                    case 612532405:
                        if (action.equals(Posts.ACTION_USER_NAME_CHANGED)) {
                            c = 5;
                            break;
                        }
                        break;
                    case 816139794:
                        if (action.equals(Groups.ACTION_GROUP_LIST_CHANGED)) {
                            c = 1;
                            break;
                        }
                        break;
                }
                switch (c) {
                    case 0:
                        MenuListView.this.friends.clear();
                        Friends.getFriends(MenuListView.this.friends);
                        if (MenuListView.this.friends.size() > 5) {
                            MenuListView.this.friends.subList(5, MenuListView.this.friends.size()).clear();
                        }
                        MenuListView.this.updateList();
                        return;
                    case 1:
                        MenuListView.this.groups.clear();
                        Groups.getGroups(MenuListView.this.groups);
                        if (MenuListView.this.groups.size() > 5) {
                            MenuListView.this.groups.subList(5, MenuListView.this.groups.size()).clear();
                        }
                        MenuListView.this.updateList();
                        return;
                    case 2:
                        int uid = intent.getIntExtra(ArgKeys.UID, 0);
                        int friendsSize = MenuListView.this.friends.size();
                        for (int i = 0; i < friendsSize; i++) {
                            UserProfile p = (UserProfile) MenuListView.this.friends.get(i);
                            if (p.uid == uid) {
                                p.online = intent.getIntExtra("online", 0);
                                MenuListView.this.updateList();
                            }
                        }
                        return;
                    case 3:
                        MenuListView.this.groups.clear();
                        Groups.getGroups(MenuListView.this.groups);
                        if (MenuListView.this.groups.size() > 5) {
                            MenuListView.this.groups.subList(5, MenuListView.this.groups.size()).clear();
                        }
                        MenuListView.this.updateList();
                        return;
                    case 4:
                        if (intent.getIntExtra("id", 0) == VKAccountManager.getCurrent().getUid()) {
                            MenuListView.this.userPhoto = intent.getStringExtra("photo");
                            MenuListView.this.updateList();
                            return;
                        }
                        return;
                    case 5:
                        MenuListView.this.userName = intent.getStringExtra("name");
                        MenuListView.this.updateList();
                        return;
                    case 6:
                    case 7:
                        if (!intent.getBooleanExtra("out", false)) {
                            MenuListView.this.updateList();
                            return;
                        }
                        return;
                    default:
                        return;
                }
            }
        };
        this.playerListener = new PlayerListener.PlayerListenerAdapter() { // from class: com.vkontakte.android.ui.widget.MenuListView.2
            {
                MenuListView.this = this;
            }

            @Override // com.vkontakte.android.audio.player.PlayerListener.PlayerListenerAdapter, com.vkontakte.android.audio.player.PlayerListener
            public void onStateChanged(PlayerState state, TrackInfo trackInfo) {
                if (state == PlayerState.STOPPED || state == PlayerState.IDLE) {
                    if (MenuListView.this.playerView.getVisibility() != 8) {
                        MenuListView.this.playerView.setVisibility(8);
                        MenuListView.this.updateListPadding();
                        return;
                    }
                    return;
                }
                if (MenuListView.this.audioProgress == null || !trackInfo.isContentMode()) {
                    if (MenuListView.this.audioProgress != null) {
                        MenuListView.this.audioProgress.setProgressDrawable(ViewUtils.getDrawable(MenuListView.this.audioProgress.getContext(), R.drawable.drawer_player_progress_ad));
                    }
                } else {
                    MenuListView.this.audioProgress.setProgressDrawable(ViewUtils.getDrawable(MenuListView.this.audioProgress.getContext(), R.drawable.drawer_player_progress));
                }
                if (MenuListView.this.playerView.getVisibility() != 0) {
                    MenuListView.this.playerView.setVisibility(0);
                    MenuListView.this.updateListPadding();
                    MenuListView.this.updateList();
                }
                if (trackInfo.hasTrack()) {
                    TextView artist = (TextView) MenuListView.this.playerView.findViewById(R.id.player_view_artist);
                    TextView title = (TextView) MenuListView.this.playerView.findViewById(R.id.player_view_title);
                    String subtitle = trackInfo.isContentMode() ? null : trackInfo.getSubTitle();
                    if (!artist.getText().equals(subtitle)) {
                        ViewUtils.setText(artist, subtitle, true);
                    }
                    if (!title.getText().equals(trackInfo.getTitle())) {
                        ViewUtils.setText(title, trackInfo.getTitle(), true);
                    }
                    MenuListView.this.updateAudioAlbumArt(trackInfo.getTrack());
                }
                if (MenuListView.this.lastState != state || MenuListView.this.lastState == null) {
                    MenuListView.this.lastState = state;
                    ((ImageView) MenuListView.this.playerView.findViewById(R.id.player_view_button)).setImageDrawable(new RecoloredDrawable(MenuListView.this.getResources().getDrawable(state == PlayerState.PLAYING ? R.drawable.ic_menu_pause : R.drawable.ic_menu_play), MenuListView.this.getResources().getColor(R.color.leftmenu_icon)));
                    MenuListView.this.postInvalidate();
                }
            }

            @Override // com.vkontakte.android.audio.player.PlayerListener.PlayerListenerAdapter, com.vkontakte.android.audio.player.PlayerListener
            public void onBufferingProgress(TrackInfo trackInfo) {
            }

            @Override // com.vkontakte.android.audio.player.PlayerListener.PlayerListenerAdapter, com.vkontakte.android.audio.player.PlayerListener
            public void onProgress(TrackInfo trackInfo) {
                MenuListView.this.audioProgress.setProgress(trackInfo.getPositionPercent());
            }
        };
        this.navDelegate = navDelegate;
        this.isTablet = Screen.isTablet(context);
        init();
    }

    private void init() {
        View.OnClickListener onClickListener;
        String[] titles = getResources().getStringArray(R.array.leftmenu);
        for (int i = 0; i < titles.length; i++) {
            this.items.add(new MenuItem(this.iconsRes[i], i, titles[i]));
        }
        this.playerView = inflate(getContext(), R.layout.menu_audio_player, null);
        this.audioProgress = (ProgressBar) this.playerView.findViewById(R.id.player_view_progress);
        this.trackImageView = (ThumbsImageView) this.playerView.findViewById(R.id.player_view_albumart);
        this.list = new UsableRecyclerView(getContext());
        this.list.setLayoutManager(new LinearLayoutManager(getContext()));
        UsableRecyclerView usableRecyclerView = this.list;
        MenuAdapter menuAdapter = new MenuAdapter();
        this.adapter = menuAdapter;
        usableRecyclerView.setAdapter(menuAdapter);
        this.list.setHasFixedSize(true);
        this.list.setSelector(R.drawable.highlight);
        if (this.isTablet) {
            Drawable selector = getResources().getDrawable(R.drawable.drawer_highlight_tablet);
            this.listSelector = new PaddingDrawable(selector, V.dp(204.0f));
            this.list.setSelector(this.listSelector);
        }
        setBackgroundColor(getResources().getColor(this.isTablet ? R.color.drawer_bg_tablet : R.color.drawer_bg_phone));
        setClipToPadding(false);
        if (this.isTablet) {
            Activity activity = Utils.castToActivity(getContext());
            this.tabletNavIcon = new FrameLayout(getContext());
            this.tabletNavIcon.setBackgroundColor(getResources().getColor(this.isTablet ? R.color.drawer_bg_tablet : R.color.drawer_bg_phone));
            ImageView icon = new ImageView(getContext());
            icon.setScaleType(ImageView.ScaleType.CENTER);
            icon.setImageDrawable(new RecoloredDrawable(getResources().getDrawable(activity.isTaskRoot() ? R.drawable.ic_ab_menu : R.drawable.ic_ab_back), -5985615));
            icon.setBackgroundResource(R.drawable.highlight);
            this.tabletNavIcon.addView(icon, new FrameLayout.LayoutParams(V.dp(56.0f), V.dp(56.0f), 17));
            FrameLayout.LayoutParams lp = new FrameLayout.LayoutParams(V.dp(84.0f), V.dp(64.0f), 51);
            this.tabletNavIcon.setLayoutParams(lp);
            icon.setOnClickListener(MenuListView$$Lambda$1.lambdaFactory$(this, activity));
        }
        VKAccount account = VKAccountManager.getCurrent();
        this.userName = account.getName();
        this.userPhoto = account.getPhoto();
        this.userStatus = account.getStatus();
        updateBirthdays();
        this.playerView.setVisibility(8);
        updateListPadding();
        View findViewById = this.playerView.findViewById(R.id.player_view_button);
        onClickListener = MenuListView$$Lambda$2.instance;
        findViewById.setOnClickListener(onClickListener);
        this.playerView.findViewById(R.id.player_view_content).setOnClickListener(MenuListView$$Lambda$3.lambdaFactory$(this));
        this.playerView.findViewById(R.id.player_view_title).setSelected(true);
        this.playerView.findViewById(R.id.player_view_artist).setSelected(true);
        this.list.setLayoutParams(new FrameLayout.LayoutParams(-1, -1));
        this.playerView.setLayoutParams(new FrameLayout.LayoutParams(-1, -2, 80));
        addView(this.list);
        addView(this.playerView);
        if (this.tabletNavIcon != null) {
            addView(this.tabletNavIcon);
        }
        if (this.isTablet) {
            this.list.addOnScrollListener(new RecyclerView.OnScrollListener() { // from class: com.vkontakte.android.ui.widget.MenuListView.3
                {
                    MenuListView.this = this;
                }

                @Override // android.support.v7.widget.RecyclerView.OnScrollListener
                public void onScrolled(RecyclerView recyclerView, int dx, int dy) {
                    int alpha;
                    if (((LinearLayoutManager) recyclerView.getLayoutManager()).findFirstVisibleItemPosition() == 0) {
                        int top = MenuListView.this.list.getChildAt(0).getTop();
                        if (top >= 0) {
                            alpha = 0;
                        } else {
                            alpha = (int) (Math.min(1.0f, (-top) / V.dp(20.0f)) * 255.0f);
                        }
                    } else {
                        alpha = 255;
                    }
                    MenuListView.this.tabletNavIcon.getBackground().setAlpha(alpha);
                }
            });
        }
        setListener(new Listener() { // from class: com.vkontakte.android.ui.widget.MenuListView.4
            {
                MenuListView.this = this;
            }

            @Override // com.vkontakte.android.ui.widget.MenuListView.Listener
            public void onUserSelected(int id, boolean allowBack) {
                if (!allowBack) {
                    MenuListView.this.setCurrentItem(-1);
                }
                Bundle args = new Bundle();
                args.putInt("id", id);
                MenuListView.this.navDelegate.openFragment(ProfileFragment.class, args, allowBack);
            }

            @Override // com.vkontakte.android.ui.widget.MenuListView.Listener
            public void onMenuItemSelected(int item, boolean allowBack) {
                Class<? extends Fragment> fragment = null;
                Bundle args = new Bundle();
                String statKey = null;
                switch (item) {
                    case -2000000000:
                        fragment = BirthdaysFragment.class;
                        break;
                    case 0:
                        fragment = ProfileFragment.class;
                        args.putInt("id", VKAccountManager.getCurrent().getUid());
                        statKey = "profile";
                        break;
                    case 1:
                        Activity activity2 = Utils.castToActivity(MenuListView.this.getContext());
                        boolean forseUpdate = false;
                        if (activity2 != null) {
                            Fragment fragmentLocal = activity2.getFragmentManager().findFragmentById(R.id.fragment_wrapper);
                            if (fragmentLocal instanceof NewsFragment) {
                                forseUpdate = true;
                            }
                        }
                        NewsFragment.resetListIdIfNeed(forseUpdate);
                        fragment = NewsFragment.class;
                        statKey = "news";
                        break;
                    case 2:
                        fragment = FeedbackFragment.class;
                        statKey = "feedback";
                        break;
                    case 3:
                        fragment = DialogsFragment.class;
                        statKey = "messages";
                        break;
                    case 4:
                        fragment = FriendsFragment.class;
                        statKey = "friends";
                        break;
                    case 5:
                        fragment = GroupsFragment.class;
                        statKey = "groups";
                        break;
                    case 6:
                        fragment = PhotosFragment.class;
                        args.putBoolean("show_friends_feed", false);
                        statKey = "photos";
                        break;
                    case 7:
                        fragment = VideosFragment.class;
                        statKey = "videos";
                        break;
                    case 8:
                        fragment = MusicFragment.class;
                        statKey = MimeTypes.BASE_TYPE_AUDIO;
                        break;
                    case 9:
                        fragment = GamesFragment.class;
                        statKey = "games";
                        break;
                    case 10:
                        fragment = FaveFragment.class;
                        statKey = "fave";
                        break;
                    case 11:
                        fragment = ExtendedSearchFragment.class;
                        statKey = FirebaseAnalytics.Event.SEARCH;
                        break;
                    case 12:
                        fragment = SettingsListFragment.class;
                        statKey = "settings";
                        break;
                }
                if (statKey != null) {
                    Analytics.track("user_action").addParam(ShareConstants.WEB_DIALOG_PARAM_ACTION_TYPE, "menu_click").addParam("action_param", statKey).commit();
                }
                if (fragment != null) {
                    MenuListView.this.navDelegate.openFragment(fragment, args, allowBack);
                }
            }

            @Override // com.vkontakte.android.ui.widget.MenuListView.Listener
            public void onCommunitySelected(int id, boolean allowBack) {
                if (!allowBack) {
                    MenuListView.this.setCurrentItem(-1);
                }
                Bundle args = new Bundle();
                args.putInt("id", -id);
                MenuListView.this.navDelegate.openFragment(ProfileFragment.class, args, allowBack);
            }
        });
        String installer = getContext().getPackageManager().getInstallerPackageName(getContext().getPackageName());
        if (installer != null && installer.contains("amazon")) {
            Iterator<MenuItem> it = this.items.iterator();
            while (true) {
                if (!it.hasNext()) {
                    break;
                }
                MenuItem item = it.next();
                if (item.index == 9) {
                    this.items.remove(item);
                    break;
                }
            }
        }
        getRootView().getViewTreeObserver().addOnPreDrawListener(new ViewTreeObserver.OnPreDrawListener() { // from class: com.vkontakte.android.ui.widget.MenuListView.5
            {
                MenuListView.this = this;
            }

            @Override // android.view.ViewTreeObserver.OnPreDrawListener
            public boolean onPreDraw() {
                MenuListView.this.getRootView().getViewTreeObserver().removeOnPreDrawListener(this);
                MenuListView.this.prepare();
                ((ViewGroup) Utils.castToActivity(MenuListView.this.getContext()).findViewById(R.id.fragment_wrapper)).setOnHierarchyChangeListener(new ViewGroup.OnHierarchyChangeListener() { // from class: com.vkontakte.android.ui.widget.MenuListView.5.1
                    {
                        AnonymousClass5.this = this;
                    }

                    @Override // android.view.ViewGroup.OnHierarchyChangeListener
                    public void onChildViewAdded(View parent, View child) {
                        Log.e("vk", "onChildViewAdded " + child);
                        MenuListView.this.prepare();
                    }

                    @Override // android.view.ViewGroup.OnHierarchyChangeListener
                    public void onChildViewRemoved(View parent, View child) {
                    }
                });
                return true;
            }
        });
    }

    public /* synthetic */ void lambda$init$0(Activity activity, View view) {
        if (activity.isTaskRoot()) {
            ((SlidingPaneLayout) getParent()).openPane();
        } else {
            activity.finish();
        }
    }

    public /* synthetic */ void lambda$init$2(View v) {
        getContext().startActivity(new Intent(getContext(), AudioPlayerActivity.class));
        Utils.castToActivity(getContext()).overridePendingTransition(R.anim.slide_in, R.anim.noop);
        if (this.listener != null) {
            this.listener.onMenuItemSelected(-20, false);
        }
    }

    public void setCurrentItem(int item) {
        this.currentItem = item;
        this.adapter.notifyDataSetChanged();
    }

    public void updateAudioAlbumArt(MusicTrack musicTrack) {
        if (!this.isTablet && musicTrack != null && this.trackImageView != null) {
            this.trackImageView.setThumb(musicTrack.getThumb());
        }
    }

    public static int getRecommendedWidth(Context context) {
        return Math.min(Global.scale(300.0f), context.getResources().getDisplayMetrics().widthPixels - Global.scale(40.0f));
    }

    public void updateUserInfo() {
        VKAccount account = VKAccountManager.getCurrent();
        this.userName = account.getName();
        this.userPhoto = account.getPhoto();
        this.userStatus = account.getStatus();
        updateList();
    }

    public void updateBirthdays() {
        new Thread(MenuListView$$Lambda$4.lambdaFactory$(this)).start();
    }

    public /* synthetic */ void lambda$updateBirthdays$4() {
        Thread.currentThread().setName("Update birthdays");
        CharSequence _rtext = null;
        ArrayList<UserProfile> bdays = Cache.getBirthdays(System.currentTimeMillis());
        this.birthdayUsers.clear();
        if (bdays.size() > 0) {
            Global.scale(40.0f);
            ArrayList<String> names = new ArrayList<>();
            Date date = new Date(System.currentTimeMillis());
            String today = date.getDate() + "." + (date.getMonth() + 1) + ".";
            Date date2 = new Date(System.currentTimeMillis() + TimeUtils.DAY);
            String str = date2.getDate() + "." + (date2.getMonth() + 1) + ".";
            boolean hasToday = false;
            Iterator<UserProfile> it = bdays.iterator();
            while (it.hasNext()) {
                UserProfile p = it.next();
                if (p.bdate.startsWith(today)) {
                    hasToday = true;
                }
                if ((hasToday && p.bdate.startsWith(today)) || !hasToday) {
                    names.add("[id" + p.uid + "|" + p.university + "]");
                    this.birthdayUsers.add(p);
                }
            }
            _rtext = LinkParser.parseLinks(getContext().getResources().getString(hasToday ? R.string.birthday_today : R.string.birthday_tomorrow, TextUtils.join(", ", names)), 2);
            if (this.isTablet && !hasToday) {
                this.birthdayUsers.clear();
            }
        }
        CharSequence rtext = _rtext;
        Utils.castToActivity(getContext()).runOnUiThread(MenuListView$$Lambda$8.lambdaFactory$(this, rtext));
    }

    public /* synthetic */ void lambda$null$3(CharSequence rtext) {
        reminderText = rtext;
        updateList();
    }

    @Override // android.view.ViewGroup, android.view.View
    public void onAttachedToWindow() {
        super.onAttachedToWindow();
        new Thread(MenuListView$$Lambda$5.lambdaFactory$(this)).start();
        lastInstance = this;
        IntentFilter filter = new IntentFilter();
        filter.addAction(Friends.ACTION_FRIEND_LIST_CHANGED);
        filter.addAction(Friends.ACTION_FRIEND_REQUESTS_CHANGED);
        filter.addAction(Groups.ACTION_GROUP_LIST_CHANGED);
        filter.addAction(LongPollService.ACTION_USER_PRESENCE);
        filter.addAction(NetworkStateReceiver.ACTION_GROUPS_UPDATED);
        filter.addAction(LongPollService.ACTION_COUNTERS_UPDATED);
        filter.addAction(Posts.ACTION_USER_PHOTO_CHANGED);
        filter.addAction(Posts.ACTION_USER_NAME_CHANGED);
        getContext().registerReceiver(this.receiver, filter, "com.vkontakte.android.permission.ACCESS_DATA", null);
        AudioFacade.addPlayerListener(this.playerListener, true);
    }

    public /* synthetic */ void lambda$onAttachedToWindow$5() {
        try {
            ArrayList<UserProfile> friends1 = new ArrayList<>();
            Friends.getFriends(friends1);
            if (friends1.size() > 5) {
                friends1.subList(5, friends1.size()).clear();
            }
            ArrayList<Group> groups1 = new ArrayList<>();
            Groups.getGroups(groups1);
            if (groups1.size() > 5) {
                groups1.subList(5, groups1.size()).clear();
            }
            update(friends1, groups1);
        } catch (Exception x) {
            L.e(x, new Object[0]);
        }
    }

    @Override // android.view.ViewGroup, android.view.View
    public void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        Log.i("vk", "on detached");
        lastInstance = null;
        try {
            getContext().unregisterReceiver(this.receiver);
        } catch (Exception e) {
        }
        AudioFacade.removePlayerListener(this.playerListener);
    }

    public void update(List<UserProfile> _friends, List<Group> _groups) {
        Utils.castToActivity(getContext()).runOnUiThread(MenuListView$$Lambda$6.lambdaFactory$(this, _friends, _groups));
    }

    public /* synthetic */ void lambda$update$6(List _friends, List _groups) {
        VKAccount account = VKAccountManager.getCurrent();
        this.userName = account.getName();
        this.userPhoto = account.getPhoto();
        this.userStatus = account.getStatus();
        this.friends.clear();
        this.friends.addAll(_friends);
        this.groups.clear();
        this.groups.addAll(_groups);
        this.adapter.notifyDataSetChanged();
    }

    public void updateList() {
        Utils.castToActivity(getContext()).runOnUiThread(MenuListView$$Lambda$7.lambdaFactory$(this));
    }

    public /* synthetic */ void lambda$updateList$7() {
        this.adapter.notifyDataSetChanged();
    }

    public void setListener(Listener listener) {
        this.listener = listener;
    }

    public void setExpansion(float exp) {
        if (this.headerViewHolder != null) {
            this.list.setOverScrollMode(exp == 0.0f ? 2 : 0);
            this.expansion = exp;
            boolean ignoreZeroOffset = false;
            if ((this.expansion == 0.0f && this.prevExpansion != 0.0f) || (this.expansion != 0.0f && this.prevExpansion == 0.0f)) {
                this.adapter.notifyDataSetChanged();
                ignoreZeroOffset = true;
            }
            float scale = 0.5555555f + (0.44444448f * exp);
            this.headerViewHolder.photo.setScaleX(scale);
            this.headerViewHolder.photo.setScaleY(scale);
            this.headerViewHolder.photo.setTranslationY(V.dp(84.0f) * (1.0f - exp));
            this.list.setTranslationY(V.dp(28.0f) * (1.0f - exp));
            float nameAlpha = Math.max(0.0f, exp - 0.5f) / 0.5f;
            this.headerViewHolder.name.setAlpha(nameAlpha);
            this.headerViewHolder.status.setAlpha(nameAlpha);
            float iconsAlpha = 1.0f - Math.min(1.0f, exp / 0.2f);
            this.headerViewHolder.search2.setAlpha(iconsAlpha);
            this.headerViewHolder.search2.setTranslationY(V.dp(28.0f) - this.list.getTranslationY());
            this.headerViewHolder.search2.setVisibility(exp == 1.0f ? 8 : 0);
            this.tabletNavIcon.setAlpha(iconsAlpha);
            updateListPadding();
            this.listSelector.setLevel((int) ((1.0f - exp) * 10000.0f));
            this.audioProgress.setScaleX(0.2917f + (0.7083f * exp));
            for (int i = 0; i < this.list.getChildCount(); i++) {
                View v = this.list.getChildAt(i);
                RecyclerView.ViewHolder vh = this.list.mo1205getChildViewHolder(v);
                if (vh instanceof ItemViewHolder) {
                    ItemViewHolder ivh = (ItemViewHolder) vh;
                    ivh.applyExpansion();
                } else if (vh instanceof UserViewHolder) {
                    UserViewHolder uvh = (UserViewHolder) vh;
                    uvh.applyExpansion(ignoreZeroOffset);
                } else if (vh instanceof SectionViewHolder) {
                    SectionViewHolder svh = (SectionViewHolder) vh;
                    svh.applyExpansion();
                } else if (vh instanceof BirthdayViewHolder) {
                    BirthdayViewHolder bvh = (BirthdayViewHolder) vh;
                    bvh.applyExpansion();
                }
            }
            this.prevExpansion = this.expansion;
        }
    }

    public void updateListPadding() {
        int pad = 0;
        if (this.expansion == 0.0f) {
            pad = 0 + V.dp(28.0f);
        }
        if (this.playerView.getVisibility() == 0) {
            pad += V.dp(56.0f);
        }
        if (this.list.getPaddingBottom() != pad) {
            this.list.setPadding(0, 0, 0, pad);
        }
    }

    public void prepare() {
        updateUserInfo();
        Activity activity = Utils.castToActivity(getContext());
        Fragment fragment = activity.getFragmentManager().findFragmentById(R.id.fragment_wrapper);
        if (fragment == null || !activity.isTaskRoot()) {
            setCurrentItem(-1);
        } else if (fragment instanceof NewsFragment) {
            setCurrentItem(1);
        } else if (fragment instanceof FeedbackFragment) {
            setCurrentItem(2);
        } else if (fragment instanceof DialogsFragment) {
            setCurrentItem(3);
        } else if (fragment instanceof FriendsFragment) {
            setCurrentItem(4);
        } else if (fragment instanceof GroupsFragment) {
            setCurrentItem(5);
        } else if (fragment instanceof PhotosFragment) {
            setCurrentItem(6);
        } else if (fragment instanceof VideosFragment) {
            setCurrentItem(7);
        } else if (fragment instanceof MusicFragment) {
            setCurrentItem(8);
        } else if (fragment instanceof GamesFragment) {
            setCurrentItem(9);
        } else if (fragment instanceof FaveFragment) {
            setCurrentItem(10);
        } else if (fragment instanceof ExtendedSearchFragment) {
            setCurrentItem(11);
        } else if (fragment instanceof SettingsListFragment) {
            setCurrentItem(12);
        } else {
            setCurrentItem(-1);
        }
    }

    @Override // android.view.View
    @TargetApi(21)
    public WindowInsets onApplyWindowInsets(WindowInsets insets) {
        this.statusBarHeight = insets.getSystemWindowInsetTop();
        if (this.statusBarHeight != this.prevStatusBarHeight) {
            if (this.tabletNavIcon != null) {
                FrameLayout.LayoutParams lp = (FrameLayout.LayoutParams) this.tabletNavIcon.getLayoutParams();
                lp.height = V.dp(64.0f) + this.statusBarHeight;
                this.tabletNavIcon.setLayoutParams(lp);
                this.tabletNavIcon.setPadding(0, this.statusBarHeight, 0, 0);
                this.playerView.setTranslationY(-this.statusBarHeight);
            }
            updateList();
            this.prevStatusBarHeight = this.statusBarHeight;
        }
        return super.onApplyWindowInsets(insets.replaceSystemWindowInsets(0, 0, 0, insets.getSystemWindowInsetBottom()));
    }

    /* loaded from: classes3.dex */
    public class MenuAdapter extends UsableRecyclerView.Adapter<UsableRecyclerView.ViewHolder> {
        private static final int ITEM_TYPE_BIRTHDAY = 6;
        private static final int ITEM_TYPE_DIVIDER = 7;
        private static final int ITEM_TYPE_HEADER = 1;
        private static final int ITEM_TYPE_ITEM = 2;
        private static final int ITEM_TYPE_PADDING = 5;
        private static final int ITEM_TYPE_SECTION = 4;
        private static final int ITEM_TYPE_USER = 3;

        public MenuAdapter() {
            MenuListView.this = r2;
            setHasStableIds(true);
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        /* renamed from: onCreateViewHolder */
        public UsableRecyclerView.ViewHolder mo1206onCreateViewHolder(ViewGroup parent, int viewType) {
            if (viewType == 1) {
                return new HeaderViewHolder();
            }
            if (viewType == 2) {
                return new ItemViewHolder();
            }
            if (viewType == 4) {
                return new SectionViewHolder();
            }
            if (viewType == 3) {
                return new UserViewHolder();
            }
            if (viewType == 5) {
                return new PaddingViewHolder();
            }
            if (viewType == 6) {
                return new BirthdayViewHolder();
            }
            if (viewType == 7) {
                return new DividerViewHolder();
            }
            return null;
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        public void onBindViewHolder(UsableRecyclerView.ViewHolder holder, int position) {
            if (position == 0) {
                ((HeaderViewHolder) holder).bind();
                return;
            }
            int position2 = position - 1;
            if (position2 != 0) {
                int position3 = position2 - 1;
                if (position3 < MenuListView.this.items.size()) {
                    ((ItemViewHolder) holder).bind((MenuItem) MenuListView.this.items.get(position3));
                    return;
                }
                int position4 = position3 - MenuListView.this.items.size();
                if (MenuListView.this.birthdayUsers.size() > 0) {
                    if (position4 != 0) {
                        if (position4 == 1) {
                            ((BirthdayViewHolder) holder).bind();
                            return;
                        }
                        position4 -= 2;
                    } else {
                        return;
                    }
                }
                if (MenuListView.this.friends.size() > 0) {
                    if (position4 == 0) {
                        if (MenuListView.this.expansion != 0.0f) {
                            ((SectionViewHolder) holder).bind(MenuListView.this.getResources().getString(R.string.friends), 0);
                            return;
                        }
                        return;
                    }
                    int position5 = position4 - 1;
                    if (position5 < MenuListView.this.friends.size()) {
                        ((UserViewHolder) holder).bind((UserProfile) MenuListView.this.friends.get(position5));
                        return;
                    }
                    position4 = position5 - MenuListView.this.friends.size();
                }
                if (MenuListView.this.groups.size() > 0) {
                    if (position4 == 0) {
                        if (MenuListView.this.expansion != 0.0f) {
                            ((SectionViewHolder) holder).bind(MenuListView.this.getResources().getString(R.string.groups), 1);
                            return;
                        }
                        return;
                    }
                    int position6 = position4 - 1;
                    if (position6 < MenuListView.this.groups.size()) {
                        ((UserViewHolder) holder).bind((Group) MenuListView.this.groups.get(position6));
                    } else {
                        int size = position6 - MenuListView.this.groups.size();
                    }
                }
            }
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        public int getItemCount() {
            int count = MenuListView.this.items.size() + 2;
            if (MenuListView.this.birthdayUsers.size() > 0) {
                count += 2;
            }
            if (MenuListView.this.friends.size() > 0) {
                count += MenuListView.this.friends.size() + 1;
            }
            if (MenuListView.this.groups.size() > 0) {
                count += MenuListView.this.groups.size() + 1;
            }
            return count + 1;
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        public int getItemViewType(int position) {
            if (position == 0) {
                return 1;
            }
            int position2 = position - 1;
            if (position2 == 0) {
                return 5;
            }
            int position3 = position2 - 1;
            if (position3 >= MenuListView.this.items.size()) {
                int position4 = position3 - MenuListView.this.items.size();
                if (MenuListView.this.birthdayUsers.size() > 0) {
                    if (position4 == 0) {
                        return 7;
                    }
                    if (position4 == 1) {
                        return 6;
                    }
                    position4 -= 2;
                }
                if (MenuListView.this.friends.size() > 0) {
                    if (position4 == 0) {
                        return MenuListView.this.expansion != 0.0f ? 4 : 7;
                    }
                    int position5 = position4 - 1;
                    if (position5 < MenuListView.this.friends.size()) {
                        return 3;
                    }
                    position4 = position5 - MenuListView.this.friends.size();
                }
                if (MenuListView.this.groups.size() > 0) {
                    if (position4 == 0) {
                        return MenuListView.this.expansion != 0.0f ? 4 : 7;
                    }
                    int position6 = position4 - 1;
                    if (position6 < MenuListView.this.groups.size()) {
                        return 3;
                    }
                    position4 = position6 - MenuListView.this.groups.size();
                }
                if (position4 == 0) {
                    return 5;
                }
                return 0;
            }
            return 2;
        }

        @Override // me.grishka.appkit.views.UsableRecyclerView.Adapter, me.grishka.appkit.preloading.PrefetchInfoProvider
        public int getImageCountForItem(int position) {
            int position2;
            if (position == 0) {
                return 1;
            }
            int position3 = position - 1;
            if (position3 != 0 && position3 - 1 >= MenuListView.this.items.size()) {
                int position4 = position2 - MenuListView.this.items.size();
                if (MenuListView.this.birthdayUsers.size() > 0) {
                    if (position4 == 0) {
                        return 0;
                    }
                    if (position4 == 1) {
                        return MenuListView.this.birthdayUsers.size();
                    }
                    position4 -= 2;
                }
                if (MenuListView.this.friends.size() > 0) {
                    if (position4 == 0) {
                        return 0;
                    }
                    int position5 = position4 - 1;
                    if (position5 < MenuListView.this.friends.size()) {
                        return 1;
                    }
                    position4 = position5 - MenuListView.this.friends.size();
                }
                if (MenuListView.this.groups.size() > 0) {
                    if (position4 == 0) {
                        return 0;
                    }
                    int position6 = position4 - 1;
                    if (position6 < MenuListView.this.groups.size()) {
                        return 1;
                    }
                    int size = position6 - MenuListView.this.groups.size();
                }
                return 0;
            }
            return 0;
        }

        @Override // me.grishka.appkit.views.UsableRecyclerView.Adapter, me.grishka.appkit.preloading.PrefetchInfoProvider
        public String getImageURL(int position, int image) {
            int position2;
            if (position == 0) {
                return MenuListView.this.userPhoto;
            }
            int position3 = position - 1;
            if (position3 == 0 || position3 - 1 < MenuListView.this.items.size()) {
                return null;
            }
            int position4 = position2 - MenuListView.this.items.size();
            if (MenuListView.this.birthdayUsers.size() > 0) {
                if (position4 == 0) {
                    return null;
                }
                if (position4 == 1) {
                    return ((UserProfile) MenuListView.this.birthdayUsers.get(image)).photo;
                }
                position4 -= 2;
            }
            if (MenuListView.this.friends.size() > 0) {
                if (position4 == 0) {
                    return null;
                }
                int position5 = position4 - 1;
                if (position5 < MenuListView.this.friends.size()) {
                    return ((UserProfile) MenuListView.this.friends.get(position5)).photo;
                }
                position4 = position5 - MenuListView.this.friends.size();
            }
            if (MenuListView.this.groups.size() <= 0 || position4 == 0) {
                return null;
            }
            int position6 = position4 - 1;
            if (position6 < MenuListView.this.groups.size()) {
                return ((Group) MenuListView.this.groups.get(position6)).photo;
            }
            int size = position6 - MenuListView.this.groups.size();
            return null;
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        public long getItemId(int position) {
            if (position == 0) {
                return -2000000001L;
            }
            int position2 = position - 1;
            if (position2 == 0) {
                return -2000000002L;
            }
            int position3 = position2 - 1;
            if (position3 < MenuListView.this.items.size()) {
                return ((MenuItem) MenuListView.this.items.get(position3)).index + 2000000000;
            }
            int position4 = position3 - MenuListView.this.items.size();
            if (MenuListView.this.birthdayUsers.size() > 0) {
                if (position4 == 0) {
                    return -2000000003L;
                }
                if (position4 == 1) {
                    return -2000000004L;
                }
                position4 -= 2;
            }
            if (MenuListView.this.friends.size() > 0) {
                if (position4 == 0) {
                    return -2000000005L;
                }
                int position5 = position4 - 1;
                if (position5 < MenuListView.this.friends.size()) {
                    return ((UserProfile) MenuListView.this.friends.get(position5)).uid;
                }
                position4 = position5 - MenuListView.this.friends.size();
            }
            if (MenuListView.this.groups.size() > 0) {
                if (position4 == 0) {
                    return -2000000006L;
                }
                int position6 = position4 - 1;
                if (position6 < MenuListView.this.groups.size()) {
                    return -((Group) MenuListView.this.groups.get(position6)).id;
                }
                position4 = position6 - MenuListView.this.groups.size();
            }
            return super.getItemId(position4);
        }
    }

    /* loaded from: classes3.dex */
    public class HeaderViewHolder extends UsableRecyclerView.ViewHolder implements UsableRecyclerView.Clickable, UsableRecyclerView.LongClickable {
        private VKImageView blurredPhoto;
        private TextView name;
        private View padder;
        private VKImageView photo;
        private ImageView search2;
        private TextView status;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public HeaderViewHolder() {
            super(View.inflate(r6.getContext(), R.layout.left_menu_item_me, null));
            View.OnClickListener searchClickListener;
            MenuListView.this = r6;
            this.photo = (VKImageView) this.itemView.findViewById(R.id.flist_item_photo);
            this.blurredPhoto = (VKImageView) this.itemView.findViewById(R.id.drawer_header_blurred_photo);
            this.name = (TextView) this.itemView.findViewById(R.id.flist_item_text);
            this.status = (TextView) this.itemView.findViewById(R.id.status);
            this.padder = this.itemView.findViewById(R.id.padder);
            searchClickListener = MenuListView$HeaderViewHolder$$Lambda$1.instance;
            this.itemView.findViewById(R.id.search).setOnClickListener(searchClickListener);
            this.search2 = (ImageView) this.itemView.findViewById(R.id.search2);
            if (this.search2 != null) {
                this.search2.setOnClickListener(searchClickListener);
                this.search2.setImageDrawable(new RecoloredDrawable(r6.getResources().getDrawable(R.drawable.ic_menu_search), -5985615));
            }
            r6.headerViewHolder = this;
            if (this.blurredPhoto != null) {
                this.blurredPhoto.setPostprocessor(new BlurPostProcessor());
            }
        }

        public void bind() {
            CharSequence string;
            this.padder.setLayoutParams(new RelativeLayout.LayoutParams(-1, MenuListView.this.statusBarHeight));
            this.name.setText(MenuListView.this.userName);
            TextView textView = this.status;
            if (MenuListView.this.userStatus != null && MenuListView.this.userStatus.length() > 0) {
                string = Emoji.instance(MenuListView.this.getContext()).replaceEmoji(MenuListView.this.userStatus);
            } else {
                string = MenuListView.this.getResources().getString(R.string.online);
            }
            textView.setText(string);
            this.photo.load(MenuListView.this.userPhoto);
            if (this.blurredPhoto != null) {
                this.blurredPhoto.load(MenuListView.this.userPhoto);
            }
        }

        @Override // me.grishka.appkit.views.UsableRecyclerView.Clickable
        public void onClick() {
            if (MenuListView.this.listener != null) {
                MenuListView.this.listener.onMenuItemSelected(0, false);
            }
        }

        @Override // me.grishka.appkit.views.UsableRecyclerView.LongClickable
        public boolean onLongClick() {
            if (MenuListView.this.listener != null) {
                MenuListView.this.listener.onMenuItemSelected(0, true);
            }
            return true;
        }
    }

    /* loaded from: classes3.dex */
    public class ItemViewHolder extends UsableRecyclerView.ViewHolder implements UsableRecyclerView.Clickable, UsableRecyclerView.LongClickable {
        private TextView counter;
        private ImageView icon;
        private MenuItem item;
        private TextView overlayCounter;
        private TextView title;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public ItemViewHolder() {
            super(View.inflate(r4.getContext(), R.layout.left_menu_item, null));
            MenuListView.this = r4;
            this.title = (TextView) this.itemView.findViewById(R.id.leftmenu_text);
            this.counter = (TextView) this.itemView.findViewById(R.id.leftmenu_counter);
            this.overlayCounter = (TextView) this.itemView.findViewById(R.id.leftmenu_counter2);
            this.icon = (ImageView) this.itemView.findViewById(R.id.leftmenu_icon);
            if (r4.isTablet) {
                this.itemView.setBackgroundDrawable(new TabletDrawerItemBackgroundDrawable(V.dp(204.0f)));
            }
        }

        public void bind(MenuItem item) {
            int count;
            String text;
            boolean z = true;
            this.item = item;
            this.title.setText(item.title);
            this.icon.setImageDrawable(new RecoloredDrawable(MenuListView.this.getResources().getDrawable(item.icon), MenuListView.this.getResources().getColorStateList(R.color.leftmenu_icon)));
            switch (item.index) {
                case 1:
                    count = LongPollService.getNumNotifications();
                    break;
                case 2:
                    count = LongPollService.getNumNewMessages();
                    break;
                case 3:
                    count = LongPollService.getNumFriendRequests();
                    break;
                case 4:
                    count = LongPollService.getNumGroupInvitations();
                    break;
                case 5:
                    count = LongPollService.getNumPhotosMarks();
                    break;
                case 6:
                    count = LongPollService.getNumVideosMarks();
                    break;
                case 7:
                default:
                    count = 0;
                    break;
                case 8:
                    count = LongPollService.getNumAppRequests();
                    break;
            }
            if (count == 0) {
                this.counter.setVisibility(8);
                if (this.overlayCounter != null) {
                    this.overlayCounter.setVisibility(8);
                }
            } else {
                this.counter.setVisibility(0);
                if (this.overlayCounter != null) {
                    this.overlayCounter.setVisibility(0);
                }
                if (count > 1000000) {
                    text = String.format("%.2fM", Float.valueOf(count / 1000000.0f));
                } else if (count > 1000) {
                    text = String.format("%.2fK", Float.valueOf(count / 1000.0f));
                } else {
                    text = count + "";
                }
                this.counter.setText(text);
                if (this.overlayCounter != null) {
                    this.overlayCounter.setText(text);
                }
            }
            View view = this.itemView;
            if (MenuListView.this.currentItem != item.index + 1) {
                z = false;
            }
            view.setSelected(z);
            if (MenuListView.this.isTablet) {
                applyExpansion();
            }
        }

        @Override // me.grishka.appkit.views.UsableRecyclerView.Clickable
        public void onClick() {
            if (MenuListView.this.listener != null) {
                MenuListView.this.listener.onMenuItemSelected(this.item.index + 1, false);
            }
        }

        @Override // me.grishka.appkit.views.UsableRecyclerView.LongClickable
        public boolean onLongClick() {
            if (MenuListView.this.listener != null) {
                MenuListView.this.listener.onMenuItemSelected(this.item.index + 1, true);
            }
            return true;
        }

        public void applyExpansion() {
            float countersAlpha = 1.0f - Math.min(1.0f, MenuListView.this.expansion / 0.2f);
            float titlesAlpha = Math.max(0.0f, MenuListView.this.expansion - 0.3f) / 0.7f;
            this.overlayCounter.setAlpha(countersAlpha);
            this.title.setAlpha(titlesAlpha);
            if (this.itemView.getBackground() != null) {
                this.itemView.getBackground().setLevel((int) ((1.0f - MenuListView.this.expansion) * 10000.0f));
            }
        }
    }

    /* loaded from: classes3.dex */
    public class SectionViewHolder extends UsableRecyclerView.ViewHolder {
        int index;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public SectionViewHolder() {
            super(View.inflate(r5.getContext(), R.layout.list_menu_section_header, null));
            MenuListView.this = r5;
            this.itemView.setLayoutParams(new RecyclerView.LayoutParams(-1, V.dp(56.0f)));
        }

        public void bind(String text, int i) {
            ((TextView) this.itemView).setText(text);
            this.index = i;
            if (MenuListView.this.isTablet) {
                applyExpansion();
            }
        }

        public void applyExpansion() {
            TextView txt = (TextView) this.itemView;
            txt.setTextColor((txt.getCurrentTextColor() & ViewCompat.MEASURED_SIZE_MASK) | (((int) (255.0f * MenuListView.this.expansion)) << 24));
            this.itemView.setTranslationY((-V.dp(this.index * 40)) * (1.0f - MenuListView.this.expansion));
        }
    }

    /* loaded from: classes3.dex */
    public class UserViewHolder extends UsableRecyclerView.ViewHolder implements UsableRecyclerView.Clickable, UsableRecyclerView.LongClickable {
        private int id;
        private ImageView online;
        private VKImageView photo;
        private String photoURL;
        private TextView title;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public UserViewHolder() {
            super(View.inflate(r4.getContext(), R.layout.left_menu_item2, null));
            MenuListView.this = r4;
            this.title = (TextView) this.itemView.findViewById(R.id.flist_item_text);
            this.photo = (VKImageView) this.itemView.findViewById(R.id.flist_item_photo);
            this.online = (ImageView) this.itemView.findViewById(R.id.flist_item_online);
        }

        public void bind(UserProfile profile) {
            this.id = profile.uid;
            this.title.setText(profile.fullName);
            this.photoURL = profile.photo;
            this.online.setVisibility(profile.online > 0 ? 0 : 4);
            this.online.setImageResource(profile.online == 1 ? R.drawable.ic_online : R.drawable.ic_online_mobile);
            this.photo.load(profile.photo);
            if (MenuListView.this.isTablet) {
                applyExpansion(false);
            }
        }

        public void bind(Group group) {
            this.id = -group.id;
            this.title.setText(group.name);
            this.photoURL = group.photo;
            this.online.setVisibility(8);
            this.photo.load(group.photo);
            if (MenuListView.this.isTablet) {
                applyExpansion(false);
            }
        }

        @Override // me.grishka.appkit.views.UsableRecyclerView.Clickable
        public void onClick() {
            if (this.id > 0) {
                MenuListView.this.listener.onUserSelected(this.id, false);
            } else {
                MenuListView.this.listener.onCommunitySelected(-this.id, false);
            }
        }

        @Override // me.grishka.appkit.views.UsableRecyclerView.LongClickable
        public boolean onLongClick() {
            if (this.id > 0) {
                MenuListView.this.listener.onUserSelected(this.id, true);
            } else {
                MenuListView.this.listener.onCommunitySelected(-this.id, true);
            }
            return true;
        }

        public void applyExpansion(boolean ignoreZero) {
            float titlesAlpha = Math.max(0.0f, MenuListView.this.expansion - 0.3f) / 0.7f;
            this.title.setAlpha(titlesAlpha);
            if (this.itemView.getBackground() != null) {
                this.itemView.getBackground().setLevel((int) ((1.0f - MenuListView.this.expansion) * 10000.0f));
            }
            int offset = this.id > 0 ? V.dp(40.0f) : V.dp(80.0f);
            if ((MenuListView.this.expansion == 0.0f && !ignoreZero) || (ignoreZero && MenuListView.this.prevExpansion == 0.0f)) {
                offset = 0;
            }
            this.itemView.setTranslationY((-offset) * (1.0f - MenuListView.this.expansion));
        }
    }

    /* loaded from: classes3.dex */
    public class PaddingViewHolder extends UsableRecyclerView.ViewHolder {
        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public PaddingViewHolder() {
            super(new View(r5.getContext()));
            MenuListView.this = r5;
            this.itemView.setLayoutParams(new RecyclerView.LayoutParams(-1, V.dp(8.0f)));
        }
    }

    /* loaded from: classes3.dex */
    public class DividerViewHolder extends UsableRecyclerView.ViewHolder {
        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public DividerViewHolder() {
            super(new View(r5.getContext()));
            MenuListView.this = r5;
            this.itemView.setLayoutParams(new RecyclerView.LayoutParams(-1, V.dp(16.0f)));
            this.itemView.setBackgroundResource(R.drawable.left_divider);
        }
    }

    /* loaded from: classes3.dex */
    public class BirthdayViewHolder extends UsableRecyclerView.ViewHolder implements UsableRecyclerView.Clickable, UsableRecyclerView.LongClickable {
        private TextView counter;
        private TextView counter2;
        private ImageView icon;
        private PhotoStripView photos;
        private TextView text;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public BirthdayViewHolder() {
            super(View.inflate(r6.getContext(), R.layout.left_menu_item_birthdays, null));
            MenuListView.this = r6;
            this.icon = (ImageView) this.itemView.findViewById(R.id.leftmenu_icon);
            this.icon.setImageDrawable(new RecoloredDrawable(r6.getResources().getDrawable(R.drawable.ic_menu_birthdays), r6.getResources().getColorStateList(R.color.leftmenu_icon)));
            this.text = (TextView) this.itemView.findViewById(R.id.leftmenu_text);
            this.counter = (TextView) this.itemView.findViewById(R.id.leftmenu_counter);
            this.counter2 = (TextView) this.itemView.findViewById(R.id.leftmenu_counter2);
            this.photos = (PhotoStripView) this.itemView.findViewById(R.id.leftmenu_photo_strip);
            this.photos.setPadding(V.dp(6.0f));
            this.photos.setListener(MenuListView$BirthdayViewHolder$$Lambda$1.lambdaFactory$(this));
        }

        public /* synthetic */ void lambda$new$0(PhotoStripView view, int index) {
            new ProfileFragment.Builder(((UserProfile) MenuListView.this.birthdayUsers.get(index)).uid).go(MenuListView.this.getContext());
        }

        public void bind() {
            this.photos.setCount(MenuListView.this.birthdayUsers.size());
            for (int i = 0; i < MenuListView.this.birthdayUsers.size(); i++) {
                this.photos.load(i, ((UserProfile) MenuListView.this.birthdayUsers.get(i)).photo);
            }
            if (this.text != null) {
                this.text.setText(MenuListView.reminderText);
            }
            if (MenuListView.this.isTablet) {
                if (MenuListView.this.birthdayUsers.size() > 2) {
                    this.counter2.setVisibility(0);
                    this.counter2.setText(Marker.ANY_NON_NULL_MARKER + (MenuListView.this.birthdayUsers.size() - 2));
                } else {
                    this.counter2.setVisibility(8);
                }
                if (MenuListView.this.birthdayUsers.size() > 4) {
                    this.counter.setVisibility(0);
                    this.counter.setText(Marker.ANY_NON_NULL_MARKER + (MenuListView.this.birthdayUsers.size() - 3));
                } else {
                    this.counter.setVisibility(8);
                }
                applyExpansion();
            }
        }

        @Override // me.grishka.appkit.views.UsableRecyclerView.Clickable
        public void onClick() {
            MenuListView.this.listener.onMenuItemSelected(-2000000000, false);
        }

        @Override // me.grishka.appkit.views.UsableRecyclerView.LongClickable
        public boolean onLongClick() {
            MenuListView.this.listener.onMenuItemSelected(-2000000000, true);
            return true;
        }

        public void applyExpansion() {
            this.icon.setTranslationX(V.dp(-24.0f) * (1.0f - MenuListView.this.expansion));
            this.photos.setTranslationX(V.dp(-52.0f) * (1.0f - MenuListView.this.expansion));
            float scale = 0.7f + (MenuListView.this.expansion * 0.3f);
            this.photos.setScaleX(scale);
            this.photos.setScaleY(scale);
            this.photos.setOverlapOffset((MenuListView.this.expansion * 0.5f) + 0.5f);
            int ba = (int) ((Math.max(0.0f, MenuListView.this.expansion - 0.5f) / 0.5f) * 255.0f);
            this.photos.setBitmapAlpha(2, ba);
            this.photos.setBitmapAlpha(3, ba);
            float countersAlpha = 1.0f - Math.min(1.0f, MenuListView.this.expansion / 0.2f);
            this.counter2.setAlpha(countersAlpha);
        }
    }

    /* loaded from: classes3.dex */
    public static class MenuItem {
        public int icon;
        public int index;
        public String title;

        public MenuItem(int _icon, int _index, String _title) {
            this.icon = _icon;
            this.index = _index;
            this.title = _title;
        }
    }
}
