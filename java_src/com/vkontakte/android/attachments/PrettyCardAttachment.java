package com.vkontakte.android.attachments;

import android.content.Context;
import android.graphics.Rect;
import android.support.annotation.Nullable;
import android.support.v7.widget.RecyclerView;
import android.text.TextUtils;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;
import com.facebook.internal.NativeProtocol;
import com.vk.core.common.Image;
import com.vk.core.common.ImageSize;
import com.vk.core.util.Screen;
import com.vk.imageloader.view.VKSnippetImageView;
import com.vkontakte.android.R;
import com.vkontakte.android.ViewUtils;
import com.vkontakte.android.api.ButtonAction;
import com.vkontakte.android.data.Analytics;
import com.vkontakte.android.data.PostInteract;
import com.vkontakte.android.data.ServerKeys;
import com.vkontakte.android.statistics.StatisticPrettyCard;
import com.vkontakte.android.ui.FlowLayout;
import com.vkontakte.android.ui.holder.RecyclerHolder;
import com.vkontakte.android.utils.AdsUtil;
import com.vkontakte.android.utils.Serializer;
import java.util.ArrayList;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class PrettyCardAttachment extends Attachment {
    public static final Serializer.Creator<PrettyCardAttachment> CREATOR = new Serializer.CreatorAdapter<PrettyCardAttachment>() { // from class: com.vkontakte.android.attachments.PrettyCardAttachment.1
        @Override // com.vkontakte.android.utils.Serializer.Creator
        /* renamed from: createFromSerializer */
        public PrettyCardAttachment mo1087createFromSerializer(Serializer s) {
            return new PrettyCardAttachment(s);
        }

        @Override // android.os.Parcelable.Creator, com.vkontakte.android.utils.Serializer.Creator
        /* renamed from: newArray */
        public PrettyCardAttachment[] mo1088newArray(int size) {
            return new PrettyCardAttachment[size];
        }
    };
    public static final String REUSE_VIEW_TYPE = "pretty_cards";
    private List<Card> cards;

    public PrettyCardAttachment(JSONObject json) {
        JSONArray cardsJson = json.optJSONArray("cards");
        this.cards = new ArrayList(cardsJson.length());
        for (int i = 0; i < cardsJson.length(); i++) {
            this.cards.add(new Card(cardsJson.optJSONObject(i)));
        }
    }

    @Override // com.vkontakte.android.attachments.Attachment
    @Nullable
    public FlowLayout.LayoutParams overrideLayoutParams() {
        FlowLayout.LayoutParams layoutParams = new FlowLayout.LayoutParams();
        layoutParams.center = true;
        return layoutParams;
    }

    public PrettyCardAttachment(Serializer is) {
        this.cards = is.createTypedArrayList(Card.CREATOR);
    }

    @Override // com.vkontakte.android.attachments.Attachment
    public View getFullView(Context context) {
        return getViewForList(context, null);
    }

    @Override // com.vkontakte.android.attachments.Attachment
    public View getViewForList(Context context, View reuse) {
        RecyclerView recyclerView = (RecyclerView) getReusableView(context, REUSE_VIEW_TYPE);
        if (recyclerView == null) {
            return null;
        }
        if (recyclerView.mo1204getAdapter() == null) {
            recyclerView.setAdapter(new Adapter(this.cards));
            return recyclerView;
        }
        Adapter adapter = (Adapter) recyclerView.mo1204getAdapter();
        if (adapter.cards != this.cards) {
            adapter.setItems(this.cards);
            recyclerView.getLayoutManager().scrollToPosition(0);
            return recyclerView;
        }
        return recyclerView;
    }

    public void setStatisticsData(@Nullable PostInteract postInteract, int adId1, int adId2) {
        for (Card card : this.cards) {
            card.setStatisticsData(postInteract, adId1, adId2);
        }
    }

    @Override // com.vkontakte.android.utils.Serializer.Serializable
    public void serializeTo(Serializer s) {
        s.writeTypedList(this.cards);
    }

    /* loaded from: classes2.dex */
    public static class Card extends Serializer.SerializableAdapter {
        public static final Serializer.Creator<Card> CREATOR = new Serializer.CreatorAdapter<Card>() { // from class: com.vkontakte.android.attachments.PrettyCardAttachment.Card.1
            @Override // com.vkontakte.android.utils.Serializer.Creator
            /* renamed from: createFromSerializer */
            public Card mo1087createFromSerializer(Serializer s) {
                return new Card(s);
            }

            @Override // android.os.Parcelable.Creator, com.vkontakte.android.utils.Serializer.Creator
            /* renamed from: newArray */
            public Card[] mo1088newArray(int size) {
                return new Card[size];
            }
        };
        public Button button;
        public String cardData;
        public String id;
        public Image image;
        @Nullable
        private StatisticPrettyCard impressionStatistic;
        public String linkUrl;
        public String linkUrlTarget;
        @Nullable
        public transient PostInteract postInteract;
        public String price;
        public String priceOld;
        public String title;

        public Card(JSONObject json) {
            this.id = json.optString("card_id");
            this.cardData = json.optString("card_data");
            this.linkUrlTarget = json.optString("link_url_target");
            this.linkUrl = json.optString("link_url");
            this.title = json.optString("title");
            JSONObject buttonJson = json.optJSONObject(ServerKeys.BUTTON);
            if (buttonJson != null) {
                this.button = new Button(buttonJson);
            }
            this.price = json.optString("price");
            this.priceOld = json.optString("price_old");
            try {
                this.image = new Image(json.optJSONArray("images"));
            } catch (JSONException e) {
            }
        }

        public Card(Serializer is) {
            this.id = is.readString();
            this.cardData = is.readString();
            this.linkUrlTarget = is.readString();
            this.linkUrl = is.readString();
            this.title = is.readString();
            this.button = (Button) is.readSerializable(Button.class.getClassLoader());
            this.image = (Image) is.readSerializable(Image.class.getClassLoader());
            this.price = is.readString();
            this.priceOld = is.readString();
            this.impressionStatistic = (StatisticPrettyCard) is.readSerializable(StatisticPrettyCard.class.getClassLoader());
        }

        public void setStatisticsData(PostInteract postInteract, int adId1, int adId2) {
            this.postInteract = postInteract;
            this.impressionStatistic = new StatisticPrettyCard(postInteract.adData, this.cardData, adId1, adId2, this.id);
        }

        @Override // com.vkontakte.android.utils.Serializer.Serializable
        public void serializeTo(Serializer s) {
            s.writeString(this.id);
            s.writeString(this.cardData);
            s.writeString(this.linkUrlTarget);
            s.writeString(this.linkUrl);
            s.writeString(this.title);
            s.writeSerializable(this.button);
            s.writeSerializable(this.image);
            s.writeString(this.price);
            s.writeString(this.priceOld);
            s.writeSerializable(this.impressionStatistic);
        }
    }

    /* loaded from: classes2.dex */
    public static class Button extends Serializer.SerializableAdapter {
        public static final Serializer.Creator<Button> CREATOR = new Serializer.CreatorAdapter<Button>() { // from class: com.vkontakte.android.attachments.PrettyCardAttachment.Button.1
            @Override // com.vkontakte.android.utils.Serializer.Creator
            /* renamed from: createFromSerializer */
            public Button mo1087createFromSerializer(Serializer s) {
                return new Button(s);
            }

            @Override // android.os.Parcelable.Creator, com.vkontakte.android.utils.Serializer.Creator
            /* renamed from: newArray */
            public Button[] mo1088newArray(int size) {
                return new Button[size];
            }
        };
        public ButtonAction action;
        public String title;

        public Button(JSONObject json) {
            this.title = json.optString("title");
            this.action = new ButtonAction(json.optJSONObject(NativeProtocol.WEB_DIALOG_ACTION));
        }

        private Button(Serializer is) {
            this.title = is.readString();
            this.action = (ButtonAction) is.readSerializable(ButtonAction.class.getClassLoader());
        }

        @Override // com.vkontakte.android.utils.Serializer.Serializable
        public void serializeTo(Serializer s) {
            s.writeString(this.title);
            s.writeSerializable(this.action);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes2.dex */
    public static class Adapter extends RecyclerView.Adapter<RecyclerHolder<Card>> {
        List<Card> cards;

        public Adapter(List<Card> cards) {
            this.cards = cards;
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        /* renamed from: onCreateViewHolder  reason: collision with other method in class */
        public RecyclerHolder<Card> mo1206onCreateViewHolder(ViewGroup parent, int viewType) {
            return new ViewHolder(parent.getContext(), parent);
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        public void onBindViewHolder(RecyclerHolder<Card> holder, int position) {
            holder.bind(this.cards.get(position));
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        public int getItemCount() {
            return this.cards.size();
        }

        public void setItems(List<Card> cards) {
            this.cards = cards;
            notifyDataSetChanged();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes2.dex */
    public static class ViewHolder extends RecyclerHolder<Card> implements View.OnClickListener {
        private static final String CLICK_EVENT = "ads/click_pretty_card";
        private TextView adsButton;
        private VKSnippetImageView image;
        private Card item;
        private TextView oldPrice;
        private TextView price;
        private TextView title;

        public ViewHolder(Context context, ViewGroup parent) {
            super(context, R.layout.attach_pretty_card_item, parent);
            this.image = (VKSnippetImageView) $(R.id.image);
            this.image.setDrawBorder(false);
            this.image.setType(1);
            this.image.setBackgroundResource(0);
            this.title = (TextView) $(R.id.title);
            this.price = (TextView) $(R.id.price);
            this.oldPrice = (TextView) $(R.id.old_price);
            this.oldPrice.setPaintFlags(17);
            this.adsButton = (TextView) $(R.id.ads_button);
            this.adsButton.setOnClickListener(this);
            $(R.id.container).setOnClickListener(this);
        }

        @Override // com.vkontakte.android.ui.holder.RecyclerHolder
        public void onBind(Card item) {
            this.item = item;
            int width = this.image.getLayoutParams().width;
            ImageSize imageSize = item.image.getImageByWidth(width);
            if (imageSize != null) {
                this.image.load(imageSize.getUrl());
            }
            this.title.setText(item.title);
            ViewUtils.setText(this.price, item.price, true);
            ViewUtils.setText(this.oldPrice, item.priceOld, true);
            if (item.button != null) {
                this.adsButton.setVisibility(0);
                this.adsButton.setText(item.button.title);
            } else {
                this.adsButton.setVisibility(8);
            }
            if (item.impressionStatistic != null && item.impressionStatistic.isValid()) {
                Analytics.trackImpression(item.impressionStatistic);
            }
        }

        @Override // android.view.View.OnClickListener
        public void onClick(View v) {
            if (this.item != null) {
                Context context = v.getContext();
                switch (v.getId()) {
                    case R.id.container /* 2131755509 */:
                        trackPostInteractEvent(this.item.linkUrl);
                        trackClickEvent();
                        AdsUtil.onPrettyCardClick(context, this.item);
                        return;
                    case R.id.old_price /* 2131755510 */:
                    case R.id.price /* 2131755511 */:
                    default:
                        return;
                    case R.id.ads_button /* 2131755512 */:
                        if (this.item.button != null) {
                            trackPostInteractEvent(this.item.button.action.url);
                            trackClickEvent();
                            AdsUtil.onActionButtonClick(context, this.item.button.action, this.item.postInteract);
                            return;
                        }
                        return;
                }
            }
        }

        private void trackPostInteractEvent(String link) {
            if (this.item.postInteract != null) {
                this.item.postInteract.setLink(link).setCardData(this.item.cardData).commit(PostInteract.Type.click_pretty_card);
            }
        }

        private void trackClickEvent() {
            if (this.item.postInteract != null && !TextUtils.isEmpty(this.item.postInteract.adData) && !TextUtils.isEmpty(this.item.cardData)) {
                Analytics.track(CLICK_EVENT).addParam("ad_data", this.item.postInteract.adData).addParam("card_data", this.item.cardData).sendNow();
            }
        }
    }

    /* loaded from: classes2.dex */
    public static class PrettyCardDecoration extends RecyclerView.ItemDecoration {
        private int defaultOffset;
        private int firstLeftOffset;
        private int lastRightOffset;

        public PrettyCardDecoration() {
            int dp = Screen.dp(16);
            this.lastRightOffset = dp;
            this.firstLeftOffset = dp;
            this.defaultOffset = Screen.dp(8);
        }

        @Override // android.support.v7.widget.RecyclerView.ItemDecoration
        public void getItemOffsets(Rect outRect, View view, RecyclerView parent, RecyclerView.State state) {
            int position = parent.getChildAdapterPosition(view);
            RecyclerView.Adapter adapter = parent.mo1204getAdapter();
            if (position == 0) {
                outRect.left = this.firstLeftOffset;
            } else if (adapter != null && position == adapter.getItemCount() - 1) {
                outRect.left = this.defaultOffset;
                outRect.right = this.lastRightOffset;
            } else {
                outRect.left = this.defaultOffset;
            }
        }
    }
}
