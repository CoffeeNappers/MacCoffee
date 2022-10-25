package com.vkontakte.android.fragments.messages;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import android.animation.AnimatorSet;
import android.animation.ObjectAnimator;
import android.app.Activity;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.SharedPreferences;
import android.content.res.Configuration;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.net.Uri;
import android.os.Bundle;
import android.os.Parcelable;
import android.preference.PreferenceManager;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.design.widget.CoordinatorLayout;
import android.support.v4.util.Pair;
import android.support.v4.view.ViewCompat;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.support.v7.widget.Toolbar;
import android.text.ClipboardManager;
import android.text.Editable;
import android.text.Spannable;
import android.text.SpannableStringBuilder;
import android.text.TextUtils;
import android.text.TextWatcher;
import android.text.style.ImageSpan;
import android.util.Base64;
import android.util.SparseArray;
import android.view.ActionMode;
import android.view.GestureDetector;
import android.view.KeyEvent;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.widget.EditText;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.ProgressBar;
import android.widget.TextView;
import android.widget.Toast;
import com.facebook.internal.NativeProtocol;
import com.fasterxml.jackson.core.util.MinimalPrettyPrinter;
import com.google.firebase.analytics.FirebaseAnalytics;
import com.vk.attachpicker.widget.VkBottomSheetBehavior;
import com.vk.core.util.KeyboardUtils;
import com.vk.imageloader.VKImageLoader;
import com.vkontakte.android.AudioMessagePlayerService;
import com.vkontakte.android.ChatUser;
import com.vkontakte.android.Global;
import com.vkontakte.android.Log;
import com.vkontakte.android.LongPollService;
import com.vkontakte.android.MainActivity;
import com.vkontakte.android.Message;
import com.vkontakte.android.NewsEntry;
import com.vkontakte.android.NotificationUtils;
import com.vkontakte.android.R;
import com.vkontakte.android.TimeUtils;
import com.vkontakte.android.UserProfile;
import com.vkontakte.android.VKAlertDialog;
import com.vkontakte.android.VKApplication;
import com.vkontakte.android.ViewUtils;
import com.vkontakte.android.ZhukovLayout;
import com.vkontakte.android.api.APIUtils;
import com.vkontakte.android.api.Group;
import com.vkontakte.android.api.SimpleCallback;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.api.groups.GroupsGetById;
import com.vkontakte.android.api.messages.MessagesGetLastActivity;
import com.vkontakte.android.api.messages.MessagesSetActivity;
import com.vkontakte.android.attachments.Attachment;
import com.vkontakte.android.attachments.AudioMessageAttachment;
import com.vkontakte.android.attachments.FwdMessagesAttachment;
import com.vkontakte.android.attachments.MarketAttachment;
import com.vkontakte.android.attachments.PendingAttachment;
import com.vkontakte.android.attachments.PendingAudioMessageAttachment;
import com.vkontakte.android.attachments.PendingPhotoAttachment;
import com.vkontakte.android.attachments.PostAttachment;
import com.vkontakte.android.attachments.PromoPostAttachment;
import com.vkontakte.android.attachments.StickerAttachment;
import com.vkontakte.android.auth.VKAccountManager;
import com.vkontakte.android.cache.Cache;
import com.vkontakte.android.data.Analytics;
import com.vkontakte.android.data.Friends;
import com.vkontakte.android.data.Messages;
import com.vkontakte.android.fragments.BackListener;
import com.vkontakte.android.fragments.HomeListener;
import com.vkontakte.android.fragments.ProfileFragment;
import com.vkontakte.android.fragments.VKToolbarFragment;
import com.vkontakte.android.fragments.market.GoodFragment;
import com.vkontakte.android.fragments.messages.ChatAttachmentHistoryFragment;
import com.vkontakte.android.fragments.messages.DialogsFragment;
import com.vkontakte.android.functions.VoidF0;
import com.vkontakte.android.navigation.ArgKeys;
import com.vkontakte.android.navigation.Navigate;
import com.vkontakte.android.navigation.Navigator;
import com.vkontakte.android.stickers.KeyboardPopup;
import com.vkontakte.android.stickers.Stickers;
import com.vkontakte.android.stickers.StickersView;
import com.vkontakte.android.ui.ErrorViewHelper;
import com.vkontakte.android.ui.Font;
import com.vkontakte.android.ui.MentionsAdapter;
import com.vkontakte.android.ui.MentionsManager;
import com.vkontakte.android.ui.RoundedImageView2;
import com.vkontakte.android.ui.WriteBar;
import com.vkontakte.android.ui.adapters.MessagesAdapter;
import com.vkontakte.android.ui.holder.messages.LoadMoreHolder;
import com.vkontakte.android.ui.holder.messages.MessageListItem;
import com.vkontakte.android.ui.holder.messages.MessageListItemHelper;
import com.vkontakte.android.ui.widget.ChatRecyclerView;
import com.vkontakte.android.ui.widget.MessageTimeAnchorView;
import com.vkontakte.android.ui.widget.MessagesTimesList;
import com.vkontakte.android.ui.widget.VKRecyclerView;
import com.vkontakte.android.upload.Upload;
import com.vkontakte.android.utils.ApiMethodsHelper;
import com.vkontakte.android.utils.TypefaceSpanAssets;
import com.vkontakte.android.utils.Utils;
import io.fabric.sdk.android.services.events.EventsFilesManager;
import io.reactivex.Observable;
import io.reactivex.android.schedulers.AndroidSchedulers;
import io.reactivex.functions.Consumer;
import io.reactivex.schedulers.Schedulers;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.File;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
import java.util.TimeZone;
import me.grishka.appkit.utils.V;
import me.grishka.appkit.views.UsableRecyclerView;
/* loaded from: classes3.dex */
public class ChatFragment extends VKToolbarFragment implements BackListener, HomeListener, StickerAttachment.Callback, MessageListItemHelper.MessageListItemHelperProvider, StickersView.Listener, WriteBar.MentionSuggestionsSupplier {
    static final /* synthetic */ boolean $assertionsDisabled;
    private static final int FORWARD_RESULT = 200;
    private static final String KEY_GROUP = "key_group";
    public static final int TWO_E9 = 2000000000;
    public static ChatFragment activeInstance;
    @Nullable
    public ActionMode actionMode;
    private MessagesAdapter adapter;
    private VkBottomSheetBehavior<RecyclerView> bottomSheetBehavior;
    @Nullable
    private LinearLayout contentView;
    private CoordinatorLayout coordinatorMentionWrap;
    @Nullable
    private ErrorViewHelper errorView;
    private Group group;
    private View jumpToEndBtn;
    private long lastTypingRequest;
    @Nullable
    private ChatRecyclerView list;
    @Nullable
    private MessagesTimesList listWrap;
    private LoadMoreHolder.LoaderMoreHolderData loadMoreView;
    private LoadMoreHolder.LoaderMoreHolderData loadMoreViewBtm;
    @Nullable
    private KeyboardPopup mKeyboardPopup;
    @Nullable
    private StickersView mStickersView;
    private MentionsAdapter mentionsAdapter;
    private View mentionsBottomDivider;
    private UsableRecyclerView mentionsRecyclerView;
    private int peer;
    @Nullable
    private ProgressBar progress;
    private boolean shouldShowMentions;
    private CharSequence subtitle;
    private CharSequence subtitleTyping;
    @Nullable
    MessageTimeAnchorView timeAnchorPan;
    @Nullable
    private WriteBar writeBar;
    private volatile boolean isGroupLoading = false;
    private VoidF0 typingInvalidate = ChatFragment$$Lambda$1.lambdaFactory$(this);
    private int lastTime = 0;
    private CharSequence titleWithoutIcon = null;
    private boolean isShowTyping = false;
    private ArrayList<MessageListItem> items = new ArrayList<>();
    private ArrayList<Message> messages = new ArrayList<>();
    private ArrayList<Message> preloadedMessages = new ArrayList<>();
    private ArrayList<Message> preloadedMessagesDown = new ArrayList<>();
    private boolean isActive = false;
    private SparseArray<String> userNamesAcc = new SparseArray<>();
    private final ArrayList<Integer> typingUsers = new ArrayList<>();
    private boolean networkError = false;
    public int searchedMessageId = 0;
    private Runnable hideSearchedBgRunnable = ChatFragment$$Lambda$2.lambdaFactory$(this);
    private View.OnClickListener showChatInfoClickListener = ChatFragment$$Lambda$3.lambdaFactory$(this);
    private BroadcastReceiver receiver = new BroadcastReceiver() { // from class: com.vkontakte.android.fragments.messages.ChatFragment.1
        {
            ChatFragment.this = this;
        }

        /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
        /* JADX WARN: Removed duplicated region for block: B:1163:? A[RETURN, SYNTHETIC] */
        /* JADX WARN: Removed duplicated region for block: B:939:0x0e87  */
        @Override // android.content.BroadcastReceiver
        /*
            Code decompiled incorrectly, please refer to instructions dump.
            To view partially-correct add '--show-bad-code' argument
        */
        public void onReceive(android.content.Context r54, android.content.Intent r55) {
            /*
                Method dump skipped, instructions count: 4832
                To view this dump add '--comments-level debug' option
            */
            throw new UnsupportedOperationException("Method not decompiled: com.vkontakte.android.fragments.messages.ChatFragment.AnonymousClass1.onReceive(android.content.Context, android.content.Intent):void");
        }
    };
    private SparseArray<UserProfile> chatUsers = new SparseArray<>();
    private SparseArray<UserProfile> usersBuf = new SparseArray<>();
    public View.OnClickListener chatUserClickListener = ChatFragment$$Lambda$4.lambdaFactory$(this);
    public View.OnLongClickListener chatUserLongClickListener = ChatFragment$$Lambda$5.lambdaFactory$(this);
    private boolean keyboardVisible = false;
    private ArrayList<Message> selectedMessages = new ArrayList<>();
    private ActionMode.Callback actionModeCallback = new ActionMode.Callback() { // from class: com.vkontakte.android.fragments.messages.ChatFragment.2
        {
            ChatFragment.this = this;
        }

        @Override // android.view.ActionMode.Callback
        public boolean onCreateActionMode(ActionMode mode, Menu menu) {
            mode.getMenuInflater().inflate(R.menu.chat_action_mode, menu);
            return true;
        }

        @Override // android.view.ActionMode.Callback
        public boolean onPrepareActionMode(ActionMode mode, Menu menu) {
            return true;
        }

        @Override // android.view.ActionMode.Callback
        public boolean onActionItemClicked(ActionMode mode, MenuItem item) {
            switch (item.getItemId()) {
                case R.id.reply /* 2131756517 */:
                    if (ChatFragment.this.writeBar != null) {
                        ChatFragment.this.writeBar.addFwdMessages(ChatFragment.this.selectedMessages);
                        break;
                    }
                    break;
                case R.id.forward /* 2131756518 */:
                    ChatFragment.this.forward(new ArrayList(ChatFragment.this.selectedMessages));
                    break;
                case R.id.copy /* 2131756519 */:
                    ClipboardManager cm = (ClipboardManager) ChatFragment.this.getActivity().getSystemService("clipboard");
                    cm.setText(((Message) ChatFragment.this.selectedMessages.get(0)).text);
                    Toast.makeText(ChatFragment.this.getActivity(), (int) R.string.text_copied, 0).show();
                    break;
                case R.id.delete /* 2131756520 */:
                    ChatFragment.this.confirmAndDelete(new ArrayList(ChatFragment.this.selectedMessages));
                    break;
            }
            mode.finish();
            return true;
        }

        @Override // android.view.ActionMode.Callback
        public void onDestroyActionMode(ActionMode mode) {
            ChatFragment.this.actionMode = null;
            ChatFragment.this.selectedMessages.clear();
            ChatFragment.this.adapter.notifyDataSetChanged();
        }
    };
    private ArrayList<Message> messagesToForward = new ArrayList<>();
    private boolean dataLoading = false;
    private boolean moreAvailable = true;
    private boolean preloading = false;
    private boolean preloadOnReady = false;
    private boolean dataLoadingDown = false;
    private boolean moreAvailableDown = true;
    private boolean preloadingDown = false;
    private boolean preloadOnReadyDown = false;
    private int offsetFromBottom = 0;
    private boolean hasSeparator = false;
    private boolean jumpedToEnd = false;
    private boolean relayoutThumbsRequested = false;
    private boolean restoringDraft = false;

    static {
        $assertionsDisabled = !ChatFragment.class.desiredAssertionStatus();
    }

    static /* synthetic */ int access$1008(ChatFragment x0) {
        int i = x0.offsetFromBottom;
        x0.offsetFromBottom = i + 1;
        return i;
    }

    @Override // com.vkontakte.android.ui.holder.messages.MessageListItemHelper.MessageListItemHelperProvider
    public String getUserName(int uid) {
        return this.userNamesAcc.get(uid, "...");
    }

    @Override // com.vkontakte.android.ui.holder.messages.MessageListItemHelper.MessageListItemHelperProvider
    public int getContentWidth() {
        if (this.contentView == null) {
            return 0;
        }
        return this.contentView.getWidth();
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
        lambda$onCreateContentView$9(att);
    }

    @Override // com.vk.emoji.EmojiKeyboardListener
    public void onEmojiSelected(String s) {
        EditText edit = (EditText) this.contentView.findViewById(R.id.writebar_edit);
        int pos = edit.getSelectionEnd();
        edit.getText().insert(pos, s);
        int pos2 = pos + s.length();
        edit.setSelection(pos2, pos2);
    }

