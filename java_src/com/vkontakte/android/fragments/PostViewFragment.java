package com.vkontakte.android.fragments;

import android.app.Activity;
import android.app.ProgressDialog;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.pm.ResolveInfo;
import android.content.res.Configuration;
import android.graphics.PointF;
import android.graphics.drawable.ColorDrawable;
import android.net.Uri;
import android.os.Bundle;
import android.support.annotation.NonNull;
import android.support.v4.content.LocalBroadcastManager;
import android.support.v7.widget.GridLayoutManager;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.LinearSmoothScroller;
import android.support.v7.widget.RecyclerView;
import android.text.ClipboardManager;
import android.text.SpannableStringBuilder;
import android.text.TextUtils;
import android.text.style.ForegroundColorSpan;
import android.util.DisplayMetrics;
import android.util.SparseIntArray;
import android.view.KeyEvent;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.view.inputmethod.InputMethodManager;
import android.widget.AbsListView;
import android.widget.EditText;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.PopupMenu;
import android.widget.ProgressBar;
import android.widget.TextView;
import android.widget.Toast;
import com.facebook.share.internal.ShareConstants;
import com.fasterxml.jackson.core.util.MinimalPrettyPrinter;
import com.google.firebase.analytics.FirebaseAnalytics;
import com.vk.core.util.KeyboardUtils;
import com.vk.sharing.Picking;
import com.vk.sharing.Sharing;
import com.vk.sharing.SharingActivity;
import com.vk.sharing.SharingService;
import com.vk.sharing.action.Actions;
import com.vk.sharing.attachment.AttachmentInfo;
import com.vk.sharing.attachment.Attachments;
import com.vk.sharing.target.GroupsForCommentsImpersonation;
import com.vk.sharing.target.Target;
import com.vk.webapp.ReportAppInputData;
import com.vkontakte.android.ActivityUtils;
import com.vkontakte.android.ExTextView;
import com.vkontakte.android.FragmentWrapperActivity;
import com.vkontakte.android.Global;
import com.vkontakte.android.LinkParser;
import com.vkontakte.android.LoadMoreCommentsView;
import com.vkontakte.android.Log;
import com.vkontakte.android.NewsComment;
import com.vkontakte.android.NewsEntry;
import com.vkontakte.android.R;
import com.vkontakte.android.ReportContentActivity;
import com.vkontakte.android.TimeUtils;
import com.vkontakte.android.UserProfile;
import com.vkontakte.android.VKAlertDialog;
import com.vkontakte.android.VKApplication;
import com.vkontakte.android.ViewUtils;
import com.vkontakte.android.ZhukovLayout;
import com.vkontakte.android.api.APIUtils;
import com.vkontakte.android.api.Callback;
import com.vkontakte.android.api.Group;
import com.vkontakte.android.api.ResultlessCallback;
import com.vkontakte.android.api.SimpleCallback;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.api.VideoFile;
import com.vkontakte.android.api.groups.GroupsGetBanned;
import com.vkontakte.android.api.video.VideoAdd;
import com.vkontakte.android.api.video.VideoGetInfo;
import com.vkontakte.android.api.wall.WallAddComment;
import com.vkontakte.android.api.wall.WallDelete;
import com.vkontakte.android.api.wall.WallDeleteComment;
import com.vkontakte.android.api.wall.WallEdit;
import com.vkontakte.android.api.wall.WallGetComments;
import com.vkontakte.android.api.wall.WallLike;
import com.vkontakte.android.api.wall.WallRestoreComment;
import com.vkontakte.android.attachments.Attachment;
import com.vkontakte.android.attachments.GraffitiAttachment;
import com.vkontakte.android.attachments.ImageAttachment;
import com.vkontakte.android.attachments.PendingAttachment;
import com.vkontakte.android.attachments.PhotoAttachment;
import com.vkontakte.android.attachments.PollAttachment;
import com.vkontakte.android.attachments.SnippetAttachment;
import com.vkontakte.android.attachments.StickerAttachment;
import com.vkontakte.android.attachments.ThumbAttachment;
import com.vkontakte.android.attachments.VideoAttachment;
import com.vkontakte.android.audio.contentprovider.AudioContentProviderConstants;
import com.vkontakte.android.auth.VKAccount;
import com.vkontakte.android.auth.VKAccountManager;
import com.vkontakte.android.auth.VKAuth;
import com.vkontakte.android.cache.NewsfeedCache;
import com.vkontakte.android.data.Analytics;
import com.vkontakte.android.data.Groups;
import com.vkontakte.android.data.GroupsAdmin;
import com.vkontakte.android.data.LikeInfo;
import com.vkontakte.android.data.PostInteract;
import com.vkontakte.android.data.Posts;
import com.vkontakte.android.data.ServerKeys;
import com.vkontakte.android.data.VKList;
import com.vkontakte.android.fragments.ProfileFragment;
import com.vkontakte.android.fragments.groupadmin.BannedUserSettingsFragment;
import com.vkontakte.android.fragments.news.NewPostFragment;
import com.vkontakte.android.fragments.videos.VideoAddHelper;
import com.vkontakte.android.media.VideoPools;
import com.vkontakte.android.navigation.ArgKeys;
import com.vkontakte.android.navigation.Navigate;
import com.vkontakte.android.navigation.Navigator;
import com.vkontakte.android.stickers.KeyboardPopup;
import com.vkontakte.android.stickers.StickersView;
import com.vkontakte.android.ui.ErrorView;
import com.vkontakte.android.ui.WriteBar;
import com.vkontakte.android.ui.binder.LikeBarBinder;
import com.vkontakte.android.ui.controllers.ReplyBarController;
import com.vkontakte.android.ui.holder.comments.AbsCommentViewHolder;
import com.vkontakte.android.ui.holder.comments.CommentViewHolder;
import com.vkontakte.android.ui.holder.comments.DeletedCommentViewHolder;
import com.vkontakte.android.ui.posts.AttachContainerPostDisplayItem;
import com.vkontakte.android.ui.posts.AudioPostDisplayItem;
import com.vkontakte.android.ui.posts.ButtonsPostDisplayItem;
import com.vkontakte.android.ui.posts.CommentPostDisplayItem;
import com.vkontakte.android.ui.posts.CommonAttachmentPostDisplayItem;
import com.vkontakte.android.ui.posts.FooterPostDisplayItem;
import com.vkontakte.android.ui.posts.HeaderPostDisplayItem;
import com.vkontakte.android.ui.posts.MarkedAsAdsPostDisplayItem;
import com.vkontakte.android.ui.posts.PostDisplayItem;
import com.vkontakte.android.ui.posts.RepostPostDisplayItem;
import com.vkontakte.android.ui.posts.SignaturePostDisplayItem;
import com.vkontakte.android.ui.posts.TagConfirmationPostDisplayItem;
import com.vkontakte.android.ui.posts.TextPostDisplayItem;
import com.vkontakte.android.ui.posts.ThumbsBlockPostDisplayItem;
import com.vkontakte.android.upload.Upload;
import com.vkontakte.android.upload.UploadListener;
import com.vkontakte.android.upload.UploadTask;
import com.vkontakte.android.utils.L;
import io.fabric.sdk.android.services.events.EventsFilesManager;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import me.grishka.appkit.utils.MergeRecyclerAdapter;
import me.grishka.appkit.utils.V;
import me.grishka.appkit.views.DividerItemDecoration;
import me.grishka.appkit.views.SwipeRefreshLayoutI;
import me.grishka.appkit.views.UsableRecyclerView;
/* loaded from: classes2.dex */
public class PostViewFragment extends VKRecyclerFragment implements StickerAttachment.Callback, BackListener, CommentViewHolder.CommentViewHolderListener<NewsComment>, DeletedCommentViewHolder.DeletedCommentViewHolderListener<NewsComment>, UsableRecyclerView.ExtendedListener, View.OnClickListener, StickersView.Listener {
    private static final int EDIT_COMMENT_REQUEST = 4329;
    private static final int EDIT_REQUEST = 4328;
    private static final int PICK_GROUP_REQUEST = 4331;
    private static final int REPORT_RESULT = 4330;
    public static final int RESULT_DELETED = 2;
    public static final int TYPE_PHOTO = 1;
    public static final int TYPE_POST = 0;
    private String accessKey;
    private MergeRecyclerAdapter adapter;
    private boolean canAdmin;
    private boolean canBanUsers;
    private WriteBar commentBar;
    private ArrayList<NewsComment> comments;
    private ArrayList<NewsComment> commentsBuffer;
    private FrameLayout commentsProgress;
    private VKAPIRequest currentReq;
    private NewsEntry e;
    private ErrorView error;
    private boolean hideJumpToEndButtonDueToScrollPosition;
    private ViewGroup jumpToEndBtn;
    private boolean jumpingToEnd;
    private boolean keyboardVisible;
    private LikeBarBinder likeBarBinder;
    private List<LikeInfo> likes;
    private View likesView;
    private boolean liking;
    private boolean loadCommentsFromBeginning;
    private LoadMoreCommentsView loadMoreView;
    private boolean loadingComments;
    private KeyboardPopup mKeyboardPopup;
    boolean mScrollReset;
    private StickersView mStickersView;
    private ArrayList<PostDisplayItem> postItems;
    private BroadcastReceiver receiver;
    private ReplyBarController replyBarController;
    private boolean replyFromGroup;
    private int replyFromGroupId;
    private int replyTo;
    private String replyToName;
    private String replyToRName;
    private int replyToUid;
    private boolean resetScroll;
    private int scrollToComment;
    private boolean scrollToEnd;
    private boolean scrollToFirstComment;
    private int type;
    private ArrayList<View> views;

    /* loaded from: classes2.dex */
    public static class Builder extends Navigator {
        private static final String KEY_COMMENT = "comment";
        private static final String KEY_ENTRY = "entry";
        private static final String KEY_LOAD_COMMENTS_FROM_BEGINNING = "load_comments_from_beginning";
        private static final String KEY_PHOTO_VIEWER = "photo_viewer";
        private static final String KEY_PLACER_PROFILE = "placer_profile";
        private static final String KEY_REFER = "referer";
        private static final String KEY_RESET_SCROLL = "reset_scroll";
        private static final String KEY_SCROLL_TO_COMMENTS = "scroll_to_comments";
        private static final String KEY_SCROLL_TO_FIRST_COMMENT = "scroll_to_first_comment";
        private static final String KEY_TAG_ID = "tag_id";

        public Builder(NewsEntry entry) {
            super(PostViewFragment.class);
            this.args.putParcelable(KEY_ENTRY, entry);
        }

        @Override // com.vkontakte.android.navigation.Navigator
        protected boolean isValidNavigator() {
            return this.args.getParcelable(KEY_ENTRY) != null;
        }

        public Builder setComment(int comment) {
            this.args.putInt(KEY_COMMENT, comment);
            return this;
        }

        public Builder setIsPhotoViewer() {
            this.args.putBoolean(KEY_PHOTO_VIEWER, true);
            return this;
        }

        public Builder setRefer(String refer) {
            this.args.putString("referer", refer);
            return this;
        }

        public Builder resetScroll(boolean value) {
            this.args.putBoolean(KEY_RESET_SCROLL, value);
            return this;
        }

        public Builder setPlacerProfile(UserProfile placerProfile) {
            this.args.putParcelable(KEY_PLACER_PROFILE, placerProfile);
            return this;
        }

        public Builder setTagId(int tagId) {
            this.args.putInt(KEY_TAG_ID, tagId);
            return this;
        }

        public Builder scrollToComments() {
            this.args.putBoolean(KEY_SCROLL_TO_COMMENTS, true);
            return this;
        }

        public Builder loadFromBeginning() {
            this.args.putBoolean(KEY_LOAD_COMMENTS_FROM_BEGINNING, true);
            return this;
        }

