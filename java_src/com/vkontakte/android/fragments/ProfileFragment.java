package com.vkontakte.android.fragments;

import android.animation.ObjectAnimator;
import android.app.Activity;
import android.app.AlertDialog;
import android.app.Fragment;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.graphics.Point;
import android.graphics.Rect;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable;
import android.support.annotation.DrawableRes;
import android.support.annotation.Nullable;
import android.support.v4.view.ViewCompat;
import android.support.v7.widget.GridLayoutManager;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.text.ClipboardManager;
import android.text.InputFilter;
import android.text.Spannable;
import android.text.SpannableStringBuilder;
import android.text.TextUtils;
import android.text.style.ImageSpan;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.view.animation.AccelerateInterpolator;
import android.view.animation.DecelerateInterpolator;
import android.view.animation.Interpolator;
import android.view.inputmethod.InputMethodManager;
import android.widget.Button;
import android.widget.EditText;
import android.widget.FrameLayout;
import android.widget.HorizontalScrollView;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.PopupMenu;
import android.widget.TextView;
import android.widget.Toast;
import com.facebook.appevents.AppEventsConstants;
import com.facebook.common.util.UriUtil;
import com.facebook.drawee.drawable.ScalingUtils;
import com.facebook.drawee.generic.RoundingParams;
import com.facebook.share.internal.ShareConstants;
import com.fasterxml.jackson.core.util.MinimalPrettyPrinter;
import com.google.android.gms.analytics.ecommerce.ProductAction;
import com.google.android.gms.appindexing.AppIndex;
import com.google.android.gms.appindexing.AppIndexApi;
import com.google.android.gms.common.api.GoogleApiClient;
import com.vk.attachpicker.AttachIntent;
import com.vk.attachpicker.events.NotificationListener;
import com.vk.core.util.Screen;
import com.vk.emoji.Emoji;
import com.vk.imageloader.transform.ProfileHeaderTransform;
import com.vk.imageloader.transform.StoriesProfileButtonTransform;
import com.vk.imageloader.view.VKImageView;
import com.vk.imageloader.view.VKLayerImageView;
import com.vk.music.dto.Playlist;
import com.vk.music.fragment.MusicFragment;
import com.vk.music.view.adapter.HorizontalPlaylistBinder;
import com.vk.music.view.adapter.IdResolver;
import com.vk.music.view.adapter.ItemAdapter;
import com.vk.music.view.adapter.ItemViewHolder;
import com.vk.stories.StoriesController;
import com.vk.stories.StoryViewActivity;
import com.vk.stories.model.GetStoriesResponse;
import com.vk.stories.model.StoriesContainer;
import com.vk.stories.model.StoryEntry;
import com.vk.webapp.ReportAppInputData;
import com.vkontakte.android.ActivityUtils;
import com.vkontakte.android.AppStateTracker;
import com.vkontakte.android.AudioAttachView;
import com.vkontakte.android.Global;
import com.vkontakte.android.ImagePickerActivity;
import com.vkontakte.android.LinkParser;
import com.vkontakte.android.LinkRedirActivity;
import com.vkontakte.android.Log;
import com.vkontakte.android.NewsEntry;
import com.vkontakte.android.Photo;
import com.vkontakte.android.PhotoViewer;
import com.vkontakte.android.PostPhotoActivity;
import com.vkontakte.android.R;
import com.vkontakte.android.Relation;
import com.vkontakte.android.TextFormatter;
import com.vkontakte.android.TimeUtils;
import com.vkontakte.android.UserProfile;
import com.vkontakte.android.VKAlertDialog;
import com.vkontakte.android.VKApplication;
import com.vkontakte.android.ViewUtils;
import com.vkontakte.android.api.BoardTopic;
import com.vkontakte.android.api.Callback;
import com.vkontakte.android.api.ExtendedUserProfile;
import com.vkontakte.android.api.ResultlessCallback;
import com.vkontakte.android.api.SimpleCallback;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.api.VideoFile;
import com.vkontakte.android.api.account.AccountBanUser;
import com.vkontakte.android.api.audio.AudioGet;
import com.vkontakte.android.api.fave.FaveAddGroup;
import com.vkontakte.android.api.fave.FaveAddUser;
import com.vkontakte.android.api.fave.FaveRemoveGroup;
import com.vkontakte.android.api.fave.FaveRemoveUser;
import com.vkontakte.android.api.friends.FriendsAdd;
import com.vkontakte.android.api.friends.FriendsDelete;
import com.vkontakte.android.api.friends.FriendsEdit;
import com.vkontakte.android.api.groups.GroupsInvite;
import com.vkontakte.android.api.groups.GroupsJoin;
import com.vkontakte.android.api.groups.GroupsLeave;
import com.vkontakte.android.api.market.MarketGet;
import com.vkontakte.android.api.newsfeed.NewsfeedAddBan;
import com.vkontakte.android.api.newsfeed.NewsfeedDeleteBan;
import com.vkontakte.android.api.photos.PhotosDeleteAvatar;
import com.vkontakte.android.api.photos.PhotosGet;
import com.vkontakte.android.api.photos.PhotosGetAll;
import com.vkontakte.android.api.status.StatusSet;
import com.vkontakte.android.api.users.GetFullProfile;
import com.vkontakte.android.api.video.VideoGet;
import com.vkontakte.android.api.video.VideoLiveSubscribe;
import com.vkontakte.android.api.wall.WallGet;
import com.vkontakte.android.api.wall.WallSubscribe;
import com.vkontakte.android.audio.AudioFacade;
import com.vkontakte.android.audio.MusicTrack;
import com.vkontakte.android.audio.player.PlayerRefer;
import com.vkontakte.android.audio.player.PlayerState;
import com.vkontakte.android.auth.VKAccountManager;
import com.vkontakte.android.auth.VKAuth;
import com.vkontakte.android.cache.Cache;
import com.vkontakte.android.cache.Videos;
import com.vkontakte.android.data.Analytics;
import com.vkontakte.android.data.Friends;
import com.vkontakte.android.data.Good;
import com.vkontakte.android.data.Groups;
import com.vkontakte.android.data.Posts;
import com.vkontakte.android.data.ServerKeys;
import com.vkontakte.android.data.VKList;
import com.vkontakte.android.fragments.PostViewFragment;
import com.vkontakte.android.fragments.PostponedPostListFragment;
import com.vkontakte.android.fragments.ProfileDetailsFragment;
import com.vkontakte.android.fragments.SuggestedPostListFragment;
import com.vkontakte.android.fragments.WikiViewFragment;
import com.vkontakte.android.fragments.discussions.BoardTopicViewFragment;
import com.vkontakte.android.fragments.discussions.BoardTopicsFragment;
import com.vkontakte.android.fragments.documents.DocumentsFragmentBuilder;
import com.vkontakte.android.fragments.friends.FriendsFragment;
import com.vkontakte.android.fragments.gifts.GiftsCatalogFragment;
import com.vkontakte.android.fragments.gifts.ProfileGiftsFragment;
import com.vkontakte.android.fragments.groupadmin.GroupAdminFragment;
import com.vkontakte.android.fragments.groups.GroupsFragment;
import com.vkontakte.android.fragments.market.GoodFragment;
import com.vkontakte.android.fragments.market.MarketFragment;
import com.vkontakte.android.fragments.messages.ChatFragment;
import com.vkontakte.android.fragments.news.NewPostFragment;
import com.vkontakte.android.fragments.photos.PhotoListFragment;
import com.vkontakte.android.fragments.userlist.FollowersListFragment;
import com.vkontakte.android.fragments.userlist.SubscriptionsUserListFragment;
import com.vkontakte.android.fragments.videos.VideosFragment;
import com.vkontakte.android.media.VideoPools;
import com.vkontakte.android.navigation.ArgKeys;
import com.vkontakte.android.navigation.Navigate;
import com.vkontakte.android.navigation.Navigator;
import com.vkontakte.android.ui.CardItemDecorator;
import com.vkontakte.android.ui.PhotoStripView;
import com.vkontakte.android.ui.adapters.LoadingAdapter;
import com.vkontakte.android.ui.holder.RecyclerHolder;
import com.vkontakte.android.ui.navigation.NavigationDelegateActivity;
import com.vkontakte.android.ui.widget.HorizontalRecyclerView;
import com.vkontakte.android.ui.widget.WidgetBinder;
import com.vkontakte.android.upload.ProfilePhotoUploadTask;
import com.vkontakte.android.upload.Upload;
import com.vkontakte.android.utils.L;
import com.vkontakte.android.utils.Utils;
import io.fabric.sdk.android.services.events.EventsFilesManager;
import io.reactivex.annotations.SchedulerSupport;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import me.grishka.appkit.api.APIRequest;
import me.grishka.appkit.utils.MergeRecyclerAdapter;
import me.grishka.appkit.utils.Preloader;
import me.grishka.appkit.utils.V;
import me.grishka.appkit.views.DividerItemDecoration;
import me.grishka.appkit.views.UsableRecyclerView;
/* loaded from: classes2.dex */
public class ProfileFragment extends PostListFragment implements FitSystemWindowsFragment {
    private static final int AVA_RESULT = 3901;
    private static final int EDIT_RESULT = 3902;
    private static final int INVITE_RESULT = 3903;
    private static final int LAYOUT_TYPE_NORMAL = 0;
    private static final int LAYOUT_TYPE_WIDE = 1;
    private static final int LAYOUT_TYPE_XWIDE = 2;
    private APIRequest audioLoadReq;
    private LinearLayout countersWrap;
    private TextView emptyText;
    private ViewInfoItem emptyViewItem;
    private int fixedPostId;
    private GoogleApiClient googleApiClient;
    private View headerView;
    private Uri indexingAppUri;
    private Uri indexingWebUri;
    private ProfileInfoAdapter infoAdapter;
    private int pendingAudioId;
    private PhotoViewer photoViewer;
    private ViewInfoItem postponedView;
    private ExtendedUserProfile profile;
    private MergeRecyclerAdapter profileAdapter;
    private View selector;
    private ViewInfoItem selectorItem;
    private View statusBarBgView;
    private ViewInfoItem suggestsView;
    private int totalPosts;
    private int uid;
    private boolean showExtended = false;
    private ArrayList<InfoItem> infoItems = new ArrayList<>();
    private ArrayList<DetailsItem> detailsItems = new ArrayList<>();
    private boolean ownerOnly = false;
    private int layoutType = 0;
    private ArrayList<MusicTrack> audioPlaylist = null;
    private String nextFrom = null;
    private final NotificationListener<StoryEntry> storyMarkAsSeenListener = new NotificationListener<StoryEntry>() { // from class: com.vkontakte.android.fragments.ProfileFragment.1
        {
            ProfileFragment.this = this;
        }

        @Override // com.vk.attachpicker.events.NotificationListener
        public void onNotification(int eventType, int eventId, StoryEntry eventArgs) {
            GetStoriesResponse r;
            if (eventArgs != null && (r = ProfileFragment.this.profile.storiesResponse) != null && r.storiesResponse != null) {
                for (int j = 0; j < r.storiesResponse.size(); j++) {
                    StoriesContainer sc = r.storiesResponse.get(j);
                    if (sc.hasValidStories()) {
                        for (int i = 0; i < sc.storyEntries.size(); i++) {
                            StoryEntry se = sc.storyEntries.get(i);
                            if (eventArgs.equals(se)) {
                                se.seen = true;
                                return;
                            }
                        }
                        continue;
                    }
                }
            }
        }
    };
    private BroadcastReceiver receiver = new BroadcastReceiver() { // from class: com.vkontakte.android.fragments.ProfileFragment.2
        {
            ProfileFragment.this = this;
        }

        @Override // android.content.BroadcastReceiver
        public void onReceive(Context context, Intent intent) {
            if (Posts.ACTION_USER_PHOTO_CHANGED.equals(intent.getAction())) {
                int id = intent.getIntExtra("id", 0);
                if (id == ProfileFragment.this.uid) {
                    ProfileFragment.this.refresh();
                }
            }
            if (Posts.ACTION_RELOAD_PROFILE.equals(intent.getAction())) {
                int id2 = intent.getIntExtra("id", 0);
                if (id2 == ProfileFragment.this.uid) {
                    ProfileFragment.this.refresh();
                }
            }
        }
    };
    private final View.OnClickListener counterClickListener = new View.OnClickListener() { // from class: com.vkontakte.android.fragments.ProfileFragment.3
        {
            ProfileFragment.this = this;
        }

        @Override // android.view.View.OnClickListener
        public void onClick(View view) {
            String act = (String) view.getTag();
            ProfileFragment.this.openOwnerContent(act);
        }
    };
    private View.OnClickListener btnClickListener = new AnonymousClass4();
    ParallaxPreDrawListener parallaxPreDrawListener = new ParallaxPreDrawListener();

    /* loaded from: classes2.dex */
    public static class Builder extends Navigator {
        public Builder(int peerId) {
            super(ProfileFragment.class);
            this.args.putInt("id", peerId);
        }

        public Builder setFromPost(int ownerId, int postId) {
            this.args.putString(ArgKeys.FROM_POST, ownerId + EventsFilesManager.ROLL_OVER_FILE_NAME_SEPARATOR + postId);
            return this;
        }

        public Builder setReferrer(String referrer) {
            this.args.putString(ArgKeys.REFERRER, referrer);
            return this;
        }
    }

    /* renamed from: com.vkontakte.android.fragments.ProfileFragment$4 */
    /* loaded from: classes2.dex */
    public class AnonymousClass4 implements View.OnClickListener {
        AnonymousClass4() {
            ProfileFragment.this = this$0;
        }

        @Override // android.view.View.OnClickListener
        public void onClick(View v) {
            String act = (String) v.getTag();
            if ("message".equals(act)) {
                new ChatFragment.Builder(ProfileFragment.this.uid, ProfileFragment.this.profile.profile.fullName).setPhoto(ProfileFragment.this.profile.profile.photo).go(ProfileFragment.this.getActivity());
            } else if (ArgKeys.POST.equals(act)) {
                ProfileFragment.this.showNewPost();
            } else if (ProductAction.ACTION_ADD.equals(act)) {
                ProfileFragment.this.addFriend();
            } else if ("accept".equals(act)) {
                ProfileFragment.this.doAddFriend("");
            } else if ("cancel".equals(act)) {
                ProfileFragment.this.doRemoveFriend();
            } else if ("join".equals(act)) {
                ProfileFragment.this.joinGroup(true);
            } else if ("join_unsure".equals(act)) {
                ProfileFragment.this.joinGroup(false);
            } else if ("leave".equals(act)) {
                ProfileFragment.this.leaveGroup();
            } else if ("photo".equals(act)) {
                Intent intent = new Intent(ProfileFragment.this.getActivity(), PostPhotoActivity.class);
                intent.putExtra("option", 0);
                ProfileFragment.this.startActivity(intent);
            } else if ("edit".equals(act)) {
                ProfileFragment.this.editProfile();
            } else if ("options".equals(act)) {
                PopupMenu pm = new PopupMenu(ProfileFragment.this.getActivity(), v);
                if (ProfileFragment.this.uid > 0) {
                    if (ProfileFragment.this.profile.friendStatus != 3) {
                        if (ProfileFragment.this.profile.friendStatus != 1) {
                            if (ProfileFragment.this.profile.friendStatus == 2) {
                                pm.getMenu().add(0, 2, 0, R.string.friends_add);
                                pm.getMenu().add(0, 1, 0, R.string.friends_decline);
                            }
                        } else {
                            pm.getMenu().add(0, 1, 0, R.string.profile_friend_cancel);
                            pm.getMenu().add(0, 10, 0, ProfileFragment.this.getString(ProfileFragment.this.profile.isHiddenFromFeed ? R.string.show_user_news : R.string.hide_user_news, new Object[]{ProfileFragment.this.profile.firstNameGen}));
                        }
                    } else {
                        pm.getMenu().add(0, 0, 0, R.string.edit_user_lists);
                        pm.getMenu().add(0, 1, 0, R.string.delete_friend);
                        pm.getMenu().add(0, 10, 0, ProfileFragment.this.getString(ProfileFragment.this.profile.isHiddenFromFeed ? R.string.show_user_news : R.string.hide_user_news, new Object[]{ProfileFragment.this.profile.firstNameGen}));
                    }
                } else if (ProfileFragment.this.profile.friendStatus == 1 || ProfileFragment.this.profile.friendStatus == 2) {
                    if (ProfileFragment.this.profile.groupType != 1 || ProfileFragment.this.profile.eventStartTime <= TimeUtils.getCurrentTime()) {
                        pm.getMenu().add(0, 3, 0, ProfileFragment.this.profile.groupType != 2 ? R.string.leave_group : R.string.profile_unsubscribe);
                    } else {
                        pm.getMenu().add(0, 4, 0, R.string.event_change_decision);
                    }
                    pm.getMenu().add(0, 10, 0, ProfileFragment.this.getString(ProfileFragment.this.profile.isHiddenFromFeed ? R.string.show_user_news : R.string.hide_user_news, new Object[]{ProfileFragment.this.getString(R.string.group_s)}));
                } else if (ProfileFragment.this.profile.friendStatus != 4) {
                    if (ProfileFragment.this.profile.friendStatus == 5) {
                        if (ProfileFragment.this.profile.groupType == 1) {
                            pm.getMenu().add(0, 5, 0, R.string.group_event_join);
                            pm.getMenu().add(0, 6, 0, R.string.group_event_join_unsure);
                        } else {
                            pm.getMenu().add(0, 5, 0, R.string.group_inv_accept);
                        }
                        pm.getMenu().add(0, 3, 0, R.string.group_inv_decline);
                    }
                } else {
                    pm.getMenu().add(0, 3, 0, R.string.profile_friend_cancel);
                }
                pm.setOnMenuItemClickListener(ProfileFragment$4$$Lambda$1.lambdaFactory$(this, v));
                pm.show();
            } else if ("event_options".equals(act)) {
                ProfileFragment.this.showChangeEventDecisionOptions(v);
            }
        }

        public /* synthetic */ boolean lambda$onClick$0(View v, MenuItem item) {
            switch (item.getItemId()) {
                case 0:
                    ProfileFragment.this.editFriendLists();
                    break;
                case 1:
                    ProfileFragment.this.removeFriend();
                    break;
                case 2:
                    ProfileFragment.this.doAddFriend("");
                    break;
                case 3:
                    ProfileFragment.this.leaveGroup();
                    break;
                case 4:
                    ProfileFragment.this.showChangeEventDecisionOptions(v);
                    break;
                case 5:
                    ProfileFragment.this.joinGroup(true);
                    break;
                case 6:
                    ProfileFragment.this.joinGroup(false);
                    break;
                case 10:
                    ProfileFragment.this.toggleNewsHidden();
                    break;
            }
            return true;
        }
    }

    @Override // com.vkontakte.android.fragments.PostListFragment, android.app.DialogFragment, android.app.Fragment
    public void onCreate(Bundle state) {
        super.onCreate(state);
        StoriesController.notificationCenter().addListener(100, this.storyMarkAsSeenListener);
    }

    @Override // com.vkontakte.android.fragments.PostListFragment, me.grishka.appkit.fragments.LoaderFragment, android.app.Fragment
    public void onDestroy() {
        StoriesController.notificationCenter().removeListener(this.storyMarkAsSeenListener);
        if (this.googleApiClient != null && this.indexingAppUri != null) {
            AppIndex.AppIndexApi.viewEnd(this.googleApiClient, getActivity(), this.indexingAppUri);
            this.googleApiClient.disconnect();
        }
        super.onDestroy();
    }

    @Override // com.vkontakte.android.fragments.PostListFragment, com.vkontakte.android.fragments.CardRecyclerFragment, me.grishka.appkit.fragments.BaseRecyclerFragment, me.grishka.appkit.fragments.LoaderFragment, me.grishka.appkit.fragments.AppKitFragment, android.app.DialogFragment, android.app.Fragment
    public void onDestroyView() {
        super.onDestroyView();
        this.parallaxPreDrawListener.cleanOldView();
    }

    @Override // com.vkontakte.android.fragments.PostListFragment, com.vkontakte.android.fragments.CardRecyclerFragment, me.grishka.appkit.fragments.BaseRecyclerFragment, me.grishka.appkit.fragments.AppKitFragment, android.app.Fragment
    public void onAttach(Activity act) {
        this.uid = getArguments().getInt("id", VKAccountManager.getCurrent().getUid());
        if (this.uid == 0) {
            this.uid = VKAccountManager.getCurrent().getUid();
        }
        setLayout(R.layout.overlay_toolbar_loader_fragment);
        ActivityUtils.setBeamLink(act, this.uid > 0 ? "id" + this.uid : "club" + this.uid);
        setHasOptionsMenu(true);
        setTitle(MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR);
        super.onAttach(act);
        IntentFilter filter = new IntentFilter();
        filter.addAction(Posts.ACTION_USER_PHOTO_CHANGED);
        filter.addAction(Posts.ACTION_RELOAD_PROFILE);
        VKApplication.context.registerReceiver(this.receiver, filter, "com.vkontakte.android.permission.ACCESS_DATA", null);
    }

