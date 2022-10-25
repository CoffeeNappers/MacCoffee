package com.vkontakte.android.ui.posts;

import android.content.Context;
import android.content.DialogInterface;
import android.graphics.drawable.Drawable;
import android.support.annotation.LayoutRes;
import android.support.annotation.NonNull;
import android.support.v7.widget.PopupMenu;
import android.text.Spannable;
import android.text.SpannableStringBuilder;
import android.text.TextUtils;
import android.text.style.ImageSpan;
import android.view.MenuItem;
import android.view.View;
import android.widget.ImageView;
import android.widget.RelativeLayout;
import android.widget.TextView;
import com.fasterxml.jackson.core.util.MinimalPrettyPrinter;
import com.vk.core.util.DrawableUtils;
import com.vk.core.util.TimeoutLock;
import com.vk.imageloader.view.VKImageView;
import com.vkontakte.android.AppStateTracker;
import com.vkontakte.android.NewsEntry;
import com.vkontakte.android.R;
import com.vkontakte.android.TimeUtils;
import com.vkontakte.android.VKAlertDialog;
import com.vkontakte.android.api.Callback;
import com.vkontakte.android.api.Group;
import com.vkontakte.android.api.ResultlessCallback;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.api.friends.FriendsAdd;
import com.vkontakte.android.api.friends.FriendsDelete;
import com.vkontakte.android.api.groups.GroupsJoin;
import com.vkontakte.android.api.groups.GroupsLeave;
import com.vkontakte.android.attachments.Attachment;
import com.vkontakte.android.attachments.ShitAttachment;
import com.vkontakte.android.audio.utils.Utils;
import com.vkontakte.android.data.Analytics;
import com.vkontakte.android.data.Friends;
import com.vkontakte.android.data.Groups;
import com.vkontakte.android.data.PostInteract;
import com.vkontakte.android.data.ServerKeys;
import com.vkontakte.android.fragments.ProfileFragment;
import com.vkontakte.android.functions.F0;
import com.vkontakte.android.statistics.StatisticUrl;
import io.fabric.sdk.android.services.events.EventsFilesManager;
import me.grishka.appkit.utils.V;
/* loaded from: classes3.dex */
public class HeaderPostDisplayItem extends PostDisplayItem {
    public boolean fromList;
    public int listPosition;
    public View.OnClickListener menuClickListener;
    private View.OnClickListener photoOnClick;
    public boolean photosMode;
    public NewsEntry post;
    public String referrer;
    public boolean showMenu;
    private final SubscribeClickListener subscribeClickListener;