    @Override // com.vk.emoji.EmojiKeyboardListener
    public void onBackspace() {
        this.contentView.findViewById(R.id.writebar_edit).dispatchKeyEvent(new KeyEvent(0, 67));
    }

    /* loaded from: classes3.dex */
    public static class Builder extends Navigator {
        static final String KEY_REF = "ref";
        static final String KEY_REF_SOURCE = "ref_source";

        public Builder(int uid, String title) {
            super(ChatFragment.class);
            this.args.putInt("id", uid);
            this.args.putString("title", title);
        }

        public Builder setPhoto(CharSequence photo) {
            if (photo != null) {
                this.args.putCharSequence("photo", photo);
            }
            return this;
        }

        public Builder setPhotos(ArrayList<String> photos) {
            this.args.putStringArrayList("photos", photos);
            return this;
        }

        public Builder setPost(Parcelable post) {
            this.args.putParcelable(ArgKeys.POST, post);
            return this;
        }

        public Builder setText(String text) {
            this.args.putString("text", text);
            return this;
        }

        public Builder setAttachments(Parcelable[] attachments) {
            this.args.putParcelableArray("attachments", attachments);
            return this;
        }

        public Builder setFwd(ArrayList<? extends Parcelable> fwd) {
            this.args.putParcelableArrayList(ArgKeys.FWD, fwd);
            return this;
        }

        public Builder setMessageId(int messageId) {
            this.args.putInt(LongPollService.EXTRA_MSG_ID, messageId);
            return this;
        }

        public Builder setRef(String ref) {
            this.args.putString(KEY_REF, ref);
            return this;
        }

        public Builder setRefSource(String refSource) {
            this.args.putString(KEY_REF_SOURCE, refSource);
            return this;
        }
    }

    public /* synthetic */ void lambda$new$0() {
        ViewUtils.invalidateViewCascade(getToolbar());
    }

    public boolean getAreMentionsEnabled() {
        return getIsMultiChat();
    }

    public boolean getIsMultiChat() {
        return this.peer > 2000000000;
    }

    public /* synthetic */ void lambda$new$1(View v) {
        if (this.peer < 2000000000) {
            if (this.peer >= -2000000000) {
                new ProfileFragment.Builder(this.peer).go(getActivity());
            }
        } else if (Messages.getChatAdmin(this.peer - 2000000000) != 0) {
            Bundle args = new Bundle();
            args.putInt("id", this.peer - 2000000000);
            args.putInt("admin", Messages.getChatAdmin(this.peer - 2000000000));
            args.putCharSequence("title", getArguments().getCharSequence("title"));
            Navigate.to(ChatMembersFragment.class, args, getActivity());
        }
    }

    public /* synthetic */ void lambda$new$2(View v) {
        int mid = ((Integer) v.getTag()).intValue();
        Iterator<Message> it = this.messages.iterator();
        while (it.hasNext()) {
            Message msg = it.next();
            if (msg.id == mid) {
                new ProfileFragment.Builder(msg.sender).go(getActivity());
            }
        }
    }

    public /* synthetic */ boolean lambda$new$3(View v) {
        int mid = ((Integer) v.getTag()).intValue();
        Iterator<Message> it = this.messages.iterator();
        while (it.hasNext()) {
            Message msg = it.next();
            if (msg.id == mid) {
                int uid = msg.sender;
                if (Utils.containsKey(this.chatUsers, uid)) {
                    String name = this.chatUsers.get(uid).fullName;
                    Toast t = Toast.makeText(getActivity(), name, 0);
                    int[] loc = {0, 0};
                    v.getLocationInWindow(loc);
                    Rect rect = new Rect();
                    getActivity().getWindow().getDecorView().getWindowVisibleDisplayFrame(rect);
                    t.setGravity(51, loc[0] - rect.left, (loc[1] + v.getHeight()) - rect.top);
                    t.show();
                }
            }
        }
        return true;
    }

    public ChatFragment() {
        setLayout(R.layout.subtitle_toolbar_fragment);
    }

    @Override // me.grishka.appkit.fragments.ToolbarFragment, me.grishka.appkit.fragments.AppKitFragment, android.app.DialogFragment, android.app.Fragment
    public void onDestroyView() {
        super.onDestroyView();
        this.contentView = null;
        this.writeBar = null;
        this.list = null;
        this.progress = null;
        this.errorView = null;
        this.actionMode = null;
        this.listWrap = null;
        this.jumpToEndBtn = null;
        this.mStickersView = null;
        this.mKeyboardPopup = null;
        this.timeAnchorPan = null;
        this.lastTime = 0;
    }

    @Override // me.grishka.appkit.fragments.AppKitFragment, android.app.DialogFragment, android.app.Fragment
    public void onSaveInstanceState(Bundle state) {
        state.putParcelable(KEY_GROUP, this.group);
        super.onSaveInstanceState(state);
    }

