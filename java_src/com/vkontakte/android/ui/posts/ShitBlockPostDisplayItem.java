package com.vkontakte.android.ui.posts;

import android.content.Context;
import android.text.TextUtils;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.widget.HorizontalScrollView;
import android.widget.LinearLayout;
import android.widget.TextView;
import com.fasterxml.jackson.core.util.MinimalPrettyPrinter;
import com.vk.imageloader.view.VKImageView;
import com.vkontakte.android.NewsEntry;
import com.vkontakte.android.R;
import com.vkontakte.android.ViewUtils;
import com.vkontakte.android.attachments.Attachment;
import com.vkontakte.android.attachments.AttachmentViewHolder;
import com.vkontakte.android.attachments.ShitAttachment;
import com.vkontakte.android.attachments.VideoAttachment;
import com.vkontakte.android.data.PostInteract;
import com.vkontakte.android.data.ServerKeys;
import com.vkontakte.android.media.AutoPlay;
import com.vkontakte.android.ui.RatingView;
import com.vkontakte.android.ui.holder.RecyclerHolder;
import com.vkontakte.android.ui.widget.AdsButton;
import com.vkontakte.android.utils.AdsUtil;
import com.vkontakte.android.utils.Utils;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import me.grishka.appkit.utils.V;
/* loaded from: classes3.dex */
public class ShitBlockPostDisplayItem extends AdBlockPostDisplayItem {
    private final PostInteract postInteract;
    private final String referrer;

    public ShitBlockPostDisplayItem(NewsEntry _post, String referrer, PostInteract postInteract) {
        super(_post);
        this.referrer = referrer;
        this.postInteract = postInteract;
    }

    @Override // com.vkontakte.android.ui.posts.PostDisplayItem
    public int getType() {
        return 14;
    }

    @Override // com.vkontakte.android.ui.posts.PostDisplayItem
    public int getImageCount() {
        return this.post.attachments.size() * 2;
    }

    @Override // com.vkontakte.android.ui.posts.PostDisplayItem
    public void onBindView(View view) {
        final ViewHolder viewHolder = (ViewHolder) view.getTag();
        viewHolder.bind(this.post, this);
        int count = this.post.attachments.size();
        if (viewHolder.scroller.getTag() != null) {
            viewHolder.scroller.removeOnLayoutChangeListener((View.OnLayoutChangeListener) viewHolder.scroller.getTag());
            viewHolder.scroller.setTag(null);
        }
        if (count == 1) {
            View.OnLayoutChangeListener layoutChangeListener = new View.OnLayoutChangeListener() { // from class: com.vkontakte.android.ui.posts.ShitBlockPostDisplayItem.1
                @Override // android.view.View.OnLayoutChangeListener
                public void onLayoutChange(View v, final int left, int top, final int right, int bottom, int oldLeft, int oldTop, int oldRight, int oldBottom) {
                    final View item = viewHolder.content.getChildAt(0);
                    boolean needUpdateLayoutParams = true;
                    if (item.getLayoutParams() instanceof LinearLayout.LayoutParams) {
                        LinearLayout.LayoutParams params = (LinearLayout.LayoutParams) item.getLayoutParams();
                        if (params.width == right - left && params.height == -2) {
                            needUpdateLayoutParams = false;
                        }
                    }
                    if (needUpdateLayoutParams) {
                        ViewUtils.postDelayed(new Runnable() { // from class: com.vkontakte.android.ui.posts.ShitBlockPostDisplayItem.1.1
                            @Override // java.lang.Runnable
                            public void run() {
                                item.setLayoutParams(new LinearLayout.LayoutParams(right - left, -2));
                            }
                        }, 0L);
                    }
                }
            };
            viewHolder.scroller.addOnLayoutChangeListener(layoutChangeListener);
            viewHolder.scroller.setTag(layoutChangeListener);
        }
    }

