package com.vkontakte.android.fragments.feedback;

import android.app.Activity;
import android.content.DialogInterface;
import android.graphics.Rect;
import android.graphics.drawable.ColorDrawable;
import android.os.Bundle;
import android.os.Looper;
import android.support.v7.widget.RecyclerView;
import android.text.Spannable;
import android.text.TextUtils;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import com.facebook.appevents.AppEventsConstants;
import com.vk.webapp.ReportAppInputData;
import com.vkontakte.android.ExpandTextSpan;
import com.vkontakte.android.Global;
import com.vkontakte.android.LongPollService;
import com.vkontakte.android.NewsEntry;
import com.vkontakte.android.R;
import com.vkontakte.android.UserProfile;
import com.vkontakte.android.VKAlertDialog;
import com.vkontakte.android.VKApplication;
import com.vkontakte.android.api.SimpleCallback;
import com.vkontakte.android.api.models.Notification;
import com.vkontakte.android.api.notifications.NotificationsGet;
import com.vkontakte.android.auth.VKAccountManager;
import com.vkontakte.android.data.ServerKeys;
import com.vkontakte.android.fragments.PostViewFragment;
import com.vkontakte.android.fragments.ProfileFragment;
import com.vkontakte.android.fragments.base.GridFragment;
import com.vkontakte.android.fragments.discussions.BoardTopicViewFragment;
import com.vkontakte.android.fragments.market.GoodFragment;
import com.vkontakte.android.fragments.money.MoneyTransferDetailsFragment;
import com.vkontakte.android.functions.VoidF1;
import com.vkontakte.android.functions.VoidF1Int;
import com.vkontakte.android.ui.holder.HeaderHolder;
import com.vkontakte.android.ui.holder.RecyclerHolder;
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
import com.vkontakte.android.ui.posts.TextPostDisplayItem;
import com.vkontakte.android.ui.posts.ThumbsBlockPostDisplayItem;
import com.vkontakte.android.ui.recyclerview.CardItemDecoration;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import me.grishka.appkit.utils.V;
import me.grishka.appkit.views.DividerItemDecoration;
/* loaded from: classes2.dex */
public class NotificationsFragment extends GridFragment<Notification> {
    private NotificationsAdapter adapter;
    private boolean foundDividers;
    private String from;
    private String[][][] langInfo;
    private VoidF1Int<Notification> mNotificationAction;
    private VoidF1<UserProfile> mUserAction;

    public /* synthetic */ void lambda$new$0(UserProfile user) {
        new ProfileFragment.Builder(user.uid).go(getActivity());
    }

    public /* synthetic */ void lambda$new$1(Notification notification, int position) {
        if (notification.type == Notification.Type.Grouped && position >= 0) {
            ArrayList<Notification> list = (ArrayList) notification.group;
            this.data.remove(notification);
            this.data.addAll(position, list);
            this.adapter.notifyDataSetChanged();
            return;
        }
        NewsEntry parent = notification.parentPost;
        if (notification.type == Notification.Type.MoneyTransferAccepted || notification.type == Notification.Type.MoneyTransferDeclined || notification.type == Notification.Type.MoneyTransferReceived) {
            MoneyTransferDetailsFragment.show(notification.moneyTransfer.id, notification.moneyTransfer.from_id, notification.moneyTransfer.to_id, getActivity());
        } else if (parent == null) {
            if (notification.feedBackUsers != null && !notification.feedBackUsers.isEmpty()) {
                new ProfileFragment.Builder(notification.feedBackUsers.get(0).uid).go(getActivity());
            }
        } else if (parent.type == 18) {
            new GoodFragment.Builder(GoodFragment.Builder.Source.feed, parent.ownerID, parent.postID).go(getActivity());
        } else if (parent.type == 4) {
            new BoardTopicViewFragment.Builder(parent.postID, -parent.ownerID, parent.text).setOffset(parent.numComments - (parent.numComments % 20)).go(getActivity());
        } else if (notification.grandParentPost != null && notification.grandParentPost.type == 4) {
            new BoardTopicViewFragment.Builder(notification.grandParentPost.postID, -notification.grandParentPost.ownerID, notification.grandParentPost.text).setOffset(notification.grandParentPost.numComments - (notification.grandParentPost.numComments % 20)).go(getActivity());
        } else {
            PostViewFragment.Builder builder = new PostViewFragment.Builder(notification.grandParentPost != null ? notification.grandParentPost : notification.parentPost);
            if (notification.type.parentType == Notification.ParentType.Comment) {
                builder.setComment(notification.parentPost.postID);
            }
            if (notification.type.feedbackType == Notification.FeedbackType.Comment) {
                builder.setComment(notification.commentID);
            }
            builder.go(getActivity());
        }
    }