        public Builder scrollToFirstComment() {
            this.args.putBoolean(KEY_SCROLL_TO_FIRST_COMMENT, true);
            return this;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public PostInteract getPostInteract() {
        Bundle arg = getArguments();
        if (arg != null) {
            return new PostInteract(arg.getString(SharingService.EXTRA_REFERER), (NewsEntry) arg.getParcelable("entry"));
        }
        return null;
    }

    @Override // com.vkontakte.android.stickers.StickersView.Listener
    public void onStickerSelected(int packId, int stickerId, String url, String stickerReferrer) {
        StickerAttachment att = new StickerAttachment();
        att.id = stickerId;
        att.images = new String[]{url, null, null};
        String[] strArr = att.images;
        String[] strArr2 = att.images;
        String str = att.images[0];
        strArr2[2] = str;
        strArr[1] = str;
        att.packID = packId;
        att.stickerReferrer = stickerReferrer;
        sendAttachmentComment(att);
    }

    @Override // com.vk.emoji.EmojiKeyboardListener
    public void onEmojiSelected(String s) {
        EditText edit = (EditText) this.commentBar.findViewById(R.id.writebar_edit);
        int pos = edit.getSelectionEnd();
        edit.getText().insert(pos, s);
        int pos2 = pos + s.length();
        edit.setSelection(pos2, pos2);
    }

    @Override // com.vk.emoji.EmojiKeyboardListener
    public void onBackspace() {
        this.commentBar.findViewById(R.id.writebar_edit).dispatchKeyEvent(new KeyEvent(0, 67));
    }

    public PostViewFragment() {
        super(1);
        this.comments = new ArrayList<>();
        this.commentsBuffer = new ArrayList<>();
        this.loadingComments = false;
        this.canAdmin = false;
        this.replyTo = -1;
        this.replyToUid = -1;
        this.replyToRName = null;
        this.replyToName = null;
        this.type = 0;
        this.keyboardVisible = false;
        this.liking = false;
        this.receiver = new BroadcastReceiver() { // from class: com.vkontakte.android.fragments.PostViewFragment.1
            @Override // android.content.BroadcastReceiver
            public void onReceive(Context context, Intent intent) {
                if (Posts.ACTION_POST_UPDATED_BROADCAST.equals(intent.getAction())) {
                    int oid = intent.getIntExtra("owner_id", 0);
                    int pid = intent.getIntExtra(ShareConstants.WEB_DIALOG_RESULT_PARAM_POST_ID, 0);
                    if (oid == PostViewFragment.this.e.ownerID && pid == PostViewFragment.this.e.postID) {
                        PostViewFragment.this.e.numLikes = intent.getIntExtra(ServerKeys.LIKES, 0);
                        if (intent.hasExtra("comments")) {
                            PostViewFragment.this.e.numComments = intent.getIntExtra("comments", 0);
                        }
                        if (intent.hasExtra("retweets")) {
                            PostViewFragment.this.e.numRetweets = intent.getIntExtra("retweets", 0);
                        }
                        if (intent.hasExtra("retweeted")) {
                            PostViewFragment.this.e.flag(4, intent.getBooleanExtra("retweeted", false));
                        }
                        PostViewFragment.this.e.flag(8);
                        PostViewFragment.this.e.flag(8, intent.getBooleanExtra("liked", false));
                        PostViewFragment.this.updateButtons();
                    }
                }
                if (GroupsAdmin.ACTION_BAN_ADDED.equals(intent.getAction())) {
                    UserProfile p = (UserProfile) intent.getParcelableExtra("profile");
                    Iterator it = PostViewFragment.this.comments.iterator();
                    while (it.hasNext()) {
                        NewsComment c = (NewsComment) it.next();
                        if (c.uid == p.uid) {
                            c.isBanned = true;
                        }
                    }
                    PostViewFragment.this.updateList();
                }
            }
        };
        this.accessKey = null;
        this.scrollToComment = 0;
        this.scrollToEnd = false;
        this.scrollToFirstComment = false;
        this.postItems = new ArrayList<>();
        this.views = new ArrayList<>();
        this.canBanUsers = false;
        this.loadCommentsFromBeginning = false;
        this.jumpingToEnd = false;
        this.likes = Collections.emptyList();
    }

    @Override // me.grishka.appkit.fragments.BaseRecyclerFragment
    /* renamed from: onCreateLayoutManager */
    protected RecyclerView.LayoutManager mo1032onCreateLayoutManager() {
        return new GridLayoutManagerWithSmoothScroller(getActivity());
    }

    @Override // me.grishka.appkit.views.UsableRecyclerView.ExtendedListener
    public void onScroll(int firstItem, int visibleCount, int total) {
        boolean z = false;
        SwipeRefreshLayoutI layoutI = this.refreshLayout;
        if (layoutI != null) {
            boolean isUp = firstItem < total - (firstItem + visibleCount);
            if (layoutI.isReversed() && isUp) {
                layoutI.setReversed(false);
            } else if (!layoutI.isReversed() && !isUp) {
                layoutI.setReversed(true);
            }
        }
        boolean old = this.hideJumpToEndButtonDueToScrollPosition;
        if (firstItem < this.views.size() + this.postItems.size() || firstItem + visibleCount >= total - 1) {
            z = true;
        }
        this.hideJumpToEndButtonDueToScrollPosition = z;
        if (old != this.hideJumpToEndButtonDueToScrollPosition) {
            updateJumpToEndButtonVisibility();
        }
    }

    @Override // com.vkontakte.android.fragments.VKRecyclerFragment, me.grishka.appkit.fragments.BaseRecyclerFragment, me.grishka.appkit.fragments.LoaderFragment
    public View onCreateContentView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        View contentView = super.onCreateContentView(inflater, container, savedInstanceState);
        ViewGroup wrap = (ViewGroup) contentView.findViewById(R.id.content_wrap);
        this.jumpToEndBtn = (ViewGroup) View.inflate(getActivity(), R.layout.messages_jump_btn, null);
        FrameLayout.LayoutParams layoutParams = new FrameLayout.LayoutParams(-2, -2, 8388693);
        layoutParams.setMargins(V.dp(6.0f), V.dp(2.0f), V.dp(6.0f), V.dp(2.0f));
        wrap.addView(this.jumpToEndBtn, layoutParams);
        this.jumpToEndBtn.setVisibility(8);
        this.jumpToEndBtn.setOnClickListener(new View.OnClickListener() { // from class: com.vkontakte.android.fragments.PostViewFragment.2
            @Override // android.view.View.OnClickListener
            public void onClick(View v) {
                PostViewFragment.this.jumpToEnd();
            }
        });
        return contentView;
    }

    @Override // me.grishka.appkit.fragments.BaseRecyclerFragment, me.grishka.appkit.fragments.LoaderFragment, me.grishka.appkit.fragments.AppKitFragment, android.app.DialogFragment, android.app.Fragment
    public void onDestroyView() {
        super.onDestroyView();
        this.jumpToEndBtn = null;
    }

    @Override // me.grishka.appkit.fragments.BaseRecyclerFragment, me.grishka.appkit.fragments.AppKitFragment, android.app.Fragment
    public void onAttach(Activity act) {
        super.onAttach(act);
        setListLayoutId(R.layout.recycler_fragment_with_down_refreshable);
        this.e = (NewsEntry) getArguments().getParcelable("entry");
        if (this.e == null) {
            act.finish();
            return;
        }
        if (this.e.userID == 0) {
            this.e.userID = this.e.ownerID;
        }
        String ln = "";
        if (this.e.type == 0) {
            ln = ln + ReportAppInputData.REPORT_TYPE_WALL;
        } else if (this.e.type == 2) {
            ln = ln + "video";
        } else if (this.e.type == 1) {
            ln = ln + "photo";
        } else if (this.e.type == 4) {
            ln = ln + "topic";
        }
        ActivityUtils.setBeamLink(act, ln + this.e.ownerID + EventsFilesManager.ROLL_OVER_FILE_NAME_SEPARATOR + this.e.postID);
        this.type = getArguments().getInt(ServerKeys.TYPE, 0);
        if (this.e.type == 1) {
            setTitle(R.string.photo);
            this.accessKey = ((PhotoAttachment) this.e.attachments.get(0)).accessKey;
        } else if (this.e.type == 2) {
            setTitle(R.string.video);
            this.accessKey = ((VideoAttachment) this.e.attachments.get(0)).video.accessKey;
        } else {
            setTitle(R.string.wall_view);
        }
        if (this.e.type == 0 || this.e.type == 12) {
            String postIds = this.e.ownerID + EventsFilesManager.ROLL_OVER_FILE_NAME_SEPARATOR + this.e.postID + "|" + this.e.getTypeString() + "|single|0";
            Analytics.EventBuilder builder = Analytics.track("view_post").collapse().unique();
            if (this.e.hasTrackCode()) {
                builder.addParam("track_code", this.e.getTrackCode());
            }
            builder.addParam("post_ids", postIds);
            builder.addParam("repost_ids", this.e.flag(32) ? this.e.retweetUID + EventsFilesManager.ROLL_OVER_FILE_NAME_SEPARATOR + this.e.retweetOrigId : null);
            builder.commit();
        }
        if (this.e.type != 12 && this.e.type != 0 && this.e.type != 1 && this.e.type != 2) {
            act.finish();
            return;
        }
        this.scrollToComment = getArguments().getInt("comment");
        this.scrollToEnd = getArguments().getBoolean("scroll_to_comments");
        this.resetScroll = getArguments().getBoolean("reset_scroll");
        this.loadCommentsFromBeginning = getArguments().getBoolean("load_comments_from_beginning");
        this.scrollToFirstComment = getArguments().getBoolean("scroll_to_first_comment");
        this.canAdmin = getArguments().getBoolean(ArgKeys.IS_ADMIN, false) || this.e.flag(64) || this.e.userID == VKAccountManager.getCurrent().getUid() || this.e.ownerID == VKAccountManager.getCurrent().getUid() || this.e.ownerID == 0 || Groups.getAdminLevel(-this.e.ownerID) >= 1;
        setHasOptionsMenu(true);
        this.preloader.setMoreAvailable(false);
        this.loaded = true;
        if (this.e.type == 2) {
            loadVideoInfo();
        }
        if (this.e.ownerID < 0 && Groups.getAdminLevel(-this.e.ownerID) >= 1) {
            this.canBanUsers = true;
        }
    }

    @Override // android.app.DialogFragment, android.app.Fragment
    public void onCreate(Bundle s) {
        super.onCreate(s);
        IntentFilter filter = new IntentFilter();
        filter.addAction(Posts.ACTION_POST_UPDATED_BROADCAST);
        VKApplication.context.registerReceiver(this.receiver, filter, "com.vkontakte.android.permission.ACCESS_DATA", null);
        IntentFilter filter2 = new IntentFilter();
        filter2.addAction(GroupsAdmin.ACTION_BAN_ADDED);
        LocalBroadcastManager.getInstance(VKApplication.context).registerReceiver(this.receiver, filter2);
        if (this.e.type == 1 && getArguments().containsKey("tag_id")) {
            this.postItems.add(new TagConfirmationPostDisplayItem(this.e, (UserProfile) getArguments().getParcelable("placer_profile"), getArguments().getInt("tag_id"), new Runnable() { // from class: com.vkontakte.android.fragments.PostViewFragment.3
                @Override // java.lang.Runnable
                public void run() {
                    PostViewFragment.this.postItems.remove(0);
                    PostViewFragment.this.adapter.notifyItemRemoved(0);
                }
            }));
        }
        int thumbCount = 0;
        Iterator<Attachment> it = this.e.attachments.iterator();
        while (it.hasNext()) {
            Attachment a = it.next();
            if (a instanceof PollAttachment) {
                ((PollAttachment) a).parentPost = this.e;
            }
            if (a instanceof ThumbAttachment) {
                thumbCount++;
            }
        }
        Iterator<Attachment> it2 = this.e.repostAttachments.iterator();
        while (it2.hasNext()) {
            Attachment a2 = it2.next();
            if (a2 instanceof PollAttachment) {
                ((PollAttachment) a2).parentPost = this.e;
            }
        }
        if (thumbCount > 3) {
            this.e.layoutThumbs();
        } else {
            Iterator<Attachment> it3 = this.e.attachments.iterator();
            while (it3.hasNext()) {
                Attachment a3 = it3.next();
                if (a3 instanceof ThumbAttachment) {
                    NewsEntry.layoutThumbs(Collections.singletonList(a3));
                }
            }
            Iterator<Attachment> it4 = this.e.repostAttachments.iterator();
            while (it4.hasNext()) {
                Attachment a4 = it4.next();
                if (a4 instanceof ThumbAttachment) {
                    NewsEntry.layoutThumbs(Collections.singletonList(a4));
                }
            }
        }
        String referer = getArguments().getString(SharingService.EXTRA_REFERER, "news");
        this.postItems.addAll(Posts.buildItems(this.e, false, referer, true, false, null, false, "single", 0));
    }

    @Override // me.grishka.appkit.fragments.LoaderFragment, android.app.Fragment
    public void onDestroy() {
        super.onDestroy();
        try {
            VKApplication.context.unregisterReceiver(this.receiver);
        } catch (Exception x) {
            L.e(x, new Object[0]);
        }
        LocalBroadcastManager.getInstance(VKApplication.context).unregisterReceiver(this.receiver);
        if (this.currentReq != null) {
            this.currentReq.cancel();
        }
    }

    @Override // android.app.Fragment
    public void onPause() {
        super.onPause();
        hideEmojiPopup();
        VideoPools.onPause(getActivity());
    }

    @Override // me.grishka.appkit.fragments.BaseRecyclerFragment
    protected void doLoadData(int offset, int count) {
    }

    @Override // me.grishka.appkit.fragments.BaseRecyclerFragment, me.grishka.appkit.views.UsableRecyclerView.Listener
    public void onScrolledToLastItem() {
        super.onScrolledToLastItem();
        loadMoreCommentsFromBuffer();
    }