    @Override // com.vkontakte.android.fragments.VKToolbarFragment, me.grishka.appkit.fragments.AppKitFragment, android.app.Fragment
    public void onViewCreated(View view, Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);
        getToolbar().setOnClickListener(this.showChatInfoClickListener);
        setDialogIcon(getArguments().getCharSequence("photo"));
        setTitle(getArguments().getCharSequence("title"));
    }

    private void setDialogIcon(CharSequence photoChars) {
        Consumer<? super Throwable> consumer;
        String photo = photoChars == null ? null : photoChars.toString();
        if (this.writeBar != null) {
            this.writeBar.setGraffitiPhoto(photo);
        }
        Toolbar toolbar = getToolbar();
        if (toolbar != null) {
            Activity activity = getActivity();
            if (activity != null) {
                Drawable drawable = activity.getResources().getDrawable(R.drawable.placeholder_user_40dp);
                if (drawable instanceof BitmapDrawable) {
                    toolbar.setLogo(new RoundDrawable(((BitmapDrawable) drawable).getBitmap()));
                }
            }
            if (!TextUtils.isEmpty(photo)) {
                Observable<Bitmap> observeOn = VKImageLoader.getBitmap(Uri.parse(photo)).subscribeOn(Schedulers.io()).observeOn(AndroidSchedulers.mainThread());
                Consumer<? super Bitmap> lambdaFactory$ = ChatFragment$$Lambda$6.lambdaFactory$(toolbar);
                consumer = ChatFragment$$Lambda$7.instance;
                observeOn.subscribe(lambdaFactory$, consumer);
            }
        }
    }

    public static /* synthetic */ void lambda$setDialogIcon$5(Throwable throwable) throws Exception {
    }

    @Override // me.grishka.appkit.fragments.ToolbarFragment
    public View onCreateContentView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        Parcelable[] parcelableArray;
        Activity act = getActivity();
        this.contentView = new LinearLayout(act) { // from class: com.vkontakte.android.fragments.messages.ChatFragment.3
            {
                ChatFragment.this = this;
            }

            @Override // android.view.View
            public void onSizeChanged(int w, int h, int oldw, int oldh) {
                super.onSizeChanged(w, h, oldw, oldh);
                if (ChatFragment.this.mKeyboardPopup != null) {
                    ChatFragment.this.mKeyboardPopup.notifyLayoutHasChanged();
                }
            }
        };
        this.contentView.setLayoutParams(new ViewGroup.LayoutParams(-1, -1));
        this.contentView.setOrientation(1);
        ViewGroup wrap = new FrameLayout(act);
        this.contentView.addView(wrap, new LinearLayout.LayoutParams(-1, -1, 1.0f));
        this.writeBar = new WriteBar(act);
        this.writeBar.setChat(true);
        this.writeBar.giftAllowed = this.peer > 0 && !VKAccountManager.isCurrentUser(this.peer);
        if (this.writeBar.giftAllowed) {
            if (this.peer < 2000000000) {
                this.writeBar.giftUser = Friends.get(this.peer);
                if (this.writeBar.giftUser == null) {
                    this.writeBar.giftUser = new UserProfile();
                    this.writeBar.giftUser.uid = this.peer;
                    this.writeBar.giftUser.fullName = getArguments().getCharSequence("title").toString();
                    String[] arr = this.writeBar.giftUser.fullName.split(MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR);
                    this.writeBar.giftUser.firstName = arr[0];
                    this.writeBar.giftUser.lastName = arr.length > 1 ? arr[1] : "";
                    this.writeBar.giftUser.photo = getArguments().getCharSequence("photo").toString();
                }
            } else {
                this.writeBar.giftUsers = this.chatUsers;
            }
        }
        this.writeBar.moneyTransferAllowed = (this.peer < 2000000000 && this.peer > 0 && !VKAccountManager.isCurrentUser(this.peer) && VKAccountManager.getCurrent().moneyTransfersCanSend) || (this.peer < 0 && VKAccountManager.getCurrent().moneyTransfersCanSendToCommunities);
        this.writeBar.peerId = this.peer;
        this.writeBar.setFragment(this);
        this.contentView.addView(this.writeBar, new LinearLayout.LayoutParams(-1, -2));
        wrap.setBackgroundResource(R.color.messages_background_color);
        this.mStickersView = new StickersView(getActivity(), this);
        this.mKeyboardPopup = new KeyboardPopup(getActivity(), this.contentView, this.mStickersView);
        this.mKeyboardPopup.attachToAnchor(this.writeBar.getAnchor(), -1315086);
        this.mKeyboardPopup.setOnVisibilityChangedListener(this.writeBar);
        this.writeBar.setKeyboardPopup(this.mKeyboardPopup);
        this.writeBar.setAutoSuggestPopupListener(this);
        this.loadMoreView = new LoadMoreHolder.LoaderMoreHolderData();
        this.loadMoreViewBtm = new LoadMoreHolder.LoaderMoreHolderData();
        GestureDetector gestureDetector = new GestureDetector(getContext(), new GestureDetector.SimpleOnGestureListener() { // from class: com.vkontakte.android.fragments.messages.ChatFragment.4
            {
                ChatFragment.this = this;
            }

            @Override // android.view.GestureDetector.SimpleOnGestureListener, android.view.GestureDetector.OnGestureListener
            public boolean onScroll(MotionEvent e1, MotionEvent e2, float distanceX, float distanceY) {
                if (Math.abs(distanceX) > Math.abs(distanceY) * 2.0f) {
                    if (ChatFragment.this.isShowingTime()) {
                        ChatFragment.this.toggleTime();
                        return true;
                    } else if (!ChatFragment.this.isShowingTime() && distanceX > 0.0f) {
                        ChatFragment.this.toggleTime();
                        return true;
                    }
                }
                return false;
            }
        });
        this.list = (ChatRecyclerView) inflater.inflate(R.layout.chat_recycler_view, container, false);
        this.list.setGestureDetector(gestureDetector);
        this.list.getItemAnimator().setChangeDuration(this.list.getItemAnimator().getChangeDuration() / 3);
        this.list.getItemAnimator().setMoveDuration(this.list.getItemAnimator().getMoveDuration() / 3);
        this.list.getItemAnimator().setAddDuration(this.list.getItemAnimator().getAddDuration() / 3);
        this.list.getItemAnimator().setRemoveDuration(this.list.getItemAnimator().getRemoveDuration() / 3);
        this.list.addOnScrollListener(new RecyclerView.OnScrollListener() { // from class: com.vkontakte.android.fragments.messages.ChatFragment.5
            int scrollState = 0;

            {
                ChatFragment.this = this;
            }

            @Override // android.support.v7.widget.RecyclerView.OnScrollListener
            public void onScrollStateChanged(RecyclerView recyclerView, int newState) {
                this.scrollState = newState;
            }

            @Override // android.support.v7.widget.RecyclerView.OnScrollListener
            public void onScrolled(RecyclerView recyclerView, int dx, int dy) {
                if (dy < 0 && this.scrollState == 1) {
                    KeyboardUtils.hideKeyboard(ChatFragment.this.getActivity());
                }
                if (ChatFragment.this.jumpToEndBtn != null && ChatFragment.this.jumpToEndBtn.getVisibility() == 0 && !ChatFragment.this.jumpedToEnd) {
                    RecyclerView.LayoutManager lm = ChatFragment.this.list == null ? null : ChatFragment.this.list.getLayoutManager();
                    if (lm instanceof LinearLayoutManager) {
                        int lastPosition = ((LinearLayoutManager) lm).findLastCompletelyVisibleItemPosition();
                        if (lastPosition >= ChatFragment.this.items.size() - 2) {
                            ChatFragment.this.hideJumpButton();
                        }
                    }
                }
            }
        });
        this.list.setPadding(0, 0, 0, V.dp(6.0f));
        this.list.setClipToPadding(false);
        this.list.setLayoutManager(new LinearLayoutManager(act) { // from class: com.vkontakte.android.fragments.messages.ChatFragment.6
            {
                ChatFragment.this = this;
            }

            @Override // android.support.v7.widget.LinearLayoutManager, android.support.v7.widget.RecyclerView.LayoutManager
            public RecyclerView.LayoutParams generateDefaultLayoutParams() {
                return new RecyclerView.LayoutParams(-1, -2);
            }
        });
        this.adapter = new MessagesAdapter(this);
        this.adapter.setTopLoadingView(this.loadMoreView);
        this.adapter.setBottomLoadingView(this.loadMoreViewBtm);
        this.list.setAdapter(this.adapter);
        this.list.setId(R.id.list);
        this.list.setSelector(new ColorDrawable(0));
        this.list.delegate.setStackFromBottom(true);
        TextView emptyView = new TextView(act);
        emptyView.setText(R.string.no_messages);
        emptyView.setTextSize(18.0f);
        emptyView.setTextColor(Integer.MIN_VALUE);
        emptyView.setGravity(17);
        this.list.setEmptyView(emptyView);
        this.listWrap = new MessagesTimesList(act);
        this.listWrap.setList(this.list);
        this.listWrap.addView(this.list, new FrameLayout.LayoutParams(-1, -1, 17));
        this.listWrap.addView(emptyView);
        this.listWrap.setVisibility(8);
        wrap.addView(this.listWrap);
        this.timeAnchorPan = (MessageTimeAnchorView) View.inflate(getActivity(), R.layout.messages_time_anchor, null);
        this.timeAnchorPan.setList(this.list);
        wrap.addView(this.timeAnchorPan, this.timeAnchorPan.createNeededLayoutParams());
        this.progress = new ProgressBar(act);
        wrap.addView(this.progress, new FrameLayout.LayoutParams(Global.scale(50.0f), Global.scale(50.0f), 17));
        this.errorView = new ErrorViewHelper(View.inflate(getActivity(), R.layout.appkit_error, null));
        this.errorView.setVisibility(8);
        wrap.addView(this.errorView.getView());
        View shadow = new View(act);
        shadow.setLayoutParams(new FrameLayout.LayoutParams(-1, Global.scale(4.0f), 80));
        shadow.setBackgroundResource(R.drawable.bottom_shadow);
        wrap.addView(shadow);
        this.jumpToEndBtn = View.inflate(getActivity(), R.layout.messages_jump_btn, null);
        FrameLayout.LayoutParams layoutParams = new FrameLayout.LayoutParams(-2, -2, 8388693);
        layoutParams.setMargins(V.dp(6.0f), V.dp(2.0f), V.dp(6.0f), V.dp(2.0f));
        wrap.addView(this.jumpToEndBtn, layoutParams);
        this.jumpToEndBtn.setVisibility(8);
        this.jumpToEndBtn.setOnClickListener(ChatFragment$$Lambda$8.lambdaFactory$(this));
        this.loadMoreView.setOnClickListenerLoadMoreButton(ChatFragment$$Lambda$9.lambdaFactory$(this));
        if (getAreMentionsEnabled()) {
            this.coordinatorMentionWrap = new CoordinatorLayout(getActivity());
            FrameLayout.LayoutParams coordParams = new FrameLayout.LayoutParams(-1, -1);
            coordParams.setMargins(0, 0, 0, V.dp(0.5f));
            this.coordinatorMentionWrap.setLayoutParams(coordParams);
            this.coordinatorMentionWrap.setVisibility(8);
            MentionsManager mentionsManager = this.writeBar.setMentionSuggestionsSupplier(this);
            this.mentionsRecyclerView = new UsableRecyclerView(act);
            ViewCompat.setElevation(this.mentionsRecyclerView, V.dp(6.0f));
            this.mentionsRecyclerView.setLayoutManager(new LinearLayoutManager(act));
            CoordinatorLayout.LayoutParams lp = new CoordinatorLayout.LayoutParams(-1, -2);
            this.bottomSheetBehavior = new VkBottomSheetBehavior<>();
            this.bottomSheetBehavior.setBottomSheetCallback(new VkBottomSheetBehavior.BottomSheetCallback() { // from class: com.vkontakte.android.fragments.messages.ChatFragment.7
                {
                    ChatFragment.this = this;
                }

                @Override // com.vk.attachpicker.widget.VkBottomSheetBehavior.BottomSheetCallback
                public void onStateChanged(@NonNull View bottomSheet, int newState) {
                    if (newState == 5) {
                        ChatFragment.this.hideMentionSuggestions();
                    }
                }

                @Override // com.vk.attachpicker.widget.VkBottomSheetBehavior.BottomSheetCallback
                public void onSlide(@NonNull View bottomSheet, float slideOffset) {
                }

                @Override // com.vk.attachpicker.widget.VkBottomSheetBehavior.BottomSheetCallback
                public void onTargetStateChanged(@NonNull View bottomSheet, int targetState) {
                }
            });
            this.bottomSheetBehavior.setHideable(true);
            this.bottomSheetBehavior.setState(4);
            this.bottomSheetBehavior.setPeekHeight(V.dp(160.0f));
            lp.setBehavior(this.bottomSheetBehavior);
            this.mentionsRecyclerView.setLayoutParams(lp);
            this.mentionsRecyclerView.setBackgroundColor(-1);
            this.mentionsRecyclerView.setPadding(0, V.dp(6.0f), 0, 0);
            this.mentionsRecyclerView.setClipToPadding(false);
            wrap.addView(this.coordinatorMentionWrap);
            this.mentionsBottomDivider = new View(getActivity());
            this.mentionsBottomDivider.setBackgroundColor(-1710619);
            FrameLayout.LayoutParams dividerParams = new FrameLayout.LayoutParams(-1, V.dp(0.5f), 80);
            this.mentionsBottomDivider.setLayoutParams(dividerParams);
            wrap.addView(this.mentionsBottomDivider);
            this.coordinatorMentionWrap.addView(this.mentionsRecyclerView);
            this.mentionsAdapter = new MentionsAdapter(mentionsManager);
            this.mentionsAdapter.setUsers(this.chatUsers);
            this.mentionsRecyclerView.setAdapter(this.mentionsAdapter);
            this.coordinatorMentionWrap.setVisibility(8);
            this.mentionsBottomDivider.setVisibility(8);
        }
        this.list.addOnScrollListener(new RecyclerView.OnScrollListener() { // from class: com.vkontakte.android.fragments.messages.ChatFragment.8
            {
                ChatFragment.this = this;
            }

            @Override // android.support.v7.widget.RecyclerView.OnScrollListener
            public void onScrollStateChanged(RecyclerView recyclerView, int newState) {
                MessageTimeAnchorView.onScrollStateChanged(ChatFragment.this.timeAnchorPan, newState);
            }

            @Override // android.support.v7.widget.RecyclerView.OnScrollListener
            public void onScrolled(RecyclerView recyclerView, int dx, int dy) {
                int firstVisibleItem = ChatFragment.this.list.delegate.getFirstVisiblePosition();
                int visibleItemCount = ChatFragment.this.list.delegate.getVisibleItemCount();
                int totalItemCount = ChatFragment.this.list.getCount();
                ChatFragment.this.lastTime = MessageTimeAnchorView.checkTimeAnchor(ChatFragment.this.timeAnchorPan, ChatFragment.this.adapter, ChatFragment.this.lastTime);
                if (firstVisibleItem == 0 && !ChatFragment.this.dataLoading && ChatFragment.this.messages.size() > 0 && !ChatFragment.this.networkError && ((!ChatFragment.this.dataLoading || ChatFragment.this.preloading) && ChatFragment.this.moreAvailable)) {
                    if (ChatFragment.this.preloading) {
                        ChatFragment.this.preloading = false;
                        ChatFragment.this.preloadOnReady = true;
                    } else if (ChatFragment.this.preloadedMessages.size() > 0) {
                        ChatFragment.this.prependMessages(ChatFragment.this.preloadedMessages);
                        ChatFragment.this.preloadedMessages.clear();
                        ChatFragment.this.preloading = true;
                        ChatFragment.this.loadData(true);
                    } else {
                        ChatFragment.this.loadData(true);
                    }
                    ChatFragment.this.loadMoreView.setVisibilityProgressBar(0);
                    ChatFragment.this.loadMoreView.setVisibilityLoadMoreButton(4);
                }
                if (firstVisibleItem + visibleItemCount >= totalItemCount - 1 && !ChatFragment.this.dataLoadingDown && ChatFragment.this.messages.size() > 0) {
                    if (!ChatFragment.this.dataLoadingDown || ChatFragment.this.preloadingDown) {
                        if (ChatFragment.this.moreAvailableDown || ChatFragment.this.preloadedMessagesDown.size() > 0) {
                            if (ChatFragment.this.preloadingDown) {
                                ChatFragment.this.preloadingDown = false;
                                ChatFragment.this.preloadOnReadyDown = true;
                            } else if (ChatFragment.this.preloadedMessagesDown.size() > 0) {
                                ChatFragment.this.appendMessages(ChatFragment.this.preloadedMessagesDown);
                                ChatFragment.this.preloadedMessagesDown.clear();
                                ChatFragment.this.preloadingDown = true;
                                ChatFragment.this.loadData(false);
                                ChatFragment.this.loadMoreViewBtm.setVisibilityProgressBar(0);
                                ChatFragment.this.loadMoreViewBtm.setVisibilityLoadMoreButton(4);
                            } else if (ChatFragment.this.moreAvailableDown) {
                                ChatFragment.this.loadData(false);
                                ChatFragment.this.loadMoreViewBtm.setVisibilityProgressBar(0);
                                ChatFragment.this.loadMoreViewBtm.setVisibilityLoadMoreButton(4);
                            } else {
                                ChatFragment.this.loadMoreViewBtm.setVisibilityProgressBar(8);
                                ChatFragment.this.loadMoreViewBtm.setVisibilityLoadMoreButton(8);
                            }
                        }
                    }
                }
            }
        });
        this.writeBar.setOnSendClickListener(ChatFragment$$Lambda$10.lambdaFactory$(this));
        this.writeBar.setGraffitiSender(ChatFragment$$Lambda$11.lambdaFactory$(this));
        this.writeBar.setGraffitiAllowed(true);
        EditText editInput = (EditText) this.writeBar.findViewById(R.id.writebar_edit);
        editInput.setImeOptions(268435456);
        editInput.setOnKeyListener(ChatFragment$$Lambda$12.lambdaFactory$(this));
        editInput.addTextChangedListener(new TextWatcher() { // from class: com.vkontakte.android.fragments.messages.ChatFragment.9
            {
                ChatFragment.this = this;
            }

            @Override // android.text.TextWatcher
            public void afterTextChanged(Editable s) {
            }

            @Override // android.text.TextWatcher
            public void beforeTextChanged(CharSequence s, int start, int count, int after) {
            }

            @Override // android.text.TextWatcher
            public void onTextChanged(CharSequence s, int start, int before, int count) {
                if (s != null && s.length() > 0 && !ChatFragment.this.restoringDraft) {
                    ChatFragment.this.sendTypingIfNeeded();
                }
            }
        });
        editInput.setOnKeyListener(ChatFragment$$Lambda$13.lambdaFactory$(this));
        if (getArguments().containsKey(ArgKeys.FWD)) {
            ArrayList<Message> fwd = getArguments().getParcelableArrayList(ArgKeys.FWD);
            this.writeBar.addFwdMessages(fwd);
        }
        if (getArguments().containsKey(ArgKeys.POST)) {
            NewsEntry p = (NewsEntry) getArguments().getParcelable(ArgKeys.POST);
            Attachment att = null;
            if (p.type == 12) {
                att = new PromoPostAttachment(p);
            } else if (p.type == 0) {
                att = new PostAttachment(p);
            } else if (p.attachments.size() > 0) {
                Attachment att2 = p.attachments.get(0);
                att = att2;
            }
            if (att != null) {
                this.writeBar.addAttachment(att);
            }
        }
        if (getArguments().containsKey("photos")) {
            Iterator<String> it = getArguments().getStringArrayList("photos").iterator();
            while (it.hasNext()) {
                String photo = it.next();
                this.writeBar.addAttachment(new PendingPhotoAttachment(photo));
            }
        }
        if (getArguments().containsKey("text")) {
            this.writeBar.setText(getArguments().getString("text"));
        }
        if (getArguments().containsKey("attachments")) {
            for (Parcelable att3 : getArguments().getParcelableArray("attachments")) {
                this.writeBar.addAttachment((Attachment) att3);
            }
        }
        this.errorView.setOnRetryListener(ChatFragment$$Lambda$14.lambdaFactory$(this));
        if (this.group != null && !this.group.canMessage && -2.0E9d < this.peer && this.peer < 0) {
            setEnableWriteBarIfDoesNotHaveSpecialMarketAttachment(false);
        }
        loadData(true);
        if (Global.longPoll != null) {
            List<Integer> typings = Global.longPoll.getTypings(this.peer);
            if (typings.size() > 0) {
                this.typingUsers.addAll(typings);
                updateTyping();
            }
        }
        return this.contentView;
    }

    public /* synthetic */ void lambda$onCreateContentView$6(View v) {
        jumpToEnd();
    }

    public /* synthetic */ void lambda$onCreateContentView$7(View v) {
        this.networkError = false;
        this.loadMoreView.setVisibilityProgressBar(0);
        this.loadMoreView.setVisibilityLoadMoreButton(4);
        loadData(true);
    }

    public /* synthetic */ void lambda$onCreateContentView$8(View v) {
        sendMessage();
    }

    public /* synthetic */ boolean lambda$onCreateContentView$10(View v, int keyCode, KeyEvent event) {
        if (keyCode != 4 || this.keyboardVisible || this.mKeyboardPopup == null || !this.mKeyboardPopup.isShowing()) {
            return false;
        }
        if (event.getAction() != 1) {
            return true;
        }
        this.mKeyboardPopup.show(false);
        return true;
    }

    public /* synthetic */ boolean lambda$onCreateContentView$11(View v, int keyCode, KeyEvent event) {
        if (event != null && event.getAction() == 0 && event.getKeyCode() == 66) {
            boolean sendByEnter = PreferenceManager.getDefaultSharedPreferences(getActivity()).getBoolean("sendByEnter", false);
            if ((!sendByEnter || event.getMetaState() != 0) && (sendByEnter || (event.getMetaState() & 4096) <= 0)) {
                return false;
            }
            sendMessage();
            return true;
        }
        return false;
    }

    public /* synthetic */ void lambda$onCreateContentView$12(View v) {
        this.errorView.setVisibility(8);
        this.progress.setVisibility(0);
        loadData(true);
    }

    @Override // me.grishka.appkit.fragments.AppKitFragment, android.app.Fragment
    public void onAttach(Activity act) {
        super.onAttach(act);
        MarketAttachment.setLastSource(GoodFragment.Builder.Source.im);
        act.setTheme(R.style.BaseStyle_Messages);
        this.peer = getArguments().getInt("id", 0);
        setHasOptionsMenu(true);
    }

    public void setEnableWriteBarIfDoesNotHaveSpecialMarketAttachment(boolean b) {
        if (this.writeBar != null) {
            if (b) {
                ViewUtils.setEnabled(this.writeBar, true);
                return;
            }
            ArrayList<Attachment> attachments = this.writeBar.getAttachments();
            boolean hasSpecAttachment = false;
            int i = 0;
            while (true) {
                if (attachments == null || i >= attachments.size()) {
                    break;
                }
                Attachment attachment = attachments.get(i);
                if (!(attachment instanceof MarketAttachment) || ((MarketAttachment) attachment).canEdit) {
                    i++;
                } else {
                    hasSpecAttachment = true;
                    break;
                }
            }
            ViewUtils.setEnabled(this.writeBar, hasSpecAttachment);
        }
    }

    @Override // android.app.DialogFragment, android.app.Fragment
    public void onCreate(Bundle b) {
        super.onCreate(b);
        Stickers.get().checkServerUpdates();
        if (b != null) {
            this.group = (Group) b.getParcelable(KEY_GROUP);
        }
        IntentFilter filter = new IntentFilter();
        filter.addAction(LongPollService.ACTION_MESSAGE_DELETED);
        filter.addAction(LongPollService.ACTION_MESSAGE_RSTATE_CHANGED);
        filter.addAction(LongPollService.ACTION_NEW_MESSAGE);
        filter.addAction(LongPollService.ACTION_UPDATE_MESSAGE);
        filter.addAction(LongPollService.ACTION_TYPING);
        filter.addAction(LongPollService.ACTION_USER_PRESENCE);
        filter.addAction(LongPollService.ACTION_CHAT_CHANGED);
        filter.addAction(LongPollService.ACTION_DIALOG_CHANGED);
        filter.addAction(LongPollService.ACTION_MUTE_CHANGED);
        filter.addAction(LongPollService.ACTION_REFRESH_DIALOGS_LIST);
        filter.addAction(LongPollService.ACTION_COMMUNITY_MESSAGES_BLOCK_CHANGED);
        filter.addAction(Messages.ACTION_MESSAGE_ID_CHANGED);
        filter.addAction(Messages.ACTION_SEND_FAILED);
        filter.addAction(Upload.ACTION_UPLOAD_DONE);
        filter.addAction(AudioMessagePlayerService.ACTION_AUDIO_MESSAGE_DONE);
        VKApplication.context.registerReceiver(this.receiver, filter, "com.vkontakte.android.permission.ACCESS_DATA", null);
        this.searchedMessageId = getArguments().getInt(LongPollService.EXTRA_MSG_ID, 0);
    }

    public void hideSearchedMessageBg() {
        this.adapter.setSearchedViewBackgroundColor(this.searchedMessageId);
        this.searchedMessageId = 0;
    }

    @Override // android.app.Fragment
    public void onDestroy() {
        super.onDestroy();
        try {
            VKApplication.context.unregisterReceiver(this.receiver);
        } catch (Exception e) {
        }
        Activity activity = getActivity();
        activity.stopService(new Intent(activity, AudioMessagePlayerService.class));
    }

    @Override // android.app.Fragment
    public void onPause() {
        super.onPause();
        this.isActive = false;
        activeInstance = null;
        if (this.writeBar != null) {
            this.writeBar.onPause(getActivity());
        }
        saveDraft();
        ViewUtils.removeCallbacks(this.hideSearchedBgRunnable);
    }

    @Override // android.app.Fragment
    public void onResume() {
        super.onResume();
        this.isActive = true;
        activeInstance = this;
        markAsRead();
        this.restoringDraft = true;
        restoreDraft();
        this.restoringDraft = false;
        if (this.peer < 2000000000 && this.peer > 0) {
            updateOnline(Friends.getOnlineStatus(this.peer));
        } else if (this.peer < 0 && this.peer > -2000000000) {
            setSubtitle(R.string.group);
        }
        if (this.peer > 2000000000) {
            updateChatUsers(false);
        }
        if (this.searchedMessageId != 0) {
            ViewUtils.postDelayed(this.hideSearchedBgRunnable, 2000L);
        }
        if (this.writeBar != null) {
            this.writeBar.onResume(getActivity());
        }
    }

    @Override // me.grishka.appkit.fragments.AppKitFragment, android.app.Fragment, android.content.ComponentCallbacks
    public void onConfigurationChanged(Configuration cfg) {
        super.onConfigurationChanged(cfg);
        if (this.mKeyboardPopup != null && this.mKeyboardPopup.isShowing()) {
            this.mKeyboardPopup.show(false);
            this.mKeyboardPopup.notifyLayoutHasChanged();
            if (this.mStickersView != null) {
                this.mStickersView.dispatchConfigurationChanged(cfg);
            }
        }
        updateMentionsVisibility();
    }

    public void hideEmojiPopup() {
        if (this.mKeyboardPopup != null) {
            this.mKeyboardPopup.hide();
        }
    }

    private void saveDraft() {
        if ($assertionsDisabled || this.writeBar != null) {
            ArrayList<Attachment> atts = this.writeBar.getAttachments();
            SharedPreferences prefs = getActivity().getSharedPreferences("drafts", 0);
            if (atts.size() == 0 && this.writeBar.getText().length() == 0) {
                prefs.edit().remove("text" + this.peer).remove("attach" + this.peer).apply();
                return;
            }
            String satts = null;
            if (atts.size() > 0) {
                try {
                    ByteArrayOutputStream buf = new ByteArrayOutputStream();
                    DataOutputStream os = new DataOutputStream(buf);
                    os.writeInt(atts.size());
                    Iterator<Attachment> it = atts.iterator();
                    while (it.hasNext()) {
                        Attachment att = it.next();
                        att.serialize(os);
                    }
                    satts = Base64.encodeToString(buf.toByteArray(), 0);
                } catch (Exception e) {
                }
            }
            SharedPreferences.Editor ed = prefs.edit().putString("text" + this.peer, this.writeBar.getText());
            String mentions = this.writeBar.getMentionsForSerialization();
            if (!mentions.isEmpty()) {
                ed.putString("mentions" + this.peer, mentions);
            }
            if (satts != null) {
                ed.putString("attach" + this.peer, satts);
            }
            ed.apply();
            return;
        }
        throw new AssertionError();
    }

    private void restoreDraft() {
        if ($assertionsDisabled || this.writeBar != null) {
            ArrayList<Attachment> atts = this.writeBar.getAttachments();
            if (atts.size() <= 0 && this.writeBar.getText().length() <= 0) {
                SharedPreferences prefs = getActivity().getSharedPreferences("drafts", 0);
                if (prefs.contains("text" + this.peer)) {
                    this.writeBar.setText(prefs.getString("text" + this.peer, ""));
                    if (prefs.contains("mentions" + this.peer)) {
                        this.writeBar.setMentionsFromSerializedString(prefs.getString("mentions" + this.peer, ""));
                    }
                    if (prefs.contains("attach" + this.peer)) {
                        try {
                            DataInputStream is = new DataInputStream(new ByteArrayInputStream(Base64.decode(prefs.getString("attach" + this.peer, ""), 0)));
                            int count = is.readInt();
                            for (int i = 0; i < count; i++) {
                                Attachment att = Attachment.deserialize(is);
                                if (!(att instanceof MarketAttachment) || ((MarketAttachment) att).canEdit) {
                                    this.writeBar.addAttachment(att);
                                } else {
                                    this.writeBar.setText(null);
                                }
                            }
                        } catch (Exception e) {
                        }
                    }
                    prefs.edit().remove("text" + this.peer).apply();
                    prefs.edit().remove("attach" + this.peer).apply();
                    prefs.edit().remove("mentions" + this.peer).apply();
                    return;
                }
                return;
            }
            return;
        }
        throw new AssertionError();
    }

    public void updateOnline(int online) {
        setSubtitle(getOnlineString(online));
        if (online == 0) {
            new MessagesGetLastActivity(this.peer).setCallback(new SimpleCallback<MessagesGetLastActivity.Result>() { // from class: com.vkontakte.android.fragments.messages.ChatFragment.10
                {
                    ChatFragment.this = this;
                }

                /* JADX WARN: Multi-variable type inference failed */
                @Override // com.vkontakte.android.api.Callback
                public void success(MessagesGetLastActivity.Result res) {
                    if (res.time <= 0 || res.online != 0 || ChatFragment.this.getActivity() == null) {
                        ChatFragment.this.setSubtitle(ChatFragment.this.getOnlineString(res.online));
                        return;
                    }
                    CharSequence lastSeen = ChatFragment.this.getString(res.f ? R.string.last_seen_profile_f : R.string.last_seen_profile_m, new Object[]{TimeUtils.langDate(res.time)});
                    if (res.mobile) {
                        SpannableStringBuilder bldr = new SpannableStringBuilder(lastSeen);
                        Spannable sp = Spannable.Factory.getInstance().newSpannable("F");
                        Drawable d = ChatFragment.this.getResources().getDrawable(R.drawable.ic_left_online_mobile_xml);
                        d.setBounds(0, 0, d.getIntrinsicWidth(), d.getIntrinsicHeight());
                        sp.setSpan(new ImageSpan(d, 1), 0, 1, 0);
                        bldr.append((CharSequence) " ");
                        bldr.append((CharSequence) sp);
                        lastSeen = bldr;
                    }
                    ChatFragment.this.setSubtitle(lastSeen);
                }
            }).exec((Context) getActivity());
        }
    }

    public CharSequence getOnlineString(int online) {
        String base = getString(online > 0 ? R.string.online : R.string.offline);
        if (online == 0 || online == 1) {
            return base;
        }
        SpannableStringBuilder bldr = new SpannableStringBuilder(base);
        Spannable sp = Spannable.Factory.getInstance().newSpannable("F");
        Drawable d = getResources().getDrawable(R.drawable.ic_left_online_mobile_xml);
        d.setBounds(0, 0, d.getIntrinsicWidth(), d.getIntrinsicHeight());
        sp.setSpan(new ImageSpan(d, 1), 0, 1, 0);
        bldr.append((CharSequence) " ");
        bldr.append((CharSequence) sp);
        return bldr;
    }

    public void updateChatUsers(boolean forceReload) {
        if (forceReload) {
            Cache.setNeedUpdateChat(this.peer - 2000000000);
        }
        Messages.getChatUsers(this.peer - 2000000000, ChatFragment$$Lambda$15.lambdaFactory$(this));
    }

    public /* synthetic */ void lambda$updateChatUsers$15(ArrayList users, String title, String photo) {
        if (getActivity() != null) {
            Iterator it = users.iterator();
            while (it.hasNext()) {
                ChatUser user = (ChatUser) it.next();
                if (user != null && user.user != null) {
                    this.chatUsers.put(user.user.uid, user.user);
                }
            }
            ArrayList<Integer> needUsers = new ArrayList<>();
            Iterator<Message> it2 = this.messages.iterator();
            while (it2.hasNext()) {
                Message msg = it2.next();
                if (msg.sender != VKAccountManager.getCurrent().getUid() && !Utils.containsKey(this.chatUsers, msg.sender) && !needUsers.contains(Integer.valueOf(msg.sender))) {
                    needUsers.add(Integer.valueOf(msg.sender));
                }
            }
            if (needUsers.size() > 0) {
                Friends.getUsers(needUsers, ChatFragment$$Lambda$27.lambdaFactory$(this));
            }
            ViewUtils.runOnUiThread(ChatFragment$$Lambda$28.lambdaFactory$(this, title, users, photo));
        }
    }

    public /* synthetic */ void lambda$null$13(ArrayList users1) {
        Iterator it = users1.iterator();
        while (it.hasNext()) {
            UserProfile user = (UserProfile) it.next();
            if (user != null) {
                this.chatUsers.put(user.uid, user);
            }
        }
        if (getActivity() != null) {
            ViewUtils.runOnUiThread(ChatFragment$$Lambda$29.lambdaFactory$(this));
        }
    }

    public /* synthetic */ void lambda$null$14(String title, ArrayList users, String photo) {
        if (isAdded() && getActivity() != null) {
            updateChatUsersPhotos();
            setTitle(title);
            if (users.size() > 0) {
                setSubtitle(getResources().getQuantityString(R.plurals.chat_members, users.size(), Integer.valueOf(users.size())));
                if (TextUtils.isEmpty(photo)) {
                    photo = Messages.createChatPhoto(users);
                }
                setDialogIcon(photo);
            } else if (!TextUtils.isEmpty(photo)) {
                setDialogIcon(photo);
            }
            updateTyping();
            invalidateOptionsMenu();
            if (getAreMentionsEnabled()) {
                this.mentionsAdapter.setUsers(this.chatUsers);
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // me.grishka.appkit.fragments.AppKitFragment
    public void setTitle(CharSequence title) {
        if (this.writeBar != null) {
            this.writeBar.setGraffitiTitle(String.valueOf(title));
        }
        this.titleWithoutIcon = title;
        if (title != null) {
            Spannable sb = Spannable.Factory.getInstance().newSpannable(title);
            sb.setSpan(new TypefaceSpanAssets(Font.Medium.typeface), 0, sb.length(), 0);
            SpannableStringBuilder builder = new SpannableStringBuilder();
            builder.append((CharSequence) sb);
            if (!NotificationUtils.arePeerNotificationsEnabled(VKApplication.context, this.peer)) {
                Spannable sp = Spannable.Factory.getInstance().newSpannable("M");
                Drawable d = getResources().getDrawable(R.drawable.ic_messages_muted_white);
                d.setBounds(0, 0, d.getIntrinsicWidth(), d.getIntrinsicHeight());
                sp.setSpan(new ImageSpan(d, 1), 0, 1, 0);
                builder.append((CharSequence) MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR).append((CharSequence) sp);
            }
            Global.replaceEmoji(builder);
            super.setTitle(builder);
        }
    }

    @Override // com.vkontakte.android.ui.holder.messages.MessageListItemHelper.MessageListItemHelperProvider
    public void setHasSeparator(boolean b) {
        this.hasSeparator = b;
    }

    @Override // com.vkontakte.android.ui.holder.messages.MessageListItemHelper.MessageListItemHelperProvider
    public boolean isJumpedToEnd() {
        return this.jumpedToEnd;
    }

    private void jumpToEnd() {
        if (this.offsetFromBottom == 0) {
            smoothScrollToBottom();
            hideJumpButton();
        } else if (this.jumpToEndBtn != null) {
            hideJumpButton();
            loadDataUp(false);
            this.jumpedToEnd = true;
        }
    }

    public void smoothScrollToBottom() {
        if (this.list != null) {
            this.list.smoothScrollToPosition(this.items.size());
        }
    }

    private void scrollToNewMessage() {
        RecyclerView.LayoutManager lm = this.list == null ? null : this.list.getLayoutManager();
        if (lm instanceof LinearLayoutManager) {
            int lastPosition = ((LinearLayoutManager) lm).findLastCompletelyVisibleItemPosition();
            if (lastPosition >= this.items.size() - 1) {
                this.list.scrollToPosition(this.items.size());
            } else {
                smoothScrollToBottom();
            }
        }
    }

    public void hideJumpButton() {
        final View v = this.jumpToEndBtn;
        if (v != null) {
            AnimatorSet set = new AnimatorSet();
            set.playTogether(ObjectAnimator.ofFloat(v, "alpha", 0.0f), ObjectAnimator.ofFloat(v, "translationY", v.getHeight() / 2));
            set.setDuration(300L);
            set.addListener(new AnimatorListenerAdapter() { // from class: com.vkontakte.android.fragments.messages.ChatFragment.11
                {
                    ChatFragment.this = this;
                }

                @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
                public void onAnimationEnd(Animator a) {
                    v.setAlpha(1.0f);
                    v.setTranslationY(0.0f);
                    v.setVisibility(8);
                    v.setEnabled(true);
                }
            });
            set.start();
        }
    }

    public void showJumpButton() {
        final View v = this.jumpToEndBtn;
        if (v != null && v.getVisibility() != 0) {
            v.setVisibility(0);
            AnimatorSet set = new AnimatorSet();
            set.playTogether(ObjectAnimator.ofFloat(v, "alpha", 0.0f, 1.0f), ObjectAnimator.ofFloat(v, "translationY", v.getHeight() / 2, 0.0f));
            set.setDuration(300L);
            set.addListener(new AnimatorListenerAdapter() { // from class: com.vkontakte.android.fragments.messages.ChatFragment.12
                {
                    ChatFragment.this = this;
                }

                @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
                public void onAnimationEnd(Animator a) {
                    v.setAlpha(1.0f);
                    v.setTranslationY(0.0f);
                    v.setVisibility(0);
                    v.setEnabled(true);
                }
            });
            set.start();
        }
    }

    public int getPeerID() {
        return this.peer;
    }

    public void updateTyping() {
        showTyping(this.typingUsers.size() > 0);
        this.subtitleTyping = ViewUtils.getTypingText(getActivity(), this.peer, this.typingUsers, this.chatUsers, this.typingInvalidate, -1);
        if (this.isShowTyping) {
            setSubtitle(this.subtitleTyping, false);
        }
    }

    @Override // com.vkontakte.android.ui.holder.messages.MessageListItemHelper.MessageListItemHelperProvider
    public UserProfile getChatUser(int uid) {
        if (Utils.containsKey(this.chatUsers, uid)) {
            return this.chatUsers.get(uid);
        }
        if (Utils.containsKey(this.usersBuf, uid)) {
            return this.usersBuf.get(uid);
        }
        UserProfile p = new UserProfile();
        p.fullName = "...";
        p.lastName = "...";
        p.firstName = "...";
        Log.w("vk", "getChatUser: unknown user " + uid);
        return p;
    }

    private Message getMessage(int id) {
        Iterator<Message> it = this.messages.iterator();
        while (it.hasNext()) {
            Message m = it.next();
            if (m.id == id) {
                return m;
            }
        }
        return null;
    }

    public Pair<Message, Integer> getMessageAndIndex(int id) {
        for (int i = 0; i < this.messages.size(); i++) {
            Message m = this.messages.get(i);
            if (m.id == id) {
                return new Pair<>(m, Integer.valueOf(i));
            }
        }
        return null;
    }

    @Override // android.app.Fragment
    public void onPrepareOptionsMenu(Menu menu) {
        super.onPrepareOptionsMenu(menu);
        MenuItem menuItemTmp = menu.findItem(R.id.chat_leave);
        if (menuItemTmp != null) {
            menuItemTmp.setTitle(TextUtils.isEmpty(this.subtitle) ? R.string.return_to_chat : R.string.chat_leave);
        }
    }

    @Override // android.app.Fragment
    public void onCreateOptionsMenu(Menu menu, MenuInflater inflater) {
        boolean z = true;
        if (this.peer < 2000000000 && this.peer >= -2000000000) {
            inflater.inflate(R.menu.dialog, menu);
        } else if (this.peer >= 2000000000) {
            inflater.inflate(R.menu.chat, menu);
        }
        boolean isEnabled = NotificationUtils.arePeerNotificationsEnabled(getActivity(), this.peer);
        boolean isDenyMessages = this.group != null && this.group.messagesBlocked;
        MenuItem menuItemTmp = menu.findItem(R.id.chat_mute);
        if (menuItemTmp != null) {
            menuItemTmp.setVisible(isEnabled);
        }
        MenuItem menuItemTmp2 = menu.findItem(R.id.chat_unmute);
        if (menuItemTmp2 != null) {
            menuItemTmp2.setVisible(!isEnabled);
        }
        MenuItem menuItemTmp3 = menu.findItem(R.id.chat_leave);
        if (menuItemTmp3 != null) {
            menuItemTmp3.setTitle(TextUtils.isEmpty(this.subtitle) ? R.string.return_to_chat : R.string.chat_leave);
        }
        MenuItem menuItemTmp4 = menu.findItem(R.id.chat_deny_messaging);
        if (menuItemTmp4 != null) {
            menuItemTmp4.setVisible(!isDenyMessages && this.group != null);
        }
        MenuItem menuItemTmp5 = menu.findItem(R.id.chat_allow_messaging);
        if (menuItemTmp5 != null) {
            if (!isDenyMessages || this.group == null) {
                z = false;
            }
            menuItemTmp5.setVisible(z);
        }
    }

    @Override // android.app.Fragment
    public boolean onOptionsItemSelected(MenuItem item) {
        switch (item.getItemId()) {
            case R.id.chat_attachments /* 2131756511 */:
                new ChatAttachmentHistoryFragment.Builder(getPeerID()).go(getActivity());
                break;
            case R.id.chat_mute /* 2131756512 */:
            case R.id.chat_unmute /* 2131756513 */:
                NotificationUtils.setEnableDialogNotification(getActivity(), this.peer, !NotificationUtils.arePeerNotificationsEnabled(getActivity(), this.peer));
                setTitle(this.titleWithoutIcon);
                invalidateOptionsMenu();
                break;
            case R.id.chat_settings /* 2131756514 */:
                this.showChatInfoClickListener.onClick(null);
                break;
            case R.id.chat_clear_history /* 2131756515 */:
                ApiMethodsHelper.clearHistory(getActivity(), this.peer, null, ChatFragment$$Lambda$16.lambdaFactory$(this));
                break;
            case R.id.chat_leave /* 2131756516 */:
                if (TextUtils.isEmpty(this.subtitle)) {
                    ApiMethodsHelper.addUserToChat(getActivity(), this.peer - 2000000000, null, VKAccountManager.getCurrent().getUid(), new SimpleCallback<Boolean>() { // from class: com.vkontakte.android.fragments.messages.ChatFragment.13
                        {
                            ChatFragment.this = this;
                        }

                        @Override // com.vkontakte.android.api.Callback
                        public void success(Boolean result) {
                            ChatFragment.this.updateChatUsers(false);
                        }
                    });
                    break;
                } else {
                    ApiMethodsHelper.removeUserFromChat(getActivity(), this.peer - 2000000000, VKAccountManager.getCurrent().getUid(), ChatFragment$$Lambda$17.lambdaFactory$(this));
                    break;
                }
            case R.id.chat_allow_messaging /* 2131756522 */:
            case R.id.chat_deny_messaging /* 2131756523 */:
                if (this.group != null) {
                    final boolean isBlocked = this.group.messagesBlocked;
                    SimpleCallback<Boolean> callback = new SimpleCallback<Boolean>() { // from class: com.vkontakte.android.fragments.messages.ChatFragment.14
                        {
                            ChatFragment.this = this;
                        }

                        @Override // com.vkontakte.android.api.Callback
                        public void success(Boolean result) {
                            Intent intent = new Intent(LongPollService.ACTION_COMMUNITY_MESSAGES_BLOCK_CHANGED);
                            intent.putExtra("is_messages_blocked", !isBlocked);
                            intent.putExtra("id", ChatFragment.this.peer);
                            ChatFragment.this.getContext().sendBroadcast(intent, "com.vkontakte.android.permission.ACCESS_DATA");
                        }
                    };
                    if (isBlocked) {
                        ApiMethodsHelper.allowMessagesFromGroup(getContext(), this.group.id, callback);
                        break;
                    } else {
                        ApiMethodsHelper.denyMessagesFromGroup(getContext(), this.group.id, callback);
                        break;
                    }
                }
                break;
        }
        return super.onOptionsItemSelected(item);
    }

    public /* synthetic */ void lambda$onOptionsItemSelected$16(Integer uid, Object o) {
        this.messages.clear();
        rebuildItems();
    }

    public /* synthetic */ void lambda$onOptionsItemSelected$17(Integer uid) {
        if (getActivity() != null) {
            getActivity().onBackPressed();
        }
    }

    public void loadGroupInfo(boolean reload) {
        int id = getArguments().getInt("id", 0);
        if ((this.group == null || reload) && -2.0E9d < this.peer && this.peer < 0 && !this.isGroupLoading) {
            this.isGroupLoading = true;
            if (id < 0) {
                id = -id;
            }
            new GroupsGetById(id).setCallback(new SimpleCallback<Group>() { // from class: com.vkontakte.android.fragments.messages.ChatFragment.15
                {
                    ChatFragment.this = this;
                }

                @Override // com.vkontakte.android.api.Callback
                public void success(Group result) {
                    ChatFragment.this.group = result;
                    ChatFragment.this.setEnableWriteBarIfDoesNotHaveSpecialMarketAttachment(result.canMessage);
                    ChatFragment.this.isGroupLoading = false;
                    ChatFragment.this.invalidateOptionsMenu();
                }

                @Override // com.vkontakte.android.api.SimpleCallback, com.vkontakte.android.api.Callback
                public void fail(VKAPIRequest.VKErrorResponse error) {
                    super.fail(error);
                    ChatFragment.this.isGroupLoading = false;
                }
            }).exec((Context) getActivity());
        }
    }

    public void loadData(boolean up) {
        loadGroupInfo(false);
        if (up) {
            loadDataUp(true);
        } else {
            loadDataDown();
        }
    }

    public void loadDataUp(boolean fromUnread) {
        this.dataLoading = true;
        int offset = this.messages.size();
        int startMid = getArguments().getInt(LongPollService.EXTRA_MSG_ID);
        int count = this.preloading ? 30 : 60;
        if (offset == 0 && (fromUnread || startMid > 0)) {
            if (startMid == 0) {
                startMid = -1;
            }
            offset = -20;
        } else if (!fromUnread) {
            offset = 0;
        } else if (this.offsetFromBottom > 0) {
            offset = this.offsetFromBottom + this.messages.size();
        }
        long startTime = System.currentTimeMillis();
        Messages.getHistory(this.peer, offset, count, startMid, new AnonymousClass16(fromUnread, startTime));
    }

    /* renamed from: com.vkontakte.android.fragments.messages.ChatFragment$16 */
    /* loaded from: classes3.dex */
    public class AnonymousClass16 implements Messages.GetMessagesCallback {
        final /* synthetic */ boolean val$fromUnread;
        final /* synthetic */ long val$startTime;

        AnonymousClass16(boolean z, long j) {
            ChatFragment.this = this$0;
            this.val$fromUnread = z;
            this.val$startTime = j;
        }

        @Override // com.vkontakte.android.data.Messages.GetMessagesCallback
        public void onMessagesLoaded(ArrayList<Message> msgs, int offsetFromBtm) {
            if (ChatFragment.this.getActivity() == null) {
                ChatFragment.this.dataLoading = false;
                return;
            }
            if (!this.val$fromUnread) {
                ChatFragment.this.messages.clear();
                ChatFragment.this.preloadedMessages.clear();
                ChatFragment.this.preloadedMessagesDown.clear();
                ChatFragment.this.offsetFromBottom = 0;
            }
            if (ChatFragment.this.messages.size() == 0) {
                ChatFragment.this.offsetFromBottom = offsetFromBtm;
            }
            HashSet<Integer> needUsersAcc = new HashSet<>();
            Iterator<Message> it = msgs.iterator();
            while (it.hasNext()) {
                Message m = it.next();
                if (m.isServiceMessage && m.extras.containsKey("action_mid") && !Utils.containsKey(ChatFragment.this.userNamesAcc, m.extras.getInt("action_mid"))) {
                    needUsersAcc.add(Integer.valueOf(m.extras.getInt("action_mid")));
                }
            }
            if (needUsersAcc.size() > 0) {
                ArrayList<Integer> uids = new ArrayList<>();
                uids.addAll(needUsersAcc);
                List<UserProfile> users = Friends.getUsersBlocking(uids, 3);
                for (UserProfile p : users) {
                    ChatFragment.this.userNamesAcc.put(p.uid, p.fullName);
                }
            }
            if (ChatFragment.this.getActivity() != null) {
                ChatFragment.this.getActivity().runOnUiThread(ChatFragment$16$$Lambda$1.lambdaFactory$(this, this.val$fromUnread, msgs, this.val$startTime));
            }
        }

        public /* synthetic */ void lambda$onMessagesLoaded$0(boolean fromUnread, ArrayList msgs, long startTime) {
            boolean btnVisible = ChatFragment.this.jumpToEndBtn != null && ChatFragment.this.jumpToEndBtn.getVisibility() == 0;
            if (ChatFragment.this.jumpToEndBtn != null && !btnVisible && ChatFragment.this.offsetFromBottom > 0) {
                ChatFragment.this.jumpToEndBtn.setVisibility(0);
            }
            if (!fromUnread) {
                ChatFragment.this.items.clear();
            }
            ArrayList<Integer> mids = new ArrayList<>();
            Iterator it = ChatFragment.this.messages.iterator();
            while (it.hasNext()) {
                mids.add(Integer.valueOf(((Message) it.next()).id));
            }
            Iterator it2 = ChatFragment.this.preloadedMessages.iterator();
            while (it2.hasNext()) {
                mids.add(Integer.valueOf(((Message) it2.next()).id));
            }
            Iterator<Message> imsgs = msgs.iterator();
            while (imsgs.hasNext()) {
                Message m = imsgs.next();
                if (mids.contains(Integer.valueOf(m.id))) {
                    imsgs.remove();
                } else {
                    mids.add(Integer.valueOf(m.id));
                }
            }
            if (ChatFragment.this.messages.size() == 0) {
                ErrorViewHelper.setVisibility(ChatFragment.this.errorView, 8);
                if (System.currentTimeMillis() - startTime < 100) {
                    ViewUtils.setVisibility(ChatFragment.this.listWrap, 0);
                    ViewUtils.setVisibility(ChatFragment.this.progress, 8);
                } else {
                    ViewUtils.setVisibilityAnimated(ChatFragment.this.listWrap, 0);
                    ViewUtils.setVisibilityAnimated(ChatFragment.this.progress, 8);
                }
            }
            ChatFragment.this.moreAvailableDown = ChatFragment.this.offsetFromBottom > 0;
            if (!ChatFragment.this.moreAvailableDown) {
                ChatFragment.this.loadMoreViewBtm.setVisibilityLoadMoreButton(8);
                ChatFragment.this.loadMoreViewBtm.setVisibilityProgressBar(8);
            }
            if (msgs.size() == 0) {
                ChatFragment.this.loadMoreView.setVisibilityLoadMoreButton(8);
                ChatFragment.this.loadMoreView.setVisibilityProgressBar(8);
                ChatFragment.this.moreAvailable = false;
                ChatFragment.this.dataLoading = false;
                return;
            }
            ChatFragment.this.loadMoreView.setVisibilityLoadMoreButton(0);
            ChatFragment.this.loadMoreView.setVisibilityProgressBar(8);
            ChatFragment.this.moreAvailable = true;
            if (ChatFragment.this.preloading) {
                ChatFragment.this.preloadedMessages.addAll(msgs);
            } else if (msgs.size() > 30) {
                ChatFragment.this.prependMessages(msgs.subList(msgs.size() - 30, msgs.size()));
                ChatFragment.this.preloadedMessages.addAll(msgs.subList(0, msgs.size() - 30));
            } else {
                ChatFragment.this.prependMessages(msgs);
            }
            if (ChatFragment.this.isActive) {
                ChatFragment.this.markAsRead();
            }
            ChatFragment.this.dataLoading = false;
            ChatFragment.this.preloading = false;
            if (ChatFragment.this.preloadOnReady) {
                ChatFragment.this.preloading = true;
                ChatFragment.this.preloadOnReady = false;
                ChatFragment.this.loadDataUp(true);
            }
            int startMid1 = ChatFragment.this.getArguments().getInt(LongPollService.EXTRA_MSG_ID);
            if (startMid1 > 0) {
                int i = 0;
                while (true) {
                    if (i < ChatFragment.this.items.size()) {
                        if (ChatFragment.this.list != null && ((MessageListItem) ChatFragment.this.items.get(i)).msgId == startMid1) {
                            ChatFragment.this.list.delegate.setSelectionFromTop(i, Global.scale(70.0f));
                            break;
                        }
                        i++;
                    } else {
                        break;
                    }
                }
                ChatFragment.this.getArguments().remove(LongPollService.EXTRA_MSG_ID);
            }
            if (ChatFragment.this.jumpToEndBtn != null && ChatFragment.this.list != null && !fromUnread && ChatFragment.this.jumpToEndBtn.getVisibility() == 0) {
                ChatFragment.this.smoothScrollToBottom();
            }
            if (ChatFragment.this.writeBar != null) {
                ChatFragment.this.writeBar.setErrorViewShown(false);
            }
            ChatFragment.this.updateList();
        }

        @Override // com.vkontakte.android.data.Messages.GetMessagesCallback
        public void onError(int code, String msg) {
            Log.i("vk", "error isLoading history " + code + MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR + msg + " act=" + ChatFragment.this.getActivity());
            if (ChatFragment.this.messages.size() == 0 && this.val$fromUnread) {
                if (ChatFragment.this.getActivity() != null) {
                    ChatFragment.this.getActivity().runOnUiThread(ChatFragment$16$$Lambda$2.lambdaFactory$(this, code, msg));
                }
            } else if (ChatFragment.this.getActivity() != null) {
                ChatFragment.this.getActivity().runOnUiThread(ChatFragment$16$$Lambda$3.lambdaFactory$(this, code, msg));
            }
            ChatFragment.this.dataLoading = false;
        }

        public /* synthetic */ void lambda$onError$1(int code, String msg) {
            if (ChatFragment.this.errorView != null && ChatFragment.this.list != null) {
                ChatFragment.this.errorView.setErrorInfo(code, msg);
                ChatFragment.this.list.clearAnimation();
            }
            ViewUtils.setVisibility(ChatFragment.this.listWrap, 8);
            ViewUtils.setVisibilityAnimated(ChatFragment.this.progress, 8);
            ErrorViewHelper.setVisibilityAnimated(ChatFragment.this.errorView, 0);
            if (ChatFragment.this.writeBar != null) {
                ChatFragment.this.writeBar.setErrorViewShown(true);
            }
        }

        public /* synthetic */ void lambda$onError$2(int code, String msg) {
            ChatFragment.this.networkError = true;
            APIUtils.showErrorToast(ChatFragment.this.getActivity(), code, msg);
            ChatFragment.this.loadMoreView.setVisibilityLoadMoreButton(0);
            ChatFragment.this.loadMoreView.setVisibilityProgressBar(8);
            if (ChatFragment.this.jumpToEndBtn != null && ChatFragment.this.jumpToEndBtn.getVisibility() == 0) {
                ChatFragment.this.jumpToEndBtn.setEnabled(true);
            }
        }
    }

    public void loadDataDown() {
        this.dataLoadingDown = true;
        int startMid = getArguments().getInt(LongPollService.EXTRA_MSG_ID);
        int count = this.preloadingDown ? 30 : 60;
        int offset = this.offsetFromBottom - count;
        Messages.getHistory(this.peer, offset, count, startMid, new AnonymousClass17());
    }

    /* renamed from: com.vkontakte.android.fragments.messages.ChatFragment$17 */
    /* loaded from: classes3.dex */
    public class AnonymousClass17 implements Messages.GetMessagesCallback {
        AnonymousClass17() {
            ChatFragment.this = this$0;
        }

        @Override // com.vkontakte.android.data.Messages.GetMessagesCallback
        public void onMessagesLoaded(ArrayList<Message> msgs, int offsetFromBtm) {
            if (ChatFragment.this.getActivity() == null) {
                ChatFragment.this.dataLoadingDown = false;
                return;
            }
            ChatFragment.this.offsetFromBottom -= msgs.size();
            Log.i("vk", "Offset from bottom=" + offsetFromBtm);
            HashSet<Integer> needUsersAcc = new HashSet<>();
            Iterator<Message> it = msgs.iterator();
            while (it.hasNext()) {
                Message m = it.next();
                if (m.isServiceMessage && m.extras.containsKey("action_mid") && !Utils.containsKey(ChatFragment.this.userNamesAcc, m.extras.getInt("action_mid"))) {
                    needUsersAcc.add(Integer.valueOf(m.extras.getInt("action_mid")));
                }
            }
            if (needUsersAcc.size() > 0) {
                ArrayList<Integer> uids = new ArrayList<>();
                uids.addAll(needUsersAcc);
                List<UserProfile> users = Friends.getUsersBlocking(uids, 3);
                for (UserProfile p : users) {
                    ChatFragment.this.userNamesAcc.put(p.uid, p.fullName);
                }
            }
            ChatFragment.this.getActivity().runOnUiThread(ChatFragment$17$$Lambda$1.lambdaFactory$(this, msgs));
        }

        public /* synthetic */ void lambda$onMessagesLoaded$0(ArrayList msgs) {
            ArrayList<Integer> mids = new ArrayList<>();
            Iterator it = ChatFragment.this.messages.iterator();
            while (it.hasNext()) {
                mids.add(Integer.valueOf(((Message) it.next()).id));
            }
            Iterator it2 = ChatFragment.this.preloadedMessages.iterator();
            while (it2.hasNext()) {
                mids.add(Integer.valueOf(((Message) it2.next()).id));
            }
            Iterator<Message> imsgs = msgs.iterator();
            while (imsgs.hasNext()) {
                Message m = imsgs.next();
                if (mids.contains(Integer.valueOf(m.id))) {
                    imsgs.remove();
                } else {
                    mids.add(Integer.valueOf(m.id));
                }
            }
            if (msgs.size() == 0) {
                ChatFragment.this.loadMoreViewBtm.setVisibilityLoadMoreButton(8);
                ChatFragment.this.loadMoreViewBtm.setVisibilityProgressBar(8);
                ChatFragment.this.moreAvailableDown = false;
                ChatFragment.this.dataLoadingDown = false;
                return;
            }
            ChatFragment.this.moreAvailableDown = ChatFragment.this.offsetFromBottom > 0;
            if (ChatFragment.this.moreAvailableDown) {
                ChatFragment.this.loadMoreViewBtm.setVisibilityLoadMoreButton(0);
                ChatFragment.this.loadMoreViewBtm.setVisibilityProgressBar(8);
            } else {
                ChatFragment.this.loadMoreViewBtm.setVisibilityLoadMoreButton(8);
                ChatFragment.this.loadMoreViewBtm.setVisibilityProgressBar(8);
            }
            if (ChatFragment.this.preloadingDown) {
                ChatFragment.this.preloadedMessagesDown.addAll(msgs);
            } else if (msgs.size() > 30) {
                ChatFragment.this.appendMessages(msgs.subList(0, msgs.size() - 30));
                ChatFragment.this.preloadedMessagesDown.addAll(msgs.subList(msgs.size() - 30, msgs.size()));
            } else {
                ChatFragment.this.appendMessages(msgs);
            }
            boolean btnVisible = ChatFragment.this.jumpToEndBtn != null && ChatFragment.this.jumpToEndBtn.getVisibility() == 0;
            if (btnVisible && !ChatFragment.this.moreAvailableDown) {
                ChatFragment.this.hideJumpButton();
            }
            ChatFragment.this.updateList();
            if (ChatFragment.this.isActive) {
                ChatFragment.this.markAsRead();
            }
            ChatFragment.this.dataLoadingDown = false;
            ChatFragment.this.preloadingDown = false;
            if (ChatFragment.this.preloadOnReadyDown) {
                ChatFragment.this.preloadingDown = true;
                ChatFragment.this.preloadOnReadyDown = false;
                ChatFragment.this.loadDataDown();
            }
        }

        @Override // com.vkontakte.android.data.Messages.GetMessagesCallback
        public void onError(int code, String msg) {
            if (ChatFragment.this.getActivity() != null) {
                ChatFragment.this.getActivity().runOnUiThread(ChatFragment$17$$Lambda$2.lambdaFactory$(this, code, msg));
            }
            ChatFragment.this.dataLoadingDown = false;
        }

        public /* synthetic */ void lambda$onError$1(int code, String msg) {
            APIUtils.showErrorToast(ChatFragment.this.getActivity(), code, msg);
            ChatFragment.this.loadMoreViewBtm.setVisibilityLoadMoreButton(0);
            ChatFragment.this.loadMoreViewBtm.setVisibilityProgressBar(8);
        }
    }

    public void updateChatUsersPhotos() {
        Iterator<MessageListItem> it = this.items.iterator();
        while (it.hasNext()) {
            MessageListItem item = it.next();
            if (item.type == 5 && item.msgId > 0) {
                Message m = getMessage(item.msgId);
                MessageListItemHelper.processServiceAction(this, m, item);
            }
            if (!item.isOut && (item.type == 2 || item.type == 1)) {
                if (Utils.containsKey(this.chatUsers, item.sender)) {
                    item.setImageUrl(this.chatUsers.get(item.sender).photo);
                }
            }
        }
        updateList();
    }

    public void rebuildItems() {
        this.items.clear();
        Set<Integer> fwdUidSet = new HashSet<>();
        this.items.addAll(MessageListItemHelper.buildItems(this, this.messages, fwdUidSet));
        loadFwdUsers(fwdUidSet);
    }

    public void relayoutThumbs() {
        int sz = Math.min(getContentWidth(), Global.scale(350.0f));
        Iterator<MessageListItem> it = this.items.iterator();
        while (it.hasNext()) {
            MessageListItem item = it.next();
            ZhukovLayout.processThumbs(((sz - Global.scale(126.0f)) - (item.fwdLevel * Global.scale(8.0f))) - (item.fwdLevel == 0 ? 0 : Global.scale(6.0f)), sz, item.getOrCreateAttachments());
        }
        updateList();
        this.relayoutThumbsRequested = false;
    }

    @Override // com.vkontakte.android.ui.holder.messages.MessageListItemHelper.MessageListItemHelperProvider
    public void onBuildMessage() {
        final View view = this.contentView;
        if (view != null && view.getWidth() == 0 && !this.relayoutThumbsRequested) {
            this.relayoutThumbsRequested = true;
            view.getViewTreeObserver().addOnPreDrawListener(new ViewTreeObserver.OnPreDrawListener() { // from class: com.vkontakte.android.fragments.messages.ChatFragment.18
                {
                    ChatFragment.this = this;
                }

                @Override // android.view.ViewTreeObserver.OnPreDrawListener
                public boolean onPreDraw() {
                    view.getViewTreeObserver().removeOnPreDrawListener(this);
                    ChatFragment.this.relayoutThumbs();
                    return true;
                }
            });
        }
    }

    public void updateList() {
        ArrayList<MessageListItem> listItems = this.adapter.prepareItems(this.items);
        ViewUtils.runOnUiThread(ChatFragment$$Lambda$18.lambdaFactory$(this, listItems));
    }

    public /* synthetic */ void lambda$updateList$18(ArrayList listItems) {
        this.adapter.setItems(listItems);
    }

    public void removeSeparator() {
        Iterator<MessageListItem> itr = this.items.iterator();
        while (itr.hasNext()) {
            MessageListItem item = itr.next();
            if (item.type == 6) {
                itr.remove();
                this.hasSeparator = false;
                updateList();
                return;
            }
        }
    }

    private void sendMessage() {
        if ($assertionsDisabled || !(this.errorView == null || this.writeBar == null || this.list == null)) {
            if ((!this.dataLoading || this.messages.size() != 0) && this.errorView.getView().getVisibility() != 0) {
                ArrayList<Attachment> atts = this.writeBar.getAttachments();
                ArrayList<Message> fwd = new ArrayList<>();
                Iterator<Attachment> it = atts.iterator();
                while (true) {
                    if (!it.hasNext()) {
                        break;
                    }
                    Attachment a = it.next();
                    if (a instanceof FwdMessagesAttachment) {
                        atts.remove(a);
                        fwd.addAll(((FwdMessagesAttachment) a).msgs);
                        break;
                    } else if (a instanceof MarketAttachment) {
                        MarketAttachment marketAttachment = (MarketAttachment) a;
                        if (!marketAttachment.canEdit) {
                            Analytics.track("market_contact").addParam(FirebaseAnalytics.Param.ITEM_ID, marketAttachment.good.owner_id + EventsFilesManager.ROLL_OVER_FILE_NAME_SEPARATOR + marketAttachment.good.id).addParam(NativeProtocol.WEB_DIALOG_ACTION, "write").commit();
                        }
                    }
                }
                String msg = this.writeBar.getAsFormattedString().trim();
                if (msg.length() != 0 || atts.size() != 0 || fwd.size() != 0) {
                    String ref = null;
                    String refSource = null;
                    Bundle args = getArguments();
                    if (args != null) {
                        ref = args.getString("ref");
                        refSource = args.getString("ref_source");
                        args.remove("ref");
                        args.remove("ref_source");
                    }
                    Message m = Messages.send(this.peer, msg, atts, fwd, 0, ref, refSource);
                    this.messages.add(m);
                    this.writeBar.setText("");
                    this.writeBar.clearAttachments();
                    this.messagesToForward.clear();
                    Log.d("vk", "send msg, offset=" + this.offsetFromBottom);
                    if (this.offsetFromBottom != 0) {
                        this.offsetFromBottom = 0;
                        this.moreAvailableDown = false;
                        this.messages.clear();
                        this.items.clear();
                        this.preloadedMessages.clear();
                        this.preloadedMessagesDown.clear();
                        this.loadMoreView.setVisibilityProgressBar(0);
                        this.loadMoreView.setVisibilityLoadMoreButton(4);
                        this.loadMoreViewBtm.setVisibilityProgressBar(8);
                        this.loadMoreViewBtm.setVisibilityLoadMoreButton(8);
                        hideJumpButton();
                        this.messages.add(m);
                        loadDataUp(true);
                        this.jumpedToEnd = true;
                    }
                    Set<Integer> fwdUidSet = new HashSet<>();
                    this.items.addAll(MessageListItemHelper.buildItems(this, Collections.singletonList(m), fwdUidSet));
                    MessageListItemHelper.fixTimes(this.items);
                    scrollToNewMessage();
                    if (this.hasSeparator) {
                        removeSeparator();
                    }
                    if (this.group != null && this.group.messagesBlocked) {
                        loadGroupInfo(true);
                    }
                    updateList();
                    loadFwdUsers(fwdUidSet);
                    return;
                }
                return;
            }
            return;
        }
        throw new AssertionError();
    }

    /* renamed from: sendAttachment */
    public void lambda$onCreateContentView$9(Attachment s) {
        if ($assertionsDisabled || !(this.errorView == null || this.list == null)) {
            if ((!this.dataLoading || this.messages.size() != 0) && this.errorView.getView().getVisibility() != 0) {
                ArrayList<Attachment> atts = new ArrayList<>();
                atts.add(s);
                String ref = null;
                String refSource = null;
                Bundle args = getArguments();
                if (args != null) {
                    ref = args.getString("ref");
                    refSource = args.getString("ref_source");
                    args.remove("ref");
                    args.remove("ref_source");
                }
                Message m = Messages.send(this.peer, "", atts, new ArrayList(), 0, ref, refSource);
                this.messages.add(m);
                if (this.offsetFromBottom != 0) {
                    this.offsetFromBottom = 0;
                    this.moreAvailableDown = false;
                    this.messages.clear();
                    this.items.clear();
                    this.preloadedMessages.clear();
                    this.preloadedMessagesDown.clear();
                    this.loadMoreView.setVisibilityProgressBar(0);
                    this.loadMoreView.setVisibilityLoadMoreButton(4);
                    this.loadMoreViewBtm.setVisibilityProgressBar(8);
                    this.loadMoreViewBtm.setVisibilityLoadMoreButton(8);
                    hideJumpButton();
                    this.messages.add(m);
                    loadDataUp(true);
                    this.jumpedToEnd = true;
                }
                Set<Integer> fwdUidSet = new HashSet<>();
                this.items.addAll(MessageListItemHelper.buildItems(this, Collections.singletonList(m), fwdUidSet));
                MessageListItemHelper.fixTimes(this.items);
                scrollToNewMessage();
                updateList();
                loadFwdUsers(fwdUidSet);
                if (this.hasSeparator) {
                    removeSeparator();
                    return;
                }
                return;
            }
            return;
        }
        throw new AssertionError();
    }

    @Override // android.app.Fragment
    public void onActivityResult(int reqCode, int resCode, Intent data) {
        super.onActivityResult(reqCode, resCode, data);
        if ($assertionsDisabled || this.writeBar != null) {
            if (reqCode > 10000) {
                this.writeBar.onActivityResult(reqCode, resCode, data);
            }
            if (reqCode == 200 && resCode == -1) {
                UserProfile profile = (UserProfile) data.getParcelableExtra("profile");
                if (profile.uid == this.peer) {
                    this.writeBar.addFwdMessages(this.messagesToForward);
                    return;
                }
                Builder builder = new Builder(profile.uid, profile.fullName).setFwd(this.messagesToForward);
                if (profile.uid < 2000000000) {
                    builder.setPhoto(profile.photo);
                }
                builder.go(getActivity());
                return;
            }
            return;
        }
        throw new AssertionError();
    }

    public void markAsRead() {
        int last = 0;
        for (int i = 0; i < this.messages.size(); i++) {
            Message msg = this.messages.get(i);
            if (!msg.out && !msg.readState && last < msg.id) {
                last = msg.id;
            }
        }
        if (last != 0) {
            Messages.markAsRead(getPeerID(), last);
        }
    }

    public void sendTypingIfNeeded() {
        if (System.currentTimeMillis() - this.lastTypingRequest >= 5000) {
            this.lastTypingRequest = System.currentTimeMillis();
            new MessagesSetActivity(this.peer).exec();
        }
    }

    public boolean onItemLongClick(MessageListItem listItem) {
        if (this.actionMode != null) {
            return false;
        }
        Message msg = null;
        int mid = listItem.msgId;
        Iterator<Message> it = this.messages.iterator();
        while (true) {
            if (!it.hasNext()) {
                break;
            }
            Message m = it.next();
            if (m.id == mid) {
                msg = m;
                break;
            }
        }
        if (msg == null || msg.isServiceMessage) {
            return false;
        }
        this.actionMode = getToolbar().startActionMode(this.actionModeCallback);
        this.selectedMessages.add(msg);
        this.actionMode.setTitle(getString(R.string.selected_n, new Object[]{Integer.valueOf(this.selectedMessages.size())}));
        this.adapter.notifyDataSetChanged();
        return true;
    }

    public void onItemClick(MessageListItem listItem) {
        boolean z = true;
        Message msg = null;
        int mid = listItem.msgId;
        Iterator<Message> it = this.messages.iterator();
        while (true) {
            if (!it.hasNext()) {
                break;
            }
            Message m = it.next();
            if (m.id == mid) {
                msg = m;
                break;
            }
        }
        if (msg != null) {
            if (this.actionMode != null) {
                if (this.selectedMessages.contains(msg)) {
                    this.selectedMessages.remove(msg);
                } else {
                    this.selectedMessages.add(msg);
                }
                this.actionMode.setTitle(getString(R.string.selected_n, new Object[]{Integer.valueOf(this.selectedMessages.size())}));
                this.adapter.notifyDataSetChanged();
                if (this.selectedMessages.size() == 0) {
                    this.actionMode.finish();
                    return;
                }
                this.actionMode.getMenu().findItem(R.id.copy).setVisible(this.selectedMessages.size() == 1);
                MenuItem findItem = this.actionMode.getMenu().findItem(R.id.reply);
                if (this.selectedMessages.size() <= 1) {
                    z = false;
                }
                findItem.setVisible(z);
                return;
            }
            Message message = msg;
            Attachment brokenAttach = getMessageBrokenAttachment(message);
            if (brokenAttach == null) {
                showMessageOptions(message);
                return;
            }
            int titleResId = brokenAttach instanceof PendingAudioMessageAttachment ? R.string.delete_audio_msg_broken_attach : R.string.delete_msg_broken_attach;
            new VKAlertDialog.Builder(getContext()).setTitle(R.string.message).setMessage(titleResId).setNegativeButton(R.string.cancel, (DialogInterface.OnClickListener) null).setPositiveButton(R.string.delete_msg, ChatFragment$$Lambda$19.lambdaFactory$(this, message)).show();
        }
    }

    public /* synthetic */ void lambda$onItemClick$19(Message message, DialogInterface d, int i) {
        deleteMessages(Collections.singletonList(message));
    }

    public void toggleTime() {
        this.adapter.toggle();
    }

    public boolean isShowingTime() {
        return this.adapter.isTimeVisible();
    }

    private Attachment getMessageBrokenAttachment(Message message) {
        for (Attachment attach : message.attachments) {
            if (attach instanceof PendingAttachment) {
                String file = ((PendingAttachment) attach).getUrl();
                if (!new File(file).exists()) {
                    return attach;
                }
            }
        }
        return null;
    }

    private void showMessageOptions(Message msg) {
        ArrayList<String> items = new ArrayList<>();
        ArrayList<String> actions = new ArrayList<>();
        if (!msg.sendFailed) {
            items.add(getString(R.string.reply_to));
            actions.add("reply");
            items.add(getString(R.string.msg_forward));
            actions.add("forward");
        } else {
            items.add(getString(R.string.retry));
            actions.add("retry");
        }
        items.add(getString(R.string.copy_text));
        actions.add("copy");
        items.add(getString(R.string.delete));
        actions.add("delete");
        new VKAlertDialog.Builder(getActivity()).setTitle(R.string.message).setItems((CharSequence[]) items.toArray(new String[0]), ChatFragment$$Lambda$20.lambdaFactory$(this, actions, msg)).show();
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    public /* synthetic */ void lambda$showMessageOptions$20(ArrayList actions, Message msg, DialogInterface dialog, int which) {
        char c;
        String str = (String) actions.get(which);
        switch (str.hashCode()) {
            case -1335458389:
                if (str.equals("delete")) {
                    c = 4;
                    break;
                }
                c = 65535;
                break;
            case -677145915:
                if (str.equals("forward")) {
                    c = 1;
                    break;
                }
                c = 65535;
                break;
            case 3059573:
                if (str.equals("copy")) {
                    c = 3;
                    break;
                }
                c = 65535;
                break;
            case 108401386:
                if (str.equals("reply")) {
                    c = 0;
                    break;
                }
                c = 65535;
                break;
            case 108405416:
                if (str.equals("retry")) {
                    c = 2;
                    break;
                }
                c = 65535;
                break;
            default:
                c = 65535;
                break;
        }
        switch (c) {
            case 0:
                if (this.writeBar != null) {
                    this.writeBar.addFwdMessages(Arrays.asList(msg));
                    return;
                }
                return;
            case 1:
                ArrayList<Message> msgs = new ArrayList<>();
                msgs.add(msg);
                forward(msgs);
                return;
            case 2:
                try {
                    Iterator<Message> it = this.messages.iterator();
                    while (it.hasNext()) {
                        Message m = it.next();
                        if (m.id == msg.id && m.sendFailed) {
                            retryFailed(msg);
                        }
                    }
                    return;
                } catch (Exception e) {
                    return;
                }
            case 3:
                ClipboardManager cm = (ClipboardManager) getActivity().getSystemService("clipboard");
                cm.setText(msg.text);
                Toast.makeText(getActivity(), (int) R.string.text_copied, 0).show();
                return;
            case 4:
                ArrayList<Message> msgs2 = new ArrayList<>();
                msgs2.add(msg);
                confirmAndDelete(msgs2);
                return;
            default:
                return;
        }
    }

    public void confirmAndDelete(List<Message> msgs) {
        new VKAlertDialog.Builder(getActivity()).setTitle(R.string.delete_msgs_title).setMessage(getString(R.string.delete_msgs_confirm, new Object[]{getResources().getQuantityString(R.plurals.qty_msgs, msgs.size(), Integer.valueOf(msgs.size()))})).setPositiveButton(R.string.yes, ChatFragment$$Lambda$21.lambdaFactory$(this, msgs)).setNegativeButton(R.string.no, (DialogInterface.OnClickListener) null).show();
    }

    public /* synthetic */ void lambda$confirmAndDelete$21(List msgs, DialogInterface dialog, int which) {
        deleteMessages(msgs);
    }

    private void deleteMessages(List<Message> msgs) {
        ArrayList<Integer> mids = new ArrayList<>();
        for (Message m : msgs) {
            mids.add(Integer.valueOf(m.id));
        }
        stopPlayAudioMessage(msgs);
        Messages.delete(mids, false);
        this.messages.removeAll(msgs);
        ArrayList<MessageListItem> toRemove = new ArrayList<>();
        Iterator<MessageListItem> it = this.items.iterator();
        while (it.hasNext()) {
            MessageListItem item = it.next();
            if (mids.contains(Integer.valueOf(item.msgId))) {
                toRemove.add(item);
            }
        }
        this.items.removeAll(toRemove);
        updateList();
    }

    private void stopPlayAudioMessage(List<Message> msgs) {
        Context context = getContext();
        for (Message msg : msgs) {
            for (Attachment att : msg.attachments) {
                if (att instanceof AudioMessageAttachment) {
                    ((AudioMessageAttachment) att).stop(context);
                }
            }
        }
    }

    public void forward(ArrayList<Message> msgs) {
        Comparator comparator;
        this.messagesToForward.clear();
        this.messagesToForward.addAll(msgs);
        ArrayList<Message> arrayList = this.messagesToForward;
        comparator = ChatFragment$$Lambda$22.instance;
        Collections.sort(arrayList, comparator);
        new DialogsFragment.Builder().setSelectMode().forResult(this, 200);
    }

    public static /* synthetic */ int lambda$forward$22(Message lhs, Message rhs) {
        return lhs.time > rhs.time ? 1 : -1;
    }

    public void loadFwdUsers(Collection<Integer> uids) {
        Friends.getUsers(uids, ChatFragment$$Lambda$23.lambdaFactory$(this));
    }

    public /* synthetic */ void lambda$loadFwdUsers$24(ArrayList users) {
        ViewUtils.runOnUiThread(ChatFragment$$Lambda$25.lambdaFactory$(this, users));
    }

    public /* synthetic */ void lambda$null$23(ArrayList users) {
        Iterator it = users.iterator();
        while (it.hasNext()) {
            UserProfile up = (UserProfile) it.next();
            this.usersBuf.put(up.uid, up);
        }
        Iterator<MessageListItem> it2 = this.items.iterator();
        while (it2.hasNext()) {
            MessageListItem item = it2.next();
            if (item.fwdLevel > 0 && Utils.containsKey(this.usersBuf, item.fwdUid)) {
                item.fwdName = this.usersBuf.get(item.fwdUid).fullName;
                item.setImageUrlFwd(this.usersBuf.get(item.fwdUid).photo);
                item.updateHolder(false);
            }
        }
        ViewUtils.runOnUiThread(ChatFragment$$Lambda$26.lambdaFactory$(this));
    }

    public boolean isSelected(int mid) {
        Iterator<Message> it = this.selectedMessages.iterator();
        while (it.hasNext()) {
            Message msg = it.next();
            if (msg.id == mid) {
                return true;
            }
        }
        return false;
    }

    private void retryFailed(Message msg) {
        if (msg.id <= 0) {
            this.messages.remove(msg);
            ArrayList<MessageListItem> toRemove = new ArrayList<>();
            Iterator<MessageListItem> it = this.items.iterator();
            while (it.hasNext()) {
                MessageListItem item = it.next();
                if (item.msgId == msg.id) {
                    toRemove.add(item);
                }
            }
            this.items.removeAll(toRemove);
            Message m = Messages.send(msg);
            this.messages.add(m);
            ArrayList<Message> al = new ArrayList<>();
            al.add(m);
            Set<Integer> fwdUidSet = new HashSet<>();
            this.items.addAll(MessageListItemHelper.buildItems(this, al, fwdUidSet));
            MessageListItemHelper.fixTimes(this.items);
            loadFwdUsers(fwdUidSet);
            updateList();
        }
    }

    public void prependMessages(List<Message> msgs) {
        VKRecyclerView l = this.list;
        if (getActivity() != null && l != null) {
            int itemOffset = -1;
            int firstVisible = l.delegate.getFirstVisiblePosition();
            if (firstVisible == 0) {
                if (l.getChildCount() > 3) {
                    firstVisible += 2;
                    itemOffset = l.getChildAt(3).getTop();
                }
            } else if (firstVisible == 1) {
                if (l.getChildCount() > 2) {
                    firstVisible++;
                    itemOffset = l.getChildAt(2).getTop();
                }
            } else if (l.getChildCount() > 1) {
                itemOffset = l.getChildAt(0).getTop();
            }
            this.messages.addAll(0, msgs);
            Set<Integer> fwdUidSet = new HashSet<>();
            ArrayList<MessageListItem> litems = MessageListItemHelper.buildItems(this, msgs, fwdUidSet);
            this.items.addAll(0, litems);
            int ndates = MessageListItemHelper.fixTimes(this.items);
            updateList();
            int firstVisible2 = firstVisible - ndates;
            boolean foundSeparator = false;
            int i = 0;
            Iterator<MessageListItem> it = litems.iterator();
            while (it.hasNext()) {
                MessageListItem item = it.next();
                if (item.type == 6) {
                    foundSeparator = true;
                    l.delegate.setSelectionFromTop(i + 1, Global.scale(80.0f));
                }
                i++;
            }
            if (!foundSeparator) {
                l.delegate.setSelectionFromTop(litems.size() + firstVisible2 + 1, itemOffset);
            }
            loadFwdUsers(fwdUidSet);
        }
    }

    public void appendMessages(List<Message> msgs) {
        VKRecyclerView l = this.list;
        if (getActivity() != null && l != null) {
            this.messages.addAll(msgs);
            Set<Integer> fwdUidSet = new HashSet<>();
            this.items.addAll(MessageListItemHelper.buildItems(this, msgs, fwdUidSet));
            MessageListItemHelper.fixTimes(this.items);
            updateList();
            loadFwdUsers(fwdUidSet);
            if (this.isActive) {
                markAsRead();
            }
        }
    }

    public boolean isAudioMessage(Message message) {
        for (Attachment att : message.attachments) {
            if (att instanceof AudioMessageAttachment) {
                return true;
            }
        }
        return false;
    }

    public static boolean isTimeStepInterval(Message first, Message second) {
        int firstMessageTime = first.time + (TimeZone.getDefault().getRawOffset() / 1000);
        int secondMessageTime = second.time + (TimeZone.getDefault().getRawOffset() / 1000);
        return secondMessageTime - firstMessageTime > 7200;
    }

    @Override // com.vkontakte.android.fragments.HomeListener
    public boolean onHomePressed() {
        if (getActivity().isTaskRoot()) {
            Intent intent = new Navigator(DialogsFragment.class, MainActivity.class).intent(getActivity());
            intent.addFlags(67108864);
            getActivity().startActivity(intent);
            getActivity().finish();
            return true;
        }
        return false;
    }

    @Override // com.vkontakte.android.attachments.StickerAttachment.Callback
    public void openStickerKeyboard(int pack) {
        if (this.mKeyboardPopup != null && this.mStickersView != null) {
            this.mKeyboardPopup.show(true);
            this.mStickersView.openPack(pack);
        }
    }

    @Override // com.vkontakte.android.fragments.BackListener
    public boolean onBackPressed() {
        if (this.mKeyboardPopup != null && this.mKeyboardPopup.isShowing()) {
            hideEmojiPopup();
            return true;
        } else if (getIsShowingMentionsSuggestions()) {
            hideMentionSuggestions();
            return true;
        } else {
            return false;
        }
    }

    protected void setSubtitle(CharSequence subtitle, boolean saveValue) {
        if (saveValue) {
            this.subtitle = subtitle;
        }
        super.setSubtitle(subtitle);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // me.grishka.appkit.fragments.AppKitFragment
    public void setSubtitle(CharSequence subtitle) {
        setSubtitle(subtitle, true);
    }

    @Override // com.vkontakte.android.ui.WriteBar.MentionSuggestionsSupplier
    public boolean getIsShowingMentionsSuggestions() {
        return this.coordinatorMentionWrap != null && this.coordinatorMentionWrap.getVisibility() == 0;
    }

    @Override // com.vkontakte.android.ui.WriteBar.MentionSuggestionsSupplier
    public void showMentionSuggestionsFor(String searchStr) {
        if (!getIsShowingMentionsSuggestions()) {
            this.mentionsAdapter.buildUserPriorities(this.items);
        }
        this.mentionsAdapter.filterResults(searchStr);
        this.mentionsRecyclerView.scrollToPosition(0);
        this.shouldShowMentions = true;
        updateMentionsVisibility();
    }

    @Override // com.vkontakte.android.ui.WriteBar.MentionSuggestionsSupplier
    public int findExactMatch(String query) {
        return this.mentionsAdapter.findExactMatch(query);
    }

    @Override // com.vkontakte.android.ui.WriteBar.MentionSuggestionsSupplier
    public void hideMentionSuggestions() {
        this.shouldShowMentions = false;
        updateMentionsVisibility();
    }

    private void updateMentionsVisibility() {
        boolean show = true;
        int i = 0;
        if (getAreMentionsEnabled()) {
            int orientation = ViewUtils.getScreenOrientation(getActivity());
            if (!this.shouldShowMentions || this.mentionsAdapter.getItemCount() <= 0 || (orientation != 1 && orientation != 9 && !this.isTablet)) {
                show = false;
            }
            this.coordinatorMentionWrap.setVisibility(show ? 0 : 8);
            View view = this.mentionsBottomDivider;
            if (!show) {
                i = 8;
            }
            view.setVisibility(i);
            if (!show) {
                this.coordinatorMentionWrap.postDelayed(ChatFragment$$Lambda$24.lambdaFactory$(this), 300L);
            }
        }
    }

    public /* synthetic */ void lambda$updateMentionsVisibility$25() {
        this.bottomSheetBehavior.forceState(4);
    }

    public void showTyping(boolean show) {
        this.isShowTyping = show;
        setSubtitle(show ? this.subtitleTyping : this.subtitle, false);
    }

    /* loaded from: classes3.dex */
    public static class RoundDrawable extends RoundedImageView2.RoundedDrawable {
        private RectF rectBitmap;

        public RoundDrawable(Bitmap bitmap) {
            super(bitmap);
            this.rectBitmap = new RectF(0.0f, 0.0f, this.bitmapWidth, this.bitmapHeight);
        }

        @Override // com.vkontakte.android.ui.RoundedImageView2.RoundedDrawable, android.graphics.drawable.Drawable
        public void draw(Canvas canvas) {
            canvas.save();
            canvas.scale(getIntrinsicHeight() / this.bitmapWidth, getIntrinsicHeight() / this.bitmapHeight);
            float corners = this.bitmapHeight / 2.0f;
            canvas.drawRoundRect(this.rectBitmap, corners, corners, this.paint);
            canvas.restore();
        }

        @Override // com.vkontakte.android.ui.RoundedImageView2.RoundedDrawable, android.graphics.drawable.Drawable
        public int getIntrinsicHeight() {
            return Global.scale(40.0f);
        }

        @Override // com.vkontakte.android.ui.RoundedImageView2.RoundedDrawable, android.graphics.drawable.Drawable
        public int getIntrinsicWidth() {
            return Global.scale(46.0f);
        }
    }
}
