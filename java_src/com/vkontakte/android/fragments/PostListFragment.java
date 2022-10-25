package com.vkontakte.android.fragments;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import android.animation.AnimatorSet;
import android.animation.ObjectAnimator;
import android.app.Activity;
import android.app.AlertDialog;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.res.Resources;
import android.graphics.Rect;
import android.net.Uri;
import android.os.Bundle;
import android.support.annotation.Nullable;
import android.support.v7.widget.RecyclerView;
import android.text.ClipboardManager;
import android.text.Html;
import android.text.Spannable;
import android.util.SparseArray;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.webkit.WebView;
import android.widget.PopupMenu;
import android.widget.Toast;
import com.facebook.share.internal.ShareConstants;
import com.vk.sharing.attachment.AttachmentInfo;
import com.vk.webapp.ReportAppInputData;
import com.vk.webapp.VKUIWebContainerFragment;
import com.vkontakte.android.AppStateTracker;
import com.vkontakte.android.ExpandTextSpan;
import com.vkontakte.android.Log;
import com.vkontakte.android.NewsEntry;
import com.vkontakte.android.R;
import com.vkontakte.android.ReportContentActivity;
import com.vkontakte.android.TimeUtils;
import com.vkontakte.android.VKAlertDialog;
import com.vkontakte.android.VKApplication;
import com.vkontakte.android.api.ResultlessCallback;
import com.vkontakte.android.api.adsint.AdsintHideAd;
import com.vkontakte.android.api.adsint.AdsintReportAd;
import com.vkontakte.android.api.newsfeed.NewsfeedAddBan;
import com.vkontakte.android.api.newsfeed.NewsfeedIgnoreItem;
import com.vkontakte.android.api.newsfeed.NewsfeedUnsubscribe;
import com.vkontakte.android.attachments.Attachment;
import com.vkontakte.android.attachments.MarketAttachment;
import com.vkontakte.android.attachments.ShitAttachment;
import com.vkontakte.android.auth.VKAccountManager;
import com.vkontakte.android.data.Analytics;
import com.vkontakte.android.data.Groups;
import com.vkontakte.android.data.PostInteract;
import com.vkontakte.android.data.Posts;
import com.vkontakte.android.data.ServerKeys;
import com.vkontakte.android.fragments.PostViewFragment;
import com.vkontakte.android.fragments.discussions.BoardTopicViewFragment;
import com.vkontakte.android.fragments.market.GoodFragment;
import com.vkontakte.android.fragments.news.NewPostFragment;
import com.vkontakte.android.media.AutoPlay;
import com.vkontakte.android.media.AutoPlayProvider;
import com.vkontakte.android.media.VideoRecyclerViewHelper;
import com.vkontakte.android.navigation.ArgKeys;
import com.vkontakte.android.ui.CardItemDecorator;
import com.vkontakte.android.ui.CubicBezierInterpolator;
import com.vkontakte.android.ui.HardwareLayerAnimatorListener;
import com.vkontakte.android.ui.posts.ActivityCommentDisplayItem;
import com.vkontakte.android.ui.posts.ActivityLikesDisplayItem;
import com.vkontakte.android.ui.posts.AttachContainerPostDisplayItem;
import com.vkontakte.android.ui.posts.AudioPostDisplayItem;
import com.vkontakte.android.ui.posts.ButtonsPostDisplayItem;
import com.vkontakte.android.ui.posts.CommentPostDisplayItem;
import com.vkontakte.android.ui.posts.CommonAttachmentPostDisplayItem;
import com.vkontakte.android.ui.posts.FooterPostDisplayItem;
import com.vkontakte.android.ui.posts.FriendsRecommPostDisplayItem;
import com.vkontakte.android.ui.posts.GoodsBlockPostDisplayItem;
import com.vkontakte.android.ui.posts.HeaderPostDisplayItem;
import com.vkontakte.android.ui.posts.MarkedAsAdsPostDisplayItem;
import com.vkontakte.android.ui.posts.NotificationPostDisplayItemGallery;
import com.vkontakte.android.ui.posts.PaddingPostDisplayItem;
import com.vkontakte.android.ui.posts.PostDisplayItem;
import com.vkontakte.android.ui.posts.RepostPostDisplayItem;
import com.vkontakte.android.ui.posts.ShitBlockPostDisplayItem;
import com.vkontakte.android.ui.posts.SignaturePostDisplayItem;
import com.vkontakte.android.ui.posts.TextPostDisplayItem;
import com.vkontakte.android.ui.posts.ThumbsBlockPostDisplayItem;
import com.vkontakte.android.ui.posts.WidgetPostDisplayItem;
import com.vkontakte.android.utils.L;
import io.fabric.sdk.android.services.common.AbstractSpiCall;
import io.fabric.sdk.android.services.events.EventsFilesManager;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import me.grishka.appkit.views.UsableRecyclerView;
/* loaded from: classes2.dex */
public abstract class PostListFragment extends CardRecyclerFragment<NewsEntry> {
    private static final int SPA_REQUEST_CODE = 1234;
    protected UsableRecyclerView.Adapter adapter;
    private final SparseArray<AutoPlay> autoPlayItems;
    private CubicBezierInterpolator interpolator;
    protected ArrayList<PostDisplayItem> items;
    int lastCenterOwnerId;
    int lastCenterPostId;
    String lastTrackCode;
    protected View.OnClickListener menuClickListener;
    private NewsEntry newsEntryToBeRemovedAfterReport;
    protected int offset;
    private BroadcastReceiver receiver;
    private ArrayList<Animator> runningAnims;
    long startTime;
    private VideoRecyclerViewHelper viewHelper;

    protected abstract String getListReferrer();

    protected abstract String getReferer();

    public /* synthetic */ void lambda$new$0(View v) {
        showItemOptions(v, (NewsEntry) v.getTag());
    }