    public HeaderPostDisplayItem(NewsEntry _post, boolean _photosMode, boolean _list, String _referrer, int _listPosition, @NonNull PostInteract postInteract) {
        super(_post);
        this.subscribeClickListener = new SubscribeClickListener();
        this.showMenu = true;
        this.photosMode = _photosMode;
        this.post = _post;
        this.fromList = _list;
        this.referrer = _referrer;
        this.listPosition = _listPosition;
        this.photoOnClick = HeaderPostDisplayItem$$Lambda$1.lambdaFactory$(this, postInteract);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$new$0(@NonNull PostInteract postInteract, View v) {
        new ProfileFragment.Builder(this.post.userID).setFromPost(this.post.ownerID, this.post.postID).go(v.getContext());
        if (this.post.userID > 0) {
            postInteract.commit(PostInteract.Type.open_user);
        } else {
            postInteract.commit(PostInteract.Type.open_group);
        }
    }

    @Override // com.vkontakte.android.ui.posts.PostDisplayItem
    public int getType() {
        if (this.post.captionText == null || this.post.captionText.length() <= 0) {
            return this.post.type != 12 ? 0 : 12;
        }
        return 20;
    }

    @Override // com.vkontakte.android.ui.posts.PostDisplayItem
    public int getImageCount() {
        return 1;
    }

    private static View createView(Context context, @LayoutRes int res) {
        View view = View.inflate(context, res, null);
        ViewHolder holder = new ViewHolder();
        holder.name = (TextView) view.findViewById(R.id.poster_name_view);
        holder.time = (TextView) view.findViewById(R.id.post_info_view);
        holder.photo = (VKImageView) view.findViewById(R.id.user_photo);
        holder.menuBtn = view.findViewById(R.id.post_options_btn);
        holder.subscribeBtn = (ImageView) view.findViewById(R.id.subscribe_btn);
        holder.unSubscribeBtn = view.findViewById(R.id.unsubscribe_btn);
        holder.adsTitle = (TextView) view.findViewById(R.id.ads_title);
        holder.adsAction = (TextView) view.findViewById(R.id.ads_action);
        holder.ageRestriction = (TextView) view.findViewById(R.id.age_restriction);
        holder.profileBtn = view.findViewById(R.id.post_profile_btn);
        view.setTag(holder);
        return view;
    }

    public static View createView(Context context) {
        return createView(context, R.layout.news_item_header);
    }

    public static View createViewAd(Context context) {
        return createView(context, R.layout.news_item_header_ad);
    }

    public static View createViewRecommended(Context context) {
        return createView(context, R.layout.news_item_header_recommended);
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // com.vkontakte.android.ui.posts.PostDisplayItem
    public void onBindView(View view) {
        CharSequence infoHtml;
        StatisticUrl impression;
        CharSequence name = this.post.userName;
        if (this.post.type == 7) {
            infoHtml = view.getResources().getQuantityString(this.post.f ? R.plurals.photos_tagged_short_f : R.plurals.photos_tagged_short_m, this.post.postID, Integer.valueOf(this.post.postID)) + ", " + TimeUtils.langDateRelative(this.post.time, view.getResources());
        } else if (this.post.type == 6) {
            infoHtml = view.getResources().getQuantityString(R.plurals.photos, this.post.postID, Integer.valueOf(this.post.postID)) + ", " + TimeUtils.langDateRelative(this.post.time, view.getResources());
        } else if (this.post.type == 11) {
            infoHtml = this.post.retweetUserName + MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR + this.post.extra.getString("age_restriction");
        } else if (this.fromList) {
            infoHtml = TimeUtils.langDateRelative(this.post.time, view.getResources());
        } else {
            infoHtml = TimeUtils.langDate(this.post.time);
        }
        if (this.post.type == 5) {
            infoHtml = ((Object) infoHtml) + MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR + view.getResources().getString(R.string.ntf_to_post);
        }
        if (!this.photosMode && this.post.type == 1 && this.post.extra.getBoolean("converted_to_photo")) {
            if (this.post.extra.getInt("orig_type") == 6) {
                infoHtml = view.getResources().getQuantityString(R.plurals.photos, 1, 1) + ", " + ((Object) infoHtml);
            } else if (this.post.extra.getInt("orig_type") == 7) {
                infoHtml = view.getResources().getQuantityString(this.post.f ? R.plurals.photos_tagged_short_f : R.plurals.photos_tagged_short_m, 1, 1) + ", " + ((Object) infoHtml);
            }
        }
        if (this.post.flag(512) || this.post.flag(1024)) {
            SpannableStringBuilder bldr = new SpannableStringBuilder(((Object) name) + "");
            Spannable sp = Spannable.Factory.getInstance().newSpannable("F");
            Drawable d = view.getResources().getDrawable(this.post.flag(512) ? R.drawable.ic_post_friends_only : R.drawable.ic_post_pinned);
            d.setBounds(0, 0, d.getIntrinsicWidth(), d.getIntrinsicHeight());
            sp.setSpan(new ImageSpan(d, 0), 0, 1, 0);
            bldr.append((CharSequence) MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR);
            bldr.append((CharSequence) sp);
            name = bldr;
        }
        ViewHolder holder = (ViewHolder) view.getTag();
        int platformIconResId = this.post.getPlatformIconResource();
        if (platformIconResId != 0 && !this.post.flag(32)) {
            SpannableStringBuilder bldr2 = new SpannableStringBuilder(infoHtml);
            Spannable sp2 = Spannable.Factory.getInstance().newSpannable("F");
            Drawable d2 = view.getResources().getDrawable(platformIconResId);
            d2.setBounds(0, 0, d2.getIntrinsicWidth(), d2.getIntrinsicHeight());
            sp2.setSpan(new ImageSpan(d2, 0), 0, 1, 0);
            bldr2.append((CharSequence) MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR);
            bldr2.append((CharSequence) sp2);
            infoHtml = bldr2;
        }
        if (holder.adsTitle != null && !TextUtils.isEmpty(this.post.captionText)) {
            holder.adsTitle.setText(this.post.captionText);
        } else if (holder.adsTitle != null && holder.ageRestriction != null) {
            holder.adsTitle.setText(this.post.extra.getString(ServerKeys.ADS_TITLE));
            holder.ageRestriction.setText(this.post.extra.getString("age_restriction"));
        }
        if (holder.adsAction != null) {
            boolean showAction = !TextUtils.isEmpty(this.post.captionActionUrl) && !TextUtils.isEmpty(this.post.captionActionText);
            holder.adsAction.setVisibility(showAction ? 0 : 8);
            if (showAction) {
                holder.adsAction.setText(this.post.captionActionText);
                holder.adsAction.setOnClickListener(HeaderPostDisplayItem$$Lambda$2.lambdaFactory$(this));
            }
            if (holder.adsTitle != null) {
                int padding = (int) holder.adsTitle.getContext().getResources().getDimension(R.dimen.post_side_padding);
                holder.adsTitle.setPadding(padding, 0, 0, 0);
            }
        }
        if (holder.subscribeBtn != null) {
            if (this.post.ownerID > 0) {
                holder.subscribeBtn.setImageResource(R.drawable.ic_recommendations_add_friend);
            } else {
                Context context = holder.subscribeBtn.getContext();
                holder.subscribeBtn.setImageDrawable(DrawableUtils.tint(context, R.drawable.ic_add_24dp, R.color.brand_primary));
            }
            holder.subscribeBtn.setVisibility((this.post.suggestSubscribe == null || !this.post.suggestSubscribe.booleanValue()) ? 8 : 0);
            holder.subscribeBtn.setOnClickListener(this.subscribeClickListener);
            this.subscribeClickListener.subscribeButton = holder.subscribeBtn;
        }
        if (holder.unSubscribeBtn != null) {
            holder.unSubscribeBtn.setVisibility((this.post.suggestSubscribe == null || this.post.suggestSubscribe.booleanValue()) ? 8 : 0);
            holder.unSubscribeBtn.setOnClickListener(this.subscribeClickListener);
            this.subscribeClickListener.unSubscribeButton = holder.unSubscribeBtn;
        }
        holder.name.setText(name);
        holder.time.setText(infoHtml);
        if (holder.menuBtn != null) {
            holder.menuBtn.setOnClickListener(this.menuClickListener);
            holder.menuBtn.setVisibility(this.showMenu ? 0 : 8);
            holder.menuBtn.setTag(this.post);
        }
        holder.profileBtn.setOnClickListener(this.photoOnClick);
        holder.profileBtn.setClickable((this.post.ownerID == 0 || this.post.type == 11) ? false : true);
        boolean needMargin = holder.subscribeBtn != null && holder.subscribeBtn.getVisibility() == 0 && holder.menuBtn != null && holder.menuBtn.getVisibility() == 0;
        int shiftMargin = needMargin ? V.dp(48.0f) : 0;
        int subscribeMargin = needMargin ? 0 : V.dp(4.0f);
        RelativeLayout.LayoutParams params = (RelativeLayout.LayoutParams) holder.profileBtn.getLayoutParams();
        RelativeLayout.LayoutParams subscribeParams = (RelativeLayout.LayoutParams) holder.subscribeBtn.getLayoutParams();
        RelativeLayout.LayoutParams unSubscribeParams = (RelativeLayout.LayoutParams) holder.unSubscribeBtn.getLayoutParams();
        params.rightMargin = ((int) view.getResources().getDimension(R.dimen.post_side_padding_info)) + shiftMargin;
        subscribeParams.rightMargin = subscribeMargin;
        unSubscribeParams.rightMargin = subscribeMargin;
        holder.profileBtn.requestLayout();
        holder.subscribeBtn.requestLayout();
        holder.unSubscribeBtn.requestLayout();
        holder.photo.setPlaceholderImage(this.post.userID > 0 ? R.drawable.placeholder_user_72dp : R.drawable.placeholder_group_72dp);
        holder.photo.load(getImageURL(0));
        if ((this.post.type == 0 || this.post.type == 1 || this.post.type == 2 || this.post.type == 4 || this.post.type == 12) && !this.post.extra.containsKey("view_post_viewed")) {
            this.post.extra.putBoolean("view_post_viewed", true);
            String postIds = this.post.ownerID + EventsFilesManager.ROLL_OVER_FILE_NAME_SEPARATOR + this.post.postID + "|" + this.post.getTypeString() + "|" + this.referrer + "|" + this.listPosition;
            if (this.post.type == 12 && this.post.attachments != null) {
                int i = 0;
                while (true) {
                    if (i >= this.post.attachments.size()) {
                        break;
                    }
                    Attachment attachment = this.post.attachments.get(i);
                    if (!(attachment instanceof ShitAttachment) || (impression = ((ShitAttachment) attachment).dataImpression) == null || TextUtils.isEmpty(impression.value)) {
                        i++;
                    } else {
                        postIds = postIds + "|" + impression.value;
                        break;
                    }
                }
            }
            Analytics.EventBuilder builder = Analytics.track("view_post").collapse().unique();
            if (this.post.hasTrackCode()) {
                builder.addParam("track_code", this.post.getTrackCode());
            }
            builder.addParam("post_ids", postIds);
            builder.addParam("repost_ids", this.post.flag(32) ? this.post.getRepostTypeString() + this.post.retweetUID + EventsFilesManager.ROLL_OVER_FILE_NAME_SEPARATOR + this.post.retweetOrigId : null);
            builder.commit();
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$onBindView$1(View v) {
        Utils.openLink(v.getContext(), this.post.captionActionUrl.toString());
    }

    @Override // com.vkontakte.android.ui.posts.PostDisplayItem
    public String getImageURL(int image) {
        return this.post.userPhotoURL;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void doAddFriend(final Context context, final int uid, final F0<Void> showUnSubscribe) {
        Analytics.track("subscription_from_post").collapse().unique().addParam("post_ids", Integer.valueOf(this.postID)).commit();
        FriendsAdd.createFriendsAddAndSendAllStats(uid, null).setCallback(new Callback<Integer>() { // from class: com.vkontakte.android.ui.posts.HeaderPostDisplayItem.1
            @Override // com.vkontakte.android.api.Callback
            public void success(Integer result) {
                int friendStatus;
                switch (result.intValue()) {
                    case 1:
                        friendStatus = 1;
                        break;
                    case 2:
                        friendStatus = 3;
                        break;
                    case 3:
                    default:
                        friendStatus = 0;
                        break;
                    case 4:
                        friendStatus = 1;
                        break;
                }
                showUnSubscribe.f();
                Friends.notifyFriendStatusChanged(uid, friendStatus);
                HeaderPostDisplayItem.this.post.suggestSubscribe = false;
            }

            @Override // com.vkontakte.android.api.Callback
            public void fail(VKAPIRequest.VKErrorResponse error) {
                new VKAlertDialog.Builder(context == null ? AppStateTracker.getCurrentActivity() : context).setTitle(R.string.error).setMessage(R.string.err_access).setPositiveButton(R.string.ok, (DialogInterface.OnClickListener) null).show();
            }
        }).wrapProgress(context).exec(context);
    }

    private void doRemoveFriend(final Context context, final int uid, final F0<Void> showSubscribe) {
        new FriendsDelete(uid).setCallback(new Callback<Integer>() { // from class: com.vkontakte.android.ui.posts.HeaderPostDisplayItem.2
            @Override // com.vkontakte.android.api.Callback
            public void success(Integer result) {
                showSubscribe.f();
                Friends.removeLocally(uid);
                HeaderPostDisplayItem.this.post.suggestSubscribe = true;
            }

            @Override // com.vkontakte.android.api.Callback
            public void fail(VKAPIRequest.VKErrorResponse error) {
                new VKAlertDialog.Builder(context).setTitle(R.string.error).setMessage(R.string.err_text).setPositiveButton(R.string.ok, (DialogInterface.OnClickListener) null).show();
            }
        }).wrapProgress(context).exec(context);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void joinGroup(final Context context, int uid, final F0<Void> showUnSubscribe) {
        Analytics.track("subscription_from_post").collapse().unique().addParam("post_ids", Integer.valueOf(this.postID)).commit();
        GroupsJoin.createGroupsJoinAndSendAllStats(uid, false).setCallback(new ResultlessCallback(context) { // from class: com.vkontakte.android.ui.posts.HeaderPostDisplayItem.3
            @Override // com.vkontakte.android.api.ResultlessCallback
            public void success() {
                HeaderPostDisplayItem.this.post.suggestSubscribe = false;
                showUnSubscribe.f();
            }

            @Override // com.vkontakte.android.api.SimpleCallback, com.vkontakte.android.api.Callback
            public void fail(VKAPIRequest.VKErrorResponse error) {
                new VKAlertDialog.Builder(context).setTitle(R.string.error).setMessage(error.getCodeValue() == 15 ? R.string.page_blacklist : R.string.err_text).setPositiveButton(R.string.ok, (DialogInterface.OnClickListener) null).show();
            }
        }).wrapProgress(context).exec(context);
    }

    private void doLeaveGroup(final Context context, int uid, final F0<Void> showSubscribe) {
        new GroupsLeave(uid).setCallback(new ResultlessCallback(context) { // from class: com.vkontakte.android.ui.posts.HeaderPostDisplayItem.4
            @Override // com.vkontakte.android.api.ResultlessCallback
            public void success() {
                HeaderPostDisplayItem.this.post.suggestSubscribe = true;
                showSubscribe.f();
            }

            @Override // com.vkontakte.android.api.SimpleCallback, com.vkontakte.android.api.Callback
            public void fail(VKAPIRequest.VKErrorResponse error) {
                new VKAlertDialog.Builder(context).setTitle(R.string.error).setMessage(R.string.err_text).setPositiveButton(R.string.ok, (DialogInterface.OnClickListener) null).show();
            }
        }).wrapProgress(context).exec(context);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void showUnSubscribeMenu(View anchorView, F0<Void> showSubscribe) {
        int unSubscribeTitle;
        if (this.post.ownerID < 0) {
            Group group = Groups.getById(-this.post.ownerID);
            unSubscribeTitle = (group == null || group.isClosed == 0) ? R.string.profile_unsubscribe : R.string.leave_group;
        } else {
            unSubscribeTitle = R.string.profile_friend_cancel;
        }
        PopupMenu menu = new PopupMenu(anchorView.getContext(), anchorView);
        menu.getMenu().add(0, 0, 0, unSubscribeTitle);
        menu.setOnMenuItemClickListener(HeaderPostDisplayItem$$Lambda$3.lambdaFactory$(this, anchorView, showSubscribe));
        menu.show();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ boolean lambda$showUnSubscribeMenu$2(View anchorView, F0 showSubscribe, MenuItem mi) {
        if (this.post.ownerID < 0) {
            doLeaveGroup(anchorView.getContext(), -this.post.ownerID, showSubscribe);
            return true;
        }
        doRemoveFriend(anchorView.getContext(), this.post.ownerID, showSubscribe);
        return true;
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes3.dex */
    public class SubscribeClickListener implements View.OnClickListener {
        final TimeoutLock clickLock;
        final F0<Void> showSubscribe;
        final F0<Void> showUnSubscribe;
        View subscribeButton;
        View unSubscribeButton;

        private SubscribeClickListener() {
            this.showUnSubscribe = HeaderPostDisplayItem$SubscribeClickListener$$Lambda$1.lambdaFactory$(this);
            this.showSubscribe = HeaderPostDisplayItem$SubscribeClickListener$$Lambda$2.lambdaFactory$(this);
            this.clickLock = new TimeoutLock(500L);
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public /* synthetic */ Void lambda$new$0() {
            V.setVisibilityAnimated(this.subscribeButton, 4);
            V.setVisibilityAnimated(this.unSubscribeButton, 0);
            return null;
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public /* synthetic */ Void lambda$new$1() {
            V.setVisibilityAnimated(this.unSubscribeButton, 4);
            V.setVisibilityAnimated(this.subscribeButton, 0);
            return null;
        }

        @Override // android.view.View.OnClickListener
        public void onClick(View v) {
            if (!this.clickLock.isLocked()) {
                this.clickLock.lock();
                if (HeaderPostDisplayItem.this.post.suggestSubscribe == null || !HeaderPostDisplayItem.this.post.suggestSubscribe.booleanValue()) {
                    HeaderPostDisplayItem.this.showUnSubscribeMenu(v, this.showSubscribe);
                } else if (HeaderPostDisplayItem.this.post.ownerID > 0) {
                    HeaderPostDisplayItem.this.doAddFriend(v.getContext(), HeaderPostDisplayItem.this.post.ownerID, this.showUnSubscribe);
                } else {
                    HeaderPostDisplayItem.this.joinGroup(v.getContext(), -HeaderPostDisplayItem.this.post.ownerID, this.showUnSubscribe);
                }
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes3.dex */
    public static class ViewHolder {
        TextView adsAction;
        TextView adsTitle;
        TextView ageRestriction;
        View menuBtn;
        TextView name;
        VKImageView photo;
        View profileBtn;
        ImageView subscribeBtn;
        TextView time;
        View unSubscribeBtn;

        private ViewHolder() {
        }
    }
}