    private void loadMoreCommentsFromBuffer() {
        if (this.loadCommentsFromBeginning) {
            if (this.commentsBuffer.size() > 0) {
                this.comments.addAll(this.commentsBuffer);
                this.commentsBuffer.clear();
                updateList();
            }
            if (this.e != null && this.comments.size() < this.e.numComments) {
                loadComments(false);
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void resetReplyTo() {
        if (this.replyToName != null && this.commentBar.getText().equals(this.replyToName + ", ")) {
            this.commentBar.setText("");
        }
        if (this.replyBarController != null) {
            this.replyBarController.resetReplyToName();
        }
        this.replyTo = -1;
        this.replyToUid = -1;
        this.replyToRName = null;
        this.replyToName = null;
    }

    @Override // me.grishka.appkit.fragments.BaseRecyclerFragment
    /* renamed from: getAdapter */
    protected RecyclerView.Adapter mo1066getAdapter() {
        if (this.adapter == null) {
            this.adapter = new MergeRecyclerAdapter();
            this.adapter.addAdapter(new NewsAdapter());
            this.adapter.addAdapter(new ViewListAdapter());
            this.adapter.addAdapter(new CommentsAdapter());
        }
        return this.adapter;
    }

    @Override // me.grishka.appkit.fragments.BaseRecyclerFragment
    protected View onCreateFooterView(LayoutInflater inflater) {
        return null;
    }

    @Override // me.grishka.appkit.fragments.AppKitFragment, android.app.Fragment, android.content.ComponentCallbacks
    public void onConfigurationChanged(Configuration cfg) {
        super.onConfigurationChanged(cfg);
        updateList();
        if (this.mKeyboardPopup != null) {
            this.mKeyboardPopup.show(false);
            this.mKeyboardPopup.notifyLayoutHasChanged();
            this.mStickersView.dispatchConfigurationChanged(cfg);
        }
    }

    @Override // android.view.View.OnClickListener
    public void onClick(View v) {
        int i = 1;
        boolean z = true;
        switch (v.getId()) {
            case R.id.wall_view_like_container /* 2131756232 */:
                if (this.e.numLikes - (this.e.flag(8) ? 1 : 0) == 0) {
                    int i2 = this.e.numRetweets;
                    if (!this.e.flag(4)) {
                        i = 0;
                    }
                    if (i2 - i == 0) {
                        return;
                    }
                }
                Bundle args = new Bundle();
                args.putCharSequence("title", getString(R.string.liked));
                args.putInt("ltype", this.e.type);
                args.putInt(AudioContentProviderConstants.MUSIC_TRACK_COLUMN_OID, this.e.ownerID);
                args.putInt(FirebaseAnalytics.Param.ITEM_ID, this.e.postID);
                Navigate.to(LikesListFragment.class, args, getActivity());
                return;
            case R.id.wall_view_like_photos /* 2131756233 */:
            case R.id.wall_view_like_label /* 2131756234 */:
            default:
                return;
            case R.id.wall_view_like /* 2131756235 */:
                if (this.e.flag(8)) {
                    z = false;
                }
                like(z);
                return;
            case R.id.wall_view_repost /* 2131756236 */:
                repost();
                return;
        }
    }

    @Override // me.grishka.appkit.fragments.LoaderFragment, android.app.Fragment
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        ArrayList<View> arrayList = this.views;
        View inflate = View.inflate(getActivity(), R.layout.post_view_likes, null);
        this.likesView = inflate;
        arrayList.add(inflate);
        ArrayList<View> arrayList2 = this.views;
        LoadMoreCommentsView loadMoreCommentsView = (LoadMoreCommentsView) View.inflate(getActivity(), R.layout.load_more_comments, null);
        this.loadMoreView = loadMoreCommentsView;
        arrayList2.add(loadMoreCommentsView);
        this.views.remove(this.loadMoreView);
        this.likesView.setTag(1);
        this.loadMoreView.setTag(2);
        this.error = (ErrorView) inflater.inflate(R.layout.error, (ViewGroup) null);
        this.error.setIsInline(true);
        this.error.setOnRetryListener(new View.OnClickListener() { // from class: com.vkontakte.android.fragments.PostViewFragment.4
            @Override // android.view.View.OnClickListener
            public void onClick(View v) {
                PostViewFragment.this.loadComments(true);
            }
        });
        this.likeBarBinder = new LikeBarBinder(this.likesView);
        this.likeBarBinder.likesContainer.setOnClickListener(this);
        this.likeBarBinder.likesCounterView.setOnClickListener(this);
        this.likeBarBinder.repostsCounterView.setOnClickListener(this);
        if (!this.e.flag(2048) && !this.e.flag(4096)) {
            this.commentsProgress = new FrameLayout(getActivity());
            ProgressBar progress = new ProgressBar(getActivity());
            FrameLayout.LayoutParams params = new FrameLayout.LayoutParams(Global.scale(30.0f), Global.scale(30.0f));
            params.gravity = 1;
            progress.setLayoutParams(params);
            this.commentsProgress.addView(progress);
            this.commentsProgress.setPadding(0, V.dp(16.0f), 0, V.dp(16.0f));
            this.commentsProgress.setTag(3);
            this.commentsProgress.setId(R.id.load_more_progress);
        }
        this.loadMoreView.setLayoutParams(new AbsListView.LayoutParams(-1, Global.scale(48.5f)));
        this.loadMoreView.setOnClickListener(new View.OnClickListener() { // from class: com.vkontakte.android.fragments.PostViewFragment.5
            @Override // android.view.View.OnClickListener
            public void onClick(View v) {
                PostViewFragment.this.loadMoreView.showProgress(true);
                PostViewFragment.this.updateList();
                PostViewFragment.this.loadComments(false);
            }
        });
        View view = super.onCreateView(inflater, container, savedInstanceState);
        LinearLayout wrap = new LinearLayout(getActivity()) { // from class: com.vkontakte.android.fragments.PostViewFragment.6
            @Override // android.view.View
            public void onSizeChanged(int w, int h, int oldw, int oldh) {
                super.onSizeChanged(w, h, oldw, oldh);
                PostViewFragment.this.mKeyboardPopup.notifyLayoutHasChanged();
            }
        };
        wrap.setOrientation(1);
        wrap.addView(view, new LinearLayout.LayoutParams(-1, -1, 1.0f));
        this.commentBar = new WriteBar(getActivity());
        this.mStickersView = new StickersView(getActivity(), this);
        this.mKeyboardPopup = new KeyboardPopup(getActivity(), wrap, this.mStickersView);
        this.mKeyboardPopup.attachToAnchor(this.commentBar.getAnchor(), -1315086);
        this.mKeyboardPopup.setOnVisibilityChangedListener(this.commentBar);
        this.commentBar.setAutoSuggestPopupListener(this);
        this.commentBar.setOnSendClickListener(new View.OnClickListener() { // from class: com.vkontakte.android.fragments.PostViewFragment.7
            @Override // android.view.View.OnClickListener
            public void onClick(View v) {
                if (PostViewFragment.this.commentBar.isUploading()) {
                    PostViewFragment.this.waitAndSendComment();
                } else {
                    PostViewFragment.this.sendComment();
                }
            }
        });
        this.commentBar.findViewById(R.id.writebar_send).setOnLongClickListener(new View.OnLongClickListener() { // from class: com.vkontakte.android.fragments.PostViewFragment.8
            @Override // android.view.View.OnLongClickListener
            public boolean onLongClick(View view1) {
                if (Groups.getAdminLevel(-PostViewFragment.this.e.ownerID) < 2) {
                    return false;
                }
                PopupMenu menu = new PopupMenu(PostViewFragment.this.getActivity(), PostViewFragment.this.commentBar.findViewById(R.id.writebar_send));
                menu.getMenu().add(R.string.reply_from_group);
                menu.setOnMenuItemClickListener(new PopupMenu.OnMenuItemClickListener() { // from class: com.vkontakte.android.fragments.PostViewFragment.8.1
                    @Override // android.widget.PopupMenu.OnMenuItemClickListener
                    public boolean onMenuItemClick(MenuItem menuItem) {
                        PostViewFragment.this.setReplyFromCurrentlyAdminedGroup();
                        if (PostViewFragment.this.commentBar.isUploading()) {
                            PostViewFragment.this.waitAndSendComment();
                            return true;
                        }
                        PostViewFragment.this.sendComment();
                        return true;
                    }
                });
                menu.show();
                return true;
            }
        });
        this.commentBar.setFragment(this);
        this.commentBar.setUploadType(true, this.e.ownerID);
        this.commentBar.setAttachLimits(2, false);
        this.commentBar.setGraffitiAllowed(true);
        this.commentBar.setGraffitiSender(new WriteBar.GraffitiSender() { // from class: com.vkontakte.android.fragments.PostViewFragment.9
            @Override // com.vkontakte.android.ui.WriteBar.GraffitiSender
            public void sendGraffiti(GraffitiAttachment graffiti) {
                if (graffiti instanceof PendingAttachment) {
                    PostViewFragment.this.sendPendingAttachmentComment((PendingAttachment) graffiti);
                } else {
                    PostViewFragment.this.sendAttachmentComment(graffiti);
                }
            }
        });
        this.commentBar.setKeyboardPopup(this.mKeyboardPopup);
        this.commentBar.findViewById(R.id.writebar_edit).setOnKeyListener(new View.OnKeyListener() { // from class: com.vkontakte.android.fragments.PostViewFragment.10
            @Override // android.view.View.OnKeyListener
            public boolean onKey(View v, int keyCode, KeyEvent event) {
                if (keyCode != 4 || PostViewFragment.this.keyboardVisible || PostViewFragment.this.mKeyboardPopup == null || !PostViewFragment.this.mKeyboardPopup.isShowing()) {
                    return false;
                }
                if (event.getAction() != 1) {
                    return true;
                }
                PostViewFragment.this.mKeyboardPopup.show(false);
                return true;
            }
        });
        if (this.e.flag(2)) {
            final View replyBarView = View.inflate(getActivity(), R.layout.reply_bar, null);
            final boolean restrictToAdminedGroup = this.e.type != 0 || !VKAccountManager.getCurrent().communityComments || !this.e.flag(131072);
            this.replyBarController = new ReplyBarController(replyBarView, this.e.ownerID, restrictToAdminedGroup, new ReplyBarController.Delegate() { // from class: com.vkontakte.android.fragments.PostViewFragment.11
                @Override // com.vkontakte.android.ui.controllers.ReplyBarController.Delegate
                public void onTextToReset() {
                    PostViewFragment.this.resetReplyTo();
                }

                @Override // com.vkontakte.android.ui.controllers.ReplyBarController.Delegate
                public void onTextFromClick() {
                    final Picking.Builder builder = new Picking.Builder(PostViewFragment.this.getActivity()).adminedGroupId(-PostViewFragment.this.e.ownerID).preselectGroup(PostViewFragment.this.replyFromGroupId);
                    if (restrictToAdminedGroup) {
                        builder.restrictToAdminedGroup();
                    }
                    if (PostViewFragment.this.mKeyboardPopup.getKeyboardVisible()) {
                        KeyboardUtils.hideKeyboard(PostViewFragment.this.getContext());
                        replyBarView.postDelayed(new Runnable() { // from class: com.vkontakte.android.fragments.PostViewFragment.11.1
                            @Override // java.lang.Runnable
                            public void run() {
                                builder.pick(PostViewFragment.this, PostViewFragment.PICK_GROUP_REQUEST);
                            }
                        }, 300L);
                        return;
                    }
                    builder.pick(PostViewFragment.this, PostViewFragment.PICK_GROUP_REQUEST);
                }

                @Override // com.vkontakte.android.ui.controllers.ReplyBarController.Delegate
                public void onViewVisibilityChanged(int newVisibility) {
                    PostViewFragment.this.commentBar.handleReplyBarVisibilityChange(newVisibility);
                }
            });
            this.commentBar.addReplyBarView(replyBarView);
            View shadow = new View(getActivity());
            shadow.setBackgroundResource(R.drawable.picker_bg_attach_bottom_toolbar_shadow);
            LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(-1, Global.scale(8.0f));
            lp.topMargin = Global.scale(-8.0f);
            wrap.addView(shadow, lp);
            wrap.addView(this.commentBar);
            ((TextView) this.commentBar.findViewById(R.id.writebar_edit)).setImeOptions(268435456);
        }
        return wrap;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void setReplyFromCurrentlyAdminedGroup() {
        Group g = Groups.getById(-this.e.ownerID);
        if (g != null) {
            this.replyFromGroupId = g.id;
            if (this.replyBarController != null) {
                this.replyBarController.setFromName(Groups.getById(this.replyFromGroupId).name);
            }
        }
    }

    @Override // com.vkontakte.android.fragments.VKRecyclerFragment, me.grishka.appkit.fragments.AppKitFragment, android.app.Fragment
    public void onViewCreated(View view, Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);
        updateButtons();
        DividerItemDecoration dividers = new DividerItemDecoration(new ColorDrawable(637534208), V.dp(0.5f));
        dividers.setProvider(new DividerItemDecoration.Provider() { // from class: com.vkontakte.android.fragments.PostViewFragment.12
            @Override // me.grishka.appkit.views.DividerItemDecoration.Provider
            public boolean needDrawDividerAfter(int position) {
                return position >= PostViewFragment.this.views.size() + PostViewFragment.this.postItems.size();
            }
        });
        this.list.addItemDecoration(dividers);
        this.list.setPadding(0, 0, 0, 0);
        if (this.e.flag(2048) || this.e.flag(4096)) {
            this.views.remove(this.likesView);
            setRefreshEnabled(false);
            return;
        }
        loadComments(true);
    }

    @Override // android.app.Fragment
    public void onActivityResult(int reqCode, int resCode, Intent data) {
        super.onActivityResult(reqCode, resCode, data);
        if (reqCode > 10000) {
            this.commentBar.onActivityResult(reqCode, resCode, data);
        }
        if (reqCode == PICK_GROUP_REQUEST && resCode == -1 && this.replyBarController != null) {
            Target pickedTarget = (Target) data.getParcelableExtra(SharingActivity.RESULT_EXTRA_TARGET);
            if (pickedTarget.getIsUser()) {
                this.replyFromGroupId = 0;
                this.replyBarController.setFromYouAsName();
            } else {
                this.replyFromGroupId = pickedTarget.id;
                this.replyBarController.setFromName(pickedTarget.name);
            }
        }
        if (reqCode == EDIT_REQUEST && ((resCode == -1 || resCode == 1) && (getActivity() instanceof FragmentWrapperActivity))) {
            getActivity().finish();
        }
        if (reqCode == EDIT_COMMENT_REQUEST && resCode == -1) {
            NewsEntry ce = (NewsEntry) data.getParcelableExtra("comment");
            Iterator<NewsComment> it = this.comments.iterator();
            while (true) {
                if (!it.hasNext()) {
                    break;
                }
                NewsComment comm = it.next();
                if (comm.cid == ce.postID) {
                    comm.setText(ce.text);
                    comm.attachments = ce.attachments;
                    DisplayMetrics metrics = VKApplication.context.getResources().getDisplayMetrics();
                    int tSize = Math.min(Math.min(metrics.widthPixels, metrics.heightPixels) - Global.scale(95.0f), 604);
                    Iterator<Attachment> it2 = comm.attachments.iterator();
                    while (it2.hasNext()) {
                        Attachment att = it2.next();
                        if (att instanceof SnippetAttachment) {
                            ((SnippetAttachment) att).forceSmall = true;
                        }
                    }
                    ZhukovLayout.processThumbs(tSize, (int) (tSize * 0.666f), comm.attachments);
                    updateList();
                }
            }
        }
        if (reqCode == REPORT_RESULT && resCode == -1) {
            int id = data.getIntExtra("itemID", 0);
            Iterator<NewsComment> it3 = this.comments.iterator();
            while (it3.hasNext()) {
                NewsComment comm2 = it3.next();
                if (comm2.cid == id) {
                    comm2.isReported = true;
                    updateList();
                    return;
                }
            }
        }
    }

    @Override // android.app.Fragment
    public void onCreateOptionsMenu(Menu menu, MenuInflater inflater) {
        inflater.inflate(R.menu.wallview, menu);
        if (this.canAdmin) {
            if (this.e.type != 0) {
                menu.findItem(R.id.edit).setVisible(false);
            }
            if (this.e.type != 0) {
                menu.removeItem(R.id.edit);
            } else if ((this.e.time < TimeUtils.getCurrentTime() - 86400 && !this.e.flag(4096)) || !this.e.flag(128)) {
                menu.findItem(R.id.edit).setEnabled(false);
            }
        } else {
            menu.findItem(R.id.edit).setVisible(false);
            menu.findItem(R.id.delete).setVisible(false);
        }
        menu.findItem(R.id.show_original_post).setVisible(this.e.flag(32));
        menu.findItem(R.id.report).setVisible(VKAccountManager.getCurrent().getUid() > 0 && this.e.userID != VKAccountManager.getCurrent().getUid() && !this.e.flag(4096) && !this.e.flag(2048));
        menu.findItem(R.id.publish_now).setVisible(this.e.flag(2048));
        menu.findItem(R.id.toggle_fix).setVisible(this.e.flag(65536));
        menu.findItem(R.id.toggle_fix).setTitle(this.e.flag(1024) ? R.string.post_unfix : R.string.post_fix);
        if (this.e.type == 2) {
            MenuItem add = menu.findItem(R.id.add);
            VideoAttachment va = (VideoAttachment) ((this.e.attachments == null || this.e.attachments.isEmpty()) ? null : this.e.attachments.get(0));
            boolean canAdd = true;
            if (va != null && va.video != null) {
                canAdd = va.video.canAdd;
            }
            add.setVisible(this.e.ownerID != VKAccountManager.getCurrent().getUid() && canAdd);
            menu.findItem(R.id.add_to_album).setVisible(canAdd);
        } else {
            menu.findItem(R.id.add).setVisible(false);
            menu.findItem(R.id.add_to_album).setVisible(false);
        }
        boolean youtube = false;
        if (this.e != null && this.e.attachments != null && this.e.attachments.size() == 1) {
            Attachment attachment = this.e.attachments.get(0);
            if (attachment instanceof VideoAttachment) {
                VideoFile video = ((VideoAttachment) attachment).video;
                if (video.isExternal() && "YouTube".equalsIgnoreCase(video.platform)) {
                    youtube = true;
                }
            }
        }
        if (youtube) {
            for (int i = 0; i < menu.size(); i++) {
                MenuItem item = menu.getItem(i);
                if (item.isVisible()) {
                    menu.add(0, R.id.youtube, item.getOrder() + 1, R.string.open_in_youtube);
                    return;
                }
            }
        }
    }

    @Override // android.app.Fragment
    public void onPrepareOptionsMenu(Menu menu) {
    }

    @Override // android.app.Fragment
    public boolean onOptionsItemSelected(MenuItem item) {
        if (item.getItemId() == R.id.delete) {
            int msg = R.string.delete_confirm;
            if (this.e.type == 1) {
                msg = R.string.delete_photo_confirm;
            }
            if (this.e.type == 2) {
                msg = R.string.delete_video_confirm;
            }
            new VKAlertDialog.Builder(getActivity()).setTitle(R.string.confirm).setMessage(msg).setPositiveButton(R.string.yes, new DialogInterface.OnClickListener() { // from class: com.vkontakte.android.fragments.PostViewFragment.13
                @Override // android.content.DialogInterface.OnClickListener
                public void onClick(DialogInterface dialog, int which) {
                    PostViewFragment.this.deletePost();
                }
            }).setNegativeButton(R.string.no, (DialogInterface.OnClickListener) null).show();
        } else if (item.getItemId() == R.id.edit) {
            if (this.e.flag(32)) {
                editRepostComment(this.e.retweetText);
                return true;
            }
            new NewPostFragment.Builder().attachPost(this.e).isPublic(this.e.flag(2048) && this.e.ownerID < 0).forResult(this, EDIT_REQUEST);
        } else if (item.getItemId() == R.id.copy_link) {
            ClipboardManager cm = (ClipboardManager) getActivity().getSystemService("clipboard");
            cm.setText(getLink());
            Toast.makeText(getActivity(), (int) R.string.link_copied, 0).show();
        } else if (item.getItemId() == R.id.show_original_post) {
            String type = ReportAppInputData.REPORT_TYPE_WALL;
            if (this.e.retweetType == 1) {
                type = "photo";
            }
            if (this.e.retweetType == 2) {
                type = "video";
            }
            getActivity().startActivity(new Intent("android.intent.action.VIEW", Uri.parse("vkontakte://vk.com/" + type + this.e.retweetUID + EventsFilesManager.ROLL_OVER_FILE_NAME_SEPARATOR + this.e.retweetOrigId)));
        } else if (item.getItemId() == R.id.report) {
            Intent intent = new Intent(getActivity(), ReportContentActivity.class);
            intent.putExtra("itemID", this.e.postID);
            intent.putExtra("ownerID", this.e.ownerID);
            intent.putExtra(AttachmentInfo.DATA_TRACK_CODE, this.e.getTrackCode());
            String type2 = ArgKeys.POST;
            if (this.e.type == 1) {
                type2 = "photo";
            }
            if (this.e.type == 2) {
                type2 = "video";
            }
            intent.putExtra(ServerKeys.TYPE, type2);
            PostInteract postInteract = getPostInteract();
            if (postInteract != null) {
                intent.putExtra("refer", postInteract.refer);
            }
            startActivity(intent);
        } else if (item.getItemId() == R.id.publish_now) {
            Posts.publishPostponed(this.e, getActivity(), new Runnable() { // from class: com.vkontakte.android.fragments.PostViewFragment.14
                @Override // java.lang.Runnable
                public void run() {
                    PostViewFragment.this.getActivity().finish();
                }
            });
        } else if (item.getItemId() == R.id.toggle_fix) {
            Posts.toggleFixed(this.e, getActivity(), new Runnable() { // from class: com.vkontakte.android.fragments.PostViewFragment.15
                @Override // java.lang.Runnable
                public void run() {
                    PostViewFragment.this.e.flag(1024, !PostViewFragment.this.e.flag(1024));
                    PostViewFragment.this.updateList();
                    if (PostViewFragment.this.getActivity() != null) {
                        PostViewFragment.this.getActivity().invalidateOptionsMenu();
                    }
                }
            });
        } else if (item.getItemId() == R.id.add) {
            new VideoAdd(this.e.ownerID, this.e.postID).setCallback(new SimpleCallback<Integer>(getActivity()) { // from class: com.vkontakte.android.fragments.PostViewFragment.16
                @Override // com.vkontakte.android.api.Callback
                public void success(Integer vid) {
                    VideoAttachment va = (VideoAttachment) PostViewFragment.this.e.attachments.get(0);
                    Toast.makeText(PostViewFragment.this.getActivity(), PostViewFragment.this.getResources().getString(R.string.video_added, va.video.title), 0).show();
                }
            }).wrapProgress(getActivity()).exec((Context) getActivity());
        } else if (item.getItemId() == R.id.add_to_album) {
            VideoAttachment va = (VideoAttachment) this.e.attachments.get(0);
            VideoAddHelper helper = new VideoAddHelper(getActivity());
            helper.showAlbumsDialog(VKAccountManager.getCurrent().getUid(), va.video);
        } else if (item.getItemId() == R.id.youtube) {
            try {
                openYoutubeApp(((VideoAttachment) this.e.attachments.get(0)).video, getArguments().getString(SharingService.EXTRA_REFERER));
            } catch (Throwable t) {
                Log.e("PostViewFragment", "openYoutubeApp", t);
                Toast.makeText(getActivity(), (int) R.string.error, 0).show();
            }
        } else if (item.getItemId() == R.id.open_in_browser) {
            String ln = getLink();
            Intent intent2 = new Intent("android.intent.action.VIEW", Uri.parse(ln));
            intent2.addFlags(268435456);
            startActivity(intent2);
            getActivity().overridePendingTransition(17432576, 17432577);
        }
        return true;
    }

    @NonNull
    public String getLink() {
        String ln = "https://vk.com/";
        if (this.e.type == 0 || this.e.type == 12) {
            ln = ln + ReportAppInputData.REPORT_TYPE_WALL;
        } else if (this.e.type == 2) {
            ln = ln + "video";
        } else if (this.e.type == 1) {
            ln = ln + "photo";
        } else if (this.e.type == 4) {
            ln = ln + "topic";
        }
        return ln + this.e.ownerID + EventsFilesManager.ROLL_OVER_FILE_NAME_SEPARATOR + this.e.postID;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void deletePost() {
        new WallDelete(this.e.ownerID, this.e.postID, this.e.type).setCallback(new ResultlessCallback(getActivity()) { // from class: com.vkontakte.android.fragments.PostViewFragment.17
            @Override // com.vkontakte.android.api.ResultlessCallback
            public void success() {
                Intent intent = new Intent("com.vkontakte.android.POST_DELETED");
                intent.putExtra("owner_id", PostViewFragment.this.e.ownerID);
                intent.putExtra(ShareConstants.WEB_DIALOG_RESULT_PARAM_POST_ID, PostViewFragment.this.e.postID);
                intent.putExtra(ServerKeys.TYPE, PostViewFragment.this.e.type);
                intent.putExtra(ArgKeys.POST, PostViewFragment.this.e);
                PostViewFragment.this.getActivity().sendBroadcast(intent, "com.vkontakte.android.permission.ACCESS_DATA");
                NewsfeedCache.remove(PostViewFragment.this.e.ownerID, PostViewFragment.this.e.postID);
                if (PostViewFragment.this.getActivity() instanceof FragmentWrapperActivity) {
                    Intent intent1 = new Intent();
                    intent1.putExtra(AudioContentProviderConstants.MUSIC_TRACK_COLUMN_OID, PostViewFragment.this.e.ownerID);
                    intent1.putExtra("pid", PostViewFragment.this.e.postID);
                    PostViewFragment.this.getActivity().setResult(2, intent1);
                    PostViewFragment.this.getActivity().finish();
                }
            }
        }).wrapProgress(getActivity()).exec((Context) getActivity());
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void editRepostComment(String text) {
        final EditText edit = new EditText(getActivity());
        edit.setText(text);
        edit.setLines(4);
        edit.setGravity(48);
        edit.setSelection(edit.getText().length());
        new VKAlertDialog.Builder(getActivity()).setTitle(R.string.add_comment_hint).setView(edit).setPositiveButton(R.string.save, new DialogInterface.OnClickListener() { // from class: com.vkontakte.android.fragments.PostViewFragment.18
            @Override // android.content.DialogInterface.OnClickListener
            public void onClick(DialogInterface dialog, int which) {
                PostViewFragment.this.saveRepostComment(edit.getText().toString());
            }
        }).setNegativeButton(R.string.cancel, (DialogInterface.OnClickListener) null).show();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void saveRepostComment(final String newComment) {
        new WallEdit(this.e.postID, this.e.ownerID, newComment).setCallback(new ResultlessCallback(getActivity()) { // from class: com.vkontakte.android.fragments.PostViewFragment.19
            @Override // com.vkontakte.android.api.ResultlessCallback
            public void success() {
                Toast.makeText(PostViewFragment.this.getActivity(), (int) R.string.post_edit_saved, 0).show();
                PostViewFragment.this.e.retweetText = newComment;
                if (PostViewFragment.this.e.ownerID == PostViewFragment.this.e.userID) {
                    NewsfeedCache.replaceOne(PostViewFragment.this.e, false);
                }
                Intent intent = new Intent(Posts.ACTION_POST_REPLACED_BROADCAST);
                intent.putExtra("entry", PostViewFragment.this.e);
                PostViewFragment.this.getActivity().sendBroadcast(intent, "com.vkontakte.android.permission.ACCESS_DATA");
                ((ExTextView) PostViewFragment.this.contentView.findViewById(R.id.wall_retweet_text)).setText(Global.replaceEmoji(LinkParser.parseLinks(PostViewFragment.this.e.retweetText, 7, PostViewFragment.this.getPostInteract())));
            }

            @Override // com.vkontakte.android.api.SimpleCallback, com.vkontakte.android.api.Callback
            public void fail(VKAPIRequest.VKErrorResponse error) {
                super.fail(error);
                PostViewFragment.this.editRepostComment(newComment);
            }
        }).wrapProgress(getActivity()).exec((Context) getActivity());
    }

    @Override // com.vkontakte.android.ui.holder.comments.CommentViewHolder.CommentViewHolderListener
    public void showCommentActions(final NewsComment comm) {
        boolean canEdit = false;
        if (!comm.isDeleted) {
            ArrayList<String> items = new ArrayList<>();
            final ArrayList<String> acts = new ArrayList<>();
            if (Groups.getAdminLevel(-this.e.ownerID) >= 2) {
                items.add(getString(R.string.reply_from_group));
                acts.add("reply_group");
            }
            items.add(getString(R.string.copy_comment_text));
            acts.add("copy");
            if (this.e.type == 0 || this.e.type == 1 || this.e.type == 2) {
                items.add(getString(R.string.copy_link));
                acts.add("copy_link");
            }
            if (this.e.type == 0 && !this.e.flag(512) && this.e.flag(1) && VKAccountManager.getCurrent().getUid() > 0) {
                items.add(getString(R.string.repost));
                acts.add("repost");
            }
            if (comm.numLikes > 0) {
                items.add(getResources().getQuantityString(R.plurals.comment_likes, comm.numLikes, Integer.valueOf(comm.numLikes)));
                acts.add("liked");
            }
            boolean canDelete = comm.canDelete || comm.uid == VKAccountManager.getCurrent().getUid() || this.e.ownerID == VKAccountManager.getCurrent().getUid() || this.e.userID == VKAccountManager.getCurrent().getUid() || (this.e.ownerID < 0 && Groups.getAdminLevel(-this.e.ownerID) == 1 && comm.uid > 0 && comm.uid != 101) || ((this.e.ownerID < 0 && Groups.getAdminLevel(-this.e.ownerID) > 1) || (comm.uid < 0 && Groups.getAdminLevel(-comm.uid) > 1));
            if (canDelete) {
                items.add(getString(R.string.delete));
                acts.add("delete");
                if (comm.uid == VKAccountManager.getCurrent().getUid() || (comm.uid < 0 && Groups.getAdminLevel(-comm.uid) > 1)) {
                    canEdit = true;
                }
                if (canEdit && comm.canEdit()) {
                    items.add(getString(R.string.edit));
                    acts.add("edit");
                }
            }
            if (comm.uid != VKAccountManager.getCurrent().getUid() && VKAccountManager.getCurrent().getUid() > 0 && !canDelete) {
                items.add(getString(R.string.report_content));
                acts.add("report");
            }
            new VKAlertDialog.Builder(getActivity()).setItems((CharSequence[]) items.toArray(new String[acts.size()]), new DialogInterface.OnClickListener() { // from class: com.vkontakte.android.fragments.PostViewFragment.20
                @Override // android.content.DialogInterface.OnClickListener
                public void onClick(DialogInterface dialog, int which) {
                    String act = (String) acts.get(which);
                    if ("profile".equals(act)) {
                        new ProfileFragment.Builder(comm.uid).go(PostViewFragment.this.getActivity());
                    } else if ("reply".equals(act) || "reply_group".equals(act)) {
                        PostViewFragment.this.replyToComment(comm, "reply_group".equals(act));
                    } else if ("copy".equals(act)) {
                        ClipboardManager clipboard = (ClipboardManager) PostViewFragment.this.getActivity().getSystemService("clipboard");
                        clipboard.setText(Global.replaceHTML(comm.text).replace("<br/>", "\n"));
                        Toast.makeText(PostViewFragment.this.getActivity(), (int) R.string.text_copied, 0).show();
                    } else if ("copy_link".equals(act)) {
                        ClipboardManager cm = (ClipboardManager) PostViewFragment.this.getActivity().getSystemService("clipboard");
                        cm.setText(PostViewFragment.this.getLink() + "?reply=" + comm.getId());
                        Toast.makeText(PostViewFragment.this.getActivity(), (int) R.string.link_copied, 0).show();
                    } else if ("like".equals(act)) {
                        PostViewFragment.this.likeComment(comm);
                    } else if ("liked".equals(act)) {
                        Bundle args = new Bundle();
                        args.putCharSequence("title", PostViewFragment.this.getString(R.string.liked));
                        args.putInt("ltype", 5);
                        args.putInt("lptype", PostViewFragment.this.e.type);
                        args.putInt(AudioContentProviderConstants.MUSIC_TRACK_COLUMN_OID, PostViewFragment.this.e.ownerID);
                        args.putInt(FirebaseAnalytics.Param.ITEM_ID, comm.cid);
                        Navigate.to(LikesListFragment.class, args, PostViewFragment.this.getActivity());
                    } else if ("delete".equals(act)) {
                        PostViewFragment.this.deleteComment(comm.cid);
                    } else if ("edit".equals(act)) {
                        PostViewFragment.this.editComment(comm);
                    } else if ("report".equals(act)) {
                        PostViewFragment.this.reportComment(comm);
                    } else if ("repost".equals(act)) {
                        PostViewFragment.this.repostComment(comm);
                    }
                }
            }).show();
        }
    }

    @Override // com.vkontakte.android.ui.holder.comments.CommentViewHolder.CommentViewHolderListener
    public void replyToComment(NewsComment comment) {
        replyToComment(comment, false);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void replyToComment(NewsComment comm, boolean fromGroup) {
        resetReplyTo();
        this.replyTo = comm.cid;
        this.replyToUid = comm.uid;
        this.replyToRName = comm.userRName;
        this.replyToName = comm.userName.split(MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR)[0];
        if (fromGroup) {
            setReplyFromCurrentlyAdminedGroup();
        }
        if (this.e.flag(2)) {
            this.replyBarController.setReplyToName(this.replyToRName);
            if (this.commentBar.isTextEmpty()) {
                this.commentBar.setText(this.replyToName + ", ");
            }
            this.commentBar.focus();
            this.list.postDelayed(new Runnable() { // from class: com.vkontakte.android.fragments.PostViewFragment.21
                @Override // java.lang.Runnable
                public void run() {
                    InputMethodManager imm = (InputMethodManager) PostViewFragment.this.getActivity().getSystemService("input_method");
                    imm.showSoftInput(PostViewFragment.this.commentBar.findViewById(R.id.writebar_edit), 1);
                }
            }, 200L);
        }
    }

    @Override // com.vkontakte.android.ui.holder.comments.DeletedCommentViewHolder.DeletedCommentViewHolderListener
    public void reportComment(NewsComment comm) {
        Intent intent = new Intent(getActivity(), ReportContentActivity.class);
        intent.putExtra("itemID", comm.cid);
        intent.putExtra("ownerID", this.e.ownerID);
        intent.putExtra(AttachmentInfo.DATA_TRACK_CODE, this.e.getTrackCode());
        PostInteract postInteract = getPostInteract();
        if (postInteract != null) {
            intent.putExtra("refer", postInteract.refer);
        }
        String type = "post_comment";
        if (this.e.type == 1) {
            type = ReportAppInputData.REPORT_TYPE_PHOTO_COMMENT;
        }
        if (this.e.type == 2) {
            type = ReportAppInputData.REPORT_TYPE_VIDEO_COMMENT;
        }
        intent.putExtra(ServerKeys.TYPE, type);
        startActivityForResult(intent, REPORT_RESULT);
    }

    @Override // android.app.Fragment
    public void onResume() {
        super.onResume();
        VideoPools.onResume(getActivity());
        if (this.resetScroll && !this.mScrollReset) {
            this.mScrollReset = true;
            this.list.postDelayed(new Runnable() { // from class: com.vkontakte.android.fragments.PostViewFragment.22
                @Override // java.lang.Runnable
                public void run() {
                    PostViewFragment.this.list.scrollToPosition(0);
                }
            }, 100L);
        }
    }

    @Override // com.vkontakte.android.ui.holder.comments.CommentViewHolder.CommentViewHolderListener
    public void likeComment(final NewsComment comm) {
        new WallLike(!comm.isLiked, this.e.ownerID, comm.cid, false, 5, this.e.type, "").param("ref", "single").setCallback(new Callback<WallLike.Result>() { // from class: com.vkontakte.android.fragments.PostViewFragment.23
            @Override // com.vkontakte.android.api.Callback
            public void success(WallLike.Result res) {
                comm.isLiked = !comm.isLiked;
                comm.numLikes = res.likes;
                PostViewFragment.this.updateList();
            }

            @Override // com.vkontakte.android.api.Callback
            public void fail(VKAPIRequest.VKErrorResponse err) {
                if (PostViewFragment.this.getActivity() != null) {
                    Toast.makeText(PostViewFragment.this.getActivity(), (int) R.string.error, 1).show();
                }
            }
        }).exec((View) this.contentView);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void repostComment(NewsComment comm) {
        if (VKAuth.ensureLoggedIn(getActivity())) {
            Sharing.from(getActivity()).withAttachment(Attachments.createInfo(this.e, comm, "single")).withActions(Actions.createInfo(this.e, comm)).share();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void deleteComment(final int cid) {
        new WallDeleteComment(this.e.ownerID, this.e.postID, cid, this.e.type, this.accessKey).setCallback(new ResultlessCallback(getActivity()) { // from class: com.vkontakte.android.fragments.PostViewFragment.24
            @Override // com.vkontakte.android.api.ResultlessCallback
            public void success() {
                Iterator it = PostViewFragment.this.comments.iterator();
                while (true) {
                    if (!it.hasNext()) {
                        break;
                    }
                    NewsComment c = (NewsComment) it.next();
                    if (c.cid == cid) {
                        c.isDeleted = true;
                        PostViewFragment.this.adapter.notifyItemChanged(PostViewFragment.this.comments.indexOf(c) + PostViewFragment.this.postItems.size() + PostViewFragment.this.views.size());
                        NewsEntry newsEntry = PostViewFragment.this.e;
                        newsEntry.numComments--;
                        break;
                    }
                }
                PostViewFragment.this.broadcastUpdate();
            }
        }).wrapProgress(getActivity()).exec((View) this.contentView);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void editComment(NewsComment comm) {
        NewsEntry ce = new NewsEntry();
        ce.text = comm.text;
        ce.attachments = comm.attachments;
        ce.ownerID = this.e.ownerID;
        ce.postID = comm.cid;
        ce.userID = comm.uid;
        ce.type = 5;
        ce.retweetOrigId = this.e.postID;
        switch (this.e.type) {
            case 1:
                ce.retweetText = "photo";
                break;
            case 2:
                ce.retweetText = "video";
                break;
            default:
                ce.retweetText = ReportAppInputData.REPORT_TYPE_WALL;
                break;
        }
        new NewPostFragment.Builder().attachPost(ce).forResult(this, EDIT_COMMENT_REQUEST);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void waitAndSendComment() {
        final ProgressDialog progress = new ProgressDialog(getActivity());
        progress.setMessage(getString(R.string.loading));
        progress.setCancelable(true);
        progress.setCanceledOnTouchOutside(false);
        progress.show();
        Runnable onDone = new Runnable() { // from class: com.vkontakte.android.fragments.PostViewFragment.25
            @Override // java.lang.Runnable
            public void run() {
                ViewUtils.dismissDialogSafety(progress);
                PostViewFragment.this.sendComment();
            }
        };
        Runnable onFailed = new Runnable() { // from class: com.vkontakte.android.fragments.PostViewFragment.26
            @Override // java.lang.Runnable
            public void run() {
                ViewUtils.dismissDialogSafety(progress);
                Toast.makeText(PostViewFragment.this.getActivity(), (int) R.string.error, 0).show();
            }
        };
        this.commentBar.waitForUploads(onDone, onFailed);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void sendComment() {
        String txt = this.commentBar.getText().replaceAll("\\*((?:id|club)[0-9-]+) \\(([^\\)]+)\\)", "[$1|$2]");
        sendComment(txt, this.commentBar.getAttachments(), true);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void sendAttachmentComment(Attachment att) {
        sendComment("", Collections.singletonList(att), false);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void sendPendingAttachmentComment(PendingAttachment att) {
        if (getActivity() != null) {
            final ProgressDialog progress = new ProgressDialog(getActivity());
            progress.setMessage(getString(R.string.loading));
            progress.setCancelable(true);
            progress.setCanceledOnTouchOutside(false);
            progress.show();
            final UploadListener uploadListener = new UploadListener(att.getUploadId(), new UploadListener.UploadListenerCallback() { // from class: com.vkontakte.android.fragments.PostViewFragment.27
                @Override // com.vkontakte.android.upload.UploadListener.UploadListenerCallback
                public void onProgress(int id, int done, int total) {
                }

                @Override // com.vkontakte.android.upload.UploadListener.UploadListenerCallback
                public void onDone(int id, Attachment attachment) {
                    progress.setOnCancelListener(null);
                    ViewUtils.dismissDialogSafety(progress);
                    PostViewFragment.this.sendAttachmentComment(attachment);
                }

                @Override // com.vkontakte.android.upload.UploadListener.UploadListenerCallback
                public void onFailed(int id, Attachment attachment) {
                    progress.setOnCancelListener(null);
                    ViewUtils.dismissDialogSafety(progress);
                    Toast.makeText(PostViewFragment.this.getActivity(), (int) R.string.error, 0).show();
                }
            });
            final UploadTask task = att.mo901createUploadTask(getActivity());
            progress.setOnCancelListener(new DialogInterface.OnCancelListener() { // from class: com.vkontakte.android.fragments.PostViewFragment.28
                @Override // android.content.DialogInterface.OnCancelListener
                public void onCancel(DialogInterface dialog) {
                    Upload.cancel(task.getID());
                    uploadListener.stopListener();
                }
            });
            uploadListener.startListener();
            Upload.start(getActivity(), task);
        }
    }

    private void sendComment(String txt, List<Attachment> atts, boolean clearCommentBar) {
        if (txt.length() != 0 || atts.size() != 0) {
            new WallAddComment(this.e, txt, this.replyTo, atts, this.accessKey, this.replyFromGroupId, getArguments().getString(SharingService.EXTRA_REFERER)).setCallback(new AnonymousClass29(getActivity(), clearCommentBar, txt, atts)).wrapProgress(getActivity()).exec((View) this.contentView);
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: com.vkontakte.android.fragments.PostViewFragment$29  reason: invalid class name */
    /* loaded from: classes2.dex */
    public class AnonymousClass29 extends SimpleCallback<Integer> {
        final /* synthetic */ List val$atts;
        final /* synthetic */ boolean val$clearCommentBar;
        final /* synthetic */ String val$txt;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        AnonymousClass29(Context context, boolean z, String str, List list) {
            super(context);
            this.val$clearCommentBar = z;
            this.val$txt = str;
            this.val$atts = list;
        }

        @Override // com.vkontakte.android.api.Callback
        public void success(Integer cid) {
            if (PostViewFragment.this.loadCommentsFromBeginning) {
                PostViewFragment.this.comments.clear();
                PostViewFragment.this.updateList();
            }
            if (this.val$clearCommentBar) {
                PostViewFragment.this.commentBar.setText("");
                PostViewFragment.this.commentBar.clearAttachments();
            }
            VKAccount account = VKAccountManager.getCurrent();
            NewsComment comment = new NewsComment();
            comment.cid = cid.intValue();
            comment.setText(this.val$txt.replaceAll("\\[(id|club)([\\d]+)\\|([^\\]]+)\\]", "$3"));
            if (PostViewFragment.this.replyFromGroupId != 0) {
                comment.uid = -PostViewFragment.this.replyFromGroupId;
                Group g = Groups.getById(PostViewFragment.this.replyFromGroupId);
                if (g != null) {
                    comment.userName = g.name;
                    comment.userRName = g.name;
                    comment.userPhoto = g.photo;
                    comment.isAuthorVerified = g.verified;
                } else {
                    comment.userName = "DELETED";
                    comment.userPhoto = null;
                }
            } else {
                comment.uid = account.getUid();
                comment.userName = account.getName();
                comment.userPhoto = account.getPhoto();
                comment.isAuthorVerified = account.getIsVerified();
            }
            comment.attachments = new ArrayList<>();
            comment.attachments.addAll(this.val$atts);
            if (this.val$atts.size() == 0 || !(this.val$atts.get(0) instanceof StickerAttachment) || !(this.val$atts.get(0) instanceof GraffitiAttachment)) {
                comment.canEdit = true;
            }
            DisplayMetrics metrics = VKApplication.context.getResources().getDisplayMetrics();
            int tSize = Math.min(Math.min(metrics.widthPixels, metrics.heightPixels) - Global.scale(95.0f), 604);
            Iterator<Attachment> it = comment.attachments.iterator();
            while (it.hasNext()) {
                Attachment att = it.next();
                if (att instanceof SnippetAttachment) {
                    ((SnippetAttachment) att).forceSmall = true;
                }
            }
            ZhukovLayout.processThumbs(tSize, (int) (tSize * 0.666f), comment.attachments);
            comment.time = TimeUtils.getCurrentTime();
            if (PostViewFragment.this.replyTo != 0) {
                comment.replyToCommentID = PostViewFragment.this.replyTo;
                comment.respToName = PostViewFragment.this.replyToRName;
            }
            PostViewFragment.this.comments.add(comment);
            PostViewFragment.this.adapter.notifyItemInserted((PostViewFragment.this.comments.size() - 1) + PostViewFragment.this.views.size() + PostViewFragment.this.postItems.size());
            if (this.val$clearCommentBar) {
                PostViewFragment.this.resetReplyTo();
            }
            PostViewFragment.this.list.post(new Runnable() { // from class: com.vkontakte.android.fragments.PostViewFragment.29.1
                @Override // java.lang.Runnable
                public void run() {
                    InputMethodManager inputManager = (InputMethodManager) PostViewFragment.this.getActivity().getSystemService("input_method");
                    inputManager.hideSoftInputFromWindow(PostViewFragment.this.getActivity().getCurrentFocus().getWindowToken(), 2);
                    PostViewFragment.this.getActivity().getCurrentFocus().clearFocus();
                    PostViewFragment.this.hideEmojiPopup();
                    if (!PostViewFragment.this.loadCommentsFromBeginning) {
                        PostViewFragment.this.list.postDelayed(new Runnable() { // from class: com.vkontakte.android.fragments.PostViewFragment.29.1.1
                            @Override // java.lang.Runnable
                            public void run() {
                                PostViewFragment.this.list.smoothScrollToPosition(9999999);
                            }
                        }, 200L);
                    }
                }
            });
            PostViewFragment.this.e.numComments++;
            Intent intent = new Intent(Posts.ACTION_POST_UPDATED_BROADCAST);
            intent.putExtra(ShareConstants.WEB_DIALOG_RESULT_PARAM_POST_ID, PostViewFragment.this.e.postID);
            intent.putExtra("owner_id", PostViewFragment.this.e.ownerID);
            intent.putExtra("comments", PostViewFragment.this.e.numComments);
            intent.putExtra(ServerKeys.LIKES, PostViewFragment.this.e.numLikes);
            intent.putExtra("liked", PostViewFragment.this.e.flag(8));
            PostViewFragment.this.getActivity().sendBroadcast(intent, "com.vkontakte.android.permission.ACCESS_DATA");
            NewsfeedCache.update(PostViewFragment.this.e.ownerID, PostViewFragment.this.e.postID, PostViewFragment.this.e.numLikes, PostViewFragment.this.e.numComments, PostViewFragment.this.e.numRetweets, PostViewFragment.this.e.flag(8), PostViewFragment.this.e.flag(4));
            if (PostViewFragment.this.loadCommentsFromBeginning) {
                PostViewFragment.this.jumpToEnd();
            }
        }

        @Override // com.vkontakte.android.api.SimpleCallback, com.vkontakte.android.api.Callback
        public void fail(VKAPIRequest.VKErrorResponse error) {
            super.fail(error);
            if (PostViewFragment.this.replyFromGroupId != 0) {
                GroupsForCommentsImpersonation.getInstance().resetCache();
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void jumpToEnd() {
        this.jumpingToEnd = true;
        this.scrollToEnd = true;
        loadComments(true);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void broadcastUpdate() {
        try {
            Intent intent = new Intent(Posts.ACTION_POST_UPDATED_BROADCAST);
            intent.putExtra(ShareConstants.WEB_DIALOG_RESULT_PARAM_POST_ID, this.e.postID);
            intent.putExtra("owner_id", this.e.ownerID);
            intent.putExtra("post_type", this.e.type);
            intent.putExtra("comments", this.e.numComments);
            intent.putExtra("retweets", this.e.numRetweets);
            intent.putExtra(ServerKeys.LIKES, this.e.numLikes);
            intent.putExtra("liked", this.e.flag(8));
            intent.putExtra("retweeted", this.e.flag(4));
            getActivity().sendBroadcast(intent, "com.vkontakte.android.permission.ACCESS_DATA");
            NewsfeedCache.update(this.e.ownerID, this.e.postID, this.e.numLikes, this.e.numComments, this.e.numRetweets, this.e.flag(8), this.e.flag(4));
        } catch (Exception x) {
            L.e(x, new Object[0]);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void loadComments(boolean clear) {
        loadComments(clear, false);
    }

    private void loadComments(final boolean clear, final boolean saveScroll) {
        if (!this.loadingComments) {
            if (clear) {
                this.commentsBuffer.clear();
            }
            int csize = clear ? 0 : this.comments.size();
            int count = 10;
            if (!clear) {
                count = Math.min(100, this.e.numComments - csize);
            }
            if (this.scrollToComment != 0 || this.scrollToEnd) {
                count = 50;
            }
            if (this.comments.size() == 0) {
                if (!this.views.contains(this.commentsProgress)) {
                    this.views.add(this.commentsProgress);
                }
                this.views.remove(this.error);
                updateList();
            }
            this.loadingComments = true;
            boolean desc = !this.loadCommentsFromBeginning;
            if (this.jumpingToEnd) {
                desc = true;
            }
            final int i = csize;
            this.currentReq = new WallGetComments(this.e.ownerID, this.e.postID, csize, count, this.e.type, clear, this.accessKey, desc, this.e.getTrackCode()).setCallback(new SimpleCallback<WallGetComments.Result>(this) { // from class: com.vkontakte.android.fragments.PostViewFragment.30
                @Override // com.vkontakte.android.api.Callback
                public void success(WallGetComments.Result r) {
                    if (PostViewFragment.this.getActivity() != null) {
                        if (PostViewFragment.this.jumpingToEnd) {
                            PostViewFragment.this.jumpingToEnd = false;
                            PostViewFragment.this.loadCommentsFromBeginning = false;
                            PostViewFragment.this.updateJumpToEndButtonVisibility();
                        }
                        PostViewFragment.this.currentReq = null;
                        PostViewFragment.this.loadingComments = false;
                        if (!r.canComment) {
                            PostViewFragment.this.commentBar.setVisibility(8);
                            PostViewFragment.this.e.flag(2, false);
                            PostViewFragment.this.getActivity().invalidateOptionsMenu();
                        }
                        PostViewFragment.this.e.numComments = r.comments.total();
                        if (clear) {
                            PostViewFragment.this.likes = LikeInfo.parse(r.likes);
                        }
                        if (r.totalReposts != -1) {
                            PostViewFragment.this.e.numRetweets = r.totalReposts;
                            PostViewFragment.this.e.flag(1, r.canRepost);
                            PostViewFragment.this.e.flag(4, r.reposted);
                        }
                        if (r.totalViews != -1) {
                            PostViewFragment.this.e.numViews = r.totalViews;
                        }
                        if (r.totalLikes != -1) {
                            PostViewFragment.this.e.numLikes = r.totalLikes;
                            PostViewFragment.this.e.flag(8, r.liked);
                        }
                        PostViewFragment.this.updateButtons();
                        PostViewFragment.this.broadcastUpdate();
                        int itemIndex = PostViewFragment.this.views.size() + PostViewFragment.this.postItems.size() + 1;
                        int itemOffset = -1;
                        if (itemIndex >= ((LinearLayoutManager) PostViewFragment.this.list.getLayoutManager()).findFirstVisibleItemPosition() && itemIndex <= ((LinearLayoutManager) PostViewFragment.this.list.getLayoutManager()).findLastVisibleItemPosition()) {
                            itemOffset = PostViewFragment.this.list.getChildAt(itemIndex - ((LinearLayoutManager) PostViewFragment.this.list.getLayoutManager()).findFirstVisibleItemPosition()).getTop();
                        }
                        int countBefore = PostViewFragment.this.adapter.getItemCount();
                        if (!clear) {
                            Iterator<NewsComment> itrtr = r.comments.iterator();
                            while (itrtr.hasNext()) {
                                NewsComment comment = itrtr.next();
                                Iterator it = PostViewFragment.this.comments.iterator();
                                while (true) {
                                    if (!it.hasNext()) {
                                        break;
                                    } else if (((NewsComment) it.next()).cid == comment.cid) {
                                        itrtr.remove();
                                        break;
                                    }
                                }
                            }
                        }
                        DisplayMetrics metrics = VKApplication.context.getResources().getDisplayMetrics();
                        int tSize = Math.min(Math.min(metrics.widthPixels, metrics.heightPixels) - Global.scale(95.0f), 604);
                        Iterator it2 = r.comments.iterator();
                        while (it2.hasNext()) {
                            NewsComment c = (NewsComment) it2.next();
                            Iterator<Attachment> it3 = c.attachments.iterator();
                            while (it3.hasNext()) {
                                Attachment att = it3.next();
                                if (att instanceof SnippetAttachment) {
                                    ((SnippetAttachment) att).forceSmall = true;
                                }
                            }
                            ZhukovLayout.processThumbs(tSize, (int) (tSize * 0.666f), c.attachments);
                        }
                        PostViewFragment.this.views.remove(PostViewFragment.this.commentsProgress);
                        PostViewFragment.this.refreshLayout.setRefreshing(false);
                        if (clear) {
                            PostViewFragment.this.comments.clear();
                        }
                        for (int i2 = 0; i2 < r.comments.size(); i2++) {
                            NewsComment comm = (NewsComment) r.comments.get(i2);
                            comm.setText(comm.text);
                            r.comments.set(i2, comm);
                        }
                        if (!PostViewFragment.this.loadCommentsFromBeginning) {
                            PostViewFragment.this.comments.addAll(0, r.comments);
                        } else if (i == 0) {
                            PostViewFragment.this.comments.addAll(r.comments);
                            if (PostViewFragment.this.comments.size() > 0 && PostViewFragment.this.comments.size() < PostViewFragment.this.e.numComments) {
                                PostViewFragment.this.loadComments(false);
                            }
                        } else {
                            PostViewFragment.this.commentsBuffer.clear();
                            PostViewFragment.this.commentsBuffer.addAll(r.comments);
                        }
                        PostViewFragment.this.views.remove(PostViewFragment.this.loadMoreView);
                        if (!PostViewFragment.this.loadCommentsFromBeginning && r.comments.total() > PostViewFragment.this.comments.size()) {
                            PostViewFragment.this.loadMoreView.showProgress(false);
                            PostViewFragment.this.loadMoreView.setNumComments(r.comments.total() - PostViewFragment.this.comments.size());
                            PostViewFragment.this.views.add(PostViewFragment.this.loadMoreView);
                        }
                        PostViewFragment.this.updateList();
                        if (PostViewFragment.this.scrollToComment != 0) {
                            int pos = -1;
                            int i3 = 0;
                            Iterator it4 = PostViewFragment.this.comments.iterator();
                            while (true) {
                                if (!it4.hasNext()) {
                                    break;
                                } else if (((NewsComment) it4.next()).cid == PostViewFragment.this.scrollToComment) {
                                    pos = i3;
                                    break;
                                } else {
                                    i3++;
                                }
                            }
                            if (pos != -1) {
                                ((LinearLayoutManager) PostViewFragment.this.list.getLayoutManager()).scrollToPositionWithOffset(pos + PostViewFragment.this.postItems.size() + PostViewFragment.this.views.size(), Global.scale(50.0f));
                            }
                        } else if (saveScroll) {
                            ((LinearLayoutManager) PostViewFragment.this.list.getLayoutManager()).scrollToPositionWithOffset(PostViewFragment.this.list.getCount() - 1, 0);
                        } else if (PostViewFragment.this.scrollToEnd) {
                            if (PostViewFragment.this.list.getCount() < 20) {
                                PostViewFragment.this.list.smoothScrollToPosition(PostViewFragment.this.list.getCount() - 1);
                            } else {
                                PostViewFragment.this.list.scrollToPosition(PostViewFragment.this.list.getCount() - 1);
                            }
                            PostViewFragment.this.scrollToEnd = false;
                        } else if (PostViewFragment.this.scrollToFirstComment) {
                            PostViewFragment.this.list.smoothScrollToPosition(PostViewFragment.this.postItems.size() + PostViewFragment.this.views.size());
                            PostViewFragment.this.scrollToFirstComment = false;
                        } else if (PostViewFragment.this.comments.size() > 10 && itemOffset != -1) {
                            ((LinearLayoutManager) PostViewFragment.this.list.getLayoutManager()).scrollToPositionWithOffset((PostViewFragment.this.adapter.getItemCount() - countBefore) + itemIndex, itemOffset);
                        }
                    }
                }

                @Override // com.vkontakte.android.api.SimpleCallback, com.vkontakte.android.api.Callback
                public void fail(VKAPIRequest.VKErrorResponse err) {
                    PostViewFragment.this.loadingComments = false;
                    if (PostViewFragment.this.jumpingToEnd) {
                        PostViewFragment.this.jumpingToEnd = false;
                        APIUtils.showErrorToast(PostViewFragment.this.getActivity(), err.getCode(), err.message);
                        PostViewFragment.this.updateJumpToEndButtonVisibility();
                    } else if (PostViewFragment.this.comments.size() == 0) {
                        if (!PostViewFragment.this.views.contains(PostViewFragment.this.error)) {
                            PostViewFragment.this.views.add(PostViewFragment.this.error);
                        }
                        PostViewFragment.this.views.remove(PostViewFragment.this.commentsProgress);
                        PostViewFragment.this.updateList();
                    } else {
                        super.fail(err);
                    }
                    PostViewFragment.this.currentReq = null;
                }
            });
            if (this.jumpingToEnd) {
                this.currentReq.wrapProgress(getActivity());
            }
            this.currentReq.exec((Context) getActivity());
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void updateJumpToEndButtonVisibility() {
        int i = 0;
        boolean shouldButtonBeVisible = !this.hideJumpToEndButtonDueToScrollPosition && this.loadCommentsFromBeginning && this.comments.size() > 0;
        ViewGroup viewGroup = this.jumpToEndBtn;
        if (!shouldButtonBeVisible) {
            i = 8;
        }
        viewGroup.setVisibility(i);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void updateButtons() {
        if (getActivity() != null) {
            this.likeBarBinder.bind(this.e.flag(8), this.e.flag(4), this.e.numLikes, this.e.numRetweets, this.e.numViews, this.likes);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void like(final boolean liked) {
        if (VKAuth.ensureLoggedIn(getActivity())) {
            this.e.flag(8, liked);
            if (liked) {
                this.e.numLikes++;
            } else {
                NewsEntry newsEntry = this.e;
                newsEntry.numLikes--;
            }
            broadcastUpdate();
            updateButtons();
            updateList();
            if (!this.liking) {
                this.liking = true;
                String akey = "";
                if (this.e.type == 2) {
                    akey = ((VideoAttachment) this.e.attachments.get(0)).video.accessKey;
                }
                if (this.e.type == 1) {
                    akey = ((PhotoAttachment) this.e.attachments.get(0)).accessKey;
                }
                WallLike.newsEntry(this.e, liked, akey).setCallback(new Callback<WallLike.Result>() { // from class: com.vkontakte.android.fragments.PostViewFragment.31
                    @Override // com.vkontakte.android.api.Callback
                    public void success(WallLike.Result res) {
                        PostViewFragment.this.e.numLikes = res.likes;
                        if (liked) {
                            PostViewFragment.this.e.numRetweets = res.retweets;
                        }
                        PostViewFragment.this.broadcastUpdate();
                        PostViewFragment.this.liking = false;
                        if (PostViewFragment.this.contentView != null) {
                            if (PostViewFragment.this.e.flag(8) != liked) {
                                PostViewFragment.this.contentView.post(new Runnable() { // from class: com.vkontakte.android.fragments.PostViewFragment.31.1
                                    @Override // java.lang.Runnable
                                    public void run() {
                                        PostViewFragment.this.like(PostViewFragment.this.e.flag(8));
                                    }
                                });
                            } else {
                                PostViewFragment.this.contentView.post(new Runnable() { // from class: com.vkontakte.android.fragments.PostViewFragment.31.2
                                    @Override // java.lang.Runnable
                                    public void run() {
                                        PostViewFragment.this.updateButtons();
                                    }
                                });
                            }
                        }
                    }

                    @Override // com.vkontakte.android.api.Callback
                    public void fail(VKAPIRequest.VKErrorResponse err) {
                        PostViewFragment.this.e.flag(8, !liked);
                        if (liked) {
                            NewsEntry newsEntry2 = PostViewFragment.this.e;
                            newsEntry2.numLikes--;
                        } else {
                            PostViewFragment.this.e.numLikes++;
                        }
                        PostViewFragment.this.liking = false;
                        if (PostViewFragment.this.contentView != null) {
                            PostViewFragment.this.contentView.post(new Runnable() { // from class: com.vkontakte.android.fragments.PostViewFragment.31.3
                                @Override // java.lang.Runnable
                                public void run() {
                                    Toast.makeText(PostViewFragment.this.getActivity(), (int) R.string.error, 0).show();
                                    PostViewFragment.this.updateButtons();
                                }
                            });
                        }
                    }
                }).exec();
            }
        }
    }

    private void repost() {
        if (VKAuth.ensureLoggedIn(getActivity())) {
            Sharing.from(getActivity()).withAttachment(Attachments.createInfo(this.e, "posts")).withActions(Actions.createInfo(this.e)).share();
        }
    }

    @Override // com.vkontakte.android.ui.holder.comments.DeletedCommentViewHolder.DeletedCommentViewHolderListener
    public void restoreComment(final int cid) {
        new WallRestoreComment(this.e.ownerID, this.e.postID, cid, this.e.type, this.accessKey).setCallback(new ResultlessCallback(getActivity()) { // from class: com.vkontakte.android.fragments.PostViewFragment.32
            @Override // com.vkontakte.android.api.ResultlessCallback
            public void success() {
                Iterator it = PostViewFragment.this.comments.iterator();
                while (true) {
                    if (!it.hasNext()) {
                        break;
                    }
                    NewsComment c = (NewsComment) it.next();
                    if (c.cid == cid) {
                        PostViewFragment.this.e.numComments++;
                        c.isDeleted = false;
                        PostViewFragment.this.adapter.notifyItemChanged(PostViewFragment.this.comments.indexOf(c) + PostViewFragment.this.postItems.size() + PostViewFragment.this.views.size());
                        break;
                    }
                }
                PostViewFragment.this.broadcastUpdate();
            }
        }).wrapProgress(getActivity()).exec((View) this.contentView);
    }

    @Override // com.vkontakte.android.ui.holder.comments.DeletedCommentViewHolder.DeletedCommentViewHolderListener
    public void banUser(final NewsComment comment) {
        new GroupsGetBanned(-this.e.ownerID, comment.uid).setCallback(new SimpleCallback<VKList<UserProfile>>(getActivity()) { // from class: com.vkontakte.android.fragments.PostViewFragment.33
            @Override // com.vkontakte.android.api.Callback
            public void success(VKList<UserProfile> users) {
                UserProfile p = new UserProfile();
                p.uid = comment.uid;
                p.fullName = comment.userName;
                p.photo = comment.userPhoto;
                p.extra = new Bundle();
                if (users.size() <= 0) {
                    PostViewFragment.this.openBanUserFragment(p);
                    return;
                }
                UserProfile r = (UserProfile) users.get(0);
                if (r.uid != 0) {
                    PostViewFragment.this.openBanUserFragment((UserProfile) users.get(0));
                    return;
                }
                p.extra = r.extra;
                PostViewFragment.this.openBanUserFragment(p);
            }

            @Override // com.vkontakte.android.api.SimpleCallback, com.vkontakte.android.api.Callback
            public void fail(VKAPIRequest.VKErrorResponse error) {
                if (error.getCodeValue() == 104) {
                    UserProfile p = new UserProfile();
                    p.uid = comment.uid;
                    p.fullName = comment.userName;
                    p.photo = comment.userPhoto;
                    p.extra = new Bundle();
                    PostViewFragment.this.openBanUserFragment(p);
                    return;
                }
                super.fail(error);
            }
        }).wrapProgress(getActivity()).exec((Context) getActivity());
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void openBanUserFragment(UserProfile p) {
        Bundle args = new Bundle();
        args.putInt("id", -this.e.ownerID);
        args.putParcelable("profile", p);
        BannedUserSettingsFragment.open(args, getActivity());
    }

    private void loadVideoInfo() {
        new VideoGetInfo(this.e.ownerID, this.e.postID).setCallback(new SimpleCallback<VideoGetInfo.Result>() { // from class: com.vkontakte.android.fragments.PostViewFragment.34
            @Override // com.vkontakte.android.api.Callback
            public void success(VideoGetInfo.Result r) {
                PostViewFragment.this.e.flag(8, r.isLiked);
                PostViewFragment.this.e.numLikes = r.numLikes;
                PostViewFragment.this.updateButtons();
                if (r.tags.size() > 0) {
                    SpannableStringBuilder ssb = new SpannableStringBuilder();
                    ssb.append((CharSequence) PostViewFragment.this.getResources().getString(R.string.in_this_video));
                    ssb.setSpan(new ForegroundColorSpan(-5592406), 0, ssb.length(), 0);
                    ArrayList<String> tt = new ArrayList<>();
                    Iterator<UserProfile> it = r.tags.iterator();
                    while (it.hasNext()) {
                        UserProfile p = it.next();
                        tt.add("[id" + p.uid + "|" + p.fullName + "]");
                    }
                    String t = TextUtils.join(", ", tt);
                    ssb.append((CharSequence) MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR);
                    ssb.append(LinkParser.parseLinks(t, 2));
                    TextPostDisplayItem item = new TextPostDisplayItem(0, 0, ssb, null, false, true, PostViewFragment.this.getPostInteract());
                    PostViewFragment.this.postItems.add(item);
                    PostViewFragment.this.updateList();
                }
            }
        }).exec((View) this.contentView);
    }

    @Override // com.vkontakte.android.attachments.StickerAttachment.Callback
    public void openStickerKeyboard(int pack) {
        if (this.e.flag(2)) {
            this.mKeyboardPopup.show(true);
            this.mStickersView.openPack(pack);
        }
    }

    public void hideEmojiPopup() {
        if (this.mKeyboardPopup != null && this.mKeyboardPopup.isShowing()) {
            this.mKeyboardPopup.hide();
        }
    }

    @Override // com.vkontakte.android.fragments.BackListener
    public boolean onBackPressed() {
        if (this.mKeyboardPopup == null || !this.mKeyboardPopup.isShowing()) {
            return false;
        }
        hideEmojiPopup();
        return true;
    }

    @Override // me.grishka.appkit.fragments.BaseRecyclerFragment, android.support.v4.widget.SwipeRefreshLayout.OnRefreshListener
    public void onRefresh() {
        boolean z = false;
        if (this.loadCommentsFromBeginning && this.e.numComments > this.comments.size()) {
            loadMoreCommentsFromBuffer();
            return;
        }
        this.loadCommentsFromBeginning = false;
        if (this.refreshLayout != null && this.refreshLayout.isReversed()) {
            z = true;
        }
        loadComments(true, z);
    }

    void openYoutubeApp(VideoFile file, String referrer) {
        Intent intent = new Intent("android.intent.action.VIEW", Uri.parse(file.urlExternal));
        List<ResolveInfo> info = getActivity().getPackageManager().queryIntentActivities(intent, 65536);
        boolean foundApp = false;
        Iterator<ResolveInfo> it = info.iterator();
        while (true) {
            if (!it.hasNext()) {
                break;
            }
            ResolveInfo ri = it.next();
            if (ri.activityInfo.packageName.equals("com.google.android.youtube")) {
                foundApp = true;
                intent.setClassName(ri.activityInfo.packageName, ri.activityInfo.name);
                break;
            }
        }
        if (!foundApp) {
            intent.addFlags(268435456);
        }
        startActivityForResult(intent, 10500);
        getActivity().overridePendingTransition(17432576, 17432577);
    }

    /* loaded from: classes2.dex */
    private class CommentsAdapter extends UsableRecyclerView.Adapter<AbsCommentViewHolder<NewsComment>> {
        private static final int VIEW_TYPE_DELETED = 101;
        private static final int VIEW_TYPE_REGULAR = 100;

        private CommentsAdapter() {
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        /* renamed from: onCreateViewHolder  reason: collision with other method in class */
        public AbsCommentViewHolder<NewsComment> mo1206onCreateViewHolder(ViewGroup parent, int viewType) {
            return viewType == 101 ? new DeletedCommentViewHolder(parent, PostViewFragment.this) : new CommentViewHolder(parent, PostViewFragment.this);
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        public void onBindViewHolder(AbsCommentViewHolder<NewsComment> holder, int position) {
            NewsComment comment = (NewsComment) PostViewFragment.this.comments.get(position);
            holder.bind(comment);
            if (PostViewFragment.this.scrollToComment == comment.getId()) {
                PostViewFragment.this.scrollToComment = 0;
                holder.highlight();
            }
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        public int getItemCount() {
            return PostViewFragment.this.comments.size();
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        public int getItemViewType(int position) {
            return ((NewsComment) PostViewFragment.this.comments.get(position)).isDeleted ? 101 : 100;
        }

        @Override // me.grishka.appkit.views.UsableRecyclerView.Adapter, me.grishka.appkit.preloading.PrefetchInfoProvider
        public int getImageCountForItem(int position) {
            int count = 1;
            Iterator<Attachment> it = ((NewsComment) PostViewFragment.this.comments.get(position)).attachments.iterator();
            while (it.hasNext()) {
                Attachment att = it.next();
                if (att instanceof ImageAttachment) {
                    count++;
                }
            }
            return count;
        }

        @Override // me.grishka.appkit.views.UsableRecyclerView.Adapter, me.grishka.appkit.preloading.PrefetchInfoProvider
        public String getImageURL(int position, int image) {
            switch (image) {
                case 0:
                    return ((NewsComment) PostViewFragment.this.comments.get(position)).userPhoto;
                default:
                    int imgindex = 0;
                    Iterator<Attachment> it = ((NewsComment) PostViewFragment.this.comments.get(position)).attachments.iterator();
                    while (it.hasNext()) {
                        Attachment att = it.next();
                        if ((att instanceof ImageAttachment) && (imgindex = imgindex + 1) == image) {
                            return ((ImageAttachment) att).getImageURL();
                        }
                    }
                    return null;
            }
        }
    }

    @Override // com.vkontakte.android.ui.holder.comments.DeletedCommentViewHolder.DeletedCommentViewHolderListener
    public boolean canBanUsers() {
        return this.canBanUsers;
    }

    /* loaded from: classes2.dex */
    protected class NewsAdapter extends UsableRecyclerView.Adapter<PostDisplayItemViewHolder> {
        protected NewsAdapter() {
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        public int getItemCount() {
            return PostViewFragment.this.postItems.size();
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        public long getItemId(int position) {
            return position;
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        /* renamed from: onCreateViewHolder  reason: collision with other method in class */
        public PostDisplayItemViewHolder mo1206onCreateViewHolder(ViewGroup parent, int viewType) {
            switch (viewType) {
                case 0:
                    return new PostDisplayItemViewHolder(HeaderPostDisplayItem.createView(PostViewFragment.this.getActivity()));
                case 1:
                    return new PostDisplayItemViewHolder(FooterPostDisplayItem.createView(PostViewFragment.this.getActivity()));
                case 2:
                    return new PostDisplayItemViewHolder(TextPostDisplayItem.createView(PostViewFragment.this.getActivity(), true));
                case 3:
                    return new PostDisplayItemViewHolder(RepostPostDisplayItem.createView(PostViewFragment.this.getActivity()));
                case 4:
                    return new PostDisplayItemViewHolder(CommentPostDisplayItem.createView(PostViewFragment.this.getActivity()));
                case 5:
                    return new PostDisplayItemViewHolder(ThumbsBlockPostDisplayItem.createView(PostViewFragment.this.getActivity()));
                case 6:
                    return new PostDisplayItemViewHolder(AudioPostDisplayItem.createView(PostViewFragment.this.getActivity()));
                case 7:
                    return new PostDisplayItemViewHolder(CommonAttachmentPostDisplayItem.createView(PostViewFragment.this.getActivity()));
                case 8:
                    return new PostDisplayItemViewHolder(SignaturePostDisplayItem.createView(PostViewFragment.this.getActivity()));
                case 9:
                    return new PostDisplayItemViewHolder(AttachContainerPostDisplayItem.createView(PostViewFragment.this.getActivity()));
                case 10:
                    return new PostDisplayItemViewHolder(ButtonsPostDisplayItem.createView(PostViewFragment.this.getActivity()));
                case 11:
                case 13:
                case 14:
                case 15:
                case 17:
                case 18:
                case 19:
                default:
                    return null;
                case 12:
                    return new PostDisplayItemViewHolder(HeaderPostDisplayItem.createViewAd(PostViewFragment.this.getActivity()));
                case 16:
                    return new PostDisplayItemViewHolder(TagConfirmationPostDisplayItem.createView(PostViewFragment.this.getActivity()));
                case 20:
                    return new PostDisplayItemViewHolder(HeaderPostDisplayItem.createView(PostViewFragment.this.getActivity()));
                case 21:
                    return new PostDisplayItemViewHolder(MarkedAsAdsPostDisplayItem.createView(PostViewFragment.this.getActivity()));
            }
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        public void onBindViewHolder(PostDisplayItemViewHolder holder, int position) {
            ((PostDisplayItem) PostViewFragment.this.postItems.get(position)).bindView(holder.itemView);
            holder.bind((PostDisplayItem) PostViewFragment.this.postItems.get(position));
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        public int getItemViewType(int pos) {
            return ((PostDisplayItem) PostViewFragment.this.postItems.get(pos)).getType();
        }

        @Override // me.grishka.appkit.views.UsableRecyclerView.Adapter, me.grishka.appkit.preloading.PrefetchInfoProvider
        public int getImageCountForItem(int item) {
            return ((PostDisplayItem) PostViewFragment.this.postItems.get(item)).getImageCount();
        }

        @Override // me.grishka.appkit.views.UsableRecyclerView.Adapter, me.grishka.appkit.preloading.PrefetchInfoProvider
        public String getImageURL(int item, int image) {
            return ((PostDisplayItem) PostViewFragment.this.postItems.get(item)).getImageURL(image);
        }
    }

    /* loaded from: classes2.dex */
    public class PostDisplayItemViewHolder extends UsableRecyclerView.ViewHolder {
        private PostDisplayItem item;

        public PostDisplayItemViewHolder(View itemView) {
            super(itemView);
        }

        public void bind(PostDisplayItem item) {
            this.item = item;
        }
    }

    /* loaded from: classes2.dex */
    private class ViewListAdapter extends UsableRecyclerView.Adapter<UsableRecyclerView.ViewHolder> {
        private SparseIntArray positionMap;

        private ViewListAdapter() {
            this.positionMap = new SparseIntArray(5);
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        /* renamed from: onCreateViewHolder  reason: collision with other method in class */
        public UsableRecyclerView.ViewHolder mo1206onCreateViewHolder(ViewGroup parent, int viewType) {
            return new UsableRecyclerView.ViewHolder((View) PostViewFragment.this.views.get(this.positionMap.get(viewType)));
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        public void onBindViewHolder(UsableRecyclerView.ViewHolder holder, int position) {
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        public int getItemCount() {
            return PostViewFragment.this.views.size();
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        public int getItemViewType(int position) {
            this.positionMap.put(((View) PostViewFragment.this.views.get(position)).getId(), position);
            return ((View) PostViewFragment.this.views.get(position)).getId();
        }
    }

    /* loaded from: classes2.dex */
    public static class GridLayoutManagerWithSmoothScroller extends GridLayoutManager {
        public GridLayoutManagerWithSmoothScroller(Context context) {
            super(context, 1);
        }

        @Override // android.support.v7.widget.LinearLayoutManager, android.support.v7.widget.RecyclerView.LayoutManager
        public void smoothScrollToPosition(RecyclerView recyclerView, RecyclerView.State state, int position) {
            RecyclerView.SmoothScroller smoothScroller = new TopSnappedSmoothScroller(recyclerView.getContext());
            smoothScroller.setTargetPosition(position);
            startSmoothScroll(smoothScroller);
        }

        /* loaded from: classes2.dex */
        private class TopSnappedSmoothScroller extends LinearSmoothScroller {
            public TopSnappedSmoothScroller(Context context) {
                super(context);
            }

            @Override // android.support.v7.widget.LinearSmoothScroller
            public PointF computeScrollVectorForPosition(int targetPosition) {
                return GridLayoutManagerWithSmoothScroller.this.computeScrollVectorForPosition(targetPosition);
            }

            @Override // android.support.v7.widget.LinearSmoothScroller
            protected int getVerticalSnapPreference() {
                return -1;
            }
        }
    }
}