    public NotificationsFragment() {
        super(20);
        this.mUserAction = NotificationsFragment$$Lambda$1.lambdaFactory$(this);
        this.mNotificationAction = NotificationsFragment$$Lambda$2.lambdaFactory$(this);
    }

    @Override // me.grishka.appkit.fragments.BaseRecyclerFragment, me.grishka.appkit.fragments.AppKitFragment, android.app.Fragment
    public void onAttach(Activity activity) {
        super.onAttach(activity);
        setEmptyText(R.string.no_replies);
    }

    @Override // android.app.DialogFragment, android.app.Fragment
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setHasOptionsMenu(true);
        setRefreshEnabled(true);
        getActivity().getSharedPreferences(null, 0).edit().remove("like_notifications").commit();
        this.langInfo = new String[][][]{new String[][]{getResources().getStringArray(R.array.ntf_like_m), getResources().getStringArray(R.array.ntf_like_f), getResources().getStringArray(R.array.ntf_like_x)}, new String[][]{getResources().getStringArray(R.array.ntf_rt_m), getResources().getStringArray(R.array.ntf_rt_f), getResources().getStringArray(R.array.ntf_rt_x)}, new String[][]{getResources().getStringArray(R.array.ntf_follow_m), getResources().getStringArray(R.array.ntf_follow_f), getResources().getStringArray(R.array.ntf_follow_x)}, new String[][]{getResources().getStringArray(R.array.ntf_accepted_m), getResources().getStringArray(R.array.ntf_accepted_f), getResources().getStringArray(R.array.ntf_accepted_x)}};
    }

    @Override // me.grishka.appkit.fragments.BaseRecyclerFragment
    protected void doLoadData(int offset, int count) {
        boolean z = true;
        final boolean fromCache = this.data.size() == 0 && LongPollService.getNumNotifications() == 0 && !this.refreshing;
        String str = (offset == 0 || this.refreshing) ? "" : this.from;
        if (this.refreshing || !this.foundDividers) {
            z = false;
        }
        this.currentRequest = new NotificationsGet(str, count, fromCache, z).setCallback(new SimpleCallback<NotificationsGet.Result>(this) { // from class: com.vkontakte.android.fragments.feedback.NotificationsFragment.1
            {
                NotificationsFragment.this = this;
            }

            @Override // com.vkontakte.android.api.Callback
            public void success(NotificationsGet.Result result) {
                boolean more = false;
                if (NotificationsFragment.this.refreshing) {
                    NotificationsFragment.this.from = null;
                    NotificationsFragment.this.foundDividers = false;
                }
                if (result.newFrom != null && result.newFrom.length() > 0 && !AppEventsConstants.EVENT_PARAM_VALUE_NO.equals(result.newFrom)) {
                    more = true;
                }
                NotificationsFragment.this.from = result.newFrom;
                NotificationsFragment.this.foundDividers = result.foundDividers;
                NotificationsFragment.this.onDataLoaded(result.n, more);
                for (int i = 0; i < result.n.size(); i++) {
                    Notification notification = result.n.get(i);
                    if (notification.item != null) {
                        NotificationsFragment.this.attachExpandListeners(notification);
                    }
                }
                LongPollService.resetNotifications();
                if (NotificationsFragment.this.getActivity() != null) {
                    NotificationsFragment.this.getActivity().invalidateOptionsMenu();
                }
                if (fromCache) {
                    NotificationsFragment.this.refresh();
                }
            }
        }).exec(Looper.getMainLooper());
    }

    @Override // com.vkontakte.android.fragments.base.GridFragment, me.grishka.appkit.fragments.ContainerFragment, android.app.DialogFragment, android.app.Fragment
    public void onActivityCreated(Bundle state) {
        super.onActivityCreated(state);
        if (!this.loaded) {
            loadData();
        } else {
            dataLoaded();
        }
    }

    @Override // android.app.Fragment
    public void onCreateOptionsMenu(Menu menu, MenuInflater inflater) {
        if (menu.findItem(R.id.filter) == null) {
            inflater.inflate(R.menu.replies, menu);
        }
    }

    @Override // android.app.Fragment
    public boolean onOptionsItemSelected(MenuItem item) {
        if (item.getItemId() == R.id.filter) {
            showFilterDialog();
            return true;
        }
        return false;
    }

    @Override // com.vkontakte.android.fragments.base.GridFragment, com.vkontakte.android.fragments.VKRecyclerFragment, me.grishka.appkit.fragments.AppKitFragment, android.app.Fragment
    public void onViewCreated(View view, Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);
        this.list.addItemDecoration(new DividerItemDecoration(new ColorDrawable(637534208), Global.scale(0.5f), this.isTablet ? null : new ColorDrawable(-1), this.isTablet ? 0 : V.dp(9.0f), null, 0).setProvider((DividerItemDecoration.Provider) mo1066getAdapter()));
        this.list.setDrawSelectorOnTop(true);
        this.list.setItemAnimator(null);
        this.list.setSelectorBoundsProvider(NotificationsFragment$$Lambda$3.lambdaFactory$(this));
    }

    public /* synthetic */ void lambda$onViewCreated$2(View child, Rect outRect) {
        RecyclerView.ViewHolder rawHolder = this.list.mo1205getChildViewHolder(child);
        if (!(rawHolder instanceof TempPostHolder)) {
            outRect.set(child.getLeft(), child.getTop(), child.getRight(), child.getBottom());
            return;
        }
        TempPostHolder currentHolder = (TempPostHolder) rawHolder;
        outRect.left = child.getLeft();
        outRect.right = child.getRight();
        boolean foundFirst = false;
        for (int i = 0; i < this.list.getLayoutManager().getChildCount(); i++) {
            RecyclerView.ViewHolder holder = this.list.mo1205getChildViewHolder(this.list.getLayoutManager().getChildAt(i));
            if (holder instanceof TempPostHolder) {
                TempPostHolder h = (TempPostHolder) holder;
                if (h.getItem().item.postID == currentHolder.getItem().item.postID && h.getItem().item.postOwnerID == currentHolder.getItem().item.postOwnerID) {
                    if (!foundFirst) {
                        foundFirst = true;
                        outRect.top = this.list.getLayoutManager().getChildAt(i).getTop();
                    }
                    outRect.bottom = this.list.getLayoutManager().getChildAt(i).getBottom();
                }
            }
        }
    }

    @Override // me.grishka.appkit.fragments.BaseRecyclerFragment
    public void onDataLoaded(List<Notification> d, boolean more) {
        super.onDataLoaded(d, more);
        updateDecorator();
    }

    @Override // com.vkontakte.android.fragments.base.GridFragment
    protected CardItemDecoration onCreateCardDecorator() {
        int paddingTop;
        boolean z = true;
        if (this.data.size() == 0) {
            return null;
        }
        boolean isTabletDecorator = this.scrW >= 924;
        GridFragment.GridAdapter adapter = mo1066getAdapter();
        if (isTabletDecorator) {
            z = false;
        }
        CardItemDecoration decorator = new CardItemDecoration(adapter, z);
        if (this.scrW >= 600) {
            paddingTop = V.dp(9.0f);
        } else if (this.scrW >= 480) {
            paddingTop = V.dp(9.0f);
        } else {
            paddingTop = V.dp(8.0f);
        }
        int margin = isTabletDecorator ? V.dp(Math.max(16, (this.scrW - 924) / 2)) + ((int) (decorator.getShadowSize() / 2.0f)) : 0;
        this.list.setPadding(margin, paddingTop, margin, 0);
        decorator.setPadding(0, 0, 0, 0);
        return decorator;
    }

    public void attachExpandListeners(Notification item) {
        if (item.item instanceof TextPostDisplayItem) {
            TextPostDisplayItem text = (TextPostDisplayItem) item.item;
            if (text.text instanceof Spannable) {
                ExpandTextSpan[] spans = (ExpandTextSpan[]) ((Spannable) text.text).getSpans(0, text.text.length(), ExpandTextSpan.class);
                if (spans.length > 0) {
                    spans[0].setOnClickListener(new ExpandTextClickListener(item));
                }
            }
        }
    }

    @Override // com.vkontakte.android.fragments.base.GridFragment
    protected GridFragment<Notification>.GridAdapter<?> createAdapter() {
        this.adapter = new NotificationsAdapter();
        this.adapter.setHasStableIds(true);
        return this.adapter;
    }

    @Override // com.vkontakte.android.fragments.base.GridFragment
    protected int getColumnsCount() {
        return 1;
    }

    public static void ensureMoneyTransferNotificationsAreEnabledOnce() {
        if (!VKApplication.context.getSharedPreferences(null, 0).getBoolean("money_transfers_notifications_enabled_once", false)) {
            String[] _setting = VKApplication.context.getSharedPreferences(null, 0).getString("notifications_filter", "wall,mentions,comments,likes,reposts,followers|friends").split(",");
            ArrayList<String> setting = new ArrayList<>();
            Collections.addAll(setting, _setting);
            if (!setting.contains("money_transfers")) {
                setting.add("money_transfers");
            }
            VKApplication.context.getSharedPreferences(null, 0).edit().putString("notifications_filter", TextUtils.join(",", setting)).putBoolean("money_transfers_notifications_enabled_once", true).commit();
        }
    }

    private void showFilterDialog() {
        if (isAdded()) {
            boolean moneyTransfersEnabled = VKAccountManager.getCurrent().moneyTransfersAvailable;
            if (moneyTransfersEnabled) {
                ensureMoneyTransferNotificationsAreEnabledOnce();
            }
            String[] keys = moneyTransfersEnabled ? new String[]{ReportAppInputData.REPORT_TYPE_WALL, "mentions", "comments", ServerKeys.LIKES, "reposts", "followers|friends", "money_transfers"} : new String[]{ReportAppInputData.REPORT_TYPE_WALL, "mentions", "comments", ServerKeys.LIKES, "reposts", "followers|friends"};
            String[] opts = !moneyTransfersEnabled ? new String[]{getString(R.string.wall), getString(R.string.mentions), getString(R.string.comments), getString(R.string.likes), getString(R.string.reposts), getString(R.string.followers)} : new String[]{getString(R.string.wall), getString(R.string.mentions), getString(R.string.comments), getString(R.string.likes), getString(R.string.reposts), getString(R.string.followers), getString(R.string.money_transfer_money_transfers)};
            String[] _setting = getActivity().getSharedPreferences(null, 0).getString("notifications_filter", "wall,mentions,comments,likes,reposts,followers|friends").split(",");
            ArrayList<String> setting = new ArrayList<>();
            Collections.addAll(setting, _setting);
            boolean[] values = new boolean[keys.length];
            for (int i = 0; i < values.length; i++) {
                values[i] = setting.contains(keys[i]);
            }
            new VKAlertDialog.Builder(getActivity()).setTitle(R.string.filter).setMultiChoiceItems(opts, values, NotificationsFragment$$Lambda$4.lambdaFactory$(values)).setPositiveButton(R.string.ok, NotificationsFragment$$Lambda$5.lambdaFactory$(this, values, keys)).setNegativeButton(R.string.cancel, (DialogInterface.OnClickListener) null).show();
        }
    }

    public static /* synthetic */ void lambda$showFilterDialog$3(boolean[] values, DialogInterface dialog, int which, boolean isChecked) {
        values[which] = isChecked;
    }

    public /* synthetic */ void lambda$showFilterDialog$4(boolean[] values, String[] keys, DialogInterface dialog, int which) {
        if (isAdded()) {
            ArrayList<String> sett = new ArrayList<>();
            for (int i = 0; i < values.length; i++) {
                if (values[i]) {
                    sett.add(keys[i]);
                }
            }
            getActivity().getSharedPreferences(null, 0).edit().putString("notifications_filter", TextUtils.join(",", sett)).commit();
            reload();
        }
    }

    /* loaded from: classes2.dex */
    public class ExpandTextClickListener implements View.OnClickListener {
        public Notification item;

        public ExpandTextClickListener(Notification item) {
            NotificationsFragment.this = this$0;
            this.item = item;
        }

        @Override // android.view.View.OnClickListener
        public void onClick(View view) {
            this.item.item = ((TextPostDisplayItem) this.item.item).expandText();
            NotificationsFragment.this.adapter.notifyItemChanged(NotificationsFragment.this.data.indexOf(this.item));
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes2.dex */
    public class NotificationsAdapter extends GridFragment<Notification>.GridAdapter<RecyclerHolder> implements CardItemDecoration.Provider, DividerItemDecoration.Provider {
        public static final int TYPE_COMMENT = 15;
        public static final int TYPE_GROUP = 14;
        public static final int TYPE_HEADER = 13;
        public static final int TYPE_POST = 16;
        public static final int TYPE_USERS = 17;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public NotificationsAdapter() {
            super();
            NotificationsFragment.this = r2;
            setHasStableIds(false);
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        /* renamed from: onCreateViewHolder */
        public RecyclerHolder mo1206onCreateViewHolder(ViewGroup parent, int viewType) {
            switch (viewType) {
                case 0:
                    return new TempPostHolder(HeaderPostDisplayItem.createView(NotificationsFragment.this.getActivity()));
                case 1:
                    return new TempPostHolder(FooterPostDisplayItem.createView(NotificationsFragment.this.getActivity()));
                case 2:
                    return new TempPostHolder(TextPostDisplayItem.createView(NotificationsFragment.this.getActivity(), false));
                case 3:
                    return new TempPostHolder(RepostPostDisplayItem.createView(NotificationsFragment.this.getActivity()));
                case 4:
                    return new TempPostHolder(CommentPostDisplayItem.createView(NotificationsFragment.this.getActivity()));
                case 5:
                    return new TempPostHolder(ThumbsBlockPostDisplayItem.createView(NotificationsFragment.this.getActivity()));
                case 6:
                    return new TempPostHolder(AudioPostDisplayItem.createView(NotificationsFragment.this.getActivity()));
                case 7:
                    return new TempPostHolder(CommonAttachmentPostDisplayItem.createView(NotificationsFragment.this.getActivity()));
                case 8:
                    return new TempPostHolder(SignaturePostDisplayItem.createView(NotificationsFragment.this.getActivity()));
                case 9:
                    return new TempPostHolder(AttachContainerPostDisplayItem.createView(NotificationsFragment.this.getActivity()));
                case 10:
                    return new TempPostHolder(ButtonsPostDisplayItem.createView(NotificationsFragment.this.getActivity()));
                case 11:
                case 16:
                case 18:
                case 19:
                default:
                    return null;
                case 12:
                    return new TempPostHolder(HeaderPostDisplayItem.createViewAd(NotificationsFragment.this.getActivity()));
                case 13:
                    return new HeaderHolder(parent);
                case 14:
                    return new GroupedHolder(parent).attach(NotificationsFragment.this.mNotificationAction);
                case 15:
                    return new CommentHolder(parent).attach(NotificationsFragment.this.mUserAction, NotificationsFragment.this.mNotificationAction);
                case 17:
                    return new UsersHolder(parent, NotificationsFragment.this.langInfo).attach(NotificationsFragment.this.mUserAction, NotificationsFragment.this.mNotificationAction);
                case 20:
                    return new TempPostHolder(HeaderPostDisplayItem.createView(NotificationsFragment.this.getActivity()));
                case 21:
                    return new TempPostHolder(MarkedAsAdsPostDisplayItem.createView(NotificationsFragment.this.getActivity()));
            }
        }

        @Override // com.vkontakte.android.fragments.base.GridFragment.GridAdapter, android.support.v7.widget.RecyclerView.Adapter
        public void onBindViewHolder(RecyclerHolder holder, int position) {
            switch (getItemViewType(position)) {
                case 0:
                case 1:
                case 2:
                case 3:
                case 4:
                case 5:
                case 6:
                case 7:
                case 8:
                case 9:
                case 10:
                case 16:
                    ((Notification) NotificationsFragment.this.data.get(position)).item.bindView(holder.itemView);
                    ((TempPostHolder) holder).bind(NotificationsFragment.this.data.get(position));
                    return;
                case 11:
                case 12:
                default:
                    return;
                case 13:
                    ((HeaderHolder) holder).bind(((Notification) NotificationsFragment.this.data.get(position)).getText());
                    return;
                case 14:
                    ((GroupedHolder) holder).bind(NotificationsFragment.this.data.get(position));
                    return;
                case 15:
                    ((CommentHolder) holder).bind(NotificationsFragment.this.data.get(position));
                    return;
                case 17:
                    ((UsersHolder) holder).bind(NotificationsFragment.this.data.get(position));
                    return;
            }
        }

        @Override // com.vkontakte.android.fragments.base.GridFragment.GridAdapter, android.support.v7.widget.RecyclerView.Adapter
        public int getItemCount() {
            return NotificationsFragment.this.data.size();
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        public int getItemViewType(int position) {
            switch (((Notification) NotificationsFragment.this.data.get(position)).type.feedbackType) {
                case Copy:
                case Users:
                case MoneyTransfer:
                    return 17;
                case Post:
                    return ((Notification) NotificationsFragment.this.data.get(position)).item.getType();
                case Comment:
                    return 15;
                case Header:
                    return 13;
                case Group:
                    return 14;
                default:
                    return 5;
            }
        }

        @Override // me.grishka.appkit.views.UsableRecyclerView.Adapter, me.grishka.appkit.preloading.PrefetchInfoProvider
        public int getImageCountForItem(int position) {
            switch (getItemViewType(position)) {
                case 0:
                case 1:
                case 2:
                case 3:
                case 4:
                case 5:
                case 6:
                case 7:
                case 8:
                case 9:
                case 10:
                case 16:
                    return ((Notification) NotificationsFragment.this.data.get(position)).item.getImageCount();
                case 11:
                case 12:
                case 13:
                case 14:
                default:
                    return 0;
                case 15:
                    return CommentHolder.getImagesCount((Notification) NotificationsFragment.this.data.get(position));
                case 17:
                    return UsersHolder.getImagesCount((Notification) NotificationsFragment.this.data.get(position));
            }
        }

        @Override // me.grishka.appkit.views.UsableRecyclerView.Adapter, me.grishka.appkit.preloading.PrefetchInfoProvider
        public String getImageURL(int position, int image) {
            Notification entry = (Notification) NotificationsFragment.this.data.get(position);
            switch (getItemViewType(position)) {
                case 0:
                case 1:
                case 2:
                case 3:
                case 4:
                case 5:
                case 6:
                case 7:
                case 8:
                case 9:
                case 10:
                case 16:
                    return ((Notification) NotificationsFragment.this.data.get(position)).item.getImageURL(image);
                case 11:
                case 12:
                case 13:
                case 14:
                default:
                    return null;
                case 15:
                    return CommentHolder.getImageURL(entry, image);
                case 17:
                    return UsersHolder.getImageURL(entry, image);
            }
        }

        @Override // com.vkontakte.android.fragments.base.GridFragment.GridAdapter, com.vkontakte.android.ui.recyclerview.CardItemDecoration.Provider
        public int getBlockType(int position) {
            if (position >= getItemCount() || position < 0) {
                return 1;
            }
            if (!NotificationsFragment.this.isTablet && (position == 0 || position == getItemCount() - 2 || position == getItemCount() - 1)) {
                return 1;
            }
            switch (getItemViewType(position)) {
                case 13:
                    return 2;
                default:
                    return 1;
            }
        }

        @Override // me.grishka.appkit.views.DividerItemDecoration.Provider
        public boolean needDrawDividerAfter(int position) {
            PostDisplayItem next;
            if (getBlockType(position) == 1) {
                Notification item = (Notification) NotificationsFragment.this.data.get(position);
                Notification.FeedbackType feedbackType = item.type.feedbackType;
                if (feedbackType != Notification.FeedbackType.Header) {
                    if (feedbackType != Notification.FeedbackType.Post || position + 1 >= getItemCount() || (next = ((Notification) NotificationsFragment.this.data.get(position + 1)).item) == null) {
                        return true;
                    }
                    return next.postID != item.item.postID;
                }
            }
            return false;
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        public long getItemId(int position) {
            return (((Notification) NotificationsFragment.this.data.get(position)).hashCode() * 5) + (((Notification) NotificationsFragment.this.data.get(position)).id * 7);
        }
    }
}