    public PostListFragment() {
        super(10);
        this.items = new ArrayList<>();
        this.interpolator = new CubicBezierInterpolator(0.0d, 0.56d, 0.59d, 1.0d);
        this.menuClickListener = PostListFragment$$Lambda$1.lambdaFactory$(this);
        this.offset = 0;
        this.receiver = new BroadcastReceiver() { // from class: com.vkontakte.android.fragments.PostListFragment.1
            {
                PostListFragment.this = this;
            }

            @Override // android.content.BroadcastReceiver
            public void onReceive(Context context, Intent intent) {
                if (Posts.ACTION_NEW_POST_BROADCAST.equals(intent.getAction())) {
                    NewsEntry post = (NewsEntry) intent.getParcelableExtra("entry");
                    if (PostListFragment.this.canAddPost(post)) {
                        PostListFragment.this.prepend(post);
                    } else {
                        return;
                    }
                }
                if ("com.vkontakte.android.POST_DELETED".equals(intent.getAction())) {
                    PostListFragment.this.remove(intent.getIntExtra("owner_id", 0), intent.getIntExtra(ShareConstants.WEB_DIALOG_RESULT_PARAM_POST_ID, 0));
                    NewsEntry post2 = (NewsEntry) intent.getParcelableExtra(ArgKeys.POST);
                    if (post2 != null) {
                        PostListFragment.this.onPostDeleted(post2);
                    }
                }
                if (Posts.ACTION_POST_UPDATED_BROADCAST.equals(intent.getAction())) {
                    PostListFragment.this.update(intent.getIntExtra("owner_id", 0), intent.getIntExtra(ShareConstants.WEB_DIALOG_RESULT_PARAM_POST_ID, 0), intent.getIntExtra(ServerKeys.LIKES, 0), intent.getIntExtra("comments", -1), intent.getIntExtra("retweets", -1), intent.getBooleanExtra("liked", false), intent.getBooleanExtra("retweeted", false));
                }
                if (Posts.ACTION_POST_REPLACED_BROADCAST.equals(intent.getAction())) {
                    NewsEntry post3 = (NewsEntry) intent.getParcelableExtra("entry");
                    if (PostListFragment.this.getArguments() != null) {
                        String mode = PostListFragment.this.getArguments().getString("mode");
                        if (!"postponed".equals(mode) || post3.flag(2048)) {
                            if ("suggested".equals(mode) && !post3.flag(4096)) {
                                return;
                            }
                        } else {
                            return;
                        }
                    }
                    if (!intent.getBooleanExtra("bg_only", false) || AppStateTracker.getCurrentActivity() != PostListFragment.this.getActivity()) {
                        PostListFragment.this.replace(post3);
                    } else {
                        return;
                    }
                }
                if (Posts.ACTION_RELOAD_FEED.equals(intent.getAction())) {
                    PostListFragment.this.loadData();
                }
            }
        };
        this.runningAnims = new ArrayList<>();
        this.autoPlayItems = new SparseArray<>();
        this.lastCenterOwnerId = 0;
        this.lastCenterPostId = 0;
        this.lastTrackCode = null;
        this.startTime = 0L;
    }

    public PostListFragment(int layoutId) {
        super(layoutId, 10);
        this.items = new ArrayList<>();
        this.interpolator = new CubicBezierInterpolator(0.0d, 0.56d, 0.59d, 1.0d);
        this.menuClickListener = PostListFragment$$Lambda$2.lambdaFactory$(this);
        this.offset = 0;
        this.receiver = new BroadcastReceiver() { // from class: com.vkontakte.android.fragments.PostListFragment.1
            {
                PostListFragment.this = this;
            }

            @Override // android.content.BroadcastReceiver
            public void onReceive(Context context, Intent intent) {
                if (Posts.ACTION_NEW_POST_BROADCAST.equals(intent.getAction())) {
                    NewsEntry post = (NewsEntry) intent.getParcelableExtra("entry");
                    if (PostListFragment.this.canAddPost(post)) {
                        PostListFragment.this.prepend(post);
                    } else {
                        return;
                    }
                }
                if ("com.vkontakte.android.POST_DELETED".equals(intent.getAction())) {
                    PostListFragment.this.remove(intent.getIntExtra("owner_id", 0), intent.getIntExtra(ShareConstants.WEB_DIALOG_RESULT_PARAM_POST_ID, 0));
                    NewsEntry post2 = (NewsEntry) intent.getParcelableExtra(ArgKeys.POST);
                    if (post2 != null) {
                        PostListFragment.this.onPostDeleted(post2);
                    }
                }
                if (Posts.ACTION_POST_UPDATED_BROADCAST.equals(intent.getAction())) {
                    PostListFragment.this.update(intent.getIntExtra("owner_id", 0), intent.getIntExtra(ShareConstants.WEB_DIALOG_RESULT_PARAM_POST_ID, 0), intent.getIntExtra(ServerKeys.LIKES, 0), intent.getIntExtra("comments", -1), intent.getIntExtra("retweets", -1), intent.getBooleanExtra("liked", false), intent.getBooleanExtra("retweeted", false));
                }
                if (Posts.ACTION_POST_REPLACED_BROADCAST.equals(intent.getAction())) {
                    NewsEntry post3 = (NewsEntry) intent.getParcelableExtra("entry");
                    if (PostListFragment.this.getArguments() != null) {
                        String mode = PostListFragment.this.getArguments().getString("mode");
                        if (!"postponed".equals(mode) || post3.flag(2048)) {
                            if ("suggested".equals(mode) && !post3.flag(4096)) {
                                return;
                            }
                        } else {
                            return;
                        }
                    }
                    if (!intent.getBooleanExtra("bg_only", false) || AppStateTracker.getCurrentActivity() != PostListFragment.this.getActivity()) {
                        PostListFragment.this.replace(post3);
                    } else {
                        return;
                    }
                }
                if (Posts.ACTION_RELOAD_FEED.equals(intent.getAction())) {
                    PostListFragment.this.loadData();
                }
            }
        };
        this.runningAnims = new ArrayList<>();
        this.autoPlayItems = new SparseArray<>();
        this.lastCenterOwnerId = 0;
        this.lastCenterPostId = 0;
        this.lastTrackCode = null;
        this.startTime = 0L;
    }

    @Override // android.app.DialogFragment, android.app.Fragment
    public void onCreate(Bundle state) {
        super.onCreate(state);
        this.viewHelper = new VideoRecyclerViewHelper(getActivity());
        IntentFilter filter = new IntentFilter();
        filter.addAction(Posts.ACTION_NEW_POST_BROADCAST);
        filter.addAction("com.vkontakte.android.POST_DELETED");
        filter.addAction(Posts.ACTION_POST_UPDATED_BROADCAST);
        filter.addAction(Posts.ACTION_POST_REPLACED_BROADCAST);
        filter.addAction(Posts.ACTION_RELOAD_FEED);
        VKApplication.context.registerReceiver(this.receiver, filter, "com.vkontakte.android.permission.ACCESS_DATA", null);
    }

    @Override // me.grishka.appkit.fragments.LoaderFragment, android.app.Fragment
    public void onDestroy() {
        super.onDestroy();
        this.viewHelper.onDestroy();
        try {
            VKApplication.context.unregisterReceiver(this.receiver);
        } catch (Exception x) {
            L.e(x, new Object[0]);
        }
    }

    @Override // com.vkontakte.android.fragments.CardRecyclerFragment, me.grishka.appkit.fragments.BaseRecyclerFragment, me.grishka.appkit.fragments.AppKitFragment, android.app.Fragment
    public void onAttach(Activity act) {
        super.onAttach(act);
        MarketAttachment.setLastSource(GoodFragment.Builder.Source.wall);
        setEmptyText(R.string.no_posts);
        if (isAutoload()) {
            loadData();
        }
    }

    protected boolean isAutoload() {
        return getArguments() == null || !getArguments().getBoolean("no_autoload");
    }

    @Override // me.grishka.appkit.fragments.ContainerFragment, android.app.DialogFragment, android.app.Fragment
    public void onDetach() {
        int abId = Resources.getSystem().getIdentifier("action_bar_container", "id", AbstractSpiCall.ANDROID_CLIENT_TYPE);
        View actionBarView = getActivity().findViewById(abId);
        if (actionBarView != null) {
            actionBarView.setOnClickListener(null);
        }
        super.onDetach();
    }