    @Override // com.vkontakte.android.fragments.PostListFragment, com.vkontakte.android.fragments.CardRecyclerFragment, com.vkontakte.android.fragments.VKRecyclerFragment, me.grishka.appkit.fragments.AppKitFragment, android.app.Fragment
    public void onViewCreated(View view, Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);
        this.statusBarBgView = this.contentView.findViewById(R.id.loader_overlay_statusbar_bg);
        getToolbar().setOnClickListener(ProfileFragment$$Lambda$1.lambdaFactory$(this));
        VKImageView vkImageView = (VKImageView) this.headerView.findViewById(R.id.group_cover);
        if (vkImageView != null) {
            vkImageView.setMaxAspectRatio(4.0f);
        }
        if (this.uid > 0) {
            addParallaxEffect();
        } else if (isEnableGroupParallaxEffect()) {
            this.parallaxPreDrawListener.hideToolbar();
        }
        this.list.getRecycledViewPool().setMaxRecycledViews(R.id.profile_counters, 0);
        this.list.addItemDecoration(new RecyclerView.ItemDecoration() { // from class: com.vkontakte.android.fragments.ProfileFragment.5
            {
                ProfileFragment.this = this;
            }

            @Override // android.support.v7.widget.RecyclerView.ItemDecoration
            public void getItemOffsets(Rect outRect, View view2, RecyclerView parent, RecyclerView.State state) {
                int pos = parent.getChildLayoutPosition(view2);
                if (pos < ProfileFragment.this.infoAdapter.getItemCount()) {
                    if (ProfileFragment.this.layoutType == 1 && (ProfileFragment.this.infoItems.get(pos) instanceof OverviewInfoItem) && (pos == 1 || pos == 2)) {
                        outRect.top = V.dp(8.0f);
                    }
                    if (ProfileFragment.this.layoutType == 0 && ProfileFragment.this.uid == VKAccountManager.getCurrent().getUid() && (ProfileFragment.this.infoItems.get(pos) instanceof OverviewInfoItem) && pos == 1) {
                        outRect.top = V.dp(8.0f);
                    }
                    if (((view2.getId() == R.id.profile_show_info || view2.getId() == R.id.profile_wiki || view2.getId() == R.id.profile_website || ProfileFragment.this.profile.ban != null) && ((InfoItem) ProfileFragment.this.infoItems.get(pos)).backgroundType == 4) || (ProfileFragment.this.infoItems.get(pos) instanceof BoardTopicInfoItem) || (ProfileFragment.this.infoItems.get(pos) instanceof AudioInfoItem)) {
                        outRect.bottom = V.dp(8.0f);
                    }
                }
            }
        });
        DividerItemDecoration dividers = new DividerItemDecoration(new ColorDrawable(637534208), V.dp(0.5f));
        dividers.setUseDecoratedVBounds(true);
        dividers.setProvider(ProfileFragment$$Lambda$2.lambdaFactory$(this));
        this.list.addItemDecoration(dividers);
    }

    public /* synthetic */ void lambda$onViewCreated$0(View v) {
        if (this.list != null) {
            this.list.scrollToPosition(0);
        }
    }

    public /* synthetic */ boolean lambda$onViewCreated$1(int position) {
        return position < this.infoItems.size() && this.infoItems.get(position).dividerAfter;
    }

    public void addParallaxEffect() {
        if (this.uid > 0 || isEnableGroupParallaxEffect()) {
            getToolbar().setBackgroundDrawable(getToolbar().getBackground().mutate());
            this.list.getViewTreeObserver().removeOnPreDrawListener(this.parallaxPreDrawListener);
            this.list.getViewTreeObserver().addOnPreDrawListener(this.parallaxPreDrawListener);
        }
    }

    public boolean isEnableGroupParallaxEffect() {
        return this.uid < 0 && !isTabletDecorator() && !this.isTablet;
    }

    @Override // com.vkontakte.android.fragments.CardRecyclerFragment
    protected CardItemDecorator onCreateCardDecorator() {
        boolean z = true;
        int scrW = getResources().getConfiguration().screenWidthDp;
        boolean isTablet = isTabletDecorator() && this.isTablet;
        UsableRecyclerView usableRecyclerView = this.list;
        if (isTablet) {
            z = false;
        }
        CardItemDecorator decorator = new CardItemDecorator(usableRecyclerView, z);
        decorator.setPadding(V.dp(2.0f), V.dp(3.0f), V.dp(-2.0f), 0);
        int pad = isTablet ? V.dp(Math.max(16, ((scrW - 840) - 84) / 2)) : 0;
        this.list.setPadding(pad, 0, pad, 0);
        return decorator;
    }

    @Override // com.vkontakte.android.fragments.PostListFragment, me.grishka.appkit.fragments.ContainerFragment, android.app.DialogFragment, android.app.Fragment
    public void onDetach() {
        try {
            VKApplication.context.unregisterReceiver(this.receiver);
        } catch (Exception x) {
            L.e(x, new Object[0]);
        }
        super.onDetach();
    }

    @Override // me.grishka.appkit.fragments.BaseRecyclerFragment
    /* renamed from: onCreateLayoutManager */
    protected RecyclerView.LayoutManager mo1032onCreateLayoutManager() {
        if (this.layoutType >= 1) {
            GridLayoutManager glm = new GridLayoutManager(getActivity(), 2);
            glm.setSpanSizeLookup(new GridLayoutManager.SpanSizeLookup() { // from class: com.vkontakte.android.fragments.ProfileFragment.6
                {
                    ProfileFragment.this = this;
                }

                @Override // android.support.v7.widget.GridLayoutManager.SpanSizeLookup
                public int getSpanSize(int position) {
                    if (position == 0 || position >= ProfileFragment.this.infoItems.size()) {
                        return 2;
                    }
                    if (position < ProfileFragment.this.infoItems.size() && (ProfileFragment.this.infoItems.get(position) instanceof ViewInfoItem)) {
                        View view = ((ViewInfoItem) ProfileFragment.this.infoItems.get(position)).view;
                        if (view.getId() == R.id.profile_show_info || view.getId() == R.id.profile_wiki || view.getId() == R.id.profile_website || view.getId() == R.id.profile_group_invited) {
                            return 2;
                        }
                    }
                    for (int i = 1; i <= position; i++) {
                        if ((((InfoItem) ProfileFragment.this.infoItems.get(i)).backgroundType & 4) == 4) {
                            return 2;
                        }
                    }
                    return 1;
                }
            });
            return glm;
        }
        return new LinearLayoutManager(getActivity());
    }

    @Override // com.vkontakte.android.fragments.PostListFragment, android.app.Fragment
    public void onPause() {
        VideoPools.onPause(getActivity());
        super.onPause();
    }

    @Override // com.vkontakte.android.fragments.PostListFragment, android.app.Fragment
    public void onResume() {
        super.onResume();
        VideoPools.onResume(getActivity());
    }

    @Override // com.vkontakte.android.fragments.PostListFragment, me.grishka.appkit.fragments.BaseRecyclerFragment
    /* renamed from: getAdapter */
    public UsableRecyclerView.Adapter mo1066getAdapter() {
        if (this.profileAdapter == null) {
            this.profileAdapter = new CardMergeAdapter();
            MergeRecyclerAdapter mergeRecyclerAdapter = this.profileAdapter;
            ProfileInfoAdapter profileInfoAdapter = new ProfileInfoAdapter();
            this.infoAdapter = profileInfoAdapter;
            mergeRecyclerAdapter.addAdapter(profileInfoAdapter);
            this.profileAdapter.addAdapter(super.mo1066getAdapter());
        }
        return this.profileAdapter;
    }

    @Override // com.vkontakte.android.fragments.PostListFragment
    protected boolean canAddPost(NewsEntry post) {
        if (post.ownerID == this.uid) {
            if (post.flag(2048)) {
                updatePostsButtons(1, 0);
                return false;
            }
            if (!this.profile.canPost && this.profile.adminLevel < 2) {
                Log.d("vk", AppEventsConstants.EVENT_PARAM_VALUE_YES);
                if (post.flag(4096)) {
                    updatePostsButtons(0, 1);
                    return false;
                }
            }
            return true;
        }
        return false;
    }

    @Override // android.app.Fragment
    public void onCreateOptionsMenu(Menu menu, MenuInflater inflater) {
        boolean z = true;
        if (this.profile != null) {
            inflater.inflate(R.menu.profile, menu);
            menu.findItem(R.id.edit_profile).setVisible(this.uid == VKAccountManager.getCurrent().getUid());
            menu.findItem(R.id.favorites_add).setVisible(VKAccountManager.getCurrent().getUid() != this.uid && !this.profile.isFavorite && !this.profile.isDeactivated());
            menu.findItem(R.id.favorites_remove).setVisible(VKAccountManager.getCurrent().getUid() != this.uid && this.profile.isFavorite && !this.profile.isDeactivated());
            menu.findItem(R.id.subscribe).setVisible(!this.profile.isDeactivated() && this.uid != VKAccountManager.getCurrent().getUid() && this.profile.ban == null);
            menu.findItem(R.id.subscribe).setTitle(this.profile.isSubscribed ? R.string.unsubscribe_from_posts : R.string.subscribe_to_posts);
            menu.findItem(R.id.subscribe_live).setVisible(this.profile.isLiveEnabled && this.uid != VKAccountManager.getCurrent().getUid() && this.profile.ban == null);
            menu.findItem(R.id.subscribe_live).setTitle(this.profile.isLiveSubscribed ? R.string.group_video_live_notify_off : R.string.group_video_live_notify_on);
            menu.findItem(R.id.gift).setVisible(this.uid > 0 && !this.profile.isDeactivated() && this.profile.ban == null && this.uid != VKAccountManager.getCurrent().getUid() && VKAccountManager.getCurrent().getUid() > 0);
            if (this.uid > 0) {
                if (this.uid == VKAccountManager.getCurrent().getUid() || VKAccountManager.getCurrent().getUid() == 0) {
                    menu.findItem(R.id.block).setVisible(false);
                }
                menu.findItem(R.id.block).setTitle(this.profile.blacklisted ? R.string.unblock_user : R.string.block_user);
                menu.findItem(R.id.edit_group).setVisible(false);
                menu.findItem(R.id.invite).setVisible(false);
                if (this.profile.isDeactivated() && this.profile.friendStatus == 3) {
                    menu.add(0, R.id.delete, 0, R.string.delete_friend);
                    return;
                }
                return;
            }
            menu.findItem(R.id.block).setVisible(false);
            if (!this.profile.isDeactivated()) {
                menu.findItem(R.id.edit_group).setVisible(this.profile.adminLevel > 0);
                MenuItem findItem = menu.findItem(R.id.invite);
                if (this.profile.groupType == 2 || (this.profile.groupAccess != 0 && this.profile.adminLevel < 1)) {
                    z = false;
                }
                findItem.setVisible(z);
                return;
            }
            menu.findItem(R.id.edit_group).setVisible(false);
            menu.findItem(R.id.invite).setVisible(false);
            if (this.profile.friendStatus == 1) {
                menu.add(0, R.id.delete, 0, R.string.leave_group);
            }
        }
    }

    @Override // com.vkontakte.android.fragments.CardRecyclerFragment, me.grishka.appkit.fragments.AppKitFragment, android.app.Fragment, android.content.ComponentCallbacks
    public void onConfigurationChanged(Configuration cfg) {
        super.onConfigurationChanged(cfg);
        int pos = 0;
        int offset = 0;
        if (this.list.getChildCount() > 0) {
            View c = this.list.getChildAt(0);
            pos = this.list.getChildAdapterPosition(c);
            offset = c.getTop();
        }
        this.list.removeView(this.headerView);
        updateLayoutType(cfg);
        applyLayout();
        updateHeaderItems();
        this.list.getRecycledViewPool().clear();
        this.list.setLayoutManager(mo1032onCreateLayoutManager());
        ((LinearLayoutManager) this.list.getLayoutManager()).scrollToPositionWithOffset(pos, offset);
        updateContentParalaxPadding();
    }

    private void updateLayoutType(Configuration cfg) {
        if (!this.isTablet && cfg.screenWidthDp <= cfg.screenHeightDp) {
            this.layoutType = 0;
        } else if (cfg.screenWidthDp > 640) {
            this.layoutType = 2;
        } else if (cfg.screenWidthDp > 480) {
            this.layoutType = 1;
        } else {
            this.layoutType = 0;
        }
    }

    private void applyLayout() {
        int res = 0;
        switch (this.layoutType) {
            case 0:
                if (this.uid <= 0) {
                    res = R.layout.profile_head_group;
                    break;
                } else {
                    res = R.layout.profile_head;
                    break;
                }
            case 1:
            case 2:
                if (this.uid <= 0) {
                    res = R.layout.profile_head_group_wide;
                    break;
                } else {
                    res = R.layout.profile_head_wide;
                    break;
                }
        }
        this.headerView = View.inflate(getActivity(), res, null);
        this.parallaxPreDrawListener.cleanOldView();
        this.headerView.findViewById(R.id.profile_photo).setOnClickListener(ProfileFragment$$Lambda$3.lambdaFactory$(this));
        if (this.uid == VKAccountManager.getCurrent().getUid() || (this.uid < 0 && Groups.isGroupAdmin(-this.uid))) {
            this.headerView.setOnLongClickListener(ProfileFragment$$Lambda$4.lambdaFactory$(this));
        }
        if (this.uid > 0) {
            this.list.getViewTreeObserver().addOnPreDrawListener(new ViewTreeObserver.OnPreDrawListener() { // from class: com.vkontakte.android.fragments.ProfileFragment.7
                {
                    ProfileFragment.this = this;
                }

                @Override // android.view.ViewTreeObserver.OnPreDrawListener
                public boolean onPreDraw() {
                    if (ProfileFragment.this.list != null && ProfileFragment.this.contentWrap != null) {
                        ProfileFragment.this.list.getViewTreeObserver().removeOnPreDrawListener(this);
                        ProfileFragment.this.contentWrap.setPadding(0, ProfileFragment.this.layoutType == 0 ? 0 : ProfileFragment.this.getToolbar().getHeight(), 0, 0);
                    }
                    return false;
                }
            });
            if (this.layoutType == 0) {
                this.headerView.addOnLayoutChangeListener(new View.OnLayoutChangeListener() { // from class: com.vkontakte.android.fragments.ProfileFragment.8
                    int prevW = 0;

                    {
                        ProfileFragment.this = this;
                    }

                    @Override // android.view.View.OnLayoutChangeListener
                    public void onLayoutChange(View v, int left, int top, int right, int bottom, int oldLeft, int oldTop, int oldRight, int oldBottom) {
                        int w = right - left;
                        if (w != this.prevW) {
                            Button btn2 = (Button) v.findViewById(R.id.profile_btn2);
                            Button btn3 = (Button) v.findViewById(R.id.profile_btn3);
                            View btnWrap = v.findViewById(R.id.profile_buttons_wrap);
                            int btnMinW = (w - (btnWrap.getPaddingLeft() * 2)) / 2;
                            btn2.setMinWidth(btnMinW);
                            btn3.setMinWidth(btnMinW);
                            this.prevW = w;
                        }
                    }
                });
            }
        }
    }

    public /* synthetic */ void lambda$applyLayout$2(View v) {
        if (this.uid == VKAccountManager.getCurrent().getUid() || (this.uid < 0 && Groups.isGroupAdmin(-this.uid))) {
            showUpdatePhotoDlg(this.profile.hasPhoto);
        } else {
            openProfilePhotos();
        }
    }

    public /* synthetic */ boolean lambda$applyLayout$3(View v) {
        openProfilePhotos();
        return true;
    }

    @Override // android.app.Fragment
    public boolean onOptionsItemSelected(MenuItem item) {
        switch (item.getItemId()) {
            case R.id.copy_link /* 2131755023 */:
                copyLink();
                return true;
            case R.id.search /* 2131755135 */:
                openWallSearch();
                return true;
            case R.id.subscribe /* 2131755474 */:
                togglePostSubscription();
                return true;
            case R.id.gift /* 2131755903 */:
                sendGift();
                return true;
            case R.id.edit_profile /* 2131756334 */:
                editProfile();
                return true;
            case R.id.delete /* 2131756520 */:
                if (this.uid > 0) {
                    removeFriend();
                    return true;
                }
                leaveGroup();
                return true;
            case R.id.invite /* 2131756534 */:
                inviteToGroup();
                return true;
            case R.id.edit_group /* 2131756535 */:
                editGroup();
                return true;
            case R.id.subscribe_live /* 2131756536 */:
                toggleLiveSubscription();
                return true;
            case R.id.favorites_add /* 2131756537 */:
                addToFavorites();
                return true;
            case R.id.open_in_browser /* 2131756538 */:
                openInBrowser();
                return true;
            case R.id.block /* 2131756539 */:
                toggleBlacklist();
                return true;
            case R.id.favorites_remove /* 2131756540 */:
                removeFromFavorites();
                return true;
            default:
                return true;
        }
    }

    @Override // me.grishka.appkit.fragments.LoaderFragment, android.app.Fragment
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        updateLayoutType(getResources().getConfiguration());
        View view = super.onCreateView(inflater, container, savedInstanceState);
        this.selector = inflater.inflate(R.layout.profile_wall_selector, container, false);
        this.selector.findViewById(R.id.profile_wall_all_posts).setOnClickListener(ProfileFragment$$Lambda$5.lambdaFactory$(this));
        this.selector.findViewById(R.id.profile_wall_owner_posts).setOnClickListener(ProfileFragment$$Lambda$6.lambdaFactory$(this));
        this.selector.findViewById(R.id.profile_wall_post_btn).setOnClickListener(ProfileFragment$$Lambda$7.lambdaFactory$(this));
        this.selector.findViewById(R.id.profile_wall_all_posts).setSelected(true);
        this.emptyText = new TextView(getActivity());
        this.emptyText.setText(R.string.wall_empty);
        this.emptyText.setGravity(17);
        this.emptyText.setPadding(Global.scale(16.0f), Global.scale(32.0f), Global.scale(16.0f), Global.scale(32.0f));
        this.emptyText.setTextSize(17.0f);
        this.emptyText.setTextColor(-6052957);
        this.emptyText.setId(R.id.empty_text);
        this.emptyViewItem = new ViewInfoItem(this.emptyText);
        this.emptyViewItem.backgroundType = 4;
        this.postponedView = new ViewInfoItem(getActivity().getLayoutInflater().inflate(R.layout.profile_posts_button, (ViewGroup) this.list, false));
        this.suggestsView = new ViewInfoItem(getActivity().getLayoutInflater().inflate(R.layout.profile_posts_button, (ViewGroup) this.list, false));
        this.postponedView.view.setId(R.id.profile_btn_postponed);
        this.suggestsView.view.setId(R.id.profile_btn_suggested);
        this.postponedView.view.setOnClickListener(ProfileFragment$$Lambda$8.lambdaFactory$(this));
        this.suggestsView.view.setOnClickListener(ProfileFragment$$Lambda$9.lambdaFactory$(this));
        this.contentWrap.removeView(this.emptyView);
        applyLayout();
        updateHeaderItems();
        return view;
    }

    public /* synthetic */ void lambda$onCreateView$4(View v) {
        switchOwnerOnly(false);
    }

    public /* synthetic */ void lambda$onCreateView$5(View v) {
        switchOwnerOnly(true);
    }

    public /* synthetic */ void lambda$onCreateView$6(View v) {
        openWallSearch();
    }

    public /* synthetic */ void lambda$onCreateView$7(View v) {
        new PostponedPostListFragment.Builder(this.uid).go(getActivity());
    }

    public /* synthetic */ void lambda$onCreateView$8(View v) {
        new SuggestedPostListFragment.Builder(this.uid).go(getActivity());
    }

    @Override // com.vkontakte.android.fragments.PostListFragment
    protected void onPostDeleted(NewsEntry post) {
        if (post.flag(2048)) {
            updatePostsButtons(-1, 0);
        }
        if (post.flag(4096)) {
            updatePostsButtons(0, -1);
        }
    }

    private void sendGift() {
        GiftsCatalogFragment.start(getActivity(), this.profile.profile);
    }

    private void openWallSearch() {
        Bundle args = new Bundle();
        args.putInt("owner", this.uid);
        args.putString("owner_name_gen", this.uid < 0 ? getString(R.string.group_s) : this.profile.firstNameGen);
        Navigate.to(NewsSearchFragment.class, args, getActivity());
    }

    public void showUpdatePhotoDlg(boolean havePhotos) {
        Intent intent = new Intent(getActivity(), ImagePickerActivity.class);
        intent.putExtra("allow_album", false);
        intent.putExtra(ArgKeys.LIMIT, 1);
        ArrayList<String> acts = new ArrayList<>();
        if (havePhotos) {
            acts.add(getString(R.string.open));
            acts.add(getString(R.string.delete));
            intent.putExtra(SchedulerSupport.CUSTOM, acts);
        }
        intent.putExtra("no_thumbs", true);
        intent.putExtra(AttachIntent.INTENT_THUMB, true);
        startActivityForResult(intent, AVA_RESULT);
    }

    public void editProfile() {
        new Navigator(ProfileEditFragment.class, new Bundle()).forResult(this, EDIT_RESULT);
    }

    public void editGroup() {
        Bundle args = new Bundle();
        args.putInt("level", this.profile.adminLevel);
        args.putString("title", this.profile.profile.fullName);
        args.putInt("id", -this.uid);
        args.putInt(ServerKeys.TYPE, this.profile.groupType);
        args.putInt("access", this.profile.groupAccess);
        Navigate.to(GroupAdminFragment.class, args, getActivity());
    }

    public void inviteToGroup() {
        new FriendsFragment.Builder().setSelect().forResult(this, 3903);
    }

    @Override // com.vkontakte.android.fragments.PostListFragment, android.app.Fragment
    public void onActivityResult(int reqCode, int resCode, Intent data) {
        if (reqCode == AVA_RESULT && resCode == -1) {
            float cropLeft = data.getFloatExtra("cropLeft", 0.0f);
            float cropTop = data.getFloatExtra("cropTop", 0.0f);
            float cropRight = data.getFloatExtra("cropRight", 0.0f);
            float cropBottom = data.getFloatExtra("cropBottom", 0.0f);
            Upload.start(getActivity(), new ProfilePhotoUploadTask(getActivity(), data.getStringExtra(UriUtil.LOCAL_FILE_SCHEME), this.uid, true, cropLeft, cropTop, cropRight, cropBottom));
        }
        if (reqCode == AVA_RESULT && resCode == 1) {
            int idx = data.getIntExtra("option", 0);
            if (idx == 0) {
                openProfilePhotos();
            }
            if (idx == 1) {
                new VKAlertDialog.Builder(getActivity()).setTitle(R.string.confirm).setMessage(R.string.delete_photo_confirm).setPositiveButton(R.string.yes, ProfileFragment$$Lambda$10.lambdaFactory$(this)).setNegativeButton(R.string.no, (DialogInterface.OnClickListener) null).show();
            }
        }
        if (reqCode == EDIT_RESULT && resCode == -1) {
            Toast.makeText(getActivity(), (int) R.string.profile_saved, 0).show();
            refresh();
        }
        if (reqCode == 3903 && resCode == -1) {
            UserProfile p = (UserProfile) data.getParcelableExtra(ProfileGiftsFragment.Extra.User);
            new GroupsInvite(-this.uid, p.uid).setCallback(new ResultlessCallback(getActivity()) { // from class: com.vkontakte.android.fragments.ProfileFragment.9
                {
                    ProfileFragment.this = this;
                }

                @Override // com.vkontakte.android.api.ResultlessCallback
                public void success() {
                    if (ProfileFragment.this.getActivity() != null) {
                        Toast.makeText(ProfileFragment.this.getActivity(), (int) R.string.invitation_sent, 0).show();
                    }
                }
            }).wrapProgress(getActivity()).exec((Context) getActivity());
        }
    }

    public /* synthetic */ void lambda$onActivityResult$9(DialogInterface dialog, int which) {
        deletePhoto();
    }

    public static String getNameGen(Context ctx, ExtendedUserProfile profile) {
        return Screen.isTablet(ctx) ? profile.firstNameGen + MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR + profile.lastNameGen : profile.firstNameGen;
    }

    public void openOwnerContent(String act) {
        boolean z = true;
        Activity activity = getActivity();
        String valueOf = String.valueOf(act);
        char c = 65535;
        switch (valueOf.hashCode()) {
            case -1884266413:
                if (valueOf.equals("stories")) {
                    c = 0;
                    break;
                }
                break;
            case -1406804131:
                if (valueOf.equals("audios")) {
                    c = 5;
                    break;
                }
                break;
            case -1237460524:
                if (valueOf.equals("groups")) {
                    c = 6;
                    break;
                }
                break;
            case -1081306052:
                if (valueOf.equals(ReportAppInputData.REPORT_TYPE_MARKET)) {
                    c = 2;
                    break;
                }
                break;
            case -989034367:
                if (valueOf.equals("photos")) {
                    c = 1;
                    break;
                }
                break;
            case -868034268:
                if (valueOf.equals("topics")) {
                    c = 7;
                    break;
                }
                break;
            case -816678056:
                if (valueOf.equals("videos")) {
                    c = 4;
                    break;
                }
                break;
            case 3088955:
                if (valueOf.equals("docs")) {
                    c = '\t';
                    break;
                }
                break;
            case 98352451:
                if (valueOf.equals("gifts")) {
                    c = 11;
                    break;
                }
                break;
            case 948881689:
                if (valueOf.equals("members")) {
                    c = '\b';
                    break;
                }
                break;
            case 1003689066:
                if (valueOf.equals("mutual_friends")) {
                    c = 3;
                    break;
                }
                break;
            case 1987365622:
                if (valueOf.equals("subscriptions")) {
                    c = '\n';
                    break;
                }
                break;
        }
        switch (c) {
            case 0:
                Intent intent = new Intent(activity, StoryViewActivity.class);
                intent.putExtra(StoryViewActivity.INTENT_GET_STORIES_RESPONSE, this.profile.storiesResponse.storiesResponse);
                intent.putExtra(StoryViewActivity.INTENT_SOURCE_TYPE, StoriesController.SourceType.PROFILE);
                startActivity(intent);
                return;
            case 1:
                Bundle args = new Bundle();
                args.putInt(ArgKeys.UID, this.uid);
                args.putBoolean("need_system", true);
                args.putString("user_name_ins", this.profile.firstNameIns);
                if (this.uid <= 0 || !this.profile.counters.containsKey("user_photos") || this.profile.getCounter("user_photos") <= 0) {
                    z = false;
                }
                args.putBoolean("can_view_user_photos", z);
                Navigate.to(PhotosFragment.class, args, activity);
                return;
            case 2:
                new MarketFragment.Builder(this.uid).go(activity);
                return;
            case 3:
                new FriendsFragment.Builder().setUid(this.uid).setTitle(getResources().getString(R.string.friends_of_user, getNameGen(activity, this.profile))).setMutual(true).go(activity);
                return;
            case 4:
                Bundle args2 = new Bundle();
                args2.putInt(ArgKeys.UID, this.uid);
                args2.putBoolean("can_upload_video", this.profile.canUploadVideo);
                if (this.profile.profile.uid > 0) {
                    args2.putCharSequence("username_ins", this.profile.firstNameIns);
                }
                Resources resources = getResources();
                Object[] objArr = new Object[1];
                objArr[0] = this.uid > 0 ? getNameGen(activity, this.profile) : getResources().getString(R.string.group_s);
                args2.putCharSequence("title", resources.getString(R.string.videos_by_user, objArr));
                if (this.uid < 0) {
                    args2.putString("groupName", this.profile.profile.fullName);
                    args2.putString("groupPhoto", this.profile.profile.photo);
                }
                Navigate.to(VideosFragment.class, args2, activity);
                return;
            case 5:
                if (VKAuth.ensureLoggedIn(activity)) {
                    new MusicFragment.Builder().ownerId(this.uid).setOwnerNameFull(this.profile.profile.fullName).go(activity);
                    return;
                }
                return;
            case 6:
                Bundle args3 = new Bundle();
                args3.putInt(ArgKeys.UID, this.uid);
                args3.putCharSequence("title", getResources().getString(R.string.groups_of_user, getNameGen(activity, this.profile)));
                Navigate.to(GroupsFragment.class, args3, activity);
                return;
            case 7:
                new BoardTopicsFragment.Builder(-this.uid).go(this);
                return;
            case '\b':
                Bundle args4 = new Bundle();
                args4.putInt("gid", -this.uid);
                args4.putCharSequence("title", getResources().getString(R.string.group_members));
                args4.putInt(ServerKeys.TYPE, this.profile.groupType);
                Navigate.to(GroupMembersFragment.class, args4, activity);
                return;
            case '\t':
                new DocumentsFragmentBuilder().setOwnerId(this.uid).go(activity);
                return;
            case '\n':
                Bundle args5 = new Bundle();
                args5.putInt(ArgKeys.UID, this.uid);
                args5.putCharSequence("title", getResources().getString(R.string.profile_subscriptions));
                Navigate.to(SubscriptionsUserListFragment.class, args5, activity);
                return;
            case 11:
                Bundle args6 = new Bundle();
                args6.putParcelable(ProfileGiftsFragment.Extra.User, this.profile.profile);
                args6.putCharSequence("title", getResources().getString(R.string.gifts_of_placeholder, getNameGen(activity, this.profile)));
                Navigate.to(ProfileGiftsFragment.class, args6, activity);
                return;
            default:
                return;
        }
    }

    private void deletePhoto() {
        new PhotosDeleteAvatar(this.uid).setCallback(new SimpleCallback<String>(getActivity()) { // from class: com.vkontakte.android.fragments.ProfileFragment.10
            {
                ProfileFragment.this = this;
            }

            @Override // com.vkontakte.android.api.Callback
            public void success(String newPhoto) {
                ProfileFragment.this.profile.hasPhoto = false;
                ProfileFragment.this.setUserPhoto(newPhoto);
                if (ProfileFragment.this.uid == VKAccountManager.getCurrent().getUid()) {
                    ProfileFragment.this.getActivity().sendBroadcast(new Intent(Posts.ACTION_USER_PHOTO_CHANGED).putExtra("photo", newPhoto).putExtra("id", ProfileFragment.this.uid), "com.vkontakte.android.permission.ACCESS_DATA");
                }
            }
        }).wrapProgress(getActivity()).exec((Context) getActivity());
    }

    public void openProfilePhotos() {
        new PhotosGet(this.uid, -6, 0, 15, true).setCallback(new SimpleCallback<VKList<Photo>>(getActivity()) { // from class: com.vkontakte.android.fragments.ProfileFragment.11
            {
                ProfileFragment.this = this;
            }

            @Override // com.vkontakte.android.api.Callback
            public void success(VKList<Photo> photos) {
                if (photos.size() == 0) {
                    Toast.makeText(ProfileFragment.this.getActivity(), (int) R.string.no_photos, 0).show();
                    return;
                }
                ProfilePhotoViewerCallback callback = new ProfilePhotoViewerCallback(photos.size(), photos.total());
                PhotoViewer viewer = new PhotoViewer(ProfileFragment.this.getActivity(), photos, 0, callback);
                callback.viewer = viewer;
                viewer.setTitle(ProfileFragment.this.uid > 0 ? ProfileFragment.this.getString(R.string.user_profile_photos, new Object[]{ProfileFragment.this.profile.firstNameGen}) : ProfileFragment.this.getString(R.string.community_profile_photos));
                viewer.show();
            }
        }).wrapProgress(getActivity()).exec((Context) getActivity());
    }

    @Override // com.vkontakte.android.fragments.PostListFragment
    protected String getReferer() {
        return this.uid > 0 ? "wall_user" : "wall_group";
    }

    @Override // com.vkontakte.android.fragments.PostListFragment
    protected String getListReferrer() {
        return (this.uid < 0 ? "club" : "profile") + this.uid;
    }

    @Override // me.grishka.appkit.fragments.BaseRecyclerFragment
    protected void doLoadData(int offset, int count) {
        if (offset == 0 || this.refreshing) {
            loadInitial(this.refreshing, count);
        } else {
            loadWall(offset, count);
        }
    }

    public void setUserPhoto(String photo) {
        if (this.profile != null) {
            this.profile.profile.photo = photo;
            this.profile.bigPhoto = photo;
            updateList();
        }
    }

    public void updateContentParalaxPadding() {
        if (this.content != null && this.profile != null && this.content.getLayoutParams() != null) {
            if (this.uid < 0 && (!this.profile.hasCover() || !isEnableGroupParallaxEffect())) {
                ((ViewGroup.MarginLayoutParams) this.content.getLayoutParams()).topMargin = getToolbar().getBottom();
                return;
            }
            ((ViewGroup.MarginLayoutParams) this.content.getLayoutParams()).topMargin = 0;
        }
    }

    public void updateHeaderItems() {
        if (this.profile != null) {
            if (this.profile.bigPhoto.endsWith("gif") && this.uid != VKAccountManager.getCurrent().getUid() && (this.uid >= 0 || !Groups.isGroupAdmin(-this.uid))) {
                this.headerView.setEnabled(false);
            }
            ViewUtils.setVisibility(this.headerView.findViewById(R.id.group_cover), this.profile.hasCover() ? 0 : 8);
            ViewUtils.setVisibility(this.headerView.findViewById(R.id.profile_scrim1), this.profile.hasCover() ? 0 : 8);
            updateContentParalaxPadding();
            this.ownerOnly = !this.profile.showAllPosts && this.uid > 0;
            this.selector.findViewById(R.id.profile_wall_all_posts).setSelected(!this.ownerOnly);
            this.selector.findViewById(R.id.profile_wall_owner_posts).setSelected(this.ownerOnly);
            updateHeaderView();
            buildInfoItems();
            updateButtons();
            if (this.uid > 0) {
                ((TextView) this.selector.findViewById(R.id.profile_wall_owner_posts)).setText(getResources().getString(R.string.wall_owners_posts, this.profile.firstNameGen));
            } else {
                ((TextView) this.selector.findViewById(R.id.profile_wall_owner_posts)).setText(getResources().getString(R.string.wall_owners_posts, getResources().getString(R.string.group_s)));
            }
            if (!this.profile.canSeeAllPosts || (this.uid < 0 && this.profile.groupType == 2)) {
                this.selector.findViewById(R.id.profile_wall_owner_posts).setVisibility(8);
                this.selector.findViewById(R.id.profile_wall_all_posts).setSelected(false);
                this.selector.findViewById(R.id.profile_wall_all_posts).setEnabled(false);
            }
            if (this.profile.isDeactivated()) {
                switch (this.profile.deactivated) {
                    case Banned:
                        this.emptyText.setText(R.string.profile_inactive_banned);
                        break;
                    default:
                        this.emptyText.setText(R.string.profile_inactive_deleted);
                        break;
                }
                setRefreshEnabled(false);
                updateList();
            }
        }
    }

    public void loadInitial(boolean refresh, int count) {
        this.currentRequest = new GetFullProfile(this.uid, 25, 25, 15).param(ShareConstants.FEED_SOURCE_PARAM, getArguments().containsKey(ArgKeys.REFERRER) ? getArguments().getString(ArgKeys.REFERRER) : null).setCallback(new AnonymousClass12(this, count)).exec((Context) getActivity());
    }

    /* renamed from: com.vkontakte.android.fragments.ProfileFragment$12 */
    /* loaded from: classes2.dex */
    public class AnonymousClass12 extends SimpleCallback<GetFullProfile.Result> {
        final /* synthetic */ int val$count;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        AnonymousClass12(Fragment fragment, int i) {
            super(fragment);
            ProfileFragment.this = this$0;
            this.val$count = i;
        }

        @Override // com.vkontakte.android.api.Callback
        public void success(GetFullProfile.Result res) {
            if (res.profile == null && ProfileFragment.this.getActivity() != null) {
                new VKAlertDialog.Builder(ProfileFragment.this.getActivity()).setTitle(R.string.error).setMessage(R.string.page_not_found).setPositiveButton(R.string.ok, ProfileFragment$12$$Lambda$1.lambdaFactory$(this)).setOnCancelListener(ProfileFragment$12$$Lambda$2.lambdaFactory$(this)).show();
                return;
            }
            ArrayList<UserProfile> users = new ArrayList<>();
            users.add(res.profile.profile);
            Cache.updatePeers(users, true);
            ProfileFragment.this.profile = res.profile;
            ProfileFragment.this.updateHeaderItems();
            ProfileFragment.this.sendAppIndexing();
            if (res.profile.hasCover()) {
                ProfileFragment.this.addParallaxEffect();
            } else if (res.profile.profile.uid < 0) {
                ProfileFragment.this.parallaxPreDrawListener.showToolbar(true);
            }
            ProfileFragment.this.currentRequest = null;
            ProfileFragment.this.showContent();
            if (!ProfileFragment.this.profile.isDeactivated()) {
                ProfileFragment.this.loadWall(0, this.val$count);
            }
            ProfileFragment.this.updateList();
            ProfileFragment.this.setTitle(ProfileFragment.this.profile.profile.fullName);
        }

        public /* synthetic */ void lambda$success$0(DialogInterface dialog, int which) {
            ProfileFragment.this.getActivity().onBackPressed();
        }

        public /* synthetic */ void lambda$success$1(DialogInterface dialog) {
            ProfileFragment.this.getActivity().onBackPressed();
        }
    }

    public void updateButtons() {
        invalidateOptionsMenu();
        Button btn1 = (Button) this.headerView.findViewById(R.id.profile_btn1);
        Button btn2 = (Button) this.headerView.findViewById(R.id.profile_btn2);
        Button btn3 = (Button) this.headerView.findViewById(R.id.profile_btn3);
        btn1.setOnClickListener(this.btnClickListener);
        btn2.setOnClickListener(this.btnClickListener);
        btn3.setOnClickListener(this.btnClickListener);
        if (VKAccountManager.getCurrent().getUid() == 0 || this.profile.friendStatus == -1 || this.profile.isDeactivated() || this.uid == VKAccountManager.getCurrent().getUid() || (this.uid < 0 && this.profile.friendStatus == 5 && !this.profile.canWrite)) {
            this.headerView.findViewById(R.id.profile_buttons_wrap).setVisibility(8);
            return;
        }
        this.headerView.findViewById(R.id.profile_buttons_wrap).setVisibility(0);
        if (this.uid > 0) {
            if (this.uid == VKAccountManager.getCurrent().getUid()) {
                btn1.setVisibility(8);
                btn2.setVisibility(8);
                btn3.setVisibility(0);
                btn3.setText(R.string.edit_profile);
                btn3.setTag("edit");
            } else {
                btn1.setText(R.string.message);
                btn1.setEnabled(this.profile.canWrite);
                btn1.setTag("message");
                btn1.setVisibility(0);
                if (this.profile.friendStatus == 0) {
                    btn3.setVisibility(8);
                    btn2.setVisibility(0);
                    btn2.setText(this.profile.canSendFriendRequest ? R.string.profile_add_friend : R.string.profile_subscribe);
                    btn2.setTag(ProductAction.ACTION_ADD);
                } else {
                    btn2.setVisibility(8);
                    btn3.setVisibility(0);
                    btn3.setTag("options");
                    String text = "";
                    switch (this.profile.friendStatus) {
                        case 1:
                            text = getString(this.profile.canSendFriendRequest ? R.string.profile_btn_req_sent : R.string.profile_btn_subscribed);
                            break;
                        case 2:
                            text = getString(R.string.profile_btn_req_rcvd);
                            break;
                        case 3:
                            text = getString(R.string.profile_btn_is_friend);
                            break;
                    }
                    SpannableStringBuilder bldr = new SpannableStringBuilder(text);
                    Spannable sp = Spannable.Factory.getInstance().newSpannable("F");
                    Drawable d = getResources().getDrawable(R.drawable.ic_profile_btn_arrow);
                    d.setBounds(0, 0, d.getIntrinsicWidth(), d.getIntrinsicHeight());
                    d.setLevel(10000);
                    sp.setSpan(new ImageSpan(d, 1), 0, 1, 0);
                    bldr.append((CharSequence) MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR);
                    bldr.append((CharSequence) sp);
                    btn3.setText(bldr);
                }
            }
        }
        if (this.uid < 0) {
            if (this.profile.canWrite) {
                btn1.setText(R.string.message);
                btn1.setTag("message");
            } else {
                btn1.setVisibility(8);
            }
            if (this.profile.friendStatus == 0) {
                btn3.setVisibility(8);
                btn2.setVisibility(0);
                if (this.profile.groupAccess == 2 || (this.profile.groupType == 1 && this.profile.groupAccess == 1)) {
                    btn2.setVisibility(8);
                } else if (this.profile.groupType == 0) {
                    btn2.setText(this.profile.groupAccess == 0 ? R.string.join_group : R.string.join_group_closed);
                    btn2.setTag("join");
                } else if (this.profile.groupType == 1) {
                    btn2.setText(R.string.join_event);
                    btn2.setTag("event_options");
                } else if (this.profile.groupType == 2) {
                    btn2.setText(R.string.join_page);
                    btn2.setTag("join");
                }
            } else if (this.profile.friendStatus == 1 || this.profile.friendStatus == 2) {
                btn2.setVisibility(8);
                btn3.setVisibility(0);
                String text2 = "";
                if (this.profile.groupType == 0) {
                    text2 = getString(R.string.group_joined);
                } else if (this.profile.groupType == 1) {
                    text2 = getString(this.profile.eventStartTime > TimeUtils.getCurrentTime() ? this.profile.friendStatus == 2 ? R.string.event_joined_unsure : R.string.event_joined : R.string.group_joined);
                } else if (this.profile.groupType == 2) {
                    text2 = getString(R.string.profile_btn_subscribed);
                }
                SpannableStringBuilder bldr2 = new SpannableStringBuilder(text2);
                Spannable sp2 = Spannable.Factory.getInstance().newSpannable("F");
                Drawable d2 = getResources().getDrawable(R.drawable.ic_profile_btn_arrow);
                d2.setBounds(0, 0, d2.getIntrinsicWidth(), d2.getIntrinsicHeight());
                d2.setLevel(10000);
                sp2.setSpan(new ImageSpan(d2, 1), 0, 1, 0);
                bldr2.append((CharSequence) MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR);
                bldr2.append((CharSequence) sp2);
                btn3.setText(bldr2);
                btn3.setTag("options");
            } else if (this.profile.friendStatus == 4) {
                btn2.setVisibility(8);
                btn3.setVisibility(0);
                String text3 = getString(R.string.group_sent_req);
                SpannableStringBuilder bldr3 = new SpannableStringBuilder(text3);
                Spannable sp3 = Spannable.Factory.getInstance().newSpannable("F");
                Drawable d3 = getResources().getDrawable(R.drawable.ic_profile_btn_arrow);
                d3.setBounds(0, 0, d3.getIntrinsicWidth(), d3.getIntrinsicHeight());
                d3.setLevel(10000);
                sp3.setSpan(new ImageSpan(d3, 1), 0, 1, 0);
                bldr3.append((CharSequence) MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR);
                bldr3.append((CharSequence) sp3);
                btn3.setText(bldr3);
                btn3.setTag("options");
            } else if (this.profile.friendStatus == 5) {
                btn2.setVisibility(8);
                btn3.setVisibility(8);
            }
        }
    }

    private View createTextThumbView(String title, String subtitle, @DrawableRes int icon) {
        View view = View.inflate(getActivity(), R.layout.profile_counter_thumb_text, null);
        ((TextView) view.findViewById(R.id.thumb_text_title)).setText(title);
        ((TextView) view.findViewById(R.id.thumb_text_subtitle)).setText(subtitle);
        ((ImageView) view.findViewById(R.id.thumb_text_icon)).setImageResource(icon);
        return view;
    }

    private View createPlaceholderView(@DrawableRes int icon) {
        View view = View.inflate(getActivity(), R.layout.profile_counter_thumb_placeholder, null);
        ((ImageView) view.findViewById(R.id.thumb_text_icon)).setImageResource(icon);
        return view;
    }

    private View createBackgroundImageView(String url, int placeholderResId) {
        VKImageView imageView = new VKImageView(getActivity());
        imageView.getHierarchy().setRoundingParams(RoundingParams.fromCornersRadii(V.dp(2.0f), V.dp(2.0f), V.dp(2.0f), V.dp(2.0f)));
        imageView.setPlaceholderImage(placeholderResId);
        imageView.load(url);
        return imageView;
    }

    private View createStoriesBackgroundImageView(String url, int placeholderResId) {
        VKImageView imageView = new VKImageView(getActivity());
        imageView.getHierarchy().setRoundingParams(RoundingParams.fromCornersRadii(V.dp(2.0f), V.dp(2.0f), V.dp(2.0f), V.dp(2.0f)));
        imageView.setPostprocessor(new StoriesProfileButtonTransform());
        imageView.setPlaceholderImage(placeholderResId);
        imageView.load(url);
        return imageView;
    }

    private View createBackgroundLayerImageView(List<String> _images) {
        VKLayerImageView layerImageView = new VKLayerImageView(getActivity(), 6);
        layerImageView.setLayerPlaceholders(-1644309);
        ArrayList<String> images = new ArrayList<>();
        images.addAll(_images);
        while (images.size() < 6) {
            images.add(null);
        }
        int photoSize = V.dp(42.0f);
        int padding = V.dp(2.0f);
        int sizeWithPad = photoSize + padding;
        for (int j = 0; j < images.size(); j++) {
            switch (j) {
                case 0:
                    layerImageView.setLayerInset(j, 0, 0, sizeWithPad * 2, sizeWithPad);
                    break;
                case 1:
                    layerImageView.setLayerInset(j, sizeWithPad, 0, sizeWithPad, sizeWithPad);
                    break;
                case 2:
                    layerImageView.setLayerInset(j, sizeWithPad * 2, 0, 0, sizeWithPad);
                    break;
                case 3:
                    layerImageView.setLayerInset(j, 0, sizeWithPad, sizeWithPad * 2, 0);
                    break;
                case 4:
                    layerImageView.setLayerInset(j, sizeWithPad, sizeWithPad, sizeWithPad, 0);
                    break;
                case 5:
                    layerImageView.setLayerInset(j, sizeWithPad * 2, sizeWithPad, 0, 0);
                    break;
            }
            if (images.get(j) != null) {
                if (j == 0 || j == 2 || j == 3 || j == 5) {
                    if (j == 0) {
                        layerImageView.setLayerCorners(j, V.dp(2.0f), 0, 0, 0);
                    } else if (j == 2) {
                        layerImageView.setLayerCorners(j, 0, V.dp(2.0f), 0, 0);
                    } else if (j == 3) {
                        layerImageView.setLayerCorners(j, 0, 0, 0, V.dp(2.0f));
                    } else if (j == 5) {
                        layerImageView.setLayerCorners(j, 0, 0, V.dp(2.0f), 0);
                    }
                } else {
                    layerImageView.setLayerCorners(j, 0, 0, 0, 0);
                }
                layerImageView.load(j, images.get(j));
            }
        }
        return layerImageView;
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    /* JADX WARN: Removed duplicated region for block: B:291:0x00b1  */
    /* JADX WARN: Removed duplicated region for block: B:299:0x00f0  */
    /* JADX WARN: Removed duplicated region for block: B:352:0x0290  */
    /* JADX WARN: Removed duplicated region for block: B:355:0x029c  */
    /* JADX WARN: Removed duplicated region for block: B:358:0x02a8  */
    /* JADX WARN: Removed duplicated region for block: B:361:0x02b4  */
    /* JADX WARN: Removed duplicated region for block: B:364:0x02c0  */
    /* JADX WARN: Removed duplicated region for block: B:367:0x02cc  */
    /* JADX WARN: Removed duplicated region for block: B:370:0x02d8  */
    /* JADX WARN: Removed duplicated region for block: B:373:0x02e4  */
    /* JADX WARN: Removed duplicated region for block: B:376:0x02f0  */
    /* JADX WARN: Removed duplicated region for block: B:377:0x02f8  */
    /* JADX WARN: Removed duplicated region for block: B:378:0x0300  */
    /* JADX WARN: Removed duplicated region for block: B:379:0x0308  */
    /* JADX WARN: Removed duplicated region for block: B:380:0x0310  */
    /* JADX WARN: Removed duplicated region for block: B:381:0x0318  */
    /* JADX WARN: Removed duplicated region for block: B:382:0x0320  */
    /* JADX WARN: Removed duplicated region for block: B:383:0x0328  */
    /* JADX WARN: Removed duplicated region for block: B:384:0x0330  */
    /* JADX WARN: Removed duplicated region for block: B:387:0x033c  */
    /* JADX WARN: Removed duplicated region for block: B:390:0x0348  */
    /* JADX WARN: Removed duplicated region for block: B:393:0x0354  */
    /* JADX WARN: Removed duplicated region for block: B:396:0x0360  */
    /* JADX WARN: Removed duplicated region for block: B:399:0x036c  */
    /* JADX WARN: Removed duplicated region for block: B:402:0x0378  */
    /* JADX WARN: Removed duplicated region for block: B:405:0x0384  */
    /* JADX WARN: Removed duplicated region for block: B:408:0x0390  */
    /* JADX WARN: Removed duplicated region for block: B:411:0x039d  */
    /* JADX WARN: Removed duplicated region for block: B:414:0x03aa  */
    /* JADX WARN: Removed duplicated region for block: B:418:0x03eb  */
    /* JADX WARN: Removed duplicated region for block: B:422:0x0430  */
    /* JADX WARN: Removed duplicated region for block: B:426:0x0496  */
    /* JADX WARN: Removed duplicated region for block: B:430:0x04e8  */
    /* JADX WARN: Removed duplicated region for block: B:441:0x0541  */
    /* JADX WARN: Removed duplicated region for block: B:451:0x05a2  */
    /* JADX WARN: Removed duplicated region for block: B:484:0x069a A[FALL_THROUGH] */
    /* JADX WARN: Removed duplicated region for block: B:491:0x06e2  */
    /* JADX WARN: Removed duplicated region for block: B:498:0x072a  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private boolean updateCounters() {
        /*
            Method dump skipped, instructions count: 2162
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.vkontakte.android.fragments.ProfileFragment.updateCounters():boolean");
    }

    /* JADX WARN: Multi-variable type inference failed */
    private void updateHeaderView() {
        int i = R.drawable.ic_verified;
        if (this.uid > 0) {
            CharSequence name = this.profile.profile.firstName + MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR + this.profile.profile.lastName;
            if (this.profile.verified) {
                SpannableStringBuilder bldr = new SpannableStringBuilder(name);
                Spannable sp = Spannable.Factory.getInstance().newSpannable("F");
                Resources resources = getResources();
                if (this.uid > 0 && this.layoutType == 0) {
                    i = R.drawable.ic_profile_verified;
                }
                Drawable d = resources.getDrawable(i);
                d.setBounds(0, 0, d.getIntrinsicWidth(), d.getIntrinsicHeight());
                sp.setSpan(new ImageSpan(d, 1), 0, 1, 0);
                bldr.append((CharSequence) " ");
                bldr.append((CharSequence) sp);
                name = bldr;
            }
            ((TextView) this.headerView.findViewById(R.id.profile_name)).setText(name);
            if (this.layoutType == 0) {
                this.headerView.findViewById(R.id.profile_photo_icon).setVisibility(this.uid == VKAccountManager.getCurrent().getUid() ? 0 : 8);
            }
            if (this.profile.profile.online > 0) {
                CharSequence online = getString(R.string.online);
                if (this.profile.profile.online != 1) {
                    SpannableStringBuilder bldr2 = new SpannableStringBuilder(online);
                    Spannable sp2 = Spannable.Factory.getInstance().newSpannable("F");
                    Drawable d2 = getResources().getDrawable(R.drawable.ic_left_online_mobile_xml);
                    d2.setBounds(0, 0, d2.getIntrinsicWidth(), d2.getIntrinsicHeight());
                    sp2.setSpan(new ImageSpan(d2, 1), 0, 1, 0);
                    bldr2.append((CharSequence) " ");
                    bldr2.append((CharSequence) sp2);
                    online = bldr2;
                }
                ((TextView) this.headerView.findViewById(R.id.profile_last_seen)).setText(online);
                this.headerView.findViewById(R.id.profile_last_seen).setVisibility(0);
            } else if (this.profile.lastSeen > 0) {
                CharSequence online2 = getResources().getString(this.profile.profile.f ? R.string.last_seen_profile_f : R.string.last_seen_profile_m, TimeUtils.langDateRelative(this.profile.lastSeen, getResources()));
                if (this.profile.lastSeenMobile) {
                    SpannableStringBuilder bldr3 = new SpannableStringBuilder(online2);
                    Spannable sp3 = Spannable.Factory.getInstance().newSpannable("F");
                    Drawable d3 = getResources().getDrawable(R.drawable.ic_left_online_mobile_xml);
                    d3.setBounds(0, 0, d3.getIntrinsicWidth(), d3.getIntrinsicHeight());
                    sp3.setSpan(new ImageSpan(d3, 1), 0, 1, 0);
                    bldr3.append((CharSequence) " ");
                    bldr3.append((CharSequence) sp3);
                    online2 = bldr3;
                }
                ((TextView) this.headerView.findViewById(R.id.profile_last_seen)).setText(online2);
                this.headerView.findViewById(R.id.profile_last_seen).setVisibility(0);
            } else {
                ((TextView) this.headerView.findViewById(R.id.profile_last_seen)).setText("");
                this.headerView.findViewById(R.id.profile_last_seen).setVisibility(4);
            }
        } else {
            CharSequence name2 = this.profile.profile.fullName;
            if (this.profile.verified) {
                SpannableStringBuilder bldr4 = new SpannableStringBuilder(name2);
                Spannable sp4 = Spannable.Factory.getInstance().newSpannable("F");
                Drawable d4 = getResources().getDrawable(R.drawable.ic_verified);
                d4.setBounds(0, 0, d4.getIntrinsicWidth(), d4.getIntrinsicHeight());
                sp4.setSpan(new ImageSpan(d4, 1), 0, 1, 0);
                bldr4.append((CharSequence) " ");
                bldr4.append((CharSequence) sp4);
                name2 = bldr4;
            }
            TextView profileName = (TextView) this.headerView.findViewById(R.id.profile_name);
            profileName.setText(name2);
            ((TextView) this.headerView.findViewById(R.id.profile_last_seen)).setText(Emoji.instance(getActivity()).replaceEmoji(this.profile.activity));
        }
        this.headerView.findViewById(R.id.profile_last_seen).setSelected(true);
    }

    private void switchOwnerOnly(boolean owner) {
        boolean z = true;
        if (owner != this.ownerOnly && !this.dataLoading) {
            this.ownerOnly = owner;
            this.refreshing = true;
            loadWall(0, this.itemsPerPage * 2);
            View findViewById = this.selector.findViewById(R.id.profile_wall_all_posts);
            if (owner) {
                z = false;
            }
            findViewById.setSelected(z);
            this.selector.findViewById(R.id.profile_wall_owner_posts).setSelected(owner);
            this.selector.findViewById(R.id.profile_wall_post_btn).setVisibility(4);
            this.selector.findViewById(R.id.profile_wall_progress).setVisibility(0);
        }
    }

    private View createTextItem(CharSequence text) {
        TextView view = new TextView(getActivity());
        view.setText(text);
        view.setPadding(getResources().getDimensionPixelOffset(R.dimen.post_side_padding), V.dp(32.0f), getResources().getDimensionPixelOffset(R.dimen.post_side_padding), V.dp(32.0f));
        view.setTextSize(1, 14.0f);
        view.setTextColor(-9669766);
        view.setLineSpacing(V.dp(2.0f), 1.0f);
        return view;
    }

    private String generateRelativesString(UserProfile[] users) {
        ArrayList<String> parts = new ArrayList<>();
        for (UserProfile u : users) {
            if (u.uid > 0) {
                parts.add("[id" + u.uid + "|" + u.fullName + "]");
            } else {
                parts.add(u.fullName);
            }
        }
        return parts.size() == 2 ? parts.get(0) + MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR + getString(R.string.ntf_two_users_c) + MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR + parts.get(1) : TextUtils.join(", ", parts);
    }

    private boolean hasDisplayField(String field) {
        return this.profile.displayFields == null || this.profile.displayFields.contains(field);
    }

    /* JADX WARN: Multi-variable type inference failed */
    private void buildInfoItems() {
        int i;
        String text;
        String contacts;
        ItemViewHolder.ClickListener clickListener;
        IdResolver idResolver;
        ContentTitleInfoItem titleItem;
        int i2;
        int i3;
        int i4;
        int i5;
        int i6;
        String rel;
        String bd;
        this.infoItems.clear();
        ViewInfoItem expandItem = null;
        if (this.uid > 0 && this.layoutType == 0) {
            this.infoItems.add(new ViewInfoItem(this.headerView) { // from class: com.vkontakte.android.fragments.ProfileFragment.13
                {
                    ProfileFragment.this = this;
                }

                @Override // com.vkontakte.android.fragments.ProfileFragment.InfoItem
                public int getImageCount() {
                    return (ProfileFragment.this.profile.isDeactivated() || !ProfileFragment.this.profile.hasPhoto) ? 0 : 1;
                }

                @Override // com.vkontakte.android.fragments.ProfileFragment.InfoItem
                public String getImageURL(int image) {
                    return ProfileFragment.this.getHeaderImageUrl();
                }

                @Override // com.vkontakte.android.fragments.ProfileFragment.ViewInfoItem, com.vkontakte.android.fragments.ProfileFragment.InfoItem
                public RecyclerHolder createViewHolder() {
                    return new HeaderViewHolder(ProfileFragment.this.headerView);
                }
            });
            if (this.profile.isDeactivated()) {
                ((VKImageView) this.headerView.findViewById(R.id.profile_photo)).setPlaceholderImage(R.drawable.crosseyed_dog_big);
                this.headerView.findViewById(R.id.profile_scrim1).setBackgroundDrawable(null);
                this.headerView.findViewById(R.id.profile_scrim2).setBackgroundDrawable(null);
            } else if (!this.profile.hasPhoto) {
                ((VKImageView) this.headerView.findViewById(R.id.profile_photo)).setPlaceholderImage(this.uid > 0 ? R.drawable.no_user_photo_big : R.drawable.no_group_photo_big);
                this.headerView.findViewById(R.id.profile_scrim1).setBackgroundDrawable(null);
                this.headerView.findViewById(R.id.profile_scrim2).setBackgroundDrawable(null);
            } else {
                ((VKImageView) this.headerView.findViewById(R.id.profile_photo)).setPlaceholderImage(this.uid > 0 ? R.drawable.no_user_photo_big : R.drawable.no_group_photo_big);
                this.headerView.findViewById(R.id.profile_scrim1).setBackgroundResource(R.drawable.scrim_top);
                this.headerView.findViewById(R.id.profile_scrim2).setBackgroundResource(R.drawable.scrim_bottom);
            }
        } else {
            ViewInfoItem item = new ViewInfoItem(this.headerView) { // from class: com.vkontakte.android.fragments.ProfileFragment.14
                {
                    ProfileFragment.this = this;
                }

                @Override // com.vkontakte.android.fragments.ProfileFragment.InfoItem
                public int getImageCount() {
                    int i7 = 1;
                    int i8 = (ProfileFragment.this.profile.isDeactivated() || !ProfileFragment.this.profile.hasPhoto) ? 0 : 1;
                    if (ProfileFragment.this.uid >= 0 || !ProfileFragment.this.profile.hasCover()) {
                        i7 = 0;
                    }
                    return i8 + i7;
                }

                @Override // com.vkontakte.android.fragments.ProfileFragment.InfoItem
                public String getImageURL(int image) {
                    return image == 0 ? ProfileFragment.this.profile.bigPhoto : ProfileFragment.this.profile.coverPhoto.getImageByWidth(ProfileFragment.this.getToolbar().getMeasuredWidth()).url;
                }

                @Override // com.vkontakte.android.fragments.ProfileFragment.ViewInfoItem, com.vkontakte.android.fragments.ProfileFragment.InfoItem
                public RecyclerHolder createViewHolder() {
                    return new ViewViewHolder(this.view) { // from class: com.vkontakte.android.fragments.ProfileFragment.14.1
                        {
                            AnonymousClass14.this = this;
                            ProfileFragment profileFragment = ProfileFragment.this;
                        }

                        @Override // com.vkontakte.android.fragments.ProfileFragment.ViewViewHolder, com.vkontakte.android.ui.holder.RecyclerHolder
                        public void onBind(ViewInfoItem item2) {
                            super.onBind(item2);
                            if (ProfileFragment.this.profile.isDeactivated() || !ProfileFragment.this.profile.hasPhoto) {
                                ((VKImageView) ProfileFragment.this.headerView.findViewById(R.id.profile_photo)).clear();
                            } else {
                                ((VKImageView) ProfileFragment.this.headerView.findViewById(R.id.profile_photo)).load(item2.getImageURL(0));
                            }
                            VKImageView groupCover = (VKImageView) ProfileFragment.this.headerView.findViewById(R.id.group_cover);
                            if (groupCover != null) {
                                if (ProfileFragment.this.uid >= 0 || !ProfileFragment.this.profile.hasCover()) {
                                    ((VKImageView) ProfileFragment.this.headerView.findViewById(R.id.group_cover)).clear();
                                } else {
                                    ((VKImageView) ProfileFragment.this.headerView.findViewById(R.id.group_cover)).load(item2.getImageURL(1));
                                }
                            }
                        }
                    };
                }
            };
            if (this.profile.isDeactivated()) {
                ((VKImageView) this.headerView.findViewById(R.id.profile_photo)).setPlaceholderImage(R.drawable.crosseyed_dog_small);
            } else {
                ((VKImageView) this.headerView.findViewById(R.id.profile_photo)).setPlaceholderImage(this.uid > 0 ? R.drawable.no_user_photo_small : R.drawable.no_group_photo_small);
            }
            item.dividerAfter = this.layoutType == 1;
            this.infoItems.add(item);
            if (this.profile.invitedBy != null) {
                View inviterView = View.inflate(getActivity(), R.layout.profile_group_invited, null);
                TextView textView = (TextView) inviterView.findViewById(R.id.text);
                if (this.profile.groupType == 0) {
                    i = this.profile.invitedBy.f ? R.string.group_inviter_f : R.string.group_inviter_m;
                } else {
                    i = this.profile.invitedBy.f ? R.string.group_inviter_event_f : R.string.group_inviter_event_m;
                }
                textView.setText(LinkParser.parseLinks(getString(i, new Object[]{"[id" + this.profile.invitedBy.uid + "|" + this.profile.invitedBy.fullName + "]"}), 2));
                ((TextView) inviterView.findViewById(R.id.accept)).setText(this.profile.groupType == 0 ? R.string.group_inv_accept : R.string.group_inv_event_positive);
                inviterView.findViewById(R.id.accept).setOnClickListener(ProfileFragment$$Lambda$11.lambdaFactory$(this));
                inviterView.findViewById(R.id.reject).setOnClickListener(ProfileFragment$$Lambda$12.lambdaFactory$(this));
                ViewInfoItem inv = new AnonymousClass15(inviterView);
                this.infoItems.add(inv);
                item.dividerAfter = false;
                inv.dividerAfter = true;
            }
        }
        if (this.profile.isDeactivated()) {
            String msg = null;
            if (this.profile.deactivated == ExtendedUserProfile.Deactivated.Deleted) {
                msg = getString(this.uid > 0 ? R.string.profile_inactive_deleted : R.string.group_inactive_deleted);
            } else if (this.profile.deactivated == ExtendedUserProfile.Deactivated.Banned) {
                msg = getString(this.uid > 0 ? R.string.profile_inactive_banned : R.string.group_inactive_banned);
            }
            if (!TextUtils.isEmpty(msg)) {
                View view = createTextItem(msg);
                ViewInfoItem vii = new ViewInfoItem(view);
                vii.backgroundType = 4;
                this.infoItems.add(vii);
            }
        }
        if (this.profile.ban != null && this.uid > 0) {
            View view2 = createTextItem(getString(this.profile.profile.f ? R.string.blacklisted_f : R.string.blacklisted_m, new Object[]{this.profile.profile.firstName}));
            ViewInfoItem vii2 = new ViewInfoItem(view2);
            vii2.backgroundType = 4;
            this.infoItems.add(vii2);
        }
        if ((!TextUtils.isEmpty(this.profile.activity) && this.uid > 0) || this.uid == VKAccountManager.getCurrent().getUid() || (this.uid < 0 && this.profile.adminLevel >= 2 && !this.profile.isDeactivated())) {
            OverviewInfoItem status = new OverviewInfoItem((int) R.drawable.ic_profile_status, TextUtils.isEmpty(this.profile.activity) ? getString(R.string.change_status) : Emoji.instance(getActivity()).replaceEmoji(this.profile.activity), (Runnable) null);
            if (this.profile.audioStatus != null) {
                status.onClick = ProfileFragment$$Lambda$13.lambdaFactory$(this);
            } else if (this.uid == VKAccountManager.getCurrent().getUid() || (this.uid < 0 && this.profile.adminLevel >= 2)) {
                status.onClick = ProfileFragment$$Lambda$14.lambdaFactory$(this);
            }
            this.infoItems.add(status);
        }
        if (this.uid > 0) {
            if (hasDisplayField("friends") && this.profile.counters.containsKey("friends") && this.profile.getCounter("friends") > 0) {
                int numFriends = this.profile.getCounter("friends");
                int numMutual = this.profile.counters.containsKey("mutual_friends") ? this.profile.getCounter("mutual_friends") : 0;
                String text2 = getResources().getQuantityString(R.plurals.profile_friends, numFriends, Integer.valueOf(numFriends));
                if (numMutual > 0) {
                    text2 = text2 + " • " + getResources().getQuantityString(R.plurals.profile_mutual_friends, numMutual, Integer.valueOf(numMutual));
                }
                OverviewInfoItem friendsItem = new OverviewInfoItem((int) R.drawable.ic_profile_friends, TextFormatter.processString(text2), ProfileFragment$$Lambda$15.lambdaFactory$(this));
                if (this.profile.friends.size() > 0) {
                    for (int i7 = 0; i7 < Math.min(this.profile.friends.size(), 3); i7++) {
                        friendsItem.photos.add(this.profile.friends.get(i7).photo);
                    }
                }
                this.infoItems.add(friendsItem);
            }
            if (hasDisplayField("followers") && this.profile.counters.containsKey("followers") && this.profile.getCounter("followers") > 0) {
                int numFollowers = this.profile.getCounter("followers");
                this.infoItems.add(new OverviewInfoItem((int) R.drawable.ic_profile_followers, TextFormatter.processString(getResources().getQuantityString(R.plurals.profile_followers, numFollowers, Integer.valueOf(numFollowers))), ProfileFragment$$Lambda$16.lambdaFactory$(this)));
            }
            if (hasDisplayField("city") && !TextUtils.isEmpty(this.profile.city)) {
                this.infoItems.add(new OverviewInfoItem((int) R.drawable.ic_profile_home, getString(R.string.profile_lives_in, new Object[]{this.profile.city}), (Runnable) null));
            }
            if (hasDisplayField("work") && this.profile.career != null && this.profile.career.size() > 0 && this.profile.career.get(this.profile.career.size() - 1).yearTo == 0) {
                ExtendedUserProfile.Employer e = this.profile.career.get(this.profile.career.size() - 1);
                Object[] objArr = new Object[1];
                objArr[0] = e.group != null ? e.group.name : e.title;
                OverviewInfoItem careerItem = new OverviewInfoItem((int) R.drawable.ic_profile_work, getString(R.string.profile_works_at, objArr), (Runnable) null);
                if (e.group != null) {
                    careerItem.photos.add(e.group.photo);
                    careerItem.onClick = ProfileFragment$$Lambda$17.lambdaFactory$(this, e);
                }
                this.infoItems.add(careerItem);
            } else if (hasDisplayField("education") && this.profile.universities != null && this.profile.universities.size() > 0) {
                ExtendedUserProfile.University u = this.profile.universities.get(this.profile.universities.size() - 1);
                String text3 = u.name;
                if (u.graduation > 0) {
                    text3 = text3 + String.format(" '%02d", Integer.valueOf(u.graduation % 100));
                }
                this.infoItems.add(new OverviewInfoItem((int) R.drawable.ic_profile_study, text3, (Runnable) null));
            }
            View expandInfoView = View.inflate(getActivity(), R.layout.profile_show_info, null);
            expandInfoView.findViewById(R.id.text).setOnClickListener(ProfileFragment$$Lambda$18.lambdaFactory$(this));
            if (!this.profile.isDeactivated() && this.profile.ban == null) {
                ArrayList<InfoItem> arrayList = this.infoItems;
                expandItem = new ViewInfoItem(expandInfoView);
                arrayList.add(expandItem);
            }
        } else {
            if (this.profile.groupType == 1) {
                if (this.profile.eventStartTime > 0) {
                    if (this.profile.eventStartTime > TimeUtils.getCurrentTime()) {
                        text = TimeUtils.langDate(this.profile.eventStartTime);
                    } else {
                        text = getString(R.string.profile_event_past, new Object[]{TimeUtils.langDate(this.profile.eventStartTime)});
                    }
                    this.infoItems.add(new OverviewInfoItem((int) R.drawable.ic_event_time, text, (Runnable) null));
                }
                if (!TextUtils.isEmpty(this.profile.city)) {
                    Runnable onclick = null;
                    if (this.profile.lat != -9000.0d) {
                        onclick = ProfileFragment$$Lambda$19.lambdaFactory$(this);
                    }
                    this.infoItems.add(new OverviewInfoItem((int) R.drawable.ic_event_place, this.profile.city, onclick));
                }
            }
            if (this.profile.getCounter("members") > 0) {
                int numFriends2 = this.profile.getCounter("members");
                int numMutual2 = this.profile.counters.containsKey("friends_members") ? this.profile.getCounter("friends_members") : 0;
                String text4 = getResources().getQuantityString(R.plurals.profile_members, numFriends2, Integer.valueOf(numFriends2));
                if (numMutual2 > 0) {
                    text4 = text4 + "\n" + getResources().getQuantityString(R.plurals.profile_friends, numMutual2, Integer.valueOf(numMutual2));
                }
                OverviewInfoItem friendsItem2 = new OverviewInfoItem((int) R.drawable.ic_profile_friends, TextFormatter.processString(text4), new Runnable() { // from class: com.vkontakte.android.fragments.ProfileFragment.16
                    {
                        ProfileFragment.this = this;
                    }

                    @Override // java.lang.Runnable
                    public void run() {
                        Bundle args = new Bundle();
                        args.putInt("gid", -ProfileFragment.this.uid);
                        args.putCharSequence("title", ProfileFragment.this.getResources().getString(R.string.group_members));
                        args.putInt(ServerKeys.TYPE, ProfileFragment.this.profile.groupType);
                        args.putBoolean("_can_go_back", true);
                        Navigate.to(GroupMembersFragment.class, args, ProfileFragment.this.getActivity());
                    }
                });
                if (this.profile.friends.size() > 0) {
                    for (int i8 = 0; i8 < Math.min(this.profile.friends.size(), 3); i8++) {
                        friendsItem2.photos.add(this.profile.friends.get(i8).photo);
                    }
                }
                this.infoItems.add(friendsItem2);
            }
            if (!TextUtils.isEmpty(this.profile.about)) {
                this.infoItems.add(new OverviewInfoItem((int) R.drawable.ic_profile_about, Global.replaceEmoji(LinkParser.stripMentions(this.profile.about)), (Runnable) null));
            }
            View expandInfoView2 = View.inflate(getActivity(), R.layout.profile_show_info, null);
            expandInfoView2.findViewById(R.id.text).setOnClickListener(ProfileFragment$$Lambda$20.lambdaFactory$(this));
            if (!this.profile.isDeactivated()) {
                ArrayList<InfoItem> arrayList2 = this.infoItems;
                expandItem = new ViewInfoItem(expandInfoView2);
                arrayList2.add(expandItem);
            }
            if (!TextUtils.isEmpty(this.profile.mobilePhone)) {
                View wikiView = View.inflate(getActivity(), R.layout.profile_show_info, null);
                wikiView.setId(R.id.profile_wiki);
                ((TextView) wikiView.findViewById(R.id.text)).setText(this.profile.mobilePhone);
                ((TextView) wikiView.findViewById(R.id.text)).setCompoundDrawablesWithIntrinsicBounds(R.drawable.ic_profile_wiki, 0, 0, 0);
                wikiView.findViewById(R.id.text).setOnClickListener(ProfileFragment$$Lambda$21.lambdaFactory$(this));
                this.infoItems.add(new ViewInfoItem(wikiView));
            }
            if (!TextUtils.isEmpty(this.profile.website)) {
                View websiteView = View.inflate(getActivity(), R.layout.profile_show_info, null);
                websiteView.setId(R.id.profile_website);
                ((TextView) websiteView.findViewById(R.id.text)).setText(this.profile.website);
                ((TextView) websiteView.findViewById(R.id.text)).setCompoundDrawablesWithIntrinsicBounds(R.drawable.ic_profile_link, 0, 0, 0);
                websiteView.findViewById(R.id.text).setOnClickListener(ProfileFragment$$Lambda$22.lambdaFactory$(this));
                this.infoItems.add(new ViewInfoItem(websiteView));
            }
        }
        Iterator<InfoItem> it = this.infoItems.iterator();
        while (it.hasNext()) {
            it.next().backgroundType = 1;
        }
        if (this.infoItems.size() == 1) {
            this.infoItems.get(0).backgroundType = 6;
        } else {
            this.infoItems.get(0).backgroundType = 2;
            this.infoItems.get(this.infoItems.size() - 1).backgroundType = 4;
        }
        this.detailsItems.clear();
        if (!TextUtils.isEmpty(this.profile.activity)) {
            this.detailsItems.add(new DetailsItem(getString(R.string.status), this.profile.activity));
            this.detailsItems.get(0).bgType = 6;
        }
        if (this.uid > 0) {
            if (this.profile.bDay > 0) {
                if (this.profile.bYear > 0) {
                    bd = String.format("%d %s %d", Integer.valueOf(this.profile.bDay), getResources().getStringArray(R.array.months_full)[Math.min(11, this.profile.bMonth - 1)], Integer.valueOf(this.profile.bYear));
                } else {
                    bd = String.format("%d %s", Integer.valueOf(this.profile.bDay), getResources().getStringArray(R.array.months_full)[Math.min(11, this.profile.bMonth - 1)]);
                }
                this.detailsItems.add(new DetailsItem(getString(R.string.profile_bdate), bd));
            }
            if (this.profile.hometown != null) {
                this.detailsItems.add(new DetailsItem(getString(R.string.profile_hometown), this.profile.hometown));
            }
            if (this.profile.relation > 0) {
                Relation relation = Relation.getRelationsById(this.profile.relation);
                if (this.profile.relationPartner > 0) {
                    rel = relation.getName(getContext(), !this.profile.profile.f, "[id" + this.profile.relationPartner + "|" + this.profile.relationPartnerName + "]");
                } else {
                    rel = relation.getName(getContext(), !this.profile.profile.f);
                }
                this.detailsItems.add(new DetailsItem(getString(R.string.profile_relation), rel, this.profile.relationPartner > 0 ? new Intent("android.intent.action.VIEW", Uri.parse("vkontakte://profile/" + this.profile.relationPartner)) : null));
            }
            if (this.profile.langs != null) {
                this.detailsItems.add(new DetailsItem(getString(R.string.personal_langs), this.profile.langs));
            }
            if (!Utils.isEmptyArray(this.profile.relativesGrandparent)) {
                ArrayList<DetailsItem> arrayList3 = this.detailsItems;
                if (this.profile.relativesGrandparent.length > 1) {
                    i6 = R.string.profile_grandparents;
                } else {
                    i6 = this.profile.relativesGrandparent[0].f ? R.string.profile_relative_grandparent_f : R.string.profile_relative_grandparent_m;
                }
                arrayList3.add(new DetailsItem(getString(i6), generateRelativesString(this.profile.relativesGrandparent)));
            }
            if (!Utils.isEmptyArray(this.profile.relativesParents)) {
                ArrayList<DetailsItem> arrayList4 = this.detailsItems;
                if (this.profile.relativesParents.length > 1) {
                    i5 = R.string.profile_parents;
                } else {
                    i5 = this.profile.relativesParents[0].f ? R.string.profile_relative_parent_f : R.string.profile_relative_parent_m;
                }
                arrayList4.add(new DetailsItem(getString(i5), generateRelativesString(this.profile.relativesParents)));
            }
            if (!Utils.isEmptyArray(this.profile.relativesSibling)) {
                ArrayList<DetailsItem> arrayList5 = this.detailsItems;
                if (this.profile.relativesSibling.length > 1) {
                    i4 = R.string.profile_siblings;
                } else {
                    i4 = this.profile.relativesSibling[0].f ? R.string.profile_relative_sibling_f : R.string.profile_relative_sibling_m;
                }
                arrayList5.add(new DetailsItem(getString(i4), generateRelativesString(this.profile.relativesSibling)));
            }
            if (!Utils.isEmptyArray(this.profile.relativesChild)) {
                ArrayList<DetailsItem> arrayList6 = this.detailsItems;
                if (this.profile.relativesChild.length > 1) {
                    i3 = R.string.profile_children;
                } else {
                    i3 = this.profile.relativesChild[0].f ? R.string.profile_relative_child_f : R.string.profile_relative_child_m;
                }
                arrayList6.add(new DetailsItem(getString(i3), generateRelativesString(this.profile.relativesChild)));
            }
            if (!Utils.isEmptyArray(this.profile.relativesGrandchild)) {
                ArrayList<DetailsItem> arrayList7 = this.detailsItems;
                if (this.profile.relativesGrandchild.length > 1) {
                    i2 = R.string.profile_grandchildren;
                } else {
                    i2 = this.profile.relativesGrandchild[0].f ? R.string.profile_relative_grandchild_f : R.string.profile_relative_grandchild_m;
                }
                arrayList7.add(new DetailsItem(getString(i2), generateRelativesString(this.profile.relativesGrandchild)));
            }
            if (this.profile.city != null || this.profile.mobilePhone != null || this.profile.homePhone != null || this.profile.skype != null || this.profile.instagram != null || this.profile.twitter != null || this.profile.facebookName != null || this.profile.livejournal != null || this.profile.website != null) {
                this.detailsItems.add(new DetailsItem(getString(R.string.profile_info_contacts), null, null, true, null, null));
                if (this.profile.city != null) {
                    this.detailsItems.add(new DetailsItem(getString(R.string.profile_city), this.profile.city, null));
                }
                if (this.profile.mobilePhone != null) {
                    this.detailsItems.add(new DetailsItem(getString(R.string.profile_mphone), this.profile.mobilePhone, new Intent("android.intent.action.VIEW", Uri.parse("tel:" + this.profile.mobilePhone))));
                }
                if (this.profile.homePhone != null) {
                    this.detailsItems.add(new DetailsItem(getString(R.string.profile_hphone), this.profile.homePhone, new Intent("android.intent.action.VIEW", Uri.parse("tel:" + this.profile.homePhone))));
                }
                if (this.profile.skype != null) {
                    this.detailsItems.add(new DetailsItem(getString(R.string.profile_skype), this.profile.skype, new Intent("android.intent.action.VIEW", Uri.parse("skype:" + this.profile.skype + "?call"))));
                }
                if (this.profile.instagram != null) {
                    Intent intent = new Intent("android.intent.action.VIEW", Uri.parse("http://instagram.com/_u/" + this.profile.instagram));
                    intent.setPackage("com.instagram.android");
                    DetailsItem item2 = new DetailsItem(getString(R.string.profile_instagram), this.profile.instagram, intent);
                    item2.fallbackIntent = new Intent("android.intent.action.VIEW", Uri.parse("http://instagram.com/" + this.profile.instagram));
                    this.detailsItems.add(item2);
                }
                if (this.profile.twitter != null) {
                    this.detailsItems.add(new DetailsItem(getString(R.string.profile_twitter), this.profile.twitter, new Intent("android.intent.action.VIEW", Uri.parse("http://twitter.com/" + this.profile.twitter))));
                }
                if (this.profile.facebookName != null) {
                    this.detailsItems.add(new DetailsItem(getString(R.string.profile_facebook), this.profile.facebookName, new Intent("android.intent.action.VIEW", Uri.parse("http://facebook.com/profile.php?id=" + this.profile.facebookId))));
                }
                if (this.profile.website != null && this.profile.website.length() > 0) {
                    String site = this.profile.website;
                    if (!site.startsWith("http://") && !site.startsWith("https://")) {
                        site = "http://" + site;
                    }
                    this.detailsItems.add(new DetailsItem(getString(R.string.group_site), this.profile.website, new Intent("android.intent.action.VIEW", Uri.parse("vklink://view/?" + site))));
                }
                if (this.profile.livejournal != null) {
                    this.detailsItems.add(new DetailsItem(getString(R.string.profile_livejournal), this.profile.livejournal, new Intent("android.intent.action.VIEW", Uri.parse("http://" + this.profile.livejournal + ".livejournal.com/"))));
                }
            }
            if (this.profile.schools.size() > 0 || this.profile.universities.size() > 0) {
                this.detailsItems.add(new DetailsItem(getString(R.string.profile_info_education), null, null, true, null, null));
                Iterator<ExtendedUserProfile.School> it2 = this.profile.schools.iterator();
                while (it2.hasNext()) {
                    ExtendedUserProfile.School s = it2.next();
                    if (s != null && s.name != null) {
                        String title = s.name;
                        if (s.graduation > 0) {
                            title = title + " '" + String.format("%02d", Integer.valueOf(s.graduation % 100));
                        }
                        String subtitle = s.city != null ? s.city : "";
                        if ((s.from > 0 || s.to > 0) && subtitle.length() > 0) {
                            subtitle = subtitle + ", ";
                        }
                        if (s.from > 0) {
                            subtitle = subtitle + s.from;
                        }
                        if (s.from > 0 && s.to > 0) {
                            subtitle = subtitle + "-";
                        }
                        if (s.to > 0) {
                            subtitle = subtitle + s.to;
                        }
                        if (s.className != null && s.className.length() > 0) {
                            subtitle = subtitle + " (" + s.className + ")";
                        }
                        String subtitle2 = subtitle.trim();
                        if (s.speciality != null) {
                            if (subtitle2.length() > 0) {
                                subtitle2 = subtitle2 + "\n";
                            }
                            subtitle2 = subtitle2 + s.speciality;
                        }
                        this.detailsItems.add(new DetailsItem(s.type, title, subtitle2, false, null, null));
                    }
                }
                Iterator<ExtendedUserProfile.University> it3 = this.profile.universities.iterator();
                while (it3.hasNext()) {
                    ExtendedUserProfile.University u2 = it3.next();
                    String title2 = u2.name;
                    if (u2.graduation > 0) {
                        title2 = title2 + " '" + String.format("%02d", Integer.valueOf(u2.graduation % 100));
                    }
                    String subtitle3 = "";
                    if (u2.faculty != null) {
                        subtitle3 = subtitle3 + u2.faculty;
                    }
                    if (u2.chair != null) {
                        if (subtitle3.length() > 0) {
                            subtitle3 = subtitle3 + "\n";
                        }
                        subtitle3 = subtitle3 + u2.chair;
                    }
                    this.detailsItems.add(new DetailsItem(getString(R.string.profile_university), title2, subtitle3, false, null, null));
                }
            }
            if (this.profile.career != null && this.profile.career.size() > 0) {
                this.detailsItems.add(new DetailsItem(getString(R.string.career), null, null, true, null, null));
                Iterator<ExtendedUserProfile.Employer> it4 = this.profile.career.iterator();
                while (it4.hasNext()) {
                    ExtendedUserProfile.Employer e2 = it4.next();
                    DetailsItem item3 = new DetailsItem(null, e2.title);
                    item3.subtitle = "";
                    if (!TextUtils.isEmpty(e2.city)) {
                        item3.subtitle = e2.city;
                        if (e2.yearFrom > 0 || e2.yearTo > 0) {
                            item3.subtitle += ", ";
                        }
                    }
                    if (e2.yearFrom > 0 && e2.yearTo > 0) {
                        item3.subtitle += getString(R.string.profile_career_range, new Object[]{Integer.valueOf(e2.yearFrom), Integer.valueOf(e2.yearTo)});
                    } else if (e2.yearFrom > 0) {
                        item3.subtitle += getString(R.string.profile_career_from, new Object[]{Integer.valueOf(e2.yearFrom)});
                    } else if (e2.yearTo > 0) {
                        item3.subtitle += getString(R.string.profile_career_to, new Object[]{Integer.valueOf(e2.yearTo)});
                    }
                    if (!TextUtils.isEmpty(e2.position)) {
                        if (!TextUtils.isEmpty(item3.subtitle)) {
                            item3.subtitle += "\n";
                        }
                        item3.subtitle += e2.position;
                    }
                    if (e2.group != null) {
                        item3.image = e2.group.photo;
                        item3.intent = new Intent("android.intent.action.VIEW", Uri.parse("vkontakte://profile/-" + e2.group.id));
                        item3.content = e2.group.name;
                    }
                    this.detailsItems.add(item3);
                }
            }
            if ((this.profile.religion != null && this.profile.religion.length() > 0) || ((this.profile.inspiredBy != null && this.profile.inspiredBy.length() > 0) || this.profile.political > 0 || this.profile.lifeMain > 0 || this.profile.peopleMain > 0 || this.profile.smoking > 0 || this.profile.alcohol > 0)) {
                this.detailsItems.add(new DetailsItem(getString(R.string.personal), null, null, true, null, null));
                if (this.profile.political > 0) {
                    String[] opts = getResources().getStringArray(R.array.personal_politics_options);
                    if (this.profile.political - 1 < opts.length) {
                        this.detailsItems.add(new DetailsItem(getString(R.string.personal_politics), opts[this.profile.political - 1]));
                    }
                }
                if (this.profile.religion != null && this.profile.religion.length() > 0) {
                    this.detailsItems.add(new DetailsItem(getString(R.string.personal_religion), this.profile.religion));
                }
                if (this.profile.lifeMain > 0) {
                    String[] opts2 = getResources().getStringArray(R.array.personal_life_options);
                    if (this.profile.lifeMain - 1 < opts2.length) {
                        this.detailsItems.add(new DetailsItem(getString(R.string.personal_life), opts2[this.profile.lifeMain - 1]));
                    }
                }
                if (this.profile.peopleMain > 0) {
                    String[] opts3 = getResources().getStringArray(R.array.personal_people_options);
                    if (this.profile.peopleMain - 1 < opts3.length) {
                        this.detailsItems.add(new DetailsItem(getString(R.string.personal_people), opts3[this.profile.peopleMain - 1]));
                    }
                }
                if (this.profile.smoking > 0) {
                    String[] opts4 = getResources().getStringArray(R.array.personal_views_options);
                    if (this.profile.smoking - 1 < opts4.length) {
                        this.detailsItems.add(new DetailsItem(getString(R.string.personal_smoking), opts4[this.profile.smoking - 1]));
                    }
                }
                if (this.profile.alcohol > 0) {
                    String[] opts5 = getResources().getStringArray(R.array.personal_views_options);
                    if (this.profile.alcohol - 1 < opts5.length) {
                        this.detailsItems.add(new DetailsItem(getString(R.string.personal_alcohol), opts5[this.profile.alcohol - 1]));
                    }
                }
                if (this.profile.inspiredBy != null && this.profile.inspiredBy.length() > 0) {
                    this.detailsItems.add(new DetailsItem(getString(R.string.personal_inspiration), this.profile.inspiredBy));
                }
            }
            if (this.profile.activities != null || this.profile.interests != null || this.profile.music != null || this.profile.movies != null || this.profile.tv != null || this.profile.books != null || this.profile.games != null || this.profile.quotations != null || this.profile.about != null) {
                this.detailsItems.add(new DetailsItem(getString(R.string.profile_info_personal), null, null, true, null, null));
                if (this.profile.activities != null) {
                    this.detailsItems.add(new DetailsItem(getString(R.string.profile_occupation), this.profile.activities));
                }
                if (this.profile.interests != null) {
                    this.detailsItems.add(new DetailsItem(getString(R.string.profile_interests), this.profile.interests));
                }
                if (this.profile.music != null) {
                    this.detailsItems.add(new DetailsItem(getString(R.string.profile_music), this.profile.music));
                }
                if (this.profile.movies != null) {
                    this.detailsItems.add(new DetailsItem(getString(R.string.profile_movies), this.profile.movies));
                }
                if (this.profile.tv != null) {
                    this.detailsItems.add(new DetailsItem(getString(R.string.profile_tv), this.profile.tv));
                }
                if (this.profile.books != null) {
                    this.detailsItems.add(new DetailsItem(getString(R.string.profile_books), this.profile.books));
                }
                if (this.profile.games != null) {
                    this.detailsItems.add(new DetailsItem(getString(R.string.profile_games), this.profile.games));
                }
                if (this.profile.quotations != null) {
                    this.detailsItems.add(new DetailsItem(getString(R.string.profile_quotations), this.profile.quotations));
                }
                if (this.profile.about != null) {
                    this.detailsItems.add(new DetailsItem(getString(R.string.profile_about), this.profile.about));
                }
            }
        } else {
            if (this.profile.about != null && this.profile.about.length() > 0) {
                this.detailsItems.add(new DetailsItem(getString(R.string.group_descr), this.profile.about, null));
            }
            if (this.profile.website != null && this.profile.website.length() > 0) {
                this.detailsItems.add(new DetailsItem(getString(R.string.group_site), this.profile.website, new Intent("android.intent.action.VIEW", Uri.parse("vklink://view/?" + this.profile.website))));
            }
            if (this.profile.eventStartTime > 0) {
                this.detailsItems.add(new DetailsItem(getString(R.string.group_start_date), TimeUtils.langDate(this.profile.eventStartTime), null));
            }
            if (this.profile.eventEndTime > 0) {
                this.detailsItems.add(new DetailsItem(getString(R.string.group_end_date), TimeUtils.langDate(this.profile.eventEndTime), null));
            }
            if (this.profile.city != null && this.profile.city.length() > 0) {
                this.detailsItems.add(new DetailsItem(getString(this.profile.groupType == 1 ? R.string.group_event_location : R.string.group_place), this.profile.city, this.profile.lat != -9000.0d ? new Intent("android.intent.action.VIEW", Uri.parse("geo:" + this.profile.lat + "," + this.profile.lon + "?q=" + this.profile.lat + "," + this.profile.lon)) : null));
            }
            if (this.profile.links != null && this.profile.links.size() > 0) {
                this.detailsItems.add(new DetailsItem(getString(R.string.group_links), null, null, true, null, null));
                Iterator<ExtendedUserProfile.Link> it5 = this.profile.links.iterator();
                while (it5.hasNext()) {
                    ExtendedUserProfile.Link link = it5.next();
                    this.detailsItems.add(new DetailsItem(null, link.title, link.subtitle, false, new Intent("android.intent.action.VIEW", Uri.parse("vklink://view/?" + link.url)), link.photo));
                }
            }
            if (this.profile.contacts != null && this.profile.contacts.size() > 0) {
                this.detailsItems.add(new DetailsItem(getString(R.string.group_contacts), null, null, true, null, null));
                Iterator<ExtendedUserProfile.Contact> it6 = this.profile.contacts.iterator();
                while (it6.hasNext()) {
                    ExtendedUserProfile.Contact contact = it6.next();
                    if (contact.user != null) {
                        boolean hasPhone = !TextUtils.isEmpty(contact.phone);
                        boolean hasEmail = !TextUtils.isEmpty(contact.email);
                        if (hasPhone || hasEmail) {
                            String contacts2 = hasPhone ? contact.phone + (hasEmail ? "\n" : "") : "";
                            contacts = contacts2 + (hasEmail ? contact.email : "");
                        } else {
                            contacts = null;
                        }
                        this.detailsItems.add(new DetailsItem(null, contact.user.fullName, contact.title, contacts, false, new Intent("android.intent.action.VIEW", Uri.parse("vkontakte://profile/" + contact.user.uid)), contact.user.photo));
                    } else {
                        this.detailsItems.add(new DetailsItem(null, contact.email, contact.title, false, new Intent("android.intent.action.VIEW", Uri.parse("mailto:" + contact.email)), "http://vk.com/images/contact_50.gif"));
                    }
                }
            }
        }
        if (!this.detailsItems.isEmpty()) {
            for (int i9 = 0; i9 < this.detailsItems.size(); i9++) {
                if (this.detailsItems.get(i9).isHeader) {
                    this.detailsItems.get(i9).bgType = 2;
                    if (i9 > 0) {
                        DetailsItem prev = this.detailsItems.get(i9 - 1);
                        if ((prev.bgType & 2) == 2) {
                            prev.bgType |= 4;
                        } else {
                            prev.bgType = 4;
                        }
                    }
                }
            }
            DetailsItem prev2 = this.detailsItems.get(this.detailsItems.size() - 1);
            if ((prev2.bgType & 2) == 2) {
                prev2.bgType |= 4;
            } else {
                prev2.bgType = 4;
            }
        } else if (expandItem != null) {
            this.infoItems.remove(expandItem);
            if (this.infoItems.size() == 1) {
                this.infoItems.get(0).backgroundType = 6;
            } else if (this.infoItems.size() > 1) {
                this.infoItems.get(this.infoItems.size() - 1).backgroundType = 4;
            }
        }
        InfoItem photosItem = null;
        if (this.profile.canPost && this.uid == VKAccountManager.getCurrent().getUid()) {
            addButtonsItem();
        }
        if (this.profile.buttonAppId != 0 && !TextUtils.isEmpty(this.profile.buttonTitle)) {
            ButtonItem buttonItem = new ButtonItem(this.profile.buttonAppId, this.profile.buttonTitle);
            buttonItem.backgroundType = 6;
            this.infoItems.add(buttonItem);
        }
        if (this.profile.counters.containsKey(ReportAppInputData.REPORT_TYPE_MARKET) && this.profile.getCounter(ReportAppInputData.REPORT_TYPE_MARKET) > 0 && canShowMainSection(5)) {
            int numPhotos = this.profile.getCounter(ReportAppInputData.REPORT_TYPE_MARKET);
            Runnable openMarket = ProfileFragment$$Lambda$23.lambdaFactory$(this);
            ContentTitleInfoItem titleItem2 = new ContentTitleInfoItem(TextFormatter.processString(getString(R.string.goods) + "  /cFF909499" + NumberFormat.getInstance().format(numPhotos) + "/e"), openMarket);
            titleItem2.onButtonClick = openMarket;
            titleItem2.backgroundType = 2;
            titleItem2.buttonText = getString(R.string.show_all);
            this.infoItems.add(titleItem2);
            UsableRecyclerView marketView = (UsableRecyclerView) View.inflate(getActivity(), R.layout.profile_market_feed, null);
            GoodsAdapter goodsAdapter = new GoodsAdapter(this.profile.goods, marketView, this.profile.marketMainAlbumId);
            marketView.setLayoutManager(new LinearLayoutManager(getActivity(), 0, false));
            marketView.setAdapter(goodsAdapter);
            marketView.setClipToPadding(false);
            marketView.addItemDecoration(new RecyclerView.ItemDecoration() { // from class: com.vkontakte.android.fragments.ProfileFragment.17
                {
                    ProfileFragment.this = this;
                }

                @Override // android.support.v7.widget.RecyclerView.ItemDecoration
                public void getItemOffsets(Rect outRect, View view3, RecyclerView parent, RecyclerView.State state) {
                    if (parent.getChildAdapterPosition(view3) != parent.mo1204getAdapter().getItemCount() - 1) {
                        outRect.right = V.dp(8.0f);
                    }
                }
            });
            photosItem = new ViewInfoItem(marketView);
            photosItem.backgroundType = 4;
            this.infoItems.add(photosItem);
        }
        if (this.profile.counters.containsKey("photos") && this.profile.getCounter("photos") > 0 && canShowMainSection(1)) {
            int numPhotos2 = this.profile.getCounter("photos");
            Runnable openAlbums = ProfileFragment$$Lambda$24.lambdaFactory$(this);
            if (this.uid > 0) {
                titleItem = new ContentTitleInfoItem(TextFormatter.processString(getString(R.string.profile_counter_photos) + "  /cFF909499" + NumberFormat.getInstance().format(numPhotos2) + "/e"), openAlbums);
            } else {
                titleItem = new ContentTitleInfoItem(TextFormatter.processString(TextFormatter.escape(this.profile.mainAlbum.title) + "  /cFF909499" + NumberFormat.getInstance().format(this.profile.mainAlbum.numPhotos) + "/e"), ProfileFragment$$Lambda$25.lambdaFactory$(this));
                titleItem.onButtonClick = openAlbums;
            }
            titleItem.backgroundType = 2;
            titleItem.buttonText = getString(R.string.all_albums);
            this.infoItems.add(titleItem);
            UsableRecyclerView photoFeedView = (UsableRecyclerView) View.inflate(getActivity(), R.layout.profile_photo_feed, null);
            PhotoFeedAdapter photoFeedAdapter = (this.uid >= 0 || this.profile.mainAlbum == null) ? new AllPhotosPhotoFeedAdapter(this.profile.photos, photoFeedView) : new MainAlbumPhotoFeedAdapter(this.profile.photos, photoFeedView);
            photoFeedView.setLayoutManager(new LinearLayoutManager(getActivity(), 0, false));
            photoFeedView.setAdapter(photoFeedAdapter);
            photoFeedView.setClipToPadding(false);
            photoFeedView.addItemDecoration(new RecyclerView.ItemDecoration() { // from class: com.vkontakte.android.fragments.ProfileFragment.18
                {
                    ProfileFragment.this = this;
                }

                @Override // android.support.v7.widget.RecyclerView.ItemDecoration
                public void getItemOffsets(Rect outRect, View view3, RecyclerView parent, RecyclerView.State state) {
                    if (parent.getChildAdapterPosition(view3) != parent.mo1204getAdapter().getItemCount() - 1) {
                        outRect.right = V.dp(3.0f);
                    }
                }
            });
            photosItem = new ViewInfoItem(photoFeedView);
            photosItem.backgroundType = 4;
            this.infoItems.add(photosItem);
            photoFeedView.setLayoutParams(new RecyclerView.LayoutParams(-1, V.dp(120.0f)));
        }
        if (canShowMainSection(4)) {
            ContentTitleInfoItem titleItem3 = new ContentTitleInfoItem(TextFormatter.processString(getString(R.string.videos) + "  /cFF909499" + NumberFormat.getInstance().format(this.profile.getCounter("videos")) + "/e"), ProfileFragment$$Lambda$26.lambdaFactory$(this));
            titleItem3.backgroundType = 2;
            this.infoItems.add(titleItem3);
            VideoFeedAdapter photoFeedAdapter2 = new VideoFeedAdapter(this.profile.videos);
            UsableRecyclerView feedView = (UsableRecyclerView) View.inflate(getActivity(), R.layout.profile_photo_feed, null);
            feedView.setLayoutManager(new LinearLayoutManager(getActivity(), 0, false));
            feedView.setAdapter(photoFeedAdapter2);
            feedView.setDrawSelectorOnTop(true);
            feedView.setClipToPadding(false);
            feedView.addItemDecoration(new RecyclerView.ItemDecoration() { // from class: com.vkontakte.android.fragments.ProfileFragment.19
                {
                    ProfileFragment.this = this;
                }

                @Override // android.support.v7.widget.RecyclerView.ItemDecoration
                public void getItemOffsets(Rect outRect, View view3, RecyclerView parent, RecyclerView.State state) {
                    if (parent.getChildAdapterPosition(view3) != parent.mo1204getAdapter().getItemCount() - 1) {
                        outRect.right = V.dp(16.0f);
                    }
                }
            });
            photosItem = new ViewInfoItem(feedView);
            photosItem.backgroundType = 4;
            this.infoItems.add(photosItem);
            feedView.setLayoutParams(new RecyclerView.LayoutParams(-1, V.dp(160.0f)));
        }
        if (canShowMainSection(2)) {
            ContentTitleInfoItem titleItem4 = new ContentTitleInfoItem(TextFormatter.processString(getString(R.string.topics) + "  /cFF909499" + NumberFormat.getInstance().format(this.profile.getCounter("topics")) + "/e"), ProfileFragment$$Lambda$27.lambdaFactory$(this));
            titleItem4.backgroundType = 2;
            this.infoItems.add(titleItem4);
            Iterator<BoardTopic> it7 = this.profile.topics.iterator();
            while (it7.hasNext()) {
                BoardTopic topic = it7.next();
                BoardTopicInfoItem item4 = new BoardTopicInfoItem(topic);
                item4.backgroundType = 1;
                this.infoItems.add(item4);
                photosItem = item4;
            }
            if (photosItem != null) {
                photosItem.backgroundType = 4;
            }
        }
        if (canShowMainSection(3)) {
            if (this.profile.playlists == null || this.profile.playlists.isEmpty()) {
                ContentTitleInfoItem titleItem5 = new ContentTitleInfoItem(TextFormatter.processString(getString(R.string.music) + "  /cFF909499" + NumberFormat.getInstance().format(this.profile.getCounter("audios")) + "/e"), ProfileFragment$$Lambda$28.lambdaFactory$(this));
                titleItem5.backgroundType = 2;
                this.infoItems.add(titleItem5);
                Iterator<MusicTrack> it8 = this.profile.audios.iterator();
                while (it8.hasNext()) {
                    MusicTrack audio = it8.next();
                    AudioInfoItem item5 = new AudioInfoItem(audio);
                    item5.backgroundType = 1;
                    this.infoItems.add(item5);
                    photosItem = item5;
                }
                if (photosItem != null) {
                    photosItem.backgroundType = 4;
                }
            } else {
                ContentTitleInfoItem titleItem6 = new ContentTitleInfoItem(TextFormatter.processString(getString(R.string.music)), ProfileFragment$$Lambda$29.lambdaFactory$(this));
                titleItem6.backgroundType = 2;
                this.infoItems.add(titleItem6);
                ItemAdapter.Builder binder = new ItemAdapter.Builder(getActivity().getLayoutInflater()).layout(R.layout.music_playlist_item2).binder(new HorizontalPlaylistBinder());
                clickListener = ProfileFragment$$Lambda$30.instance;
                ItemAdapter.Builder registerClickListener = binder.registerClickListener(clickListener);
                idResolver = ProfileFragment$$Lambda$31.instance;
                ItemAdapter<Playlist> playlistsAdapter = registerClickListener.resolver(idResolver).build();
                playlistsAdapter.setHasStableIds(true);
                RecyclerView playlistRecyclerView = (RecyclerView) View.inflate(getActivity(), R.layout.profile_playlists_feed, null);
                playlistRecyclerView.setHasFixedSize(true);
                playlistRecyclerView.setLayoutManager(new LinearLayoutManager(getActivity(), 0, false));
                playlistRecyclerView.setAdapter(playlistsAdapter);
                playlistRecyclerView.setNestedScrollingEnabled(false);
                playlistsAdapter.setItems(this.profile.playlists);
                photosItem = new ViewInfoItem(playlistRecyclerView);
                photosItem.backgroundType = 4;
                this.infoItems.add(photosItem);
            }
        }
        this.countersWrap = new LinearLayout(getActivity());
        this.countersWrap.setOrientation(0);
        this.countersWrap.setPadding(V.dp(8.0f) + getResources().getDimensionPixelOffset(R.dimen.post_side_padding_btn), V.dp(8.0f), V.dp(8.0f) + getResources().getDimensionPixelOffset(R.dimen.post_side_padding_btn), V.dp(12.0f));
        HorizontalScrollView countersScroll = new HorizontalScrollView(getActivity());
        countersScroll.setId(R.id.profile_counters);
        countersScroll.addView(this.countersWrap);
        countersScroll.setHorizontalScrollBarEnabled(false);
        ViewInfoItem vii3 = new ViewInfoItem(countersScroll);
        vii3.backgroundType = 4;
        vii3.backgroundType |= 2;
        if (this.profile.hasWidget()) {
            final View widgetView = this.profile.widget.createContentView(getActivity());
            widgetView.setId(R.id.profile_widget);
            ViewInfoItem widgetItem = new ViewInfoItem(widgetView) { // from class: com.vkontakte.android.fragments.ProfileFragment.20
                {
                    ProfileFragment.this = this;
                }

                @Override // com.vkontakte.android.fragments.ProfileFragment.ViewInfoItem, com.vkontakte.android.fragments.ProfileFragment.InfoItem
                public RecyclerHolder createViewHolder() {
                    return new WidgetViewHolder(widgetView);
                }

                @Override // com.vkontakte.android.fragments.ProfileFragment.ViewInfoItem, com.vkontakte.android.fragments.ProfileFragment.InfoItem
                public int getType() {
                    return 65261 + ProfileFragment.this.profile.widget.getType();
                }
            };
            widgetItem.backgroundType = 4;
            widgetItem.backgroundType |= 2;
            this.infoItems.add(widgetItem);
        } else if (updateCounters()) {
            this.infoItems.add(vii3);
        } else if (photosItem != null) {
            photosItem.backgroundType = 4;
        }
        if (this.profile.canPost && this.uid != VKAccountManager.getCurrent().getUid()) {
            addButtonsItem();
        }
        if (VKAccountManager.getCurrent().getUid() > 0 && this.uid < 0 && this.profile.groupType == 2 && !this.profile.canPost) {
            View btns = View.inflate(getActivity(), R.layout.profile_post_buttons, null);
            ViewInfoItem btnsItem = new ViewInfoItem(btns);
            btnsItem.backgroundType = 6;
            this.infoItems.add(btnsItem);
            ((TextView) btns.findViewById(R.id.profile_add_post_text)).setText(R.string.profile_suggest_post);
            btns.findViewById(R.id.profile_add_post).setOnClickListener(ProfileFragment$$Lambda$32.lambdaFactory$(this));
            btns.findViewById(R.id.profile_add_photo).setVisibility(8);
        }
        if (this.profile.ban != null && this.uid < 0) {
            StringBuilder text5 = new StringBuilder(getString(R.string.blacklisted_group));
            if (!TextUtils.isEmpty(this.profile.ban.comment) || this.profile.ban.endTime != 0 || this.profile.ban.reason != 0) {
                text5.append("\n\n");
                if (this.profile.ban.reason != 0) {
                    text5.append("/m").append(getString(R.string.group_ban_reason)).append(":/e ").append(getResources().getStringArray(R.array.group_ban_reasons)[this.profile.ban.reason]);
                }
                if (this.profile.ban.endTime != 0) {
                    if (text5.charAt(text5.length() - 1) != '\n') {
                        text5.append('\n');
                    }
                    text5.append("/m").append(getString(R.string.group_ban_end)).append(":/e ").append(TimeUtils.langDate(this.profile.ban.endTime));
                }
                if (!TextUtils.isEmpty(this.profile.ban.comment)) {
                    if (text5.charAt(text5.length() - 1) != '\n') {
                        text5.append('\n');
                    }
                    text5.append("/m").append(getString(R.string.group_ban_comment)).append(":/e ").append(TextFormatter.escape(this.profile.ban.comment));
                }
            }
            View view3 = createTextItem(TextFormatter.processString(text5.toString()));
            ViewInfoItem vi = new ViewInfoItem(view3);
            vi.backgroundType = 6;
            this.infoItems.add(vi);
        }
        if ((this.profile.ban == null || this.profile.ban.endTime > 0) && !this.profile.isDeactivated()) {
            this.selectorItem = new ViewInfoItem(this.selector);
            this.selectorItem.backgroundType = 2;
            this.infoItems.add(this.selectorItem);
        }
        updatePostsButtons();
    }

    public /* synthetic */ void lambda$buildInfoItems$11(View v) {
        if (this.profile.groupType == 1) {
            PopupMenu pm = new PopupMenu(getActivity(), v);
            pm.getMenu().add(0, 0, 0, R.string.group_event_join);
            pm.getMenu().add(0, 1, 0, R.string.group_event_join_unsure);
            pm.setOnMenuItemClickListener(ProfileFragment$$Lambda$44.lambdaFactory$(this));
            pm.show();
            return;
        }
        joinGroup(true);
    }

    public /* synthetic */ boolean lambda$null$10(MenuItem item1) {
        joinGroup(item1.getItemId() == 0);
        return true;
    }

    /* renamed from: com.vkontakte.android.fragments.ProfileFragment$15 */
    /* loaded from: classes2.dex */
    public class AnonymousClass15 extends ViewInfoItem {
        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        AnonymousClass15(View view) {
            super(view);
            ProfileFragment.this = this$0;
        }

        @Override // com.vkontakte.android.fragments.ProfileFragment.InfoItem
        public int getImageCount() {
            return 1;
        }

        @Override // com.vkontakte.android.fragments.ProfileFragment.InfoItem
        public String getImageURL(int image) {
            return ProfileFragment.this.profile.invitedBy.photo;
        }

        @Override // com.vkontakte.android.fragments.ProfileFragment.ViewInfoItem, com.vkontakte.android.fragments.ProfileFragment.InfoItem
        public RecyclerHolder createViewHolder() {
            return new ViewViewHolder(this.view) { // from class: com.vkontakte.android.fragments.ProfileFragment.15.1
                {
                    AnonymousClass15.this = this;
                    ProfileFragment profileFragment = ProfileFragment.this;
                }

                @Override // com.vkontakte.android.fragments.ProfileFragment.ViewViewHolder, com.vkontakte.android.ui.holder.RecyclerHolder
                public void onBind(ViewInfoItem item) {
                    super.onBind(item);
                    ((VKImageView) AnonymousClass15.this.view.findViewById(R.id.photo)).load(AnonymousClass15.this.getImageURL(0));
                }
            };
        }
    }

    public /* synthetic */ void lambda$buildInfoItems$12(View v) {
        leaveGroup();
    }

    public /* synthetic */ void lambda$buildInfoItems$13() {
        showStatusEditDlg(this.profile.activity);
    }

    public /* synthetic */ void lambda$buildInfoItems$14() {
        new FriendsFragment.Builder().setUid(this.uid).setTitle(getResources().getString(R.string.friends_of_user, this.profile.firstNameGen)).go(getActivity());
    }

    public /* synthetic */ void lambda$buildInfoItems$15() {
        Bundle args = new Bundle();
        args.putInt(ArgKeys.UID, this.uid);
        args.putCharSequence("title", getResources().getString(R.string.followers_of, this.profile.firstNameGen));
        Navigate.to(FollowersListFragment.class, args, getActivity());
    }

    public /* synthetic */ void lambda$buildInfoItems$16(ExtendedUserProfile.Employer e) {
        Bundle args = new Bundle();
        args.putInt("id", -e.group.id);
        Navigate.to(ProfileFragment.class, args, getActivity());
    }

    public /* synthetic */ void lambda$buildInfoItems$17(View v) {
        new ProfileDetailsFragment.Builder(this.detailsItems, this.profile.profile.fullName).go(getActivity());
    }

    public /* synthetic */ void lambda$buildInfoItems$18() {
        startActivity(new Intent("android.intent.action.VIEW", Uri.parse("geo:" + this.profile.lat + "," + this.profile.lon + "?q=" + this.profile.lat + "," + this.profile.lon)));
    }

    public /* synthetic */ void lambda$buildInfoItems$19(View v) {
        new ProfileDetailsFragment.Builder(this.detailsItems, this.profile.profile.fullName).go(getActivity());
    }

    public /* synthetic */ void lambda$buildInfoItems$20(View v) {
        new WikiViewFragment.Builder().setOid(this.uid).setTitle(this.profile.mobilePhone).go(getActivity());
    }

    public /* synthetic */ void lambda$buildInfoItems$21(View v) {
        String site = this.profile.website;
        if (!site.startsWith("http://") && !site.startsWith("https://")) {
            site = "http://" + site;
        }
        startActivity(new Intent("android.intent.action.VIEW", Uri.parse("vklink://view/?" + site)));
    }

    public /* synthetic */ void lambda$buildInfoItems$22() {
        openOwnerContent(ReportAppInputData.REPORT_TYPE_MARKET);
    }

    public /* synthetic */ void lambda$buildInfoItems$23() {
        openOwnerContent("photos");
    }

    public /* synthetic */ void lambda$buildInfoItems$24() {
        new PhotoListFragment.Builder(this.profile.mainAlbum).go(getActivity());
    }

    public /* synthetic */ void lambda$buildInfoItems$25() {
        openOwnerContent("videos");
    }

    public /* synthetic */ void lambda$buildInfoItems$26() {
        openOwnerContent("topics");
    }

    public /* synthetic */ void lambda$buildInfoItems$27() {
        openOwnerContent("audios");
    }

    public /* synthetic */ void lambda$buildInfoItems$28() {
        openOwnerContent("audios");
    }

    public /* synthetic */ void lambda$buildInfoItems$31(View v) {
        showNewPost();
    }

    private void addButtonsItem() {
        if (VKAccountManager.getCurrent().getUid() > 0) {
            View btns = View.inflate(getActivity(), R.layout.profile_post_buttons, null);
            ViewInfoItem btnsItem = new ViewInfoItem(btns);
            btnsItem.backgroundType = 6;
            this.infoItems.add(btnsItem);
            btns.findViewById(R.id.profile_add_post).setOnClickListener(ProfileFragment$$Lambda$33.lambdaFactory$(this));
            btns.findViewById(R.id.profile_add_photo).setOnClickListener(ProfileFragment$$Lambda$34.lambdaFactory$(this));
        }
    }

    public /* synthetic */ void lambda$addButtonsItem$32(View v) {
        showNewPost();
    }

    public /* synthetic */ void lambda$addButtonsItem$33(View v) {
        Intent intent = new Intent(getActivity(), PostPhotoActivity.class);
        if (this.uid != VKAccountManager.getCurrent().getUid()) {
            intent.putExtra("option", 0);
        }
        intent.putExtra(ArgKeys.UID, this.uid);
        startActivity(intent);
    }

    private boolean canShowMainSection(int section) {
        if (section == 1 && this.uid > 0) {
            return !this.profile.allPhotosAreHidden;
        } else if (this.profile.mainSection != section || this.uid > 0 || this.profile.hasWidget()) {
            return false;
        } else {
            switch (section) {
                case 1:
                    return this.profile.getCounter("photos") > 0;
                case 2:
                    return this.profile.getCounter("topics") > 0;
                case 3:
                    return this.profile.getCounter("audios") > 0;
                case 4:
                    return this.profile.getCounter("videos") > 0;
                case 5:
                    return this.profile.getCounter(ReportAppInputData.REPORT_TYPE_MARKET) > 0;
                default:
                    return false;
            }
        }
    }

    public void updatePostsButtons(int postponed, int suggested) {
        this.profile.postponedCount += postponed;
        this.profile.suggestedCount += suggested;
        updatePostsButtons();
        updateList();
        if (this.uid == VKAccountManager.getCurrent().getUid()) {
            getActivity().getSharedPreferences(null, 0).edit().putInt("postponed_count", this.profile.postponedCount).commit();
        }
    }

    private void addPostsButton(ViewInfoItem item) {
        if (this.infoItems.size() > 0) {
            InfoItem last = this.infoItems.get(this.infoItems.size() - 1);
            if ((last instanceof ViewInfoItem) && last.getType() == R.id.profile_wall_selector) {
                this.infoItems.add(this.infoItems.size() - 1, item);
                return;
            }
        }
        this.infoItems.add(item);
    }

    public void updatePostsButtons() {
        this.infoItems.remove(this.postponedView);
        this.infoItems.remove(this.suggestsView);
        if (this.profile.postponedCount > 0) {
            ((TextView) this.postponedView.view).setText(TextFormatter.processString(getResources().getQuantityString(R.plurals.postponed_posts, this.profile.postponedCount, Integer.valueOf(this.profile.postponedCount))));
            addPostsButton(this.postponedView);
        }
        if (this.profile.suggestedCount > 0) {
            ((TextView) this.suggestsView.view).setText(TextFormatter.processString(getResources().getQuantityString(this.profile.canPost ? R.plurals.suggested_posts : R.plurals.suggested_posts_by_me, this.profile.suggestedCount, Integer.valueOf(this.profile.suggestedCount))));
            addPostsButton(this.suggestsView);
        }
        if (this.profile.postponedCount > 0 && this.profile.suggestedCount > 0) {
            this.postponedView.dividerAfter = true;
            this.postponedView.backgroundType = 2;
            this.suggestsView.backgroundType = 4;
            return;
        }
        this.postponedView.dividerAfter = false;
        ViewInfoItem viewInfoItem = this.postponedView;
        this.suggestsView.backgroundType = 6;
        viewInfoItem.backgroundType = 6;
    }

    private void toggleExtendedInfo() {
        this.showExtended = !this.showExtended;
        this.infoAdapter.notifyDataSetChanged();
    }

    public void showNewPost() {
        boolean z = false;
        if (VKAuth.ensureLoggedIn(getActivity())) {
            NewPostFragment.Builder fragment = new NewPostFragment.Builder().uid(this.uid).suggest(!this.profile.canPost && this.uid < 0 && this.profile.adminLevel < 2);
            if (this.uid < 0) {
                NewPostFragment.Builder attachGroup = fragment.attachGroup(this.profile.profile.fullName, this.profile.profile.photo);
                if (this.profile.groupType == 2 || !this.profile.canSeeAllPosts) {
                    z = true;
                }
                attachGroup.isPublic(z);
            }
            fragment.go(getActivity());
        }
    }

    public void openAudioStatus() {
        MusicTrack musicTrack;
        if (VKAuth.ensureLoggedIn(getActivity()) && (musicTrack = this.profile.audioStatus) != null) {
            AudioFacade.playTrack(musicTrack, this.uid > 0 ? PlayerRefer.status_user : PlayerRefer.status_group, true);
            AudioFacade.showPlayer();
        }
    }

    public void showStatusEditDlg(CharSequence text) {
        EditText ed = new EditText(getActivity());
        ed.setLines(4);
        ed.setGravity(51);
        ed.setText(text);
        ed.setSelection(text.length());
        ed.setFilters(new InputFilter[]{new InputFilter.LengthFilter(140)});
        FrameLayout fl = new FrameLayout(getActivity());
        fl.addView(ed);
        if (Build.VERSION.SDK_INT >= 21) {
            fl.setPadding(V.dp(16.0f), 0, V.dp(16.0f), 0);
        }
        AlertDialog dlg = new VKAlertDialog.Builder(getActivity()).setTitle(R.string.status).setView(fl).setPositiveButton(R.string.save, ProfileFragment$$Lambda$35.lambdaFactory$(this, ed)).setNegativeButton(R.string.cancel, (DialogInterface.OnClickListener) null).create();
        dlg.setOnShowListener(ProfileFragment$$Lambda$36.lambdaFactory$(this, ed));
        dlg.show();
    }

    public /* synthetic */ void lambda$showStatusEditDlg$34(EditText ed, DialogInterface dialog, int which) {
        setStatus(ed.getText().toString());
    }

    public /* synthetic */ void lambda$showStatusEditDlg$35(EditText ed, DialogInterface dialog) {
        InputMethodManager imm = (InputMethodManager) getActivity().getSystemService("input_method");
        imm.showSoftInput(ed, 1);
    }

    private void setStatus(final String status) {
        new StatusSet(status, this.uid < 0 ? -this.uid : 0).setCallback(new ResultlessCallback(getActivity()) { // from class: com.vkontakte.android.fragments.ProfileFragment.21
            {
                ProfileFragment.this = this;
            }

            @Override // com.vkontakte.android.api.ResultlessCallback
            public void success() {
                ProfileFragment.this.profile.activity = status;
                ProfileFragment.this.updateHeaderItems();
                ProfileFragment.this.updateList();
                if (VKAccountManager.isCurrentUser(ProfileFragment.this.uid)) {
                    VKAccountManager.editCurrent().setStatus(status).commit();
                    Activity activity = ProfileFragment.this.getActivity();
                    if (activity instanceof NavigationDelegateActivity) {
                        ((NavigationDelegateActivity) activity).updateUserInfo();
                    }
                }
            }

            @Override // com.vkontakte.android.api.SimpleCallback, com.vkontakte.android.api.Callback
            public void fail(VKAPIRequest.VKErrorResponse err) {
                super.fail(err);
                ProfileFragment.this.showStatusEditDlg(status);
            }
        }).wrapProgress(getActivity()).exec((Context) getActivity());
    }

    public void addFriend() {
        if (this.profile.canSendFriendRequest) {
            View alertView = View.inflate(getActivity(), R.layout.add_friend_alert, null);
            ((TextView) alertView.findViewById(R.id.add_friend_text)).setText(getResources().getString(this.profile.profile.f ? R.string.add_friend_explain_f : R.string.add_friend_explain_m, this.profile.profile.firstName + MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR + this.profile.profile.lastName));
            new VKAlertDialog.Builder(getActivity()).setTitle(R.string.profile_add_friend).setView(alertView).setPositiveButton(R.string.ok, ProfileFragment$$Lambda$37.lambdaFactory$(this, alertView)).setNegativeButton(R.string.cancel, (DialogInterface.OnClickListener) null).show();
            return;
        }
        doAddFriend(null);
    }

    public /* synthetic */ void lambda$addFriend$36(View alertView, DialogInterface dialog, int which) {
        String msg = ((TextView) alertView.findViewById(R.id.add_friend_msg)).getText().toString();
        doAddFriend(msg);
    }

    /* renamed from: com.vkontakte.android.fragments.ProfileFragment$22 */
    /* loaded from: classes2.dex */
    public class AnonymousClass22 implements Callback<Integer> {
        final /* synthetic */ String val$msg;

        AnonymousClass22(String str) {
            ProfileFragment.this = this$0;
            this.val$msg = str;
        }

        @Override // com.vkontakte.android.api.Callback
        public void success(Integer result) {
            String msg = null;
            if (result.intValue() == 1) {
                if (ProfileFragment.this.profile.canSendFriendRequest) {
                    msg = ProfileFragment.this.getResources().getString(ProfileFragment.this.profile.profile.f ? R.string.add_friend_sent_f : R.string.add_friend_sent_m, ProfileFragment.this.profile.firstNameDat);
                }
                ProfileFragment.this.profile.friendStatus = 1;
            }
            if (result.intValue() == 2) {
                msg = ProfileFragment.this.getResources().getString(R.string.add_friend_accepted);
                ProfileFragment.this.profile.friendStatus = 3;
                Friends.addLocally(ProfileFragment.this.profile.profile);
                Friends.decreaseRequests();
            }
            if (result.intValue() == 4) {
                msg = ProfileFragment.this.getResources().getString(R.string.add_friend_already_sent);
                ProfileFragment.this.profile.friendStatus = 1;
            }
            if (msg != null) {
                Toast.makeText(ProfileFragment.this.getActivity(), msg, 1).show();
            }
            ProfileFragment.this.updateButtons();
            if (ProfileFragment.this.getArguments().containsKey(ArgKeys.FROM_POST)) {
                Analytics.track("subscription_from_post").collapse().unique().addParam("post_ids", ProfileFragment.this.getArguments().getString(ArgKeys.FROM_POST)).commit().flushBuffer();
            }
            Friends.notifyFriendStatusChanged(ProfileFragment.this.uid, ProfileFragment.this.profile.friendStatus);
        }

        @Override // com.vkontakte.android.api.Callback
        public void fail(VKAPIRequest.VKErrorResponse error) {
            if (error.getCodeValue() == 175) {
                new VKAlertDialog.Builder(ProfileFragment.this.getActivity()).setTitle(R.string.error).setMessage(ProfileFragment.this.getResources().getString(ProfileFragment.this.profile.profile.f ? R.string.add_friend_blacklisted_me_f : R.string.add_friend_blacklisted_me_m, ProfileFragment.this.profile.firstNameDat + MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR + ProfileFragment.this.profile.lastNameDat)).setPositiveButton(R.string.ok, (DialogInterface.OnClickListener) null).show();
            } else if (error.getCodeValue() == 176) {
                new VKAlertDialog.Builder(ProfileFragment.this.getActivity()).setTitle(R.string.error).setMessage(ProfileFragment.this.getResources().getString(ProfileFragment.this.profile.profile.f ? R.string.add_friend_blacklisted_f : R.string.add_friend_blacklisted_m, ProfileFragment.this.profile.firstNameAcc + MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR + ProfileFragment.this.profile.lastNameAcc)).setPositiveButton(R.string.unblock_and_continue, new DialogInterface.OnClickListener() { // from class: com.vkontakte.android.fragments.ProfileFragment.22.1
                    {
                        AnonymousClass22.this = this;
                    }

                    @Override // android.content.DialogInterface.OnClickListener
                    public void onClick(DialogInterface dialog, int which) {
                        new AccountBanUser(ProfileFragment.this.uid, false).setCallback(new ResultlessCallback(ProfileFragment.this) { // from class: com.vkontakte.android.fragments.ProfileFragment.22.1.1
                            {
                                AnonymousClass1.this = this;
                            }

                            @Override // com.vkontakte.android.api.ResultlessCallback
                            public void success() {
                                ProfileFragment.this.profile.blacklisted = false;
                                ProfileFragment.this.invalidateOptionsMenu();
                                ProfileFragment.this.doAddFriend(AnonymousClass22.this.val$msg);
                            }
                        }).wrapProgress(ProfileFragment.this.getActivity()).exec((Context) ProfileFragment.this.getActivity());
                    }
                }).setNegativeButton(R.string.cancel, (DialogInterface.OnClickListener) null).show();
            } else {
                new VKAlertDialog.Builder(ProfileFragment.this.getActivity() == null ? AppStateTracker.getCurrentActivity() : ProfileFragment.this.getActivity()).setTitle(R.string.error).setMessage(R.string.err_access).setPositiveButton(R.string.ok, (DialogInterface.OnClickListener) null).show();
            }
        }
    }

    public void doAddFriend(@Nullable String msg) {
        FriendsAdd.createFriendsAddAndSendAllStats(this.uid, msg).setCallback(new AnonymousClass22(msg)).wrapProgress(getActivity()).exec((Context) getActivity());
    }

    public void joinGroup(final boolean sure) {
        GroupsJoin.createGroupsJoinAndSendAllStats(-this.uid, !sure).setCallback(new ResultlessCallback(null) { // from class: com.vkontakte.android.fragments.ProfileFragment.23
            {
                ProfileFragment.this = this;
            }

            @Override // com.vkontakte.android.api.ResultlessCallback
            public void success() {
                if (ProfileFragment.this.getArguments().containsKey(ArgKeys.FROM_POST)) {
                    Analytics.track("subscription_from_post").collapse().unique().addParam("post_ids", ProfileFragment.this.getArguments().getString(ArgKeys.FROM_POST)).commit().flushBuffer();
                }
                if (ProfileFragment.this.profile.friendStatus == 5) {
                    Groups.decreaseInvites();
                }
                int joinedStatus = sure ? 1 : 2;
                if (ProfileFragment.this.profile.groupAccess != 0) {
                    ExtendedUserProfile extendedUserProfile = ProfileFragment.this.profile;
                    if (ProfileFragment.this.profile.friendStatus != 5 && ProfileFragment.this.profile.adminLevel <= 0) {
                        joinedStatus = 4;
                    }
                    extendedUserProfile.friendStatus = joinedStatus;
                } else {
                    ProfileFragment.this.profile.friendStatus = joinedStatus;
                }
                Groups.notifyGroupStatusChanged(ProfileFragment.this.uid, ProfileFragment.this.profile.friendStatus);
                ProfileFragment.this.refresh();
            }

            @Override // com.vkontakte.android.api.SimpleCallback, com.vkontakte.android.api.Callback
            public void fail(VKAPIRequest.VKErrorResponse error) {
                new VKAlertDialog.Builder(ProfileFragment.this.getActivity()).setTitle(R.string.error).setMessage(error.getCodeValue() == 15 ? R.string.page_blacklist : R.string.err_text).setPositiveButton(R.string.ok, (DialogInterface.OnClickListener) null).show();
            }
        }).wrapProgress(getActivity()).exec((Context) getActivity());
    }

    public void removeFriend() {
        if (this.profile.friendStatus != 3) {
            doRemoveFriend();
        } else {
            new VKAlertDialog.Builder(getActivity()).setTitle(R.string.delete_friend).setMessage(getResources().getString(R.string.delete_friend_confirm, this.profile.firstNameAcc + MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR + this.profile.lastNameAcc)).setPositiveButton(R.string.yes, ProfileFragment$$Lambda$38.lambdaFactory$(this)).setNegativeButton(R.string.no, (DialogInterface.OnClickListener) null).show();
        }
    }

    public /* synthetic */ void lambda$removeFriend$37(DialogInterface dialog, int which) {
        doRemoveFriend();
    }

    public void doRemoveFriend() {
        new FriendsDelete(this.uid).setCallback(new Callback<Integer>() { // from class: com.vkontakte.android.fragments.ProfileFragment.24
            {
                ProfileFragment.this = this;
            }

            @Override // com.vkontakte.android.api.Callback
            public void success(Integer result) {
                if (ProfileFragment.this.profile.friendStatus == 2) {
                    Friends.decreaseRequests();
                }
                if (ProfileFragment.this.profile.friendStatus == 3) {
                    ProfileFragment.this.profile.friendStatus = 2;
                    Toast.makeText(ProfileFragment.this.getActivity(), ProfileFragment.this.getResources().getString(ProfileFragment.this.profile.profile.f ? R.string.friend_deleted_f : R.string.friend_deleted_m, ProfileFragment.this.profile.profile.firstName + MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR + ProfileFragment.this.profile.profile.lastName), 1).show();
                }
                if (ProfileFragment.this.profile.friendStatus == 1) {
                    ProfileFragment.this.profile.friendStatus = 0;
                    if (ProfileFragment.this.profile.canSendFriendRequest) {
                        Toast.makeText(ProfileFragment.this.getActivity(), ProfileFragment.this.getResources().getString(R.string.friend_request_canceled), 1).show();
                    }
                }
                ProfileFragment.this.updateButtons();
                Friends.removeLocally(ProfileFragment.this.uid);
                Friends.notifyFriendStatusChanged(ProfileFragment.this.uid, ProfileFragment.this.profile.friendStatus);
            }

            @Override // com.vkontakte.android.api.Callback
            public void fail(VKAPIRequest.VKErrorResponse error) {
                new VKAlertDialog.Builder(ProfileFragment.this.getActivity()).setTitle(R.string.error).setMessage(R.string.err_text).setPositiveButton(R.string.ok, (DialogInterface.OnClickListener) null).show();
            }
        }).wrapProgress(getActivity()).exec((Context) getActivity());
    }

    public void toggleNewsHidden() {
        if (this.profile.isHiddenFromFeed) {
            new NewsfeedDeleteBan(this.uid).setCallback(new ResultlessCallback(this) { // from class: com.vkontakte.android.fragments.ProfileFragment.25
                {
                    ProfileFragment.this = this;
                }

                @Override // com.vkontakte.android.api.ResultlessCallback
                public void success() {
                    Activity activity = ProfileFragment.this.getActivity();
                    ProfileFragment profileFragment = ProfileFragment.this;
                    Object[] objArr = new Object[1];
                    objArr[0] = ProfileFragment.this.uid < 0 ? ProfileFragment.this.getString(R.string.group_s) : ProfileFragment.this.profile.firstNameGen;
                    Toast.makeText(activity, profileFragment.getString(R.string.user_news_shown, objArr), 0).show();
                    ProfileFragment.this.profile.isHiddenFromFeed = false;
                }
            }).wrapProgress(getActivity()).exec((Context) getActivity());
        } else {
            new NewsfeedAddBan(this.uid, getListReferrer(), null).setCallback(new ResultlessCallback(this) { // from class: com.vkontakte.android.fragments.ProfileFragment.26
                {
                    ProfileFragment.this = this;
                }

                @Override // com.vkontakte.android.api.ResultlessCallback
                public void success() {
                    Activity activity = ProfileFragment.this.getActivity();
                    ProfileFragment profileFragment = ProfileFragment.this;
                    Object[] objArr = new Object[1];
                    objArr[0] = ProfileFragment.this.uid < 0 ? ProfileFragment.this.getString(R.string.group_s) : ProfileFragment.this.profile.firstNameGen;
                    Toast.makeText(activity, profileFragment.getString(R.string.user_news_hidden, objArr), 0).show();
                    ProfileFragment.this.profile.isHiddenFromFeed = true;
                }
            }).wrapProgress(getActivity()).exec((Context) getActivity());
        }
    }

    public void editFriendLists() {
        ArrayList<Friends.Folder> lists = new ArrayList<>();
        Friends.getLists(lists);
        String[] items = new String[lists.size()];
        boolean[] checked = new boolean[lists.size()];
        UserProfile p = Friends.get(this.uid);
        if (p != null) {
            for (int i = 0; i < items.length; i++) {
                items[i] = lists.get(i).name;
                checked[i] = ((1 << lists.get(i).id) & p.country) > 0;
            }
            new VKAlertDialog.Builder(getActivity()).setTitle(R.string.edit_user_lists).setMultiChoiceItems(items, checked, ProfileFragment$$Lambda$39.lambdaFactory$(checked)).setPositiveButton(R.string.ok, ProfileFragment$$Lambda$40.lambdaFactory$(this, checked, lists, p)).setNegativeButton(R.string.cancel, (DialogInterface.OnClickListener) null).show();
        }
    }

    public static /* synthetic */ void lambda$editFriendLists$38(boolean[] checked, DialogInterface dialog, int which, boolean isChecked) {
        checked[which] = isChecked;
    }

    public /* synthetic */ void lambda$editFriendLists$39(boolean[] checked, ArrayList lists, final UserProfile p, DialogInterface dialog, int which) {
        ArrayList<String> ids = new ArrayList<>();
        int _newMask = 0;
        for (int i = 0; i < checked.length; i++) {
            if (checked[i]) {
                ids.add(((Friends.Folder) lists.get(i)).id + "");
                _newMask |= 1 << ((Friends.Folder) lists.get(i)).id;
            }
        }
        final int newMask = _newMask;
        new FriendsEdit(this.uid, TextUtils.join(",", ids)).setCallback(new ResultlessCallback(getActivity()) { // from class: com.vkontakte.android.fragments.ProfileFragment.27
            {
                ProfileFragment.this = this;
            }

            @Override // com.vkontakte.android.api.ResultlessCallback
            public void success() {
                p.country = newMask;
                Cache.updateFriends(Collections.singletonList(p), false);
            }
        }).wrapProgress(getActivity()).exec((Context) getActivity());
    }

    public void showChangeEventDecisionOptions(View v) {
        PopupMenu pm = new PopupMenu(getActivity(), v);
        pm.getMenu().add(0, 1, 0, R.string.group_event_join);
        pm.getMenu().add(0, 2, 0, R.string.group_event_join_unsure);
        if (this.profile.friendStatus == 1 || this.profile.friendStatus == 2) {
            pm.getMenu().add(0, 3, 0, R.string.leave_group);
        }
        pm.setOnMenuItemClickListener(ProfileFragment$$Lambda$41.lambdaFactory$(this));
        pm.show();
    }

    public /* synthetic */ boolean lambda$showChangeEventDecisionOptions$40(MenuItem item) {
        if (item.getItemId() == 3) {
            leaveGroup();
        } else {
            joinGroup(item.getItemId() == 1);
        }
        return true;
    }

    public void leaveGroup() {
        if (this.profile.groupAccess == 0 || this.profile.friendStatus == 4) {
            doLeaveGroup();
        } else {
            new VKAlertDialog.Builder(getActivity()).setTitle(R.string.leave_group).setMessage(R.string.leave_closed_group_confirm).setPositiveButton(R.string.yes, ProfileFragment$$Lambda$42.lambdaFactory$(this)).setNegativeButton(R.string.no, (DialogInterface.OnClickListener) null).show();
        }
    }

    public /* synthetic */ void lambda$leaveGroup$41(DialogInterface dialog, int which) {
        doLeaveGroup();
    }

    private void doLeaveGroup() {
        new GroupsLeave(-this.uid).setCallback(new ResultlessCallback(null) { // from class: com.vkontakte.android.fragments.ProfileFragment.28
            {
                ProfileFragment.this = this;
            }

            @Override // com.vkontakte.android.api.ResultlessCallback
            public void success() {
                if (ProfileFragment.this.profile.friendStatus == 5) {
                    Groups.decreaseInvites();
                }
                ProfileFragment.this.profile.friendStatus = 0;
                Groups.notifyGroupStatusChanged(ProfileFragment.this.uid, ProfileFragment.this.profile.friendStatus);
                ProfileFragment.this.refresh();
            }

            @Override // com.vkontakte.android.api.SimpleCallback, com.vkontakte.android.api.Callback
            public void fail(VKAPIRequest.VKErrorResponse error) {
                new VKAlertDialog.Builder(ProfileFragment.this.getActivity()).setTitle(R.string.error).setMessage(R.string.err_text).setPositiveButton(R.string.ok, (DialogInterface.OnClickListener) null).show();
            }
        }).wrapProgress(getActivity()).exec((Context) getActivity());
    }

    private void addToFavorites() {
        final Activity activity = getActivity();
        (this.uid > 0 ? new FaveAddUser(this.uid) : new FaveAddGroup(Math.abs(this.uid))).setCallback(new SimpleCallback<Boolean>(activity) { // from class: com.vkontakte.android.fragments.ProfileFragment.29
            {
                ProfileFragment.this = this;
            }

            @Override // com.vkontakte.android.api.Callback
            public void success(Boolean result) {
                ProfileFragment.this.profile.isFavorite = true;
                if (activity != null) {
                    ProfileFragment.this.invalidateOptionsMenu();
                    Toast.makeText(activity, (int) R.string.favorites_add_success, 0).show();
                }
            }
        }).wrapProgress(activity).exec((Context) activity);
    }

    private void removeFromFavorites() {
        final Activity activity = getActivity();
        (this.uid > 0 ? new FaveRemoveUser(this.uid) : new FaveRemoveGroup(Math.abs(this.uid))).setCallback(new SimpleCallback<Boolean>(activity) { // from class: com.vkontakte.android.fragments.ProfileFragment.30
            {
                ProfileFragment.this = this;
            }

            @Override // com.vkontakte.android.api.Callback
            public void success(Boolean result) {
                ProfileFragment.this.profile.isFavorite = false;
                if (activity != null) {
                    ProfileFragment.this.invalidateOptionsMenu();
                    Toast.makeText(activity, (int) R.string.favorites_remove_success, 0).show();
                }
            }
        }).wrapProgress(activity).exec((Context) activity);
    }

    private void copyLink() {
        if (this.profile != null) {
            ClipboardManager cm = (ClipboardManager) getActivity().getSystemService("clipboard");
            cm.setText("https://vk.com/" + this.profile.screenName);
            Toast.makeText(getActivity(), (int) R.string.link_copied, 0).show();
        }
    }

    private void openInBrowser() {
        startActivity(new Intent("android.intent.action.VIEW", Uri.parse("https://m.vk.com/" + this.profile.screenName)));
    }

    private void toggleBlacklist() {
        if (this.profile.blacklisted) {
            doToggleBlacklist();
        } else {
            new VKAlertDialog.Builder(getActivity()).setMessage(getResources().getString(R.string.confirm_block_user, this.profile.firstNameAcc + MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR + this.profile.lastNameAcc)).setTitle(R.string.confirm).setPositiveButton(R.string.yes, ProfileFragment$$Lambda$43.lambdaFactory$(this)).setNegativeButton(R.string.no, (DialogInterface.OnClickListener) null).show();
        }
    }

    public /* synthetic */ void lambda$toggleBlacklist$42(DialogInterface dialog, int which) {
        doToggleBlacklist();
    }

    private void togglePostSubscription() {
        final Activity activity = getActivity();
        new WallSubscribe(this.uid, !this.profile.isSubscribed).setCallback(new ResultlessCallback(activity) { // from class: com.vkontakte.android.fragments.ProfileFragment.31
            {
                ProfileFragment.this = this;
            }

            @Override // com.vkontakte.android.api.ResultlessCallback
            public void success() {
                ProfileFragment.this.profile.isSubscribed = !ProfileFragment.this.profile.isSubscribed;
                if (activity != null) {
                    ProfileFragment.this.invalidateOptionsMenu();
                    Toast.makeText(activity, ProfileFragment.this.getString(ProfileFragment.this.profile.isSubscribed ? R.string.subscribed_to_posts : R.string.unsubscribed_from_posts), 0).show();
                }
            }
        }).wrapProgress(activity).exec((Context) activity);
    }

    private void toggleLiveSubscription() {
        final Activity activity = getActivity();
        new VideoLiveSubscribe(this.uid, !this.profile.isLiveSubscribed).setCallback(new ResultlessCallback(activity) { // from class: com.vkontakte.android.fragments.ProfileFragment.32
            {
                ProfileFragment.this = this;
            }

            @Override // com.vkontakte.android.api.ResultlessCallback
            public void success() {
                ProfileFragment.this.profile.isLiveSubscribed = !ProfileFragment.this.profile.isLiveSubscribed;
                if (activity != null) {
                    ProfileFragment.this.invalidateOptionsMenu();
                    Toast.makeText(activity, ProfileFragment.this.getString(ProfileFragment.this.profile.isLiveSubscribed ? R.string.video_live_subscribed : R.string.video_live_unsubscribed), 0).show();
                }
            }
        }).wrapProgress(activity).exec((Context) activity);
    }

    private void doToggleBlacklist() {
        final Activity activity = getActivity();
        new AccountBanUser(this.uid, !this.profile.blacklisted).setCallback(new ResultlessCallback(this) { // from class: com.vkontakte.android.fragments.ProfileFragment.33
            {
                ProfileFragment.this = this;
            }

            @Override // com.vkontakte.android.api.ResultlessCallback
            public void success() {
                int i;
                ProfileFragment.this.profile.blacklisted = !ProfileFragment.this.profile.blacklisted;
                ProfileFragment.this.invalidateOptionsMenu();
                if (activity != null) {
                    Activity activity2 = activity;
                    Resources resources = ProfileFragment.this.getResources();
                    if (!ProfileFragment.this.profile.blacklisted) {
                        i = ProfileFragment.this.profile.profile.f ? R.string.user_unblocked_f : R.string.user_unblocked_m;
                    } else {
                        i = ProfileFragment.this.profile.profile.f ? R.string.user_blocked_f : R.string.user_blocked_m;
                    }
                    Toast.makeText(activity2, resources.getString(i, ProfileFragment.this.profile.profile.fullName), 0).show();
                }
            }
        }).wrapProgress(activity).exec((Context) activity);
    }

    public void loadWall(int _offset, final int count) {
        if (_offset > 0) {
            _offset = this.offset;
        } else {
            this.offset = 0;
            this.nextFrom = null;
        }
        final int offset = _offset;
        this.currentRequest = new WallGet(this.uid, this.nextFrom, count, this.ownerOnly, getListReferrer()).setCallback(new SimpleCallback<WallGet.Result>(this) { // from class: com.vkontakte.android.fragments.ProfileFragment.34
            {
                ProfileFragment.this = this;
            }

            @Override // com.vkontakte.android.api.Callback
            public void success(WallGet.Result res) {
                if (ProfileFragment.this.getActivity() != null) {
                    if (offset == 0) {
                        ProfileFragment.this.profile.postponedCount = res.postponedCount;
                        ProfileFragment.this.profile.suggestedCount = res.suggestedCount;
                        ProfileFragment.this.updatePostsButtons();
                    }
                    if (ProfileFragment.this.refreshing && res.news.size() > 0 && ((NewsEntry) res.news.get(0)).flag(1024)) {
                        ProfileFragment.this.fixedPostId = ((NewsEntry) res.news.get(0)).postID;
                    }
                    Iterator it = res.news.iterator();
                    while (true) {
                        if (!it.hasNext()) {
                            break;
                        }
                        NewsEntry p = (NewsEntry) it.next();
                        if (p.postID == ProfileFragment.this.fixedPostId && !p.flag(1024)) {
                            res.news.remove(p);
                            break;
                        }
                    }
                    if (ProfileFragment.this.content != null) {
                        if (res.news.total() == 0) {
                            if (!ProfileFragment.this.infoItems.contains(ProfileFragment.this.emptyViewItem)) {
                                ProfileFragment.this.infoItems.add(ProfileFragment.this.emptyViewItem);
                            }
                            ProfileFragment.this.emptyText.setText(ProfileFragment.this.uid == VKAccountManager.getCurrent().getUid() ? R.string.wall_empty_my : R.string.wall_empty);
                        } else {
                            ProfileFragment.this.infoItems.remove(ProfileFragment.this.emptyViewItem);
                        }
                    }
                    if (offset == 0 && ProfileFragment.this.selector != null) {
                        ProfileFragment.this.selector.findViewById(R.id.profile_wall_post_btn).setVisibility(0);
                        ProfileFragment.this.selector.findViewById(R.id.profile_wall_progress).setVisibility(8);
                    }
                    ProfileFragment.this.offset += count;
                    if ((ProfileFragment.this.uid == 0 || ProfileFragment.this.uid == VKAccountManager.getCurrent().getUid()) && ProfileFragment.this.refreshing) {
                        if (ProfileFragment.this.ownerOnly == (!ProfileFragment.this.profile.showAllPosts) && ProfileFragment.this.getActivity() != null) {
                            ProfileFragment.this.getActivity().getSharedPreferences(null, 0).edit().putInt("postponed_count", res.postponedCount).commit();
                        }
                    }
                    if (!ProfileFragment.this.refreshing) {
                        Iterator<NewsEntry> itr = res.news.iterator();
                        while (itr.hasNext()) {
                            NewsEntry e = itr.next();
                            boolean removed = false;
                            Iterator it2 = ProfileFragment.this.data.iterator();
                            while (true) {
                                if (!it2.hasNext()) {
                                    break;
                                }
                                NewsEntry ee = (NewsEntry) it2.next();
                                if (e.postID == ee.postID) {
                                    itr.remove();
                                    removed = true;
                                    break;
                                }
                            }
                            if (!removed) {
                                Iterator it3 = ProfileFragment.this.preloadedData.iterator();
                                while (true) {
                                    if (!it3.hasNext()) {
                                        break;
                                    }
                                    NewsEntry ee2 = (NewsEntry) it3.next();
                                    if (e.postID == ee2.postID) {
                                        itr.remove();
                                        removed = true;
                                        break;
                                    }
                                }
                                if (removed) {
                                }
                            }
                        }
                    }
                    ProfileFragment.this.totalPosts = res.news.total();
                    ProfileFragment.this.updatePostCount();
                    if (TextUtils.isEmpty(res.next_from)) {
                        ProfileFragment.this.nextFrom = null;
                        ProfileFragment.this.onDataLoaded(res.news, false);
                        return;
                    }
                    ProfileFragment.this.nextFrom = res.next_from;
                    ProfileFragment.this.onDataLoaded(res.news, true);
                }
            }

            @Override // com.vkontakte.android.api.SimpleCallback, com.vkontakte.android.api.Callback
            public void fail(VKAPIRequest.VKErrorResponse err) {
                boolean z = false;
                ProfileFragment.this.currentRequest = null;
                int errorCode = err.getCodeValue();
                if (errorCode == 18 || errorCode == 15) {
                    if (ProfileFragment.this.emptyText != null) {
                        if (errorCode == 18) {
                            ProfileFragment.this.emptyText.setText(R.string.page_deleted);
                        }
                        if (errorCode == 15) {
                            if (err.message.contains("is disabled")) {
                                ProfileFragment.this.emptyText.setText("");
                            } else {
                                ProfileFragment.this.emptyText.setText(R.string.page_blacklist);
                            }
                        }
                        if (ProfileFragment.this.selectorItem != null) {
                            ProfileFragment.this.infoItems.remove(ProfileFragment.this.selectorItem);
                        }
                        ProfileFragment.this.onDataLoaded(new ArrayList(), false);
                        ProfileFragment profileFragment = ProfileFragment.this;
                        if (ProfileFragment.this.uid < 0) {
                            z = true;
                        }
                        profileFragment.setRefreshEnabled(z);
                        if (ProfileFragment.this.uid > 0) {
                            ProfileFragment.this.profile.friendStatus = -1;
                        }
                        ProfileFragment.this.updateButtons();
                        ProfileFragment.this.invalidateOptionsMenu();
                        return;
                    }
                    return;
                }
                ProfileFragment.this.onError(err);
            }
        }).exec((Context) getActivity());
    }

    public void sendAppIndexing() {
        if (this.uid >= 0 || this.profile.groupAccess == 0) {
            this.googleApiClient = new GoogleApiClient.Builder(getActivity()).addApi(AppIndex.APP_INDEX_API).build();
            this.googleApiClient.connect();
            Uri appBaseUri = Uri.parse("android-app://com.vkontakte.android/vkontakte/m.vk.com/");
            Uri webBaseUri = Uri.parse("https://vk.com/");
            ArrayList<AppIndexApi.AppIndexingLink> links = new ArrayList<>();
            String title = this.uid < 0 ? this.profile.profile.fullName : this.profile.profile.firstName + MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR + this.profile.profile.lastName;
            this.indexingAppUri = appBaseUri.buildUpon().appendPath(this.profile.screenName).build();
            this.indexingWebUri = webBaseUri.buildUpon().appendPath(this.profile.screenName).build();
            AppIndex.AppIndexApi.view(this.googleApiClient, getActivity(), this.indexingAppUri, title, this.indexingWebUri, links);
        }
    }

    @Override // com.vkontakte.android.fragments.PostListFragment
    protected int getPostsOffset() {
        return this.infoAdapter.getItemCount();
    }

    @Override // com.vkontakte.android.fragments.PostListFragment
    public void prepend(NewsEntry e) {
        this.infoItems.remove(this.emptyViewItem);
        this.totalPosts++;
        updatePostCount();
        super.prepend(e);
    }

    @Override // com.vkontakte.android.fragments.PostListFragment
    public void remove(int oid, int pid) {
        super.remove(oid, pid);
        if (oid == this.uid) {
            this.totalPosts--;
            updatePostCount();
        }
        if (this.data.size() == 0 && !this.infoItems.contains(this.emptyViewItem)) {
            this.infoItems.add(this.emptyViewItem);
            updateList();
        }
    }

    public void updatePostCount() {
        if (!this.selector.findViewById(R.id.profile_wall_all_posts).isEnabled()) {
            ((TextView) this.selector.findViewById(R.id.profile_wall_all_posts)).setText(getResources().getQuantityString(R.plurals.posts, this.totalPosts, Integer.valueOf(this.totalPosts)));
        }
    }

    @Override // com.vkontakte.android.fragments.FitSystemWindowsFragment
    public boolean fitSystemWindows(Rect insets) {
        ViewGroup.MarginLayoutParams lp = (ViewGroup.MarginLayoutParams) getToolbar().getLayoutParams();
        if (this.layoutType != 0 && this.uid > 0) {
            lp.topMargin = 0;
            this.statusBarBgView.getLayoutParams().height = 0;
            this.contentView.requestLayout();
            return false;
        } else if (this.contentView == null) {
            return false;
        } else {
            lp.topMargin = insets.top;
            this.statusBarBgView.getLayoutParams().height = insets.top;
            this.contentView.requestLayout();
            return true;
        }
    }

    public void loadPlaylistAndPlay(int aid) {
        this.pendingAudioId = aid;
        if (this.audioLoadReq == null) {
            this.audioLoadReq = new AudioGet(this.uid).setCallback(new SimpleCallback<VKList<MusicTrack>>(getActivity()) { // from class: com.vkontakte.android.fragments.ProfileFragment.35
                {
                    ProfileFragment.this = this;
                }

                @Override // com.vkontakte.android.api.Callback
                public void success(VKList<MusicTrack> result) {
                    ProfileFragment.this.audioLoadReq = null;
                    ProfileFragment.this.audioPlaylist = new ArrayList();
                    ProfileFragment.this.audioPlaylist.addAll(result);
                    ProfileFragment.this.playAudio(ProfileFragment.this.pendingAudioId);
                    ProfileFragment.this.pendingAudioId = 0;
                }

                @Override // com.vkontakte.android.api.SimpleCallback, com.vkontakte.android.api.Callback
                public void fail(VKAPIRequest.VKErrorResponse error) {
                    ProfileFragment.this.audioLoadReq = null;
                    super.fail(error);
                    AudioFacade.stop();
                }
            }).exec((Context) getActivity());
        }
    }

    public void playAudio(int aid) {
        PlayerRefer refer;
        int pos = -1;
        int i = 0;
        while (true) {
            if (i >= this.audioPlaylist.size()) {
                break;
            } else if (this.audioPlaylist.get(i).aid != aid) {
                i++;
            } else {
                pos = i;
                break;
            }
        }
        if (pos != -1) {
            if (VKAccountManager.isCurrentUser(this.uid)) {
                refer = PlayerRefer.audios_my;
            } else if (this.uid >= 0) {
                refer = PlayerRefer.audios_user;
            } else {
                refer = PlayerRefer.audios_group;
            }
            AudioFacade.playTracks(this.audioPlaylist, pos, refer, true);
        }
    }

    /* loaded from: classes2.dex */
    public class ProfileInfoAdapter extends UsableRecyclerView.Adapter<RecyclerHolder<InfoItem>> implements CardItemDecorator.Provider {
        private ProfileInfoAdapter() {
            ProfileFragment.this = r1;
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        /* renamed from: onCreateViewHolder */
        public RecyclerHolder<InfoItem> mo1206onCreateViewHolder(ViewGroup parent, int viewType) {
            Iterator it = ProfileFragment.this.infoItems.iterator();
            while (it.hasNext()) {
                InfoItem item = (InfoItem) it.next();
                if (item.getType() == viewType) {
                    return item.createViewHolder();
                }
            }
            return null;
        }

        /* JADX WARN: Multi-variable type inference failed */
        @Override // android.support.v7.widget.RecyclerView.Adapter
        public void onBindViewHolder(RecyclerHolder<InfoItem> holder, int position) {
            holder.bind(ProfileFragment.this.infoItems.get(position));
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        public int getItemCount() {
            return ProfileFragment.this.infoItems.size();
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        public int getItemViewType(int position) {
            return ((InfoItem) ProfileFragment.this.infoItems.get(position)).getType();
        }

        @Override // me.grishka.appkit.views.UsableRecyclerView.Adapter, me.grishka.appkit.preloading.PrefetchInfoProvider
        public int getImageCountForItem(int position) {
            return ((InfoItem) ProfileFragment.this.infoItems.get(position)).getImageCount();
        }

        @Override // me.grishka.appkit.views.UsableRecyclerView.Adapter, me.grishka.appkit.preloading.PrefetchInfoProvider
        public String getImageURL(int position, int image) {
            return ((InfoItem) ProfileFragment.this.infoItems.get(position)).getImageURL(image);
        }

        @Override // com.vkontakte.android.ui.CardItemDecorator.Provider
        public int getBlockType(int position) {
            return ((InfoItem) ProfileFragment.this.infoItems.get(position)).backgroundType;
        }
    }

    /* loaded from: classes2.dex */
    public class CardMergeAdapter extends MergeRecyclerAdapter implements CardItemDecorator.Provider {
        private CardMergeAdapter() {
            ProfileFragment.this = r1;
        }

        @Override // com.vkontakte.android.ui.CardItemDecorator.Provider
        public int getBlockType(int position) {
            if (position != 0 || ProfileFragment.this.profile == null || !ProfileFragment.this.profile.hasCover() || !ProfileFragment.this.isEnableGroupParallaxEffect()) {
                RecyclerView.Adapter adapter = getAdapterForPosition(position);
                if (adapter instanceof CardItemDecorator.Provider) {
                    if (adapter != getAdapterAt(getAdapterCount() - 1) || getAdapterPosition(position) != 0 || ProfileFragment.this.profile == null) {
                        return ((CardItemDecorator.Provider) adapter).getBlockType(getAdapterPosition(position));
                    }
                    return 1;
                }
                return 0;
            }
            return 1;
        }
    }

    /* loaded from: classes2.dex */
    public abstract class InfoItem {
        public int backgroundType;
        public boolean dividerAfter;

        public abstract RecyclerHolder createViewHolder();

        public abstract int getType();

        private InfoItem() {
            ProfileFragment.this = r1;
        }

        public int getImageCount() {
            return 0;
        }

        public String getImageURL(int image) {
            return null;
        }
    }

    /* loaded from: classes2.dex */
    public class ViewInfoItem extends InfoItem {
        public View view;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public ViewInfoItem(View view) {
            super();
            ProfileFragment.this = r4;
            this.view = view;
            if (view.getLayoutParams() == null) {
                view.setLayoutParams(new RecyclerView.LayoutParams(-1, -2));
            }
        }

        @Override // com.vkontakte.android.fragments.ProfileFragment.InfoItem
        public int getType() {
            return this.view.getId();
        }

        @Override // com.vkontakte.android.fragments.ProfileFragment.InfoItem
        public RecyclerHolder createViewHolder() {
            return new ViewViewHolder(this.view);
        }
    }

    /* loaded from: classes2.dex */
    public class OverviewInfoItem extends InfoItem {
        public Drawable icon;
        public Runnable onClick;
        public ArrayList<String> photos;
        public CharSequence text;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public OverviewInfoItem(int icon, CharSequence text, Runnable onClick) {
            super();
            ProfileFragment.this = r2;
            this.photos = new ArrayList<>();
            this.icon = r2.getResources().getDrawable(icon);
            this.text = text;
            this.onClick = onClick;
        }

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public OverviewInfoItem(Drawable icon, CharSequence text, Runnable onClick) {
            super();
            ProfileFragment.this = r2;
            this.photos = new ArrayList<>();
            this.icon = icon;
            this.text = text;
            this.onClick = onClick;
        }

        @Override // com.vkontakte.android.fragments.ProfileFragment.InfoItem
        public int getType() {
            return -23;
        }

        @Override // com.vkontakte.android.fragments.ProfileFragment.InfoItem
        public RecyclerHolder createViewHolder() {
            return new OverviewInfoViewHolder();
        }

        @Override // com.vkontakte.android.fragments.ProfileFragment.InfoItem
        public int getImageCount() {
            return this.photos.size();
        }

        @Override // com.vkontakte.android.fragments.ProfileFragment.InfoItem
        public String getImageURL(int image) {
            return this.photos.get(image);
        }
    }

    /* loaded from: classes2.dex */
    public class ContentTitleInfoItem extends InfoItem {
        public String buttonText;
        public Runnable onButtonClick;
        public Runnable onClick;
        public CharSequence text;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public ContentTitleInfoItem(CharSequence text, Runnable onClick) {
            super();
            ProfileFragment.this = r3;
            this.buttonText = ProfileFragment.this.getString(R.string.show_all);
            this.text = text;
            this.onClick = onClick;
        }

        @Override // com.vkontakte.android.fragments.ProfileFragment.InfoItem
        public int getType() {
            return -22;
        }

        @Override // com.vkontakte.android.fragments.ProfileFragment.InfoItem
        public RecyclerHolder createViewHolder() {
            return new ContentTitleViewHolder();
        }

        @Override // com.vkontakte.android.fragments.ProfileFragment.InfoItem
        public int getImageCount() {
            return 0;
        }

        @Override // com.vkontakte.android.fragments.ProfileFragment.InfoItem
        public String getImageURL(int image) {
            return null;
        }
    }

    /* loaded from: classes2.dex */
    public class ButtonItem extends InfoItem {
        final int appId;
        final String title;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        ButtonItem(int appId, String title) {
            super();
            ProfileFragment.this = r2;
            this.appId = appId;
            this.title = title;
        }

        @Override // com.vkontakte.android.fragments.ProfileFragment.InfoItem
        public int getType() {
            return -100500;
        }

        @Override // com.vkontakte.android.fragments.ProfileFragment.InfoItem
        public RecyclerHolder createViewHolder() {
            return new ButtonViewHolder(ProfileFragment.this.getActivity().getLayoutInflater().inflate(R.layout.profile_button_layout, (ViewGroup) null));
        }
    }

    /* loaded from: classes2.dex */
    public class BoardTopicInfoItem extends InfoItem {
        public BoardTopic topic;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        BoardTopicInfoItem(BoardTopic topic) {
            super();
            ProfileFragment.this = r2;
            this.topic = topic;
        }

        @Override // com.vkontakte.android.fragments.ProfileFragment.InfoItem
        public int getType() {
            return -21;
        }

        @Override // com.vkontakte.android.fragments.ProfileFragment.InfoItem
        public RecyclerHolder createViewHolder() {
            return new BoardTopicViewHolder();
        }

        @Override // com.vkontakte.android.fragments.ProfileFragment.InfoItem
        public int getImageCount() {
            return 0;
        }

        @Override // com.vkontakte.android.fragments.ProfileFragment.InfoItem
        public String getImageURL(int image) {
            return null;
        }
    }

    /* loaded from: classes2.dex */
    public class AudioInfoItem extends InfoItem {
        public MusicTrack audio;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        AudioInfoItem(MusicTrack audio) {
            super();
            ProfileFragment.this = r2;
            this.audio = audio;
        }

        @Override // com.vkontakte.android.fragments.ProfileFragment.InfoItem
        public int getType() {
            return -20;
        }

        @Override // com.vkontakte.android.fragments.ProfileFragment.InfoItem
        public RecyclerHolder createViewHolder() {
            return new AudioViewHolder();
        }

        @Override // com.vkontakte.android.fragments.ProfileFragment.InfoItem
        public int getImageCount() {
            return 0;
        }

        @Override // com.vkontakte.android.fragments.ProfileFragment.InfoItem
        public String getImageURL(int image) {
            return null;
        }
    }

    /* loaded from: classes2.dex */
    public class ViewViewHolder extends RecyclerHolder<ViewInfoItem> {
        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        ViewViewHolder(View itemView) {
            super(itemView);
            ProfileFragment.this = r1;
        }

        @Override // com.vkontakte.android.ui.holder.RecyclerHolder
        public void onBind(ViewInfoItem item) {
        }
    }

    /* loaded from: classes2.dex */
    private class ButtonViewHolder extends RecyclerHolder<ButtonItem> implements UsableRecyclerView.Clickable {
        ButtonItem buttonItem;
        TextView textView;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        ButtonViewHolder(View view) {
            super(view);
            ProfileFragment.this = r2;
            this.textView = (TextView) view.findViewById(16908308);
        }

        @Override // com.vkontakte.android.ui.holder.RecyclerHolder
        public void onBind(ButtonItem item) {
            SpannableStringBuilder builder = new SpannableStringBuilder();
            ImageSpan imageSpan = new ImageSpan(getContext(), (int) R.drawable.ic_chevron_blue_right_24dp, 1);
            builder.append((CharSequence) item.title).append((CharSequence) "   ");
            builder.setSpan(imageSpan, builder.length() - 1, builder.length(), 33);
            this.textView.setText(builder);
            this.buttonItem = item;
        }

        @Override // me.grishka.appkit.views.UsableRecyclerView.Clickable
        public void onClick() {
            Intent intent = new Intent(getContext(), LinkRedirActivity.class);
            intent.setData(Uri.parse("https://vk.com/app" + this.buttonItem.appId + EventsFilesManager.ROLL_OVER_FILE_NAME_SEPARATOR + ProfileFragment.this.uid));
            ProfileFragment.this.startActivity(intent);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes2.dex */
    public class HeaderViewHolder extends ViewViewHolder {
        private VKImageView photo;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        HeaderViewHolder(View itemView) {
            super(itemView);
            ProfileFragment.this = r2;
            this.photo = (VKImageView) itemView.findViewById(R.id.profile_photo);
        }

        @Override // com.vkontakte.android.fragments.ProfileFragment.ViewViewHolder, com.vkontakte.android.ui.holder.RecyclerHolder
        public void onBind(ViewInfoItem item) {
            super.onBind(item);
            ProfileFragment.this.contentView.getViewTreeObserver().addOnPreDrawListener(new ViewTreeObserver.OnPreDrawListener() { // from class: com.vkontakte.android.fragments.ProfileFragment.HeaderViewHolder.1
                {
                    HeaderViewHolder.this = this;
                }

                @Override // android.view.ViewTreeObserver.OnPreDrawListener
                public boolean onPreDraw() {
                    ProfileFragment.this.contentView.getViewTreeObserver().removeOnPreDrawListener(this);
                    HeaderViewHolder.this.photo.setPostprocessor(new ProfileHeaderTransform(ProfileFragment.this.contentView.getWidth(), ProfileFragment.this.profile.photoRect));
                    HeaderViewHolder.this.photo.load(ProfileFragment.this.getHeaderImageUrl());
                    return true;
                }
            });
        }
    }

    /* loaded from: classes2.dex */
    private class WidgetViewHolder extends ViewViewHolder {
        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public WidgetViewHolder(View itemView) {
            super(itemView);
            ProfileFragment.this = r1;
        }

        @Override // com.vkontakte.android.fragments.ProfileFragment.ViewViewHolder, com.vkontakte.android.ui.holder.RecyclerHolder
        public void onBind(ViewInfoItem item) {
            if (ProfileFragment.this.profile.hasWidget() && (this.itemView instanceof WidgetBinder)) {
                ((WidgetBinder) this.itemView).bind(ProfileFragment.this.profile.widget);
            }
        }
    }

    public String getHeaderImageUrl() {
        if (this.profile == null || (this.uid > 0 && this.profile.isDeactivated())) {
            return null;
        }
        if (this.profile.photo == null) {
            return this.profile.bigPhoto;
        }
        if (Global.displayDensity > 2.0f) {
            return this.profile.photo.getImage('y', 'x').url;
        }
        return this.profile.photo.getImage('x').url;
    }

    /* loaded from: classes2.dex */
    private class OverviewInfoViewHolder extends RecyclerHolder<OverviewInfoItem> implements UsableRecyclerView.DisableableClickable {
        private ImageView icon;
        private PhotoStripView photos;
        private TextView text;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        OverviewInfoViewHolder() {
            super(r4.getActivity(), R.layout.profile_overview_item, r4.list);
            ProfileFragment.this = r4;
            this.text = (TextView) this.itemView.findViewById(R.id.text);
            this.icon = (ImageView) this.itemView.findViewById(R.id.icon);
            this.photos = (PhotoStripView) this.itemView.findViewById(R.id.photos);
            this.photos.setOverlapOffset(0.8f);
            this.photos.setPadding(V.dp(2.0f));
        }

        @Override // com.vkontakte.android.ui.holder.RecyclerHolder
        public void onBind(OverviewInfoItem item) {
            this.text.setText(item.text);
            this.icon.setImageDrawable(item.icon);
            if (item.photos.size() == 0) {
                this.photos.setVisibility(8);
                return;
            }
            this.photos.setVisibility(0);
            this.photos.load(item.photos);
        }

        @Override // me.grishka.appkit.views.UsableRecyclerView.DisableableClickable
        public boolean isEnabled() {
            return ((OverviewInfoItem) this.item).onClick != null;
        }

        @Override // me.grishka.appkit.views.UsableRecyclerView.Clickable
        public void onClick() {
            ((OverviewInfoItem) this.item).onClick.run();
        }
    }

    /* loaded from: classes2.dex */
    private class ContentTitleViewHolder extends RecyclerHolder<ContentTitleInfoItem> implements View.OnClickListener {
        private TextView button;
        private TextView text;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        ContentTitleViewHolder() {
            super(r4.getActivity(), R.layout.profile_content_title_item, r4.list);
            ProfileFragment.this = r4;
            this.text = (TextView) this.itemView.findViewById(R.id.text);
            this.text.setOnClickListener(this);
            this.button = (TextView) this.itemView.findViewById(R.id.button);
            this.button.setOnClickListener(this);
        }

        @Override // com.vkontakte.android.ui.holder.RecyclerHolder
        public void onBind(ContentTitleInfoItem item) {
            int i = 0;
            this.text.setText(item.text);
            this.text.setEnabled(item.onClick != null);
            TextView textView = this.button;
            if (ProfileFragment.this.uid >= 0) {
                i = 8;
            }
            textView.setVisibility(i);
            if (ProfileFragment.this.uid < 0) {
                this.button.setText(item.buttonText);
            }
        }

        @Override // android.view.View.OnClickListener
        public void onClick(View v) {
            if (v == this.text) {
                ((ContentTitleInfoItem) this.item).onClick.run();
            } else if (v == this.button) {
                if (((ContentTitleInfoItem) this.item).onButtonClick != null) {
                    ((ContentTitleInfoItem) this.item).onButtonClick.run();
                } else {
                    ((ContentTitleInfoItem) this.item).onClick.run();
                }
            }
        }
    }

    /* loaded from: classes2.dex */
    private class BoardTopicViewHolder extends RecyclerHolder<BoardTopicInfoItem> implements UsableRecyclerView.Clickable {
        private TextView subtitle;
        private TextView title;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        BoardTopicViewHolder() {
            super(r4.getActivity(), R.layout.profile_content_topic, r4.list);
            ProfileFragment.this = r4;
            this.title = (TextView) this.itemView.findViewById(R.id.title);
            this.subtitle = (TextView) this.itemView.findViewById(R.id.subtitle);
        }

        @Override // com.vkontakte.android.ui.holder.RecyclerHolder
        public void onBind(BoardTopicInfoItem item) {
            this.title.setText(item.topic.title);
            this.subtitle.setText(TimeUtils.langDate(item.topic.updated, true) + " · " + getResources().getQuantityString(R.plurals.topic_posts, item.topic.numComments, Integer.valueOf(item.topic.numComments)));
        }

        @Override // me.grishka.appkit.views.UsableRecyclerView.Clickable
        public void onClick() {
            BoardTopicViewFragment.Builder builder = new BoardTopicViewFragment.Builder(((BoardTopicInfoItem) this.item).topic.id, -ProfileFragment.this.uid, ((BoardTopicInfoItem) this.item).topic.title);
            if (ProfileFragment.this.profile.adminLevel > 0) {
                builder.setIsAdmin(true);
            }
            if ((((BoardTopicInfoItem) this.item).topic.flags & 1) > 0) {
                builder.setIsClosed(true);
            }
            builder.go(ProfileFragment.this);
        }
    }

    /* loaded from: classes2.dex */
    private class AudioViewHolder extends RecyclerHolder<AudioInfoItem> implements UsableRecyclerView.Clickable, UsableRecyclerView.LongClickable {
        private AudioAttachView audioView;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        AudioViewHolder() {
            super(new FrameLayout(r6.getActivity()));
            ProfileFragment.this = r6;
            this.audioView = new AudioAttachView(r6.getActivity());
            ((ViewGroup) this.itemView).addView(this.audioView);
            this.itemView.setPadding(getResources().getDimensionPixelOffset(R.dimen.post_side_padding), 0, getResources().getDimensionPixelOffset(R.dimen.post_side_padding), 0);
        }

        @Override // com.vkontakte.android.ui.holder.RecyclerHolder
        public void onBind(AudioInfoItem item) {
            MusicTrack a = item.audio;
            this.audioView.setData(a.artist, a.title, a.oid, a.aid, a.duration);
            this.audioView.setOnClickListener(null);
            this.audioView.setOnLongClickListener(null);
            this.audioView.setLongClickable(false);
            this.audioView.setClickable(false);
        }

        @Override // me.grishka.appkit.views.UsableRecyclerView.Clickable
        public void onClick() {
            if (AudioFacade.isCurrentTrack(((AudioInfoItem) this.item).audio.oid, ((AudioInfoItem) this.item).audio.aid)) {
                Context context = getContext();
                if (context != null) {
                    AudioFacade.toggleResumePause();
                }
            } else if (VKAuth.ensureLoggedIn(getContext())) {
                if (!AudioFacade.isCurrentTrack(((AudioInfoItem) this.item).audio.oid, ((AudioInfoItem) this.item).audio.aid) || AudioFacade.getPlayerState() == PlayerState.IDLE) {
                    if (ProfileFragment.this.audioPlaylist == null) {
                        ProfileFragment.this.loadPlaylistAndPlay(((AudioInfoItem) this.item).audio.aid);
                    } else {
                        ProfileFragment.this.playAudio(((AudioInfoItem) this.item).audio.aid);
                    }
                }
            }
        }

        @Override // me.grishka.appkit.views.UsableRecyclerView.LongClickable
        public boolean onLongClick() {
            return this.audioView.onLongClick(this.audioView);
        }
    }

    /* loaded from: classes2.dex */
    public abstract class PhotoFeedAdapter extends LoadingAdapter<Photo, PhotoFeedViewHolder> implements PhotoViewer.PhotoViewerCallback {
        public abstract void loadData(int i, int i2);

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        PhotoFeedAdapter(List<Photo> initialList, UsableRecyclerView list) {
            super(initialList, list, 50);
            ProfileFragment.this = r2;
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        /* renamed from: onCreateViewHolder */
        public PhotoFeedViewHolder mo1206onCreateViewHolder(ViewGroup parent, int viewType) {
            return new PhotoFeedViewHolder() { // from class: com.vkontakte.android.fragments.ProfileFragment.PhotoFeedAdapter.1
                {
                    PhotoFeedAdapter.this = this;
                    ProfileFragment profileFragment = ProfileFragment.this;
                }

                @Override // me.grishka.appkit.views.UsableRecyclerView.Clickable
                public void onClick() {
                    String string;
                    if (ProfileFragment.this.photoViewer == null) {
                        ProfileFragment.this.photoViewer = new PhotoViewer(ProfileFragment.this.getActivity(), PhotoFeedAdapter.this.preloader.getData(), PhotoFeedAdapter.this.preloader.getData().indexOf(this.item), PhotoFeedAdapter.this);
                        PhotoViewer photoViewer = ProfileFragment.this.photoViewer;
                        if (ProfileFragment.this.profile.mainAlbum != null) {
                            string = ProfileFragment.this.profile.mainAlbum.title;
                        } else {
                            string = getString(R.string.all_photos);
                        }
                        photoViewer.setTitle(string);
                        ProfileFragment.this.photoViewer.setDisplayTotal(ProfileFragment.this.profile.mainAlbum != null ? ProfileFragment.this.profile.mainAlbum.numPhotos : ProfileFragment.this.profile.getCounter("photos"));
                        ProfileFragment.this.photoViewer.show();
                    }
                }
            };
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        public void onBindViewHolder(PhotoFeedViewHolder holder, int position) {
            holder.bind(this.displayItems.get(position));
        }

        @Override // me.grishka.appkit.views.UsableRecyclerView.Adapter, me.grishka.appkit.preloading.PrefetchInfoProvider
        public int getImageCountForItem(int position) {
            return 1;
        }

        @Override // me.grishka.appkit.views.UsableRecyclerView.Adapter, me.grishka.appkit.preloading.PrefetchInfoProvider
        public String getImageURL(int position, int image) {
            return ((Photo) this.displayItems.get(position)).getImage(Global.displayDensity > 1.0f ? Global.displayDensity > 2.0f ? 'p' : 'o' : 'm', 'm').url;
        }

        @Override // me.grishka.appkit.utils.Preloader.Callback
        public void onAppendItems(List<Photo> items) {
            for (Photo photo : items) {
                if (!photo.hidden) {
                    this.displayItems.add(photo);
                }
            }
            if (ProfileFragment.this.photoViewer != null) {
                ProfileFragment.this.photoViewer.appendPhotos(items);
            }
            if (this.displayItems.size() == 0) {
                ProfileFragment.this.contentView.post(ProfileFragment$PhotoFeedAdapter$$Lambda$1.lambdaFactory$(this));
            }
        }

        @Override // com.vkontakte.android.PhotoViewer.PhotoViewerCallback
        public void getPhotoBounds(int index, Rect outRect, Rect outClip) {
            for (int i = 0; i < this.list.getChildCount(); i++) {
                View v = this.list.getChildAt(i);
                UsableRecyclerView.ViewHolder holder = this.list.mo1205getChildViewHolder(v);
                if (holder instanceof PhotoFeedViewHolder) {
                    Photo photo = ((PhotoFeedViewHolder) holder).getItem();
                    if (this.preloader.getData().indexOf(photo) == index) {
                        int[] loc = {0, 0};
                        v.getLocationInWindow(loc);
                        outRect.set(loc[0], loc[1], loc[0] + v.getWidth(), loc[1] + v.getHeight());
                        Point offset = V.getViewOffset(v, this.list);
                        if (offset.y < 0) {
                            outClip.top = -offset.y;
                        }
                        if (offset.y + v.getHeight() > this.list.getHeight()) {
                            outClip.bottom = (offset.y + v.getHeight()) - this.list.getHeight();
                            return;
                        }
                        return;
                    }
                }
            }
        }

        @Override // com.vkontakte.android.PhotoViewer.PhotoViewerCallback
        public boolean isMoreAvailable() {
            return this.preloader.isMoreAvailable();
        }

        @Override // com.vkontakte.android.PhotoViewer.PhotoViewerCallback
        public void loadMore() {
            this.preloader.onScrolledToLastItem();
        }

        @Override // com.vkontakte.android.PhotoViewer.PhotoViewerCallback
        public void onDismissed() {
            ProfileFragment.this.photoViewer = null;
        }
    }

    /* loaded from: classes2.dex */
    public class GoodsAdapter extends LoadingAdapter<Good, GoodViewHolder> implements HorizontalRecyclerView.ItemWidthFixable {
        int itemWidth;
        int mainAlbumId;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        GoodsAdapter(List<Good> initialList, UsableRecyclerView list, int mainAlbumId) {
            super(initialList, list, 10);
            ProfileFragment.this = r2;
            this.mainAlbumId = mainAlbumId;
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        /* renamed from: onCreateViewHolder */
        public GoodViewHolder mo1206onCreateViewHolder(ViewGroup parent, int viewType) {
            return new GoodViewHolder(parent);
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        public void onBindViewHolder(GoodViewHolder holder, int position) {
            holder.setItemWidth(this.itemWidth);
            holder.bind(this.displayItems.get(position));
        }

        @Override // me.grishka.appkit.views.UsableRecyclerView.Adapter, me.grishka.appkit.preloading.PrefetchInfoProvider
        public int getImageCountForItem(int position) {
            return Utils.isEmptyArray(((Good) this.displayItems.get(position)).photos) ? 0 : 1;
        }

        @Override // com.vkontakte.android.ui.widget.HorizontalRecyclerView.ItemWidthFixable
        public void setItemWidth(int width) {
            this.itemWidth = width;
        }

        @Override // me.grishka.appkit.views.UsableRecyclerView.Adapter, me.grishka.appkit.preloading.PrefetchInfoProvider
        public String getImageURL(int position, int image) {
            Photo.Image image1;
            if (!Utils.isEmptyArray(((Good) this.displayItems.get(position)).photos) && (image1 = ((Good) this.displayItems.get(position)).photos[0].getImageByWidth(V.dp(136.0f))) != null) {
                return image1.url;
            }
            return null;
        }

        @Override // me.grishka.appkit.utils.Preloader.Callback
        public void loadData(int offset, int count) {
            MarketGet marketGet;
            this.dataLoading = true;
            if (this.mainAlbumId >= 0) {
                marketGet = new MarketGet(ProfileFragment.this.uid, offset, count, this.mainAlbumId);
            } else {
                marketGet = new MarketGet(ProfileFragment.this.uid, offset, count);
            }
            marketGet.setCallback(new Callback<VKList<Good>>() { // from class: com.vkontakte.android.fragments.ProfileFragment.GoodsAdapter.1
                {
                    GoodsAdapter.this = this;
                }

                @Override // com.vkontakte.android.api.Callback
                public void success(VKList<Good> result) {
                    boolean z = false;
                    GoodsAdapter.this.dataLoading = false;
                    Preloader preloader = GoodsAdapter.this.preloader;
                    if (result.total() > GoodsAdapter.this.preloader.getData().size() + GoodsAdapter.this.preloader.getPreloadedData().size() + result.size()) {
                        z = true;
                    }
                    preloader.onDataLoaded(result, z);
                }

                @Override // com.vkontakte.android.api.Callback
                public void fail(VKAPIRequest.VKErrorResponse error) {
                    GoodsAdapter.this.dataLoading = false;
                }
            }).exec((Context) ProfileFragment.this.getActivity());
        }

        @Override // me.grishka.appkit.utils.Preloader.Callback
        public void onAppendItems(List<Good> items) {
            for (Good good : items) {
                this.displayItems.add(good);
            }
            if (this.displayItems.size() == 0) {
                ProfileFragment.this.contentView.post(ProfileFragment$GoodsAdapter$$Lambda$1.lambdaFactory$(this));
            }
        }
    }

    /* loaded from: classes2.dex */
    public class AllPhotosPhotoFeedAdapter extends PhotoFeedAdapter {
        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        AllPhotosPhotoFeedAdapter(List<Photo> initialList, UsableRecyclerView list) {
            super(initialList, list);
            ProfileFragment.this = r1;
        }

        @Override // com.vkontakte.android.fragments.ProfileFragment.PhotoFeedAdapter, me.grishka.appkit.utils.Preloader.Callback
        public void loadData(int offset, int count) {
            this.dataLoading = true;
            new PhotosGetAll(ProfileFragment.this.uid, offset, count).setCallback(new Callback<VKList<Photo>>() { // from class: com.vkontakte.android.fragments.ProfileFragment.AllPhotosPhotoFeedAdapter.1
                {
                    AllPhotosPhotoFeedAdapter.this = this;
                }

                @Override // com.vkontakte.android.api.Callback
                public void success(VKList<Photo> result) {
                    boolean z = false;
                    AllPhotosPhotoFeedAdapter.this.dataLoading = false;
                    Preloader preloader = AllPhotosPhotoFeedAdapter.this.preloader;
                    if (result.total() > AllPhotosPhotoFeedAdapter.this.preloader.getData().size() + AllPhotosPhotoFeedAdapter.this.preloader.getPreloadedData().size() + result.size()) {
                        z = true;
                    }
                    preloader.onDataLoaded(result, z);
                }

                @Override // com.vkontakte.android.api.Callback
                public void fail(VKAPIRequest.VKErrorResponse error) {
                    AllPhotosPhotoFeedAdapter.this.dataLoading = false;
                }
            }).exec((Context) ProfileFragment.this.getActivity());
        }
    }

    /* loaded from: classes2.dex */
    public class MainAlbumPhotoFeedAdapter extends PhotoFeedAdapter {
        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        MainAlbumPhotoFeedAdapter(List<Photo> initialList, UsableRecyclerView list) {
            super(initialList, list);
            ProfileFragment.this = r1;
        }

        @Override // com.vkontakte.android.fragments.ProfileFragment.PhotoFeedAdapter, me.grishka.appkit.utils.Preloader.Callback
        public void loadData(int offset, int count) {
            this.dataLoading = true;
            new PhotosGet(ProfileFragment.this.uid, ProfileFragment.this.profile.mainAlbum.id, offset, count).setCallback(new Callback<VKList<Photo>>() { // from class: com.vkontakte.android.fragments.ProfileFragment.MainAlbumPhotoFeedAdapter.1
                {
                    MainAlbumPhotoFeedAdapter.this = this;
                }

                @Override // com.vkontakte.android.api.Callback
                public void success(VKList<Photo> result) {
                    boolean z = false;
                    MainAlbumPhotoFeedAdapter.this.dataLoading = false;
                    Preloader preloader = MainAlbumPhotoFeedAdapter.this.preloader;
                    if (result.total() > MainAlbumPhotoFeedAdapter.this.preloader.getData().size() + MainAlbumPhotoFeedAdapter.this.preloader.getPreloadedData().size() + result.size()) {
                        z = true;
                    }
                    preloader.onDataLoaded(result, z);
                }

                @Override // com.vkontakte.android.api.Callback
                public void fail(VKAPIRequest.VKErrorResponse error) {
                    MainAlbumPhotoFeedAdapter.this.dataLoading = false;
                }
            }).exec((Context) ProfileFragment.this.getActivity());
        }
    }

    /* loaded from: classes2.dex */
    public class GoodViewHolder extends RecyclerHolder<Good> implements UsableRecyclerView.Clickable, HorizontalRecyclerView.ItemWidthFixable {
        final VKImageView imageView;
        int itemWidth;
        Good lastItem;
        final TextView text1;
        final TextView text2;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        GoodViewHolder(ViewGroup parent) {
            super(LayoutInflater.from(parent.getContext()).inflate(R.layout.good_profile_holder, parent, false));
            ProfileFragment.this = r4;
            this.imageView = (VKImageView) $(R.id.image);
            this.text1 = (TextView) $(16908308);
            this.text2 = (TextView) $(16908309);
            setItemWidth(this.itemWidth);
        }

        @Override // com.vkontakte.android.ui.widget.HorizontalRecyclerView.ItemWidthFixable
        public void setItemWidth(int itemWidth) {
            if (this.itemWidth != itemWidth) {
                this.itemWidth = itemWidth;
                if (itemWidth > 0) {
                    this.itemView.getLayoutParams().width = itemWidth;
                    this.itemView.setMinimumWidth(itemWidth);
                    this.itemView.forceLayout();
                }
            }
        }

        @Override // com.vkontakte.android.ui.holder.RecyclerHolder
        public void onBind(Good item) {
            this.lastItem = item;
            this.text1.setText(item.title);
            this.text2.setText(item.price_text);
            if (item.photos != null && item.photos.length > 0) {
                Photo.Image image1 = item.photos[0].getImageByWidth(V.dp(136.0f));
                if (image1 != null) {
                    this.imageView.load(image1.url);
                    return;
                } else {
                    this.imageView.clear();
                    return;
                }
            }
            this.imageView.clear();
        }

        @Override // me.grishka.appkit.views.UsableRecyclerView.Clickable
        public void onClick() {
            new GoodFragment.Builder(GoodFragment.Builder.Source.group_module, this.lastItem).go(getContext());
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes2.dex */
    public abstract class PhotoFeedViewHolder extends RecyclerHolder<Photo> implements UsableRecyclerView.Clickable {
        final int HEIGHT;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        PhotoFeedViewHolder() {
            super(new VKImageView(r5.getActivity()));
            ProfileFragment.this = r5;
            this.HEIGHT = V.dp(112.0f);
            ((VKImageView) this.itemView).setActualScaleType(ScalingUtils.ScaleType.CENTER_CROP);
            ((VKImageView) this.itemView).setPlaceholderImage(new ColorDrawable(getResources().getColor(R.color.big_photo_placeholder)));
        }

        @Override // com.vkontakte.android.ui.holder.RecyclerHolder
        public void onBind(Photo item) {
            Photo.Image img = item.getImage('m');
            if (img.width == 0 || img.height == 0) {
                this.itemView.setLayoutParams(new RecyclerView.LayoutParams(Math.round(this.HEIGHT * 1.25f), this.HEIGHT));
            } else {
                this.itemView.setLayoutParams(new RecyclerView.LayoutParams(Math.round(this.HEIGHT * Math.min(img.width / img.height, 1.5f)), this.HEIGHT));
            }
            ((VKImageView) this.itemView).load(img.url);
        }
    }

    /* loaded from: classes2.dex */
    public class VideoFeedAdapter extends UsableRecyclerView.Adapter<VideoFeedViewHolder> implements Preloader.Callback<VideoFile>, UsableRecyclerView.Listener {
        protected Preloader<VideoFile> preloader = new Preloader<>(this, 20);
        protected boolean dataLoading = false;

        VideoFeedAdapter(List<VideoFile> initialList) {
            ProfileFragment.this = r3;
            this.preloader.onDataLoaded(initialList, true);
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        /* renamed from: onCreateViewHolder */
        public VideoFeedViewHolder mo1206onCreateViewHolder(ViewGroup parent, int viewType) {
            return new VideoFeedViewHolder();
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        public void onBindViewHolder(VideoFeedViewHolder holder, int position) {
            holder.bind(this.preloader.getData().get(position));
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        public int getItemCount() {
            return this.preloader.getData().size();
        }

        @Override // me.grishka.appkit.views.UsableRecyclerView.Adapter, me.grishka.appkit.preloading.PrefetchInfoProvider
        public int getImageCountForItem(int position) {
            return 1;
        }

        @Override // me.grishka.appkit.views.UsableRecyclerView.Adapter, me.grishka.appkit.preloading.PrefetchInfoProvider
        public String getImageURL(int position, int image) {
            return this.preloader.getData().get(position).urlBigThumb;
        }

        @Override // me.grishka.appkit.utils.Preloader.Callback
        public void updateList() {
            notifyDataSetChanged();
        }

        @Override // me.grishka.appkit.utils.Preloader.Callback
        public void loadData(int offset, int count) {
            VideoGet.get(ProfileFragment.this.uid, 0, offset, count).setCallback(new Callback<VKList<VideoFile>>() { // from class: com.vkontakte.android.fragments.ProfileFragment.VideoFeedAdapter.1
                {
                    VideoFeedAdapter.this = this;
                }

                @Override // com.vkontakte.android.api.Callback
                public void success(VKList<VideoFile> result) {
                    boolean z = false;
                    VideoFeedAdapter.this.dataLoading = false;
                    Preloader<VideoFile> preloader = VideoFeedAdapter.this.preloader;
                    if (result.total() > VideoFeedAdapter.this.preloader.getData().size() + VideoFeedAdapter.this.preloader.getPreloadedData().size() + result.size()) {
                        z = true;
                    }
                    preloader.onDataLoaded(result, z);
                }

                @Override // com.vkontakte.android.api.Callback
                public void fail(VKAPIRequest.VKErrorResponse error) {
                    VideoFeedAdapter.this.dataLoading = false;
                }
            }).exec((Context) ProfileFragment.this.getActivity());
            this.dataLoading = true;
        }

        @Override // me.grishka.appkit.utils.Preloader.Callback
        public void onAppendItems(List<VideoFile> items) {
        }

        @Override // me.grishka.appkit.utils.Preloader.Callback
        public void onClearItems() {
            this.preloader.getData().clear();
        }

        @Override // me.grishka.appkit.utils.Preloader.Callback
        public boolean isDataLoading() {
            return this.dataLoading;
        }

        @Override // me.grishka.appkit.utils.Preloader.Callback
        public boolean isRefreshing() {
            return false;
        }

        @Override // me.grishka.appkit.views.UsableRecyclerView.Listener
        public void onScrolledToLastItem() {
            this.preloader.onScrolledToLastItem();
        }

        @Override // me.grishka.appkit.views.UsableRecyclerView.Listener
        public void onScrollStarted() {
        }
    }

    /* loaded from: classes2.dex */
    public class VideoFeedViewHolder extends RecyclerHolder<VideoFile> implements UsableRecyclerView.Clickable {
        private TextView duration;
        private VKImageView image;
        private TextView title;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        VideoFeedViewHolder() {
            super((int) R.layout.profile_video_item, r5.getActivity());
            ProfileFragment.this = r5;
            this.image = (VKImageView) this.itemView.findViewById(R.id.photo);
            this.title = (TextView) this.itemView.findViewById(R.id.title);
            this.duration = (TextView) this.itemView.findViewById(R.id.attach_duration);
            this.itemView.setLayoutParams(new RecyclerView.LayoutParams(V.dp(200.0f), V.dp(152.0f)));
        }

        @Override // com.vkontakte.android.ui.holder.RecyclerHolder
        public void onBind(VideoFile item) {
            String formatDuration;
            int i = 0;
            this.title.setText(item.title);
            boolean live = item.isLive();
            boolean upcoming = item.isLiveUpcoming();
            TextView textView = this.duration;
            if (upcoming) {
                formatDuration = getString(R.string.video_live_upcoming);
            } else if (live) {
                formatDuration = getString(R.string.video_live).toUpperCase();
            } else {
                formatDuration = Videos.formatDuration(item.duration);
            }
            textView.setText(formatDuration);
            this.duration.setCompoundDrawablesWithIntrinsicBounds((!live || upcoming) ? 0 : R.drawable.attach_video_live, 0, 0, 0);
            TextView textView2 = this.duration;
            if (!live && !upcoming && item.duration == 0) {
                i = 4;
            }
            textView2.setVisibility(i);
            this.image.load(item.urlBigThumb);
        }

        @Override // me.grishka.appkit.views.UsableRecyclerView.Clickable
        public void onClick() {
            new PostViewFragment.Builder(((VideoFile) this.item).convertToPost()).setRefer(ProfileFragment.this.getListReferrer()).resetScroll(true).go(ProfileFragment.this.getActivity());
        }
    }

    /* loaded from: classes2.dex */
    public static class DetailsItem implements Parcelable {
        public static final Parcelable.Creator<DetailsItem> CREATOR = new Parcelable.Creator<DetailsItem>() { // from class: com.vkontakte.android.fragments.ProfileFragment.DetailsItem.1
            @Override // android.os.Parcelable.Creator
            /* renamed from: createFromParcel */
            public DetailsItem mo1019createFromParcel(Parcel source) {
                return new DetailsItem(source);
            }

            @Override // android.os.Parcelable.Creator
            /* renamed from: newArray */
            public DetailsItem[] mo1020newArray(int size) {
                return new DetailsItem[size];
            }
        };
        int bgType;
        public String contacts;
        public String content;
        Intent fallbackIntent;
        public String image;
        Intent intent;
        public boolean isHeader;
        CharSequence parsedContent;
        public String subtitle;
        public String title;

        DetailsItem(String title, String content, String subtitle, String contacts, boolean isHeader, Intent intent, String image) {
            this.bgType = 1;
            this.content = content;
            this.intent = intent;
            this.image = image;
            this.isHeader = isHeader;
            this.subtitle = subtitle;
            this.title = title;
            this.contacts = contacts;
        }

        DetailsItem(String title, String content, String subtitle, boolean isHeader, Intent intent, String image) {
            this(title, content, subtitle, null, isHeader, intent, image);
        }

        DetailsItem(String title, String content, Intent href) {
            this(title, content, null, false, href, null);
        }

        DetailsItem(String title, String content) {
            this(title, content, null, false, null, null);
        }

        @Override // android.os.Parcelable
        public int describeContents() {
            return 0;
        }

        @Override // android.os.Parcelable
        public void writeToParcel(Parcel dest, int flags) {
            dest.writeString(this.title);
            dest.writeString(this.content);
            dest.writeString(this.subtitle);
            dest.writeByte(this.isHeader ? (byte) 1 : (byte) 0);
            dest.writeInt(this.bgType);
            dest.writeParcelable(this.intent, 0);
            dest.writeParcelable(this.fallbackIntent, 0);
            dest.writeString(this.image);
            dest.writeString(this.contacts);
        }

        DetailsItem(Parcel in) {
            boolean z = true;
            this.bgType = 1;
            this.title = in.readString();
            this.content = in.readString();
            this.subtitle = in.readString();
            this.isHeader = in.readByte() == 0 ? false : z;
            this.bgType = in.readInt();
            this.intent = (Intent) in.readParcelable(Intent.class.getClassLoader());
            this.fallbackIntent = (Intent) in.readParcelable(Intent.class.getClassLoader());
            this.image = in.readString();
            this.contacts = in.readString();
        }
    }

    /* loaded from: classes2.dex */
    public class ProfilePhotoViewerCallback implements PhotoViewer.PhotoViewerCallback {
        private boolean loading = false;
        private int offset;
        private int total;
        public PhotoViewer viewer;

        public ProfilePhotoViewerCallback(int offset, int total) {
            ProfileFragment.this = r2;
            this.offset = offset;
            this.total = total;
        }

        @Override // com.vkontakte.android.PhotoViewer.PhotoViewerCallback
        public void getPhotoBounds(int index, Rect outRect, Rect outClip) {
        }

        @Override // com.vkontakte.android.PhotoViewer.PhotoViewerCallback
        public boolean isMoreAvailable() {
            return this.offset < this.total;
        }

        @Override // com.vkontakte.android.PhotoViewer.PhotoViewerCallback
        public void loadMore() {
            if (!this.loading) {
                this.loading = true;
                new PhotosGet(ProfileFragment.this.uid, -6, this.offset, 100, true).setCallback(new Callback<VKList<Photo>>() { // from class: com.vkontakte.android.fragments.ProfileFragment.ProfilePhotoViewerCallback.1
                    {
                        ProfilePhotoViewerCallback.this = this;
                    }

                    @Override // com.vkontakte.android.api.Callback
                    public void success(VKList<Photo> result) {
                        ProfilePhotoViewerCallback.this.offset += result.size();
                        ProfilePhotoViewerCallback.this.total = result.total();
                        ProfilePhotoViewerCallback.this.loading = false;
                        ProfilePhotoViewerCallback.this.viewer.appendPhotos(result);
                    }

                    @Override // com.vkontakte.android.api.Callback
                    public void fail(VKAPIRequest.VKErrorResponse error) {
                        ProfilePhotoViewerCallback.this.loading = false;
                    }
                }).exec((Context) ProfileFragment.this.getActivity());
            }
        }

        @Override // com.vkontakte.android.PhotoViewer.PhotoViewerCallback
        public void onDismissed() {
        }
    }

    /* loaded from: classes2.dex */
    public class ParallaxPreDrawListener implements ViewTreeObserver.OnPreDrawListener {
        View _list;
        View buttonsView;
        View coverView;
        View overlay;
        TextView profileTitle;
        View profile_last_seen;
        View profile_photo_icon;
        TextView toolbarTitle;
        boolean visible = true;
        int lastTextAlpha = 255;
        int lastToolbarAlpha = 255;
        Interpolator interpolator = new AccelerateInterpolator(2.0f);
        Interpolator interpolator2 = new DecelerateInterpolator(2.0f);

        ParallaxPreDrawListener() {
            ProfileFragment.this = this$0;
        }

        public void cleanOldView() {
            this.overlay = null;
            this.buttonsView = null;
            this.coverView = null;
            this.toolbarTitle = null;
            this.profileTitle = null;
            this.profile_last_seen = null;
            this.profile_photo_icon = null;
        }

        void hideToolbar() {
            if (ProfileFragment.this.getToolbar() != null) {
                ProfileFragment.this.getToolbar().setBackgroundDrawable(ProfileFragment.this.getToolbar().getBackground().mutate());
                setToolbarAlpha(0);
            }
        }

        void showToolbar(boolean animate) {
            if (animate) {
                ObjectAnimator.ofInt(this, "toolbarAlpha", 255).setDuration(200L).start();
            } else {
                setToolbarAlpha(255);
            }
        }

        @Override // android.view.ViewTreeObserver.OnPreDrawListener
        public boolean onPreDraw() {
            boolean newVisible;
            if (ProfileFragment.this.layoutType != 0 && ProfileFragment.this.uid > 0) {
                this.overlay = null;
                if (!this.visible) {
                    setToolbarTitleTextAlpha(255);
                    this.visible = true;
                    ProfileFragment.this.getToolbar().getBackground().setAlpha(255);
                    ProfileFragment.this.statusBarBgView.setAlpha(1.0f);
                }
                return true;
            }
            if (this._list == null) {
                this._list = ProfileFragment.this.list;
            }
            if (ProfileFragment.this.list == null) {
                if (this._list != null && this._list.getViewTreeObserver() != null) {
                    this._list.getViewTreeObserver().removeOnPreDrawListener(this);
                }
                return true;
            }
            if (this.overlay == null) {
                this.overlay = ProfileFragment.this.headerView.findViewById(R.id.profile_photo_overlay);
            }
            if (this.buttonsView == null) {
                this.buttonsView = ProfileFragment.this.headerView.findViewById(R.id.profile_buttons_wrap);
            }
            if (this.coverView == null && ProfileFragment.this.uid < 0) {
                this.coverView = ProfileFragment.this.headerView.findViewById(R.id.group_cover);
            }
            if (this.toolbarTitle == null) {
                this.toolbarTitle = (TextView) ProfileFragment.this.getToolbar().findViewById(R.id.custom_action_bar_title);
            }
            if (this.profileTitle == null) {
                this.profileTitle = (TextView) ProfileFragment.this.headerView.findViewById(R.id.profile_name);
            }
            if (this.profile_last_seen == null) {
                this.profile_last_seen = ProfileFragment.this.headerView.findViewById(R.id.profile_last_seen);
            }
            if (this.profile_photo_icon == null) {
                this.profile_photo_icon = ProfileFragment.this.headerView.findViewById(R.id.profile_photo_icon);
            }
            if (ProfileFragment.this.list.getChildCount() > 0) {
                int toolbarOffset = ((ProfileFragment.this.uid <= 0 || this.buttonsView.getVisibility() != 0) ? 0 : this.buttonsView.getHeight()) + ProfileFragment.this.getToolbar().getHeight() + ProfileFragment.this.statusBarBgView.getHeight();
                if (this.coverView == null || this.coverView.getVisibility() != 0) {
                    newVisible = ProfileFragment.this.list.getChildAdapterPosition(ProfileFragment.this.list.getChildAt(0)) != 0 || ProfileFragment.this.list.getChildAt(0).getBottom() <= toolbarOffset;
                } else {
                    newVisible = ProfileFragment.this.list.getChildAdapterPosition(ProfileFragment.this.list.getChildAt(0)) != 0 || ProfileFragment.this.list.getChildAt(0).getTop() + this.coverView.getBottom() <= toolbarOffset;
                }
                if (newVisible != this.visible) {
                    this.visible = newVisible;
                    ProfileFragment.this.getToolbar().getBackground().setAlpha(this.visible ? 255 : 0);
                    ProfileFragment.this.statusBarBgView.setAlpha(this.visible ? 1.0f : 0.0f);
                    setToolbarTitleTextAlpha(255);
                }
                if (ProfileFragment.this.list.getChildAdapterPosition(ProfileFragment.this.list.getChildAt(0)) == 0) {
                    View head = ProfileFragment.this.list.getChildAt(0);
                    float visiblePart = (-head.getTop()) / (((this.coverView == null || this.coverView.getVisibility() != 0) ? head.getHeight() : this.coverView.getHeight()) - toolbarOffset);
                    if (this.overlay != null) {
                        this.overlay.setAlpha(this.interpolator.getInterpolation(Math.max(0.0f, visiblePart)));
                    }
                    if (this.toolbarTitle != null && this.profileTitle != null && this.overlay != null) {
                        if (ProfileFragment.this.uid > 0) {
                            int toolbarTitleBottom = ViewUtils.getStatusBarHeight() + this.toolbarTitle.getBottom();
                            float percent = this.interpolator2.getInterpolation(1.0f - visiblePart);
                            float alphaOnlineAndCamera = (float) Math.pow(1.0f - visiblePart, 3.0d);
                            if (this.profile_last_seen != null) {
                                this.profile_last_seen.setAlpha(alphaOnlineAndCamera);
                            }
                            if (this.profile_photo_icon != null) {
                                this.profile_photo_icon.setAlpha(alphaOnlineAndCamera);
                            }
                            float scale = (3.0f + percent) / 4.0f;
                            this.profileTitle.setScaleY(scale);
                            this.profileTitle.setScaleX(scale);
                            this.profileTitle.setTranslationX(((1.0f - percent) * (this.toolbarTitle.getLeft() - (this.profileTitle.getPaddingLeft() * scale))) - ((this.profileTitle.getWidth() * (1.0f - scale)) / 2.0f));
                            this.profileTitle.setTranslationY(((this.profileTitle.getHeight() * (1.0f - scale)) / 2.0f) - ((((this.overlay.getHeight() - this.profileTitle.getBottom()) - toolbarTitleBottom) * (1.0f - percent)) * scale));
                            if (percent > 0.0f) {
                                setToolbarTitleTextAlpha(0);
                                this.profileTitle.setVisibility(0);
                            } else {
                                setToolbarTitleTextAlpha(255);
                                this.profileTitle.setVisibility(4);
                            }
                        } else if (this.coverView != null) {
                            int titleTop = ((View) this.profileTitle.getParent().getParent()).getTop() + this.profileTitle.getTop() + ((View) this.profileTitle.getParent()).getTop() + head.getTop();
                            int maxTranslation = ProfileFragment.this.getToolbar().getHeight() - ((ProfileFragment.this.getToolbar().getHeight() - this.toolbarTitle.getHeight()) / 2);
                            this.toolbarTitle.setTranslationY(Math.max(0, (maxTranslation - ProfileFragment.this.getToolbar().getBottom()) + titleTop));
                        }
                    }
                } else if (this.toolbarTitle != null && this.toolbarTitle.getTranslationY() != 0.0f) {
                    this.toolbarTitle.setTranslationY(0.0f);
                }
            } else {
                hideToolbar();
            }
            return true;
        }

        TextView getToolbarTitle() {
            if (this.toolbarTitle == null && ProfileFragment.this.getToolbar() != null) {
                this.toolbarTitle = (TextView) ProfileFragment.this.getToolbar().findViewById(R.id.custom_action_bar_title);
            }
            return this.toolbarTitle;
        }

        public void setToolbarAlpha(int alpha) {
            if (ProfileFragment.this.getToolbar() != null) {
                ProfileFragment.this.getToolbar().getBackground().setAlpha(alpha);
                setToolbarTitleTextAlpha(alpha);
                ProfileFragment.this.statusBarBgView.setAlpha(alpha / 255.0f);
            }
            this.lastToolbarAlpha = alpha;
        }

        public int getToolbarAlpha() {
            return this.lastToolbarAlpha;
        }

        public void setToolbarTitleTextAlpha(int alpha) {
            TextView toolbarTitle = getToolbarTitle();
            if (toolbarTitle != null) {
                toolbarTitle.setTextColor((alpha << 24) | ViewCompat.MEASURED_SIZE_MASK);
            }
            this.lastTextAlpha = alpha;
        }

        public int getToolbarTitleTextAlpha() {
            return this.lastTextAlpha;
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // me.grishka.appkit.fragments.AppKitFragment
    public void setTitle(CharSequence title) {
        super.setTitle("");
        View view = getView();
        if (view != null) {
            TextView textView = (TextView) getView().findViewById(R.id.custom_action_bar_title);
            textView.setText(title);
        }
    }
}
