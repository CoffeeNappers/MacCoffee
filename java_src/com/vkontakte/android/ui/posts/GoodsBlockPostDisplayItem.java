package com.vkontakte.android.ui.posts;

import android.app.Activity;
import android.content.Context;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.text.TextUtils;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.widget.TextView;
import com.vk.imageloader.view.VKImageView;
import com.vkontakte.android.Log;
import com.vkontakte.android.NewsEntry;
import com.vkontakte.android.R;
import com.vkontakte.android.attachments.ShitAttachment;
import com.vkontakte.android.data.Analytics;
import com.vkontakte.android.data.ServerKeys;
import com.vkontakte.android.statistics.Statistic;
import com.vkontakte.android.statistics.StatisticUrl;
import com.vkontakte.android.ui.RatingView;
import com.vkontakte.android.ui.holder.RecyclerHolder;
import com.vkontakte.android.ui.recyclerview.SpaceItemDecoration;
import com.vkontakte.android.utils.AdsUtil;
import com.vkontakte.android.utils.Utils;
import java.util.Collections;
import java.util.List;
import me.grishka.appkit.utils.V;
/* loaded from: classes3.dex */
public class GoodsBlockPostDisplayItem extends AdBlockPostDisplayItem {
    /* JADX INFO: Access modifiers changed from: private */
    public void onCardClicked(ShitAttachment ad, ShitAttachment.Card card, View v) {
        Activity activity = Utils.castToActivity(v.getContext());
        if (activity != null) {
            AdsUtil.trackClicks(card.getStatisticByType("click"), card.deepLink, ad.installed);
            if (TextUtils.isEmpty(ad.appPackage) || !ad.installed) {
                AdsUtil.processClickWithoutApp(activity, ad.data, card.linkTarget, card.link);
            } else {
                AdsUtil.processClickWithApp(activity, ad.data, card.getStatisticByType(Statistic.TYPE_DEEP_LINK), card.appPackage, card.deepLink, card.link, ad.installed);
            }
        }
    }

    public GoodsBlockPostDisplayItem(NewsEntry _post) {
        super(_post);
        int size = _post.attachments.size();
        if (size > 1) {
            Log.e("vk", "Goods type display item support is only one attachment. Attachments got count: " + size);
        }
    }

    @Override // com.vkontakte.android.ui.posts.PostDisplayItem
    public int getType() {
        return 15;
    }

    @Override // com.vkontakte.android.ui.posts.PostDisplayItem
    public int getImageCount() {
        if (this.post.attachments.size() == 0) {
            return 1;
        }
        return ((ShitAttachment) this.post.attachments.get(0)).cards.size() + 1;
    }

    @Override // com.vkontakte.android.ui.posts.PostDisplayItem
    public String getImageURL(int image) {
        ShitAttachment att = (ShitAttachment) this.post.attachments.get(0);
        return image == 0 ? att.userPhoto : att.cards.get(image - 1).photo.getThumbURL();
    }