    @Override // com.vkontakte.android.fragments.CardRecyclerFragment, me.grishka.appkit.fragments.BaseRecyclerFragment, me.grishka.appkit.fragments.LoaderFragment, me.grishka.appkit.fragments.AppKitFragment, android.app.DialogFragment, android.app.Fragment
    public void onDestroyView() {
        super.onDestroyView();
        if (this.list != null) {
            this.list.removeScrollListener(this.viewHelper);
        }
    }

    @Override // com.vkontakte.android.fragments.CardRecyclerFragment, com.vkontakte.android.fragments.VKRecyclerFragment, me.grishka.appkit.fragments.AppKitFragment, android.app.Fragment
    public void onViewCreated(View view, Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);
        if (getToolbar() != null) {
            getToolbar().setOnClickListener(PostListFragment$$Lambda$3.lambdaFactory$(this));
        }
        this.list.addScrollListener(this.viewHelper);
        this.list.setDrawSelectorOnTop(true);
        this.list.setSelectorBoundsProvider(PostListFragment$$Lambda$4.lambdaFactory$(this));
        this.list.addOnScrollListener(new RecyclerView.OnScrollListener() { // from class: com.vkontakte.android.fragments.PostListFragment.2
            {
                PostListFragment.this = this;
            }

            @Override // android.support.v7.widget.RecyclerView.OnScrollListener
            public void onScrollStateChanged(RecyclerView recyclerView, int newState) {
            }

            @Override // android.support.v7.widget.RecyclerView.OnScrollListener
            public void onScrolled(RecyclerView recyclerView, int dx, int dy) {
                if (recyclerView.getHeight() > 0) {
                    int childCount = recyclerView.getChildCount();
                    int centerY = recyclerView.getHeight() / 2;
                    for (int i = 0; i < childCount; i++) {
                        View v = recyclerView.getChildAt(i);
                        if (v.getTop() <= centerY && v.getBottom() >= centerY) {
                            int pos = recyclerView.getChildAdapterPosition(v);
                            if (pos < PostListFragment.this.items.size() && pos >= 0) {
                                PostDisplayItem item = PostListFragment.this.items.get(pos);
                                if (PostListFragment.this.lastCenterOwnerId != item.postOwnerID && PostListFragment.this.lastCenterPostId != item.postID) {
                                    PostListFragment.this.pauseLookingCenterPost();
                                    PostListFragment.this.resumeLookingCenterPost(item);
                                    return;
                                }
                                return;
                            }
                            return;
                        }
                    }
                }
            }
        });
    }

    public /* synthetic */ void lambda$onViewCreated$1(View v) {
        if (this.list != null) {
            this.list.scrollToPosition(0);
        }
    }

    public /* synthetic */ void lambda$onViewCreated$2(View view1, Rect outRect) {
        RecyclerView.ViewHolder _holder = this.list.mo1205getChildViewHolder(view1);
        if (!(_holder instanceof PostDisplayItemViewHolder)) {
            outRect.set(view1.getLeft(), view1.getTop(), view1.getRight(), view1.getBottom());
            return;
        }
        PostDisplayItemViewHolder holder = (PostDisplayItemViewHolder) _holder;
        outRect.left = view1.getLeft();
        outRect.right = view1.getRight();
        if (holder != null) {
            boolean foundFirst = false;
            boolean insidePost = false;
            for (int i = 0; i < this.list.getChildCount(); i++) {
                RecyclerView.ViewHolder hh = this.list.mo1205getChildViewHolder(this.list.getChildAt(i));
                if (hh instanceof PostDisplayItemViewHolder) {
                    PostDisplayItemViewHolder h = (PostDisplayItemViewHolder) hh;
                    if (!foundFirst && h.item.postID == holder.item.postID && h.item.postOwnerID == holder.item.postOwnerID) {
                        foundFirst = true;
                        outRect.top = this.list.getChildAt(i).getTop();
                        insidePost = true;
                    } else if (insidePost && (h.item.postID != holder.item.postID || h.item.postOwnerID != holder.item.postOwnerID)) {
                        insidePost = false;
                        outRect.bottom = this.list.getChildAt(i - 1).getBottom();
                        break;
                    }
                }
            }
            if (insidePost) {
                outRect.bottom = this.list.getHeight();
            }
        }
    }

    public void resumeLookingCenterPost(@Nullable PostDisplayItem item) {
        this.startTime = System.currentTimeMillis();
        if (item != null) {
            this.lastCenterOwnerId = item.postOwnerID;
            this.lastCenterPostId = item.postID;
            this.lastTrackCode = item.trackCode;
        }
    }

    public void pauseLookingCenterPost() {
        if (this.lastCenterOwnerId != 0 && this.lastCenterPostId != 0 && this.startTime != 0) {
            Analytics.viewPostTime.addTime(getListReferrer(), this.lastTrackCode, this.lastCenterOwnerId + EventsFilesManager.ROLL_OVER_FILE_NAME_SEPARATOR + this.lastCenterPostId, (int) (System.currentTimeMillis() - this.startTime));
        }
    }

    @Override // android.app.Fragment
    public void onPause() {
        super.onPause();
        pauseLookingCenterPost();
        if (this.viewHelper != null) {
            this.viewHelper.onPause(getActivity());
        }
    }

    @Override // android.app.Fragment
    public void onResume() {
        super.onResume();
        resumeLookingCenterPost(null);
        Iterator it = this.data.iterator();
        while (true) {
            if (!it.hasNext()) {
                break;
            }
            NewsEntry e = (NewsEntry) it.next();
            if (e.type == 12) {
                if (e.retweetOrigTime != 0 && e.retweetOrigTime < TimeUtils.getCurrentTime()) {
                    remove(e.ownerID, e.postID);
                    break;
                }
                updateList();
            }
        }
        Iterator it2 = this.data.iterator();
        while (true) {
            if (!it2.hasNext()) {
                break;
            }
            NewsEntry e2 = (NewsEntry) it2.next();
            if (e2.type == 11) {
                Iterator<Attachment> itrtr = e2.attachments.iterator();
                while (itrtr.hasNext()) {
                    Attachment att = itrtr.next();
                    if (att instanceof ShitAttachment) {
                        ShitAttachment a = (ShitAttachment) att;
                        a.updateInstallationState();
                        if (a.timeToLive != 0 && a.timeToLive < TimeUtils.getCurrentTime()) {
                            itrtr.remove();
                        }
                    }
                }
                if (e2.attachments.size() == 0) {
                    remove(e2.ownerID, e2.postID);
                    break;
                }
            }
        }
        if (this.viewHelper != null) {
            this.viewHelper.onResume(getActivity());
        }
    }

    @Override // me.grishka.appkit.fragments.BaseRecyclerFragment
    /* renamed from: getAdapter */
    public UsableRecyclerView.Adapter mo1066getAdapter() {
        if (this.adapter == null) {
            this.adapter = new NewsAdapter();
        }
        return this.adapter;
    }

    protected int getPostsOffset() {
        return 0;
    }

    protected void onPostDeleted(NewsEntry post) {
    }

    protected boolean canHideFromFeed() {
        return false;
    }

    protected boolean canHideNotInterestingFromFeed(NewsEntry entry) {
        return false;
    }

    protected boolean useFrom() {
        return false;
    }

    protected boolean isFeedbackStyle() {
        return false;
    }

    protected boolean canUnsubscribe() {
        return false;
    }

    protected boolean isPhotosMode() {
        return false;
    }

    protected boolean canAddPost(NewsEntry post) {
        return false;
    }

    @Override // me.grishka.appkit.fragments.BaseRecyclerFragment, me.grishka.appkit.utils.Preloader.Callback
    public void updateList() {
        int i = 0;
        int index = 0;
        this.autoPlayItems.clear();
        Iterator<PostDisplayItem> it = this.items.iterator();
        while (it.hasNext()) {
            PostDisplayItem item = it.next();
            if (item instanceof HeaderPostDisplayItem) {
                ((HeaderPostDisplayItem) item).listPosition = i;
                i++;
            }
            if (item instanceof FriendsRecommPostDisplayItem) {
                ((FriendsRecommPostDisplayItem) item).listPosition = i;
                i++;
            }
            AutoPlay autoPlay = item.getAutoPlayItem();
            if (autoPlay != null) {
                this.autoPlayItems.put(index, autoPlay);
            }
            index++;
        }
        if (this.viewHelper != null) {
            this.viewHelper.onListUpdate();
        }
        super.updateList();
    }

    public void prepend(NewsEntry e) {
        int itemPos = 0;
        int entryPos = 0;
        if (this.data.size() > 0 && ((NewsEntry) this.data.get(0)).flag(1024)) {
            entryPos = 0 + 1;
            Iterator<PostDisplayItem> it = this.items.iterator();
            while (it.hasNext()) {
                PostDisplayItem item = it.next();
                if (item.postID != ((NewsEntry) this.data.get(0)).postID) {
                    break;
                }
                itemPos++;
            }
        }
        this.data.add(entryPos, e);
        this.offset++;
        this.items.addAll(itemPos, attachExpandListeners(e, Posts.buildItems(e, isPhotosMode(), getReferer(), isFeedbackStyle(), canHideFromFeed(), this.menuClickListener, true, getListReferrer(), 0)));
        updateList();
    }

    public void remove(int oid, int pid) {
        Iterator<PostDisplayItem> itr = this.items.iterator();
        while (itr.hasNext()) {
            PostDisplayItem item = itr.next();
            if (item.postID == pid && item.postOwnerID == oid) {
                itr.remove();
            }
        }
        Iterator it = this.data.iterator();
        while (true) {
            if (!it.hasNext()) {
                break;
            }
            NewsEntry e = (NewsEntry) it.next();
            if (oid == 0 || e.ownerID == oid) {
                if (e.postID == pid) {
                    this.data.remove(e);
                    this.offset--;
                    break;
                }
            }
        }
        updateList();
    }

    public void update(int oid, int pid, int likes, int comments, int retweets, boolean liked, boolean retweeted) {
        Iterator it = this.data.iterator();
        while (it.hasNext()) {
            NewsEntry e = (NewsEntry) it.next();
            if (oid == 0 || e.ownerID == oid) {
                if (e.postID == pid) {
                    e.numLikes = likes;
                    if (comments != -1) {
                        e.numComments = comments;
                    }
                    if (retweets != -1) {
                        e.numRetweets = retweets;
                    }
                    e.flag(8, liked);
                    if (retweets != -1) {
                        e.flag(4, retweeted);
                    }
                    updateList();
                    return;
                }
            }
        }
    }

    public void replace(NewsEntry ne) {
        int i = 0;
        int insertAt = -1;
        Iterator<PostDisplayItem> itr = this.items.iterator();
        while (itr.hasNext()) {
            PostDisplayItem item = itr.next();
            if (item.postID == ne.postID && item.postOwnerID == ne.ownerID) {
                if (insertAt == -1) {
                    insertAt = i;
                }
                itr.remove();
            }
            i++;
        }
        if (insertAt != -1) {
            this.items.addAll(Math.max(insertAt, 0), attachExpandListeners(ne, Posts.buildItems(ne, isPhotosMode(), getReferer(), isFeedbackStyle(), canHideFromFeed(), this.menuClickListener, true, getListReferrer(), 0)));
            int i2 = 0;
            Iterator it = this.data.iterator();
            while (true) {
                if (!it.hasNext()) {
                    break;
                }
                NewsEntry e = (NewsEntry) it.next();
                if ((ne.ownerID == 0 || e.ownerID == ne.ownerID) && e.postID == ne.postID) {
                    this.data.set(i2, ne);
                    break;
                }
                i2++;
            }
            updateList();
        }
    }

    private void showItemOptions(View view, NewsEntry e) {
        if (getActivity() != null) {
            ArrayList<String> items = new ArrayList<>();
            ArrayList<String> acts = new ArrayList<>();
            if (e.type != 6 && e.type != 5 && e.type != 7 && e.type != 11) {
                items.add(getResources().getString(R.string.copy_link));
                acts.add("link");
                if (e.flag(64) || e.ownerID == VKAccountManager.getCurrent().getUid() || e.userID == VKAccountManager.getCurrent().getUid()) {
                    items.add(getResources().getString(R.string.delete));
                    acts.add("del");
                }
            }
            if (e.type == 5 && e.extra.getInt("parent_post") != 0) {
                items.add(getResources().getString(R.string.copy_link));
                acts.add("link");
            }
            if (canHideNotInterestingFromFeed(e) && e.ownerID != VKAccountManager.getCurrent().getUid() && VKAccountManager.getCurrent().getUid() > 0) {
                items.add(getResources().getString(R.string.hide_not_interesting));
                acts.add("hide_not_interesting");
            }
            if (canHideFromFeed() && e.ownerID != VKAccountManager.getCurrent().getUid() && e.type != 11 && e.type != 12 && VKAccountManager.getCurrent().getUid() > 0) {
                items.add(getResources().getString(R.string.hide_from_newsfeed));
                acts.add("hide");
            }
            if (e.flag(32) && e.retweetOrigTime > 0) {
                items.add(getResources().getString(R.string.show_original_post));
                acts.add("orig");
            }
            if (e.flag(128) && e.type != 5 && ((e.time + 86400 > TimeUtils.getCurrentTime() || e.flag(4096)) && VKAccountManager.getCurrent().getUid() > 0)) {
                items.add(getResources().getString(R.string.edit));
                acts.add("edit");
            }
            if (e.flag(2048)) {
                items.add(getResources().getString(R.string.publish_now));
                acts.add("publish");
            }
            if (e.platform == 8) {
                items.add(getResources().getString(R.string.open_in_instagram));
                acts.add("instagram");
            }
            if (e.flag(65536)) {
                items.add(e.flag(1024) ? getString(R.string.post_unfix) : getString(R.string.post_fix));
                acts.add("fix");
            }
            if (e.type == 11 || e.type == 12) {
                items.add(getString(R.string.hide));
                acts.add("hide");
            }
            if (VKAccountManager.getCurrent().getUid() > 0 && e.userID != VKAccountManager.getCurrent().getUid() && ((e.type == 0 || e.type == 1 || e.type == 2 || e.type == 11 || e.type == 12) && !e.flag(4096) && !e.flag(2048))) {
                items.add(getResources().getString(R.string.report_content));
                acts.add("report");
            }
            if (canUnsubscribe() && VKAccountManager.getCurrent().getUid() > 0) {
                items.add(getResources().getString(R.string.comments_unsubscribe));
                acts.add("unsubscribe");
            }
            if (e.extra != null && e.extra.containsKey("ads_debug")) {
                items.add("Ads Debug");
                acts.add("ads_debug");
            }
            PopupMenu pm = new PopupMenu(getActivity(), view);
            for (int i = 0; i < items.size(); i++) {
                pm.getMenu().add(0, i, 0, items.get(i));
            }
            pm.setOnMenuItemClickListener(PostListFragment$$Lambda$5.lambdaFactory$(this, acts, e));
            pm.show();
        }
    }

    public /* synthetic */ boolean lambda$showItemOptions$3(ArrayList acts, NewsEntry e, MenuItem item) {
        performPostAction((String) acts.get(item.getItemId()), e);
        return true;
    }

    private void performPostAction(String act, final NewsEntry e) {
        String ln;
        if ("instagram".equals(act)) {
            startActivity(new Intent("android.intent.action.VIEW", Uri.parse(e.extra.getString("post_source_url"))));
        }
        if ("link".equals(act)) {
            String ln2 = "https://vk.com/";
            if (e.type == 5) {
                ln = ln2 + ReportAppInputData.REPORT_TYPE_WALL + e.ownerID + EventsFilesManager.ROLL_OVER_FILE_NAME_SEPARATOR + e.extra.getInt("parent_post") + "?reply=" + e.postID;
            } else {
                if (e.type == 0 || e.type == 12) {
                    ln2 = ln2 + ReportAppInputData.REPORT_TYPE_WALL;
                } else if (e.type == 2) {
                    ln2 = ln2 + "video";
                } else if (e.type == 1) {
                    ln2 = ln2 + "photo";
                } else if (e.type == 4) {
                    ln2 = ln2 + "topic";
                }
                ln = ln2 + e.ownerID + EventsFilesManager.ROLL_OVER_FILE_NAME_SEPARATOR + e.postID;
            }
            ClipboardManager cm = (ClipboardManager) getActivity().getSystemService("clipboard");
            cm.setText(ln);
            Toast.makeText(getActivity(), (int) R.string.link_copied, 0).show();
        }
        if ("hide_not_interesting".equals(act)) {
            hideNotInteresting(e);
        }
        if ("hide".equals(act)) {
            hideSource(e);
        }
        if ("orig".equals(act)) {
            String type = ReportAppInputData.REPORT_TYPE_WALL;
            if (e.retweetType == 1) {
                type = "photo";
            }
            if (e.retweetType == 2) {
                type = "video";
            }
            getActivity().startActivity(new Intent("android.intent.action.VIEW", Uri.parse("vkontakte://vk.com/" + type + e.retweetUID + EventsFilesManager.ROLL_OVER_FILE_NAME_SEPARATOR + e.retweetOrigId)));
        }
        if ("edit".equals(act)) {
            if (e.flag(32)) {
                Posts.editRepostComment(e, Html.fromHtml(e.retweetText).toString(), getActivity());
                return;
            }
            new NewPostFragment.Builder().attachPost(e).isPublic(e.flag(2048)).go(getActivity());
        }
        if ("del".equals(act)) {
            new VKAlertDialog.Builder(getActivity()).setTitle(R.string.confirm).setMessage(R.string.delete_confirm).setPositiveButton(R.string.yes, PostListFragment$$Lambda$6.lambdaFactory$(this, e)).setNegativeButton(R.string.no, (DialogInterface.OnClickListener) null).show();
        }
        if ("report".equals(act)) {
            if (e.type == 11 || e.type == 12) {
                showReportAdDialog(e);
            } else {
                String listReferrer = getListReferrer();
                Intent intent = new Intent(getActivity(), ReportContentActivity.class);
                intent.putExtra("postInteract", new PostInteract(listReferrer, e));
                intent.putExtra("itemID", e.postID);
                intent.putExtra("ownerID", e.ownerID);
                intent.putExtra(AttachmentInfo.DATA_TRACK_CODE, e.getTrackCode());
                intent.putExtra("refer", listReferrer);
                String type2 = ArgKeys.POST;
                if (e.type == 1) {
                    type2 = "photo";
                }
                if (e.type == 2) {
                    type2 = "video";
                }
                intent.putExtra(ServerKeys.TYPE, type2);
                getActivity().startActivity(intent);
            }
        }
        if ("publish".equals(act)) {
            Posts.publishPostponed(e, getActivity(), null);
        }
        if ("unsubscribe".equals(act)) {
            new NewsfeedUnsubscribe(e.ownerID, e.postID, e.type).setCallback(new ResultlessCallback(getActivity()) { // from class: com.vkontakte.android.fragments.PostListFragment.3
                {
                    PostListFragment.this = this;
                }

                @Override // com.vkontakte.android.api.ResultlessCallback
                public void success() {
                    PostListFragment.this.remove(e.ownerID, e.postID);
                }
            }).wrapProgress(getActivity()).exec((Context) getActivity());
        }
        if ("fix".equals(act)) {
            Posts.toggleFixed(e, getActivity(), null);
        }
        if ("ads_debug".equals(act)) {
            WebView wv = new WebView(getActivity());
            wv.loadData(e.extra.getString("ads_debug"), "text/html", "UTF-8");
            AlertDialog dlg = new VKAlertDialog.Builder(getActivity()).setTitle("Ads Debug").setView(wv).setPositiveButton(R.string.close, (DialogInterface.OnClickListener) null).show();
            dlg.setOnDismissListener(PostListFragment$$Lambda$7.lambdaFactory$(wv));
        }
    }

    public /* synthetic */ void lambda$performPostAction$4(NewsEntry e, DialogInterface dialog, int which) {
        Posts.deletePost(e, getActivity());
    }

    @Override // android.app.Fragment
    public void onActivityResult(int requestCode, int resultCode, Intent data) {
        super.onActivityResult(requestCode, resultCode, data);
        if (resultCode == SPA_REQUEST_CODE && resultCode == -1 && this.newsEntryToBeRemovedAfterReport != null) {
            remove(this.newsEntryToBeRemovedAfterReport.ownerID, this.newsEntryToBeRemovedAfterReport.postID);
            this.newsEntryToBeRemovedAfterReport = null;
        }
    }

    private void showReportAdDialog(NewsEntry e) {
        if (VKAccountManager.getCurrent().useWebAppForReportContent) {
            String data1 = null;
            Iterator<Attachment> it = e.attachments.iterator();
            while (it.hasNext()) {
                Attachment att = it.next();
                if (att instanceof ShitAttachment) {
                    data1 = ((ShitAttachment) att).data;
                }
            }
            if (data1 != null) {
                this.newsEntryToBeRemovedAfterReport = e;
                new VKUIWebContainerFragment.Builder(ReportAppInputData.getSPAUriForAd(data1, getListReferrer())).forResult(this, SPA_REQUEST_CODE);
                return;
            }
            return;
        }
        new VKAlertDialog.Builder(getActivity()).setTitle(R.string.report_content).setItems(R.array.ad_report_reasons, PostListFragment$$Lambda$8.lambdaFactory$(this, e)).show();
    }

    public /* synthetic */ void lambda$showReportAdDialog$6(NewsEntry e, DialogInterface dialog, int which) {
        String data1 = null;
        Iterator<Attachment> it = e.attachments.iterator();
        while (it.hasNext()) {
            Attachment att = it.next();
            if (att instanceof ShitAttachment) {
                data1 = ((ShitAttachment) att).data;
            }
        }
        if (data1 != null) {
            new PostInteract(getListReferrer(), e).commit(PostInteract.Type.report);
            new AdsintReportAd(data1, getResources().getStringArray(R.array.ad_report_reasons_api)[which]).persist(null, null).exec();
            remove(e.ownerID, e.postID);
            Toast.makeText(getActivity(), (int) R.string.report_sent, 0).show();
        }
    }

    private void hideNotInteresting(final NewsEntry de) {
        if (NewsfeedIgnoreItem.canIgnore(de)) {
            String listReferrer = getListReferrer();
            new PostInteract(listReferrer, de).commit(PostInteract.Type.hide);
            new NewsfeedIgnoreItem(de, listReferrer).setCallback(new ResultlessCallback(getActivity()) { // from class: com.vkontakte.android.fragments.PostListFragment.4
                {
                    PostListFragment.this = this;
                }

                @Override // com.vkontakte.android.api.ResultlessCallback
                public void success() {
                    PostListFragment.this.remove(de.ownerID, de.postID);
                    Toast.makeText(PostListFragment.this.getActivity(), (int) R.string.hide_not_interesting_toast, 1).show();
                }
            }).wrapProgress(getActivity()).exec((Context) getActivity());
        }
    }

    private void hideSource(final NewsEntry de) {
        new PostInteract(getListReferrer(), de).commit(PostInteract.Type.hide);
        if (de.type == 11 || de.type == 12) {
            String data = null;
            Iterator<Attachment> it = de.attachments.iterator();
            while (it.hasNext()) {
                Attachment att = it.next();
                if (att instanceof ShitAttachment) {
                    data = ((ShitAttachment) att).data;
                }
            }
            if (data != null) {
                new AdsintHideAd(data, AdsintHideAd.ObjectType.ad).persist(null, null).exec();
                remove(de.ownerID, de.postID);
                return;
            }
            return;
        }
        new NewsfeedAddBan(de.ownerID, getListReferrer(), de.getTrackCode()).setCallback(new ResultlessCallback(getActivity()) { // from class: com.vkontakte.android.fragments.PostListFragment.5
            {
                PostListFragment.this = this;
            }

            @Override // com.vkontakte.android.api.ResultlessCallback
            public void success() {
                ArrayList<NewsEntry> toRemove = new ArrayList<>();
                Iterator it2 = PostListFragment.this.data.iterator();
                while (it2.hasNext()) {
                    NewsEntry e = (NewsEntry) it2.next();
                    if (e.userID == de.ownerID) {
                        toRemove.add(e);
                    }
                }
                Iterator it3 = PostListFragment.this.preloadedData.iterator();
                while (it3.hasNext()) {
                    NewsEntry e2 = (NewsEntry) it3.next();
                    if (e2.userID == de.ownerID) {
                        toRemove.add(e2);
                    }
                }
                Iterator<NewsEntry> it4 = toRemove.iterator();
                while (it4.hasNext()) {
                    NewsEntry e3 = it4.next();
                    PostListFragment.this.data.remove(e3);
                    PostListFragment.this.preloadedData.remove(e3);
                }
                Iterator<PostDisplayItem> itr = PostListFragment.this.items.iterator();
                while (itr.hasNext()) {
                    PostDisplayItem item = itr.next();
                    if (item.postOwnerID == de.ownerID) {
                        itr.remove();
                    }
                }
                Toast.makeText(PostListFragment.this.getActivity(), de.ownerID > 0 ? R.string.news_banned_user : R.string.news_banned_group, 1).show();
                PostListFragment.this.updateList();
            }
        }).wrapProgress(getActivity()).exec((Context) getActivity());
    }

    @Override // me.grishka.appkit.fragments.BaseRecyclerFragment, me.grishka.appkit.utils.Preloader.Callback
    public void onAppendItems(List<NewsEntry> posts) {
        Iterator<NewsEntry> itr = posts.iterator();
        while (itr.hasNext()) {
            NewsEntry e = itr.next();
            if (e.type == 11 || e.type == 12) {
                if (e.retweetOrigTime != 0 && e.retweetOrigTime < TimeUtils.getCurrentTime()) {
                    itr.remove();
                } else {
                    Iterator<Attachment> it = e.attachments.iterator();
                    while (it.hasNext()) {
                        Attachment att = it.next();
                        if (att instanceof ShitAttachment) {
                            ((ShitAttachment) att).updateInstallationState();
                        }
                    }
                }
            }
            this.items.addAll(attachExpandListeners(e, Posts.buildItems(e, isPhotosMode(), getReferer(), isFeedbackStyle(), canHideFromFeed(), this.menuClickListener, true, getListReferrer(), 0)));
        }
    }

    @Override // me.grishka.appkit.fragments.BaseRecyclerFragment
    protected void onPrependItems(List<NewsEntry> posts) {
        onPrependItems(posts, 0);
    }

    public void onPrependItems(List<NewsEntry> posts, int positionToAdd) {
        ArrayList<PostDisplayItem> tmp = new ArrayList<>();
        for (NewsEntry e : posts) {
            tmp.addAll(attachExpandListeners(e, Posts.buildItems(e, isPhotosMode(), getReferer(), isFeedbackStyle(), canHideFromFeed(), this.menuClickListener, true, getListReferrer(), 0)));
        }
        if (this.items.size() >= positionToAdd) {
            this.items.addAll(positionToAdd, tmp);
        } else {
            this.items.addAll(0, tmp);
        }
    }

    private List<PostDisplayItem> attachExpandListeners(NewsEntry entry, List<PostDisplayItem> items) {
        for (PostDisplayItem item : items) {
            if (item instanceof TextPostDisplayItem) {
                TextPostDisplayItem text = (TextPostDisplayItem) item;
                if (text.text instanceof Spannable) {
                    ExpandTextSpan[] spans = (ExpandTextSpan[]) ((Spannable) text.text).getSpans(0, text.text.length(), ExpandTextSpan.class);
                    if (spans.length > 0) {
                        spans[0].setOnClickListener(new ExpandTextClickListener(entry, text));
                    }
                }
            }
        }
        return items;
    }

    @Override // me.grishka.appkit.fragments.BaseRecyclerFragment, me.grishka.appkit.utils.Preloader.Callback
    public void onClearItems() {
        this.items.clear();
        updateList();
    }

    @Override // me.grishka.appkit.fragments.BaseRecyclerFragment
    public void onDataLoaded(final List<NewsEntry> d, final boolean more) {
        if (this.refreshing) {
            ArrayList<Animator> anims = new ArrayList<>();
            for (int i = 0; i < this.list.getChildCount(); i++) {
                View c = this.list.getChildAt(i);
                String id = (String) c.getTag(R.id.tag_real_post);
                if (id != null) {
                    ObjectAnimator oa = ObjectAnimator.ofFloat(c, "alpha", 1.0f, 0.0f);
                    oa.addListener(new HardwareLayerAnimatorListener());
                    anims.add(oa);
                }
            }
            AnimatorSet anim = new AnimatorSet();
            anim.playTogether(anims);
            anim.setDuration(200L);
            this.runningAnims.add(anim);
            anim.addListener(new AnimatorListenerAdapter() { // from class: com.vkontakte.android.fragments.PostListFragment.6
                {
                    PostListFragment.this = this;
                }

                @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
                public void onAnimationEnd(Animator anim2) {
                    PostListFragment.super.onDataLoaded(d, more);
                    PostListFragment.this.runningAnims.remove(anim2);
                    PostListFragment.this.animateItemsIn();
                }
            });
            anim.start();
        } else {
            boolean needAnim = this.data.size() == 0;
            super.onDataLoaded(d, more);
            if (needAnim) {
                animateItemsIn();
            }
        }
        if (this.list != null && this.viewHelper != null) {
            this.viewHelper.onUpdate(this.list);
        }
    }

    public void animateItemsIn() {
        if (this.list != null) {
            this.list.getViewTreeObserver().addOnPreDrawListener(new ViewTreeObserver.OnPreDrawListener() { // from class: com.vkontakte.android.fragments.PostListFragment.7
                {
                    PostListFragment.this = this;
                }

                @Override // android.view.ViewTreeObserver.OnPreDrawListener
                public boolean onPreDraw() {
                    if (PostListFragment.this.list != null) {
                        PostListFragment.this.list.getViewTreeObserver().removeOnPreDrawListener(this);
                        HashMap<String, Integer> heights = new HashMap<>();
                        for (int i = 0; i < PostListFragment.this.list.getChildCount(); i++) {
                            View c = PostListFragment.this.list.getChildAt(i);
                            String id = (String) c.getTag(R.id.tag_real_post);
                            if (id != null) {
                                if (!heights.containsKey(id)) {
                                    heights.put(id, 0);
                                }
                                heights.put(id, Integer.valueOf(heights.get(id).intValue() + c.getHeight()));
                            }
                        }
                        int offset = 0;
                        int delay = -60;
                        String prevId = "";
                        ArrayList<Animator> anims = new ArrayList<>();
                        for (int i2 = 0; i2 < PostListFragment.this.list.getChildCount(); i2++) {
                            View c2 = PostListFragment.this.list.getChildAt(i2);
                            String id2 = (String) c2.getTag(R.id.tag_real_post);
                            if (id2 != null) {
                                if (!prevId.equals(id2)) {
                                    offset = 0;
                                    delay += 60;
                                }
                                c2.setPivotY((heights.get(id2).intValue() / 2) - offset);
                                c2.setPivotX(c2.getWidth() / 2);
                                offset += c2.getHeight();
                                prevId = id2;
                                ObjectAnimator oa = ObjectAnimator.ofFloat(c2, "alpha", 0.0f, 1.0f);
                                oa.setStartDelay(delay);
                                anims.add(oa);
                                ObjectAnimator oa2 = ObjectAnimator.ofFloat(c2, "translationY", PostListFragment.this.list.getHeight() / 2, 0.0f);
                                oa2.setStartDelay(delay);
                                oa2.addListener(new HardwareLayerAnimatorListener());
                                anims.add(oa2);
                                c2.setAlpha(0.0f);
                            }
                        }
                        final AnimatorSet set = new AnimatorSet();
                        set.playTogether(anims);
                        set.setDuration(300L);
                        set.setInterpolator(PostListFragment.this.interpolator);
                        PostListFragment.this.runningAnims.add(set);
                        set.addListener(new AnimatorListenerAdapter() { // from class: com.vkontakte.android.fragments.PostListFragment.7.1
                            {
                                AnonymousClass7.this = this;
                            }

                            @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
                            public void onAnimationEnd(Animator anim) {
                                PostListFragment.this.runningAnims.remove(set);
                                if (PostListFragment.this.list != null) {
                                    for (int i3 = 0; i3 < PostListFragment.this.list.getChildCount(); i3++) {
                                        View c3 = PostListFragment.this.list.getChildAt(i3);
                                        String id3 = (String) c3.getTag(R.id.tag_real_post);
                                        if (id3 != null) {
                                            c3.setTranslationY(0.0f);
                                            c3.setAlpha(1.0f);
                                        }
                                    }
                                }
                            }
                        });
                        set.start();
                        return true;
                    }
                    return false;
                }
            });
        }
    }

    @Override // me.grishka.appkit.fragments.BaseRecyclerFragment, me.grishka.appkit.views.UsableRecyclerView.Listener
    public void onScrollStarted() {
        super.onScrollStarted();
        if (this.runningAnims.size() > 0) {
            Iterator<Animator> it = this.runningAnims.iterator();
            while (it.hasNext()) {
                Animator anim = it.next();
                anim.cancel();
            }
            this.runningAnims.clear();
        }
    }

    /* loaded from: classes2.dex */
    public class NewsAdapter extends UsableRecyclerView.Adapter<PostDisplayItemViewHolder> implements CardItemDecorator.Provider, AutoPlayProvider {
        public NewsAdapter() {
            PostListFragment.this = this$0;
            this$0.viewHelper.setProvider(this);
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        public int getItemCount() {
            return PostListFragment.this.items.size();
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        public long getItemId(int position) {
            return position;
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        /* renamed from: onCreateViewHolder */
        public PostDisplayItemViewHolder mo1206onCreateViewHolder(ViewGroup parent, int viewType) {
            switch (viewType) {
                case 0:
                    return new PostDisplayItemViewHolder(HeaderPostDisplayItem.createView(PostListFragment.this.getActivity()));
                case 1:
                    return new PostDisplayItemViewHolder(FooterPostDisplayItem.createView(PostListFragment.this.getActivity()));
                case 2:
                    return new PostDisplayItemViewHolder(TextPostDisplayItem.createView(PostListFragment.this.getActivity(), false));
                case 3:
                    return new PostDisplayItemViewHolder(RepostPostDisplayItem.createView(PostListFragment.this.getActivity()));
                case 4:
                    return new PostDisplayItemViewHolder(CommentPostDisplayItem.createView(PostListFragment.this.getActivity()));
                case 5:
                    return new PostDisplayItemViewHolder(ThumbsBlockPostDisplayItem.createView(PostListFragment.this.getActivity()));
                case 6:
                    return new PostDisplayItemViewHolder(AudioPostDisplayItem.createView(PostListFragment.this.getActivity()));
                case 7:
                    return new PostDisplayItemViewHolder(CommonAttachmentPostDisplayItem.createView(PostListFragment.this.getActivity()));
                case 8:
                    return new PostDisplayItemViewHolder(SignaturePostDisplayItem.createView(PostListFragment.this.getActivity()));
                case 9:
                    return new PostDisplayItemViewHolder(AttachContainerPostDisplayItem.createView(PostListFragment.this.getActivity()));
                case 10:
                    return new PostDisplayItemViewHolder(ButtonsPostDisplayItem.createView(PostListFragment.this.getActivity()));
                case 11:
                case 16:
                default:
                    if (NotificationPostDisplayItemGallery.isNotificationViewType(viewType)) {
                        return new PostDisplayItemViewHolder(NotificationPostDisplayItemGallery.createView(PostListFragment.this, viewType));
                    }
                    return null;
                case 12:
                    return new PostDisplayItemViewHolder(HeaderPostDisplayItem.createViewAd(PostListFragment.this.getActivity()));
                case 13:
                    return new PostDisplayItemViewHolder(FriendsRecommPostDisplayItem.createView(PostListFragment.this.getActivity()));
                case 14:
                    return new PostDisplayItemViewHolder(ShitBlockPostDisplayItem.createView(PostListFragment.this.getActivity()));
                case 15:
                    return new PostDisplayItemViewHolder(GoodsBlockPostDisplayItem.createView(PostListFragment.this.getActivity()));
                case 17:
                    return new PostDisplayItemViewHolder(PaddingPostDisplayItem.createView(PostListFragment.this.getActivity()));
                case 18:
                    return new PostDisplayItemViewHolder(ActivityLikesDisplayItem.createView(PostListFragment.this.getActivity()));
                case 19:
                    return new PostDisplayItemViewHolder(ActivityCommentDisplayItem.createView(PostListFragment.this.getActivity()));
                case 20:
                    return new PostDisplayItemViewHolder(HeaderPostDisplayItem.createViewRecommended(PostListFragment.this.getActivity()));
                case 21:
                    return new PostDisplayItemViewHolder(MarkedAsAdsPostDisplayItem.createView(PostListFragment.this.getActivity()));
                case 22:
                    return new PostDisplayItemViewHolder(WidgetPostDisplayItem.createView(PostListFragment.this.getActivity()));
            }
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        public void onBindViewHolder(PostDisplayItemViewHolder holder, int position) {
            PostListFragment.this.items.get(position).bindView(holder.itemView);
            holder.bind(PostListFragment.this.items.get(position));
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        public int getItemViewType(int pos) {
            return PostListFragment.this.items.get(pos).getType();
        }

        @Override // me.grishka.appkit.views.UsableRecyclerView.Adapter, me.grishka.appkit.preloading.PrefetchInfoProvider
        public int getImageCountForItem(int item) {
            return PostListFragment.this.items.get(item).getImageCount();
        }

        @Override // me.grishka.appkit.views.UsableRecyclerView.Adapter, me.grishka.appkit.preloading.PrefetchInfoProvider
        public String getImageURL(int item, int image) {
            return PostListFragment.this.items.get(item).getImageURL(image);
        }

        @Override // com.vkontakte.android.ui.CardItemDecorator.Provider
        public int getBlockType(int position) {
            if (position >= PostListFragment.this.items.size() || position < 0) {
                return 0;
            }
            switch (PostListFragment.this.items.get(position).bgType) {
                case 0:
                    return 1;
                case 1:
                    return 2;
                case 2:
                    return 4;
                case 3:
                    return 6;
                default:
                    return 0;
            }
        }

        @Override // com.vkontakte.android.media.AutoPlayProvider
        public AutoPlay getItem(int position) {
            int pos = position - PostListFragment.this.getPostsOffset();
            return (AutoPlay) PostListFragment.this.autoPlayItems.get(pos);
        }
    }

    /* loaded from: classes2.dex */
    public class PostDisplayItemViewHolder extends UsableRecyclerView.ViewHolder implements UsableRecyclerView.DisableableClickable {
        protected PostDisplayItem item;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public PostDisplayItemViewHolder(View itemView) {
            super(itemView);
            PostListFragment.this = this$0;
            itemView.setLayoutParams(new RecyclerView.LayoutParams(-1, -2));
        }

        public void bind(PostDisplayItem item) {
            this.item = item;
        }

        @Override // me.grishka.appkit.views.UsableRecyclerView.Clickable
        public void onClick() {
            NewsEntry e = null;
            try {
                Iterator it = PostListFragment.this.data.iterator();
                while (true) {
                    if (!it.hasNext()) {
                        break;
                    }
                    NewsEntry post = (NewsEntry) it.next();
                    if (post.ownerID == this.item.postOwnerID && post.postID == this.item.postID) {
                        e = post;
                        break;
                    }
                }
                if (e != null && e.type != 6 && e.type != 7) {
                    if (e.type == 4) {
                        new BoardTopicViewFragment.Builder(e.postID, -e.ownerID, e.text).setOffset(e.numComments - (e.numComments % 20)).setIsAdmin(Groups.isGroupAdmin(-e.ownerID)).go(PostListFragment.this.getActivity());
                    } else if (e.type == 5) {
                        PostListFragment.this.startActivity(new Intent("android.intent.action.VIEW", Uri.parse("vkontakte://vk.com/wall" + e.ownerID + EventsFilesManager.ROLL_OVER_FILE_NAME_SEPARATOR + e.extra.getInt("parent_post") + "?reply=" + e.postID)));
                    } else if (e.type == 18) {
                        Iterator<Attachment> it2 = e.attachments.iterator();
                        while (it2.hasNext()) {
                            Attachment att = it2.next();
                            if (att instanceof MarketAttachment) {
                                new GoodFragment.Builder(GoodFragment.Builder.Source.feed, ((MarketAttachment) att).good).go(PostListFragment.this.getActivity());
                                return;
                            }
                        }
                    } else if (e.type != 11) {
                        new PostViewFragment.Builder(e).setRefer(PostListFragment.this.getListReferrer()).go(PostListFragment.this.getActivity());
                        new PostInteract(PostListFragment.this.getListReferrer(), e).commit(PostInteract.Type.open);
                    }
                }
            } catch (Exception x) {
                Log.w("vk", x);
            }
        }

        @Override // me.grishka.appkit.views.UsableRecyclerView.DisableableClickable
        public boolean isEnabled() {
            return this.item.clickable;
        }
    }

    /* loaded from: classes2.dex */
    public class ExpandTextClickListener implements View.OnClickListener {
        public NewsEntry entry;
        public TextPostDisplayItem item;

        ExpandTextClickListener(NewsEntry entry, TextPostDisplayItem item) {
            PostListFragment.this = this$0;
            this.entry = entry;
            this.item = item;
        }

        @Override // android.view.View.OnClickListener
        public void onClick(View view) {
            int index = PostListFragment.this.items.indexOf(this.item);
            if (index > 0 && index < PostListFragment.this.items.size()) {
                new PostInteract(PostListFragment.this.getListReferrer(), this.entry).commit(PostInteract.Type.expand);
                PostListFragment.this.items.set(index, this.item.expandText());
                PostListFragment.this.adapter.notifyItemChanged(PostListFragment.this.convertItemsIndexToReal(index));
            }
        }
    }

    protected int convertItemsIndexToReal(int index) {
        return index;
    }
}