    @Override // com.vkontakte.android.ui.posts.PostDisplayItem
    public String getImageURL(int image) {
        int idx = image / 2;
        ShitAttachment a = (ShitAttachment) this.post.attachments.get(idx);
        if (image % 2 == 1) {
            if (a.video == null) {
                if (a.photo == null) {
                    return null;
                }
                return a.photo.getThumbURL();
            }
            return a.video.getImageURL();
        }
        return a.userPhoto;
    }

    @Override // com.vkontakte.android.ui.posts.PostDisplayItem
    public AutoPlay getAutoPlayItem() {
        List<AutoPlay> playList = new ArrayList<>();
        Iterator<Attachment> it = this.post.attachments.iterator();
        while (it.hasNext()) {
            Attachment att = it.next();
            ShitAttachment a = (ShitAttachment) att;
            if (a.video != null) {
                playList.add(a.video);
            }
        }
        if (playList.size() == 1) {
            return playList.get(0);
        }
        return null;
    }

    public static View createView(Context context) {
        return new ViewHolder(context).itemView;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes3.dex */
    public static class ViewHolder extends RecyclerHolder<NewsEntry> implements View.OnTouchListener {
        final LinearLayout content;
        List<ViewHolderItem> items;
        ShitBlockPostDisplayItem postDisplayItem;
        final HorizontalScrollView scroller;
        final TextView title;

        public ViewHolder(Context context) {
            super((int) R.layout.news_shit_block, context);
            this.items = new ArrayList(1);
            this.content = (LinearLayout) $(R.id.content);
            this.content.setDividerDrawable(AdBlockPostDisplayItem.dividerDrawable);
            this.content.setShowDividers(2);
            this.title = (TextView) $(R.id.title);
            this.scroller = (HorizontalScrollView) $(R.id.scroller);
            this.itemView.setTag(this);
            this.scroller.setOnTouchListener(this);
        }

        @Override // android.view.View.OnTouchListener
        public boolean onTouch(View v, MotionEvent event) {
            if (event.getAction() == 1 || event.getAction() == 3) {
                v.postDelayed(ShitBlockPostDisplayItem$ViewHolder$$Lambda$1.lambdaFactory$(this, v), 500L);
                return false;
            }
            return false;
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public /* synthetic */ void lambda$onTouch$0(View v) {
            for (int i = 0; i < this.content.getChildCount(); i++) {
                View c = this.content.getChildAt(i);
                if (c.getVisibility() == 0) {
                    int offset = c.getLeft() - v.getScrollX();
                    if (offset > 0 && c.getWidth() + offset < v.getWidth()) {
                        AdsUtil.trackImpression(getAttachment(i));
                    }
                } else {
                    return;
                }
            }
        }

        ShitAttachment getAttachment(int i) {
            return (ShitAttachment) (i >= ((NewsEntry) this.item).attachments.size() ? null : ((NewsEntry) this.item).attachments.get(i));
        }

        public void bind(NewsEntry item, ShitBlockPostDisplayItem postDisplayItem) {
            this.postDisplayItem = postDisplayItem;
            bind(item);
        }

        @Override // com.vkontakte.android.ui.holder.RecyclerHolder
        public void onBind(NewsEntry post) {
            int count = post.attachments.size();
            int width = NewsEntry.getMaxThumbsWidth() - (count > 1 ? getResources().getDimensionPixelOffset(R.dimen.post_side_padding) * 2 : 0);
            int height = Math.round(width * 0.561194f);
            boolean needCleanScroll = false;
            int size = Math.max(this.content.getChildCount(), post.attachments.size());
            for (int i = 0; i < size; i++) {
                View view = this.content.getChildAt(i);
                ViewHolderItem holderItem = view == null ? null : (ViewHolderItem) view.getTag();
                if (holderItem == null) {
                    holderItem = new ViewHolderItem(this.itemView.getContext());
                    this.items.add(holderItem);
                    this.content.addView(holderItem.itemView);
                }
                ShitAttachment a = getAttachment(i);
                if (a != null && a.video != null) {
                    a.video.setStatistic(a);
                    a.video.setPostId(post.postID);
                    a.video.setPostOwnerId(post.ownerID);
                    a.video.setReferData(this.postDisplayItem.referrer, this.postDisplayItem.postInteract);
                }
                holderItem.setVideoAttachment(a);
                if (!Utils.equals(holderItem.getItem(), a)) {
                    needCleanScroll = true;
                }
                holderItem.bind(a, count, width, height, this.postDisplayItem);
            }
            if (needCleanScroll) {
                AdBlockPostDisplayItem.cleanScroll(this.scroller);
            }
            updateHeight();
            if (count == 1) {
                this.content.setPadding(0, 0, 0, 0);
                ((LinearLayout) this.itemView).setShowDividers(2);
            } else {
                int postSidePad = getResources().getDimensionPixelOffset(R.dimen.post_side_padding);
                this.content.setPadding(postSidePad, 0, postSidePad, V.dp(16.0f));
                ((LinearLayout) this.itemView).setShowDividers(0);
            }
            StringBuilder titleStr = new StringBuilder(post.extra.getString(ServerKeys.ADS_TITLE));
            if (count == 1) {
                String restriction = post.extra.getString("age_restriction");
                StringBuilder append = titleStr.append(' ');
                if (TextUtils.isEmpty(restriction)) {
                    restriction = getAttachment(0).ageRestriction;
                }
                append.append(restriction);
            }
            this.title.setText(titleStr);
            AdsUtil.trackImpression((ShitAttachment) post.attachments.get(0));
        }

        void updateHeight() {
            this.content.getViewTreeObserver().addOnPreDrawListener(new ViewTreeObserver.OnPreDrawListener() { // from class: com.vkontakte.android.ui.posts.ShitBlockPostDisplayItem.ViewHolder.1
                @Override // android.view.ViewTreeObserver.OnPreDrawListener
                public boolean onPreDraw() {
                    ViewHolder.this.content.getViewTreeObserver().removeOnPreDrawListener(this);
                    int maxH = 0;
                    for (int i = 0; i < ViewHolder.this.items.size(); i++) {
                        ViewHolderItem item = ViewHolder.this.items.get(i);
                        if (item.getItem() == null) {
                            break;
                        }
                        maxH = Math.max(maxH, item.text.getMeasuredHeight());
                    }
                    for (int i2 = 0; i2 < ViewHolder.this.items.size(); i2++) {
                        ViewHolderItem item2 = ViewHolder.this.items.get(i2);
                        if (item2.getItem() != null) {
                            item2.text.getLayoutParams().height = maxH;
                            item2.itemView.requestLayout();
                        } else {
                            return false;
                        }
                    }
                    return false;
                }
            });
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes3.dex */
    public static class ViewHolderItem extends RecyclerHolder<ShitAttachment> implements View.OnClickListener {
        final AdsButton attachSubtitle;
        final TextView attachTitle;
        final View border;
        final ViewGroup content;
        final VKImageView contentPhoto;
        View contentVideo;
        int count;
        int height;
        final VKImageView photo;
        ShitBlockPostDisplayItem postDisplayItem;
        final View postOptionsButton;
        final RatingView ratingView;
        final TextView subtitle;
        final TextView text;
        final TextView title;
        VideoAttachment videoAttachment;
        int width;

        ViewHolderItem(Context context) {
            super((int) R.layout.news_shit_item, context);
            this.content = (ViewGroup) $(R.id.content);
            this.contentPhoto = (VKImageView) $(R.id.content_photo);
            this.contentPhoto.setPlaceholderColor(-855310);
            this.photo = (VKImageView) $(R.id.photo);
            this.title = (TextView) $(R.id.title);
            this.border = $(R.id.border);
            this.text = (TextView) $(R.id.text);
            this.subtitle = (TextView) $(R.id.subtitle);
            this.attachTitle = (TextView) $(R.id.attach_title);
            this.attachSubtitle = (AdsButton) $(R.id.attach_subtitle);
            this.ratingView = (RatingView) $(R.id.attach_rating);
            this.postOptionsButton = $(R.id.post_options_btn);
            this.postOptionsButton.setOnClickListener(this);
            this.itemView.setOnClickListener(this);
            this.itemView.setTag(this);
        }

        public void bind(ShitAttachment item, int count, int width, int height, ShitBlockPostDisplayItem postDisplayItem) {
            this.count = count;
            this.width = width;
            this.height = height;
            this.postDisplayItem = postDisplayItem;
            this.attachSubtitle.setOnClickListener(this);
            bind(item);
        }

        public void setVideoAttachment(ShitAttachment shitAttachment) {
            if (shitAttachment != null) {
                this.videoAttachment = shitAttachment.video;
                if (this.videoAttachment != null) {
                    ensureContentVideoIsReturnedToPool();
                    this.videoAttachment.setShitAttachment(shitAttachment);
                    this.videoAttachment.setLayoutTag(VideoAttachment.HOLDER_TYPE_ADS);
                    this.contentVideo = this.videoAttachment.getFullView(this.itemView.getContext());
                    this.contentVideo.setOnClickListener(this);
                    this.videoAttachment.bind(null);
                    this.content.addView(this.contentVideo);
                    return;
                }
                ensureContentVideoIsReturnedToPool();
            }
        }

        private void ensureContentVideoIsReturnedToPool() {
            if (this.contentVideo != null) {
                Object tag = this.contentVideo.getTag();
                if ((tag instanceof String) || (tag instanceof AttachmentViewHolder)) {
                    Attachment.reuseView(this.contentVideo, tag.toString());
                }
                this.content.removeView(this.contentVideo);
                this.contentVideo = null;
            }
        }

        @Override // com.vkontakte.android.ui.holder.RecyclerHolder
        public void onBind(ShitAttachment a) {
            int i = 0;
            this.itemView.setLayoutParams(new LinearLayout.LayoutParams(this.width, -2));
            this.border.setVisibility(this.count > 1 ? 0 : 4);
            if (a != null) {
                this.itemView.setVisibility(0);
                if (a.video == null) {
                    if (a.photo != null) {
                        a.photo.setViewSize(this.width, this.height, false, false);
                        this.contentPhoto.load(a.photo.getThumbURL());
                        this.contentPhoto.getLayoutParams().height = this.height;
                        this.contentPhoto.setVisibility(0);
                        ViewUtils.setVisibility(this.contentVideo, 8);
                    }
                } else {
                    this.contentVideo.getLayoutParams().height = -2;
                    this.contentPhoto.setVisibility(8);
                    ViewUtils.setVisibility(this.contentVideo, 0);
                }
                this.photo.load(a.userPhoto);
                this.title.setText(a.userName);
                String genre = a.genre + (this.count == 1 ? "" : MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR + a.ageRestriction);
                this.subtitle.setText(genre);
                this.text.setText(a.text);
                this.text.getLayoutParams().height = -2;
                this.attachTitle.setText(a.followers);
                this.attachSubtitle.setText(a.installed ? a.buttonTextInstalled : a.buttonText);
                RatingView ratingView = this.ratingView;
                if (a.rating <= 0.0f) {
                    i = 8;
                }
                ratingView.setVisibility(i);
                this.ratingView.setRating(a.rating);
                return;
            }
            this.itemView.setVisibility(8);
        }

        @Override // android.view.View.OnClickListener
        public void onClick(View v) {
            switch (v.getId()) {
                case R.id.post_options_btn /* 2131756032 */:
                    this.postDisplayItem.onMenuClicked(getItem(), v);
                    return;
                default:
                    this.postDisplayItem.onItemClicked(getItem(), v);
                    return;
            }
        }
    }
}