    @Override // com.vkontakte.android.ui.posts.PostDisplayItem
    public void onBindView(View view) {
        ((ViewHolder) view.getTag()).bind(this.post, this);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static void trackCardsImpression(ShitAttachment.Card card) {
        for (StatisticUrl url : card.getStatisticByType(Statistic.TYPE_IMPRESSION)) {
            Analytics.trackExternal(url);
        }
    }

    public static View createView(Context context) {
        return new ViewHolder(context).itemView;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes3.dex */
    public static class ViewHolder extends RecyclerHolder<NewsEntry> implements View.OnClickListener {
        Adapter adapter;
        private final TextView appSubtitle;
        private final TextView appTitle;
        NewsEntry lastPost;
        private final View optionsButton;
        private final VKImageView photo;
        GoodsBlockPostDisplayItem postDisplayItem;
        private final RecyclerView recyclerView;
        private final TextView text;
        private final TextView title;

        public ViewHolder(Context context) {
            super((int) R.layout.news_ad_card_block, context);
            this.adapter = new Adapter();
            this.text = (TextView) $(R.id.text);
            this.title = (TextView) $(R.id.title);
            this.appTitle = (TextView) $(R.id.app_title);
            this.appSubtitle = (TextView) $(R.id.app_subtitle);
            this.photo = (VKImageView) $(R.id.photo);
            this.optionsButton = $(R.id.post_options_btn);
            this.optionsButton.setOnClickListener(this);
            this.recyclerView = (RecyclerView) $(R.id.recycle);
            this.recyclerView.setLayoutManager(new LinearLayoutManager(context, 0, false));
            this.recyclerView.setAdapter(this.adapter);
            this.recyclerView.addItemDecoration(new SpaceItemDecoration(0, 0, V.dp(8.0f), 0));
            this.itemView.setOnClickListener(this);
            this.itemView.setTag(this);
        }

        static String getGuid(NewsEntry post) {
            if (post == null || post.attachments == null || post.attachments.isEmpty() || !(post.attachments.get(0) instanceof ShitAttachment)) {
                return null;
            }
            return ((ShitAttachment) post.attachments.get(0)).guid;
        }

        public void bind(NewsEntry item, GoodsBlockPostDisplayItem postDisplayItem) {
            this.postDisplayItem = postDisplayItem;
            bind(item);
        }

        @Override // android.view.View.OnClickListener
        public void onClick(View v) {
            switch (v.getId()) {
                case R.id.post_options_btn /* 2131756032 */:
                    this.postDisplayItem.onMenuClicked(getAttachment(0), v);
                    return;
                default:
                    this.postDisplayItem.onItemClicked(getAttachment(0), v);
                    return;
            }
        }

        ShitAttachment getAttachment(int i) {
            return (ShitAttachment) (i > ((NewsEntry) this.item).attachments.size() ? null : ((NewsEntry) this.item).attachments.get(i));
        }

        @Override // com.vkontakte.android.ui.holder.RecyclerHolder
        public void onBind(NewsEntry post) {
            boolean needCleanScroll = false;
            ShitAttachment att = getAttachment(0);
            if (att != null) {
                if (!Utils.equals(getGuid(this.lastPost), getGuid(post))) {
                    needCleanScroll = true;
                }
                String restriction = post.extra.getString("age_restriction");
                if (TextUtils.isEmpty(restriction)) {
                    restriction = att.ageRestriction;
                }
                StringBuilder titleStr = new StringBuilder(post.extra.getString(ServerKeys.ADS_TITLE));
                this.photo.load(att.userPhoto);
                this.text.setText(att.text);
                this.appTitle.setText(att.userName);
                this.appSubtitle.setText(att.genre);
                this.title.setText(titleStr.append(' ').append(restriction));
                int size = getResources().getDimensionPixelSize(R.dimen.post_ad_block_item_size);
                int padding = getResources().getDimensionPixelOffset(R.dimen.post_ad_block_item_padding);
                this.adapter.bind(att.cards, att, this.postDisplayItem, padding, size);
                if (needCleanScroll) {
                    AdBlockPostDisplayItem.cleanScroll(this.recyclerView);
                }
                AdsUtil.trackImpression(att);
                this.lastPost = post;
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes3.dex */
    public static class Adapter extends RecyclerView.Adapter<CardViewHolder> {
        List<ShitAttachment.Card> cards;
        GoodsBlockPostDisplayItem displayItem;
        int padding;
        ShitAttachment shitAttachment;
        int size;

        private Adapter() {
            this.cards = Collections.emptyList();
        }

        void bind(List<ShitAttachment.Card> items, ShitAttachment shitAttachment, GoodsBlockPostDisplayItem postDisplayItem, int padding, int size) {
            if (items == null) {
                items = Collections.emptyList();
            }
            this.cards = items;
            this.shitAttachment = shitAttachment;
            this.displayItem = postDisplayItem;
            this.padding = padding;
            this.size = size;
            notifyDataSetChanged();
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        /* renamed from: onCreateViewHolder  reason: collision with other method in class */
        public CardViewHolder mo1206onCreateViewHolder(ViewGroup parent, int viewType) {
            return new CardViewHolder(parent.getContext());
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        public void onBindViewHolder(CardViewHolder holder, int position) {
            holder.bind(this.cards.get(position), this.shitAttachment, this.displayItem, this.padding, this.size);
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        public int getItemCount() {
            return this.cards.size();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes3.dex */
    public static class CardViewHolder extends RecyclerHolder<ShitAttachment.Card> implements View.OnClickListener {
        private TextView button;
        private VKImageView contentPhoto;
        private TextView description;
        private TextView followers;
        private int padding;
        private GoodsBlockPostDisplayItem postDisplayItem;
        private RatingView rating;
        private ShitAttachment shitAttachment;
        private int size;
        private TextView title;

        CardViewHolder(Context context) {
            super((int) R.layout.news_ad_card_item, context);
            this.title = (TextView) $(R.id.title);
            this.button = (TextView) $(R.id.attach_subtitle);
            this.button.setOnClickListener(this);
            this.followers = (TextView) $(R.id.attach_title);
            this.rating = (RatingView) $(R.id.attach_rating);
            this.description = (TextView) $(R.id.description);
            this.contentPhoto = (VKImageView) $(R.id.content_photo);
            this.button.setTag(this);
            this.itemView.setOnClickListener(this);
            this.itemView.setTag(this);
        }

        @Override // android.view.View.OnClickListener
        public void onClick(View v) {
            v.getId();
            this.postDisplayItem.onCardClicked(this.shitAttachment, getItem(), v);
        }

        public void bind(ShitAttachment.Card item, ShitAttachment shitAttachment, GoodsBlockPostDisplayItem postDisplayItem, int padding, int size) {
            this.postDisplayItem = postDisplayItem;
            this.shitAttachment = shitAttachment;
            this.padding = padding;
            this.size = size;
            bind(item);
        }

        @Override // com.vkontakte.android.ui.holder.RecyclerHolder
        public void onBind(final ShitAttachment.Card card) {
            String buttonText = card.installed ? card.buttonTextInstalled : card.buttonText;
            this.title.setText(card.title);
            this.rating.setRating(card.rating);
            this.followers.setText(card.followers);
            this.description.setText(card.description);
            this.description.setVisibility(TextUtils.isEmpty(card.description) ? 8 : 0);
            this.contentPhoto.getLayoutParams().height = this.size;
            card.photo.setViewSize(this.size, this.size, false, false);
            this.contentPhoto.load(card.photo.getThumbURL());
            this.button.setText(buttonText);
            this.itemView.getViewTreeObserver().addOnPreDrawListener(new ViewTreeObserver.OnPreDrawListener() { // from class: com.vkontakte.android.ui.posts.GoodsBlockPostDisplayItem.CardViewHolder.1
                @Override // android.view.ViewTreeObserver.OnPreDrawListener
                public boolean onPreDraw() {
                    boolean showFollowers = true;
                    CardViewHolder.this.itemView.getViewTreeObserver().removeOnPreDrawListener(this);
                    boolean showRating = card.rating > 0.0f && ((CardViewHolder.this.size - (CardViewHolder.this.padding * 2)) - CardViewHolder.this.rating.getWidth()) - CardViewHolder.this.button.getWidth() > 0;
                    if (showRating || TextUtils.isEmpty(card.followers) || ((CardViewHolder.this.size - (CardViewHolder.this.padding * 2)) - CardViewHolder.this.followers.getWidth()) - CardViewHolder.this.button.getWidth() <= 0) {
                        showFollowers = false;
                    }
                    int visibility = showFollowers ? 0 : 8;
                    if (CardViewHolder.this.followers.getVisibility() != visibility) {
                        CardViewHolder.this.followers.setVisibility(visibility);
                    }
                    int visibility2 = showRating ? 0 : 8;
                    if (visibility2 != CardViewHolder.this.rating.getVisibility()) {
                        CardViewHolder.this.rating.setVisibility(visibility2);
                    }
                    return false;
                }
            });
            GoodsBlockPostDisplayItem.trackCardsImpression(card);
        }
    }
}
