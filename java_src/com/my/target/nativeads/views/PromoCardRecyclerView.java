package com.my.target.nativeads.views;

import android.content.Context;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.v7.widget.RecyclerView;
import android.util.AttributeSet;
import android.view.View;
import android.view.ViewGroup;
import android.widget.RelativeLayout;
import com.my.target.Tracer;
import com.my.target.core.net.b;
import com.my.target.nativeads.banners.NativePromoCard;
import java.util.ArrayList;
import java.util.List;
/* loaded from: classes2.dex */
public class PromoCardRecyclerView extends RecyclerView {
    private final View.OnClickListener cardClickListener;
    @Nullable
    private List<NativePromoCard> cards;
    private int displayedCardNum;
    private final CardRecyclerLayoutManager layoutManager;
    private boolean moving;
    @Nullable
    private PromoCardListener onPromoCardListener;
    @Nullable
    private PromoCardAdapter promoCardAdapter;

    /* loaded from: classes2.dex */
    public interface PromoCardListener {
        void onCardChange(View view, NativePromoCard nativePromoCard);

        void onClick(View view, NativePromoCard nativePromoCard);
    }

    @Nullable
    public NativePromoCard getCurrentCard() {
        int findFirstCompletelyVisibleItemPosition = this.layoutManager.findFirstCompletelyVisibleItemPosition();
        if (findFirstCompletelyVisibleItemPosition == -1 || this.cards == null) {
            return null;
        }
        return this.cards.get(findFirstCompletelyVisibleItemPosition);
    }

    public PromoCardRecyclerView(Context context) {
        super(context);
        this.displayedCardNum = -1;
        this.cardClickListener = new View.OnClickListener() { // from class: com.my.target.nativeads.views.PromoCardRecyclerView.2
            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                View findContainingItemView;
                if (!PromoCardRecyclerView.this.moving && (findContainingItemView = PromoCardRecyclerView.this.layoutManager.findContainingItemView(view)) != null) {
                    if (PromoCardRecyclerView.this.layoutManager.isViewActive(findContainingItemView)) {
                        if (PromoCardRecyclerView.this.onPromoCardListener != null && PromoCardRecyclerView.this.cards != null) {
                            PromoCardRecyclerView.this.onPromoCardListener.onClick(findContainingItemView, (NativePromoCard) PromoCardRecyclerView.this.cards.get(PromoCardRecyclerView.this.layoutManager.getPosition(findContainingItemView)));
                            return;
                        }
                        return;
                    }
                    PromoCardRecyclerView.this.smoothScrollBy(PromoCardRecyclerView.this.layoutManager.calculateScrollDistanceOnClick(findContainingItemView), 0);
                }
            }
        };
        this.layoutManager = new CardRecyclerLayoutManager(getContext());
        setHasFixedSize(true);
    }

    public PromoCardRecyclerView(Context context, @Nullable AttributeSet attributeSet) {
        super(context, attributeSet);
        this.displayedCardNum = -1;
        this.cardClickListener = new View.OnClickListener() { // from class: com.my.target.nativeads.views.PromoCardRecyclerView.2
            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                View findContainingItemView;
                if (!PromoCardRecyclerView.this.moving && (findContainingItemView = PromoCardRecyclerView.this.layoutManager.findContainingItemView(view)) != null) {
                    if (PromoCardRecyclerView.this.layoutManager.isViewActive(findContainingItemView)) {
                        if (PromoCardRecyclerView.this.onPromoCardListener != null && PromoCardRecyclerView.this.cards != null) {
                            PromoCardRecyclerView.this.onPromoCardListener.onClick(findContainingItemView, (NativePromoCard) PromoCardRecyclerView.this.cards.get(PromoCardRecyclerView.this.layoutManager.getPosition(findContainingItemView)));
                            return;
                        }
                        return;
                    }
                    PromoCardRecyclerView.this.smoothScrollBy(PromoCardRecyclerView.this.layoutManager.calculateScrollDistanceOnClick(findContainingItemView), 0);
                }
            }
        };
        this.layoutManager = new CardRecyclerLayoutManager(getContext());
        setHasFixedSize(true);
    }

    public PromoCardRecyclerView(Context context, @Nullable AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
        this.displayedCardNum = -1;
        this.cardClickListener = new View.OnClickListener() { // from class: com.my.target.nativeads.views.PromoCardRecyclerView.2
            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                View findContainingItemView;
                if (!PromoCardRecyclerView.this.moving && (findContainingItemView = PromoCardRecyclerView.this.layoutManager.findContainingItemView(view)) != null) {
                    if (PromoCardRecyclerView.this.layoutManager.isViewActive(findContainingItemView)) {
                        if (PromoCardRecyclerView.this.onPromoCardListener != null && PromoCardRecyclerView.this.cards != null) {
                            PromoCardRecyclerView.this.onPromoCardListener.onClick(findContainingItemView, (NativePromoCard) PromoCardRecyclerView.this.cards.get(PromoCardRecyclerView.this.layoutManager.getPosition(findContainingItemView)));
                            return;
                        }
                        return;
                    }
                    PromoCardRecyclerView.this.smoothScrollBy(PromoCardRecyclerView.this.layoutManager.calculateScrollDistanceOnClick(findContainingItemView), 0);
                }
            }
        };
        this.layoutManager = new CardRecyclerLayoutManager(getContext());
        setHasFixedSize(true);
    }

    @Override // android.support.v7.widget.RecyclerView
    public void setAdapter(RecyclerView.Adapter adapter) {
        if (adapter instanceof PromoCardAdapter) {
            setPromoCardAdapter((PromoCardAdapter) adapter);
        } else {
            Tracer.d("You must use setPromoCardAdapter(PromoCardAdapter) method with custom CardRecyclerView");
        }
    }

    public void setPromoCardAdapter(@Nullable PromoCardAdapter promoCardAdapter) {
        if (promoCardAdapter != null) {
            this.cards = promoCardAdapter.getNativePromoCards();
            this.promoCardAdapter = promoCardAdapter;
            this.promoCardAdapter.setClickListener(this.cardClickListener);
            setLayoutManager(this.layoutManager);
            super.setAdapter(this.promoCardAdapter);
        }
    }

    public void loadImages() {
        Tracer.d("load images to cards");
        if (this.cards != null) {
            ArrayList arrayList = new ArrayList();
            for (NativePromoCard nativePromoCard : this.cards) {
                if (nativePromoCard.getImage() != null) {
                    arrayList.add(nativePromoCard.getImage());
                }
            }
            b.a().a(arrayList, getContext(), new b.a() { // from class: com.my.target.nativeads.views.PromoCardRecyclerView.1
                @Override // com.my.target.core.net.b.a
                public void onLoad() {
                    Tracer.d("images loaded to cards");
                    if (PromoCardRecyclerView.this.promoCardAdapter != null) {
                        PromoCardRecyclerView.this.promoCardAdapter.notifyDataSetChanged();
                    }
                }
            });
        }
    }

    public void setOnPromoCardListener(@Nullable PromoCardListener promoCardListener) {
        this.onPromoCardListener = promoCardListener;
    }

    @Override // android.support.v7.widget.RecyclerView
    public boolean fling(int i, int i2) {
        smoothScrollBy(this.layoutManager.calculateScrollDistanceOnFling(i), 0);
        return true;
    }

    @Override // android.support.v7.widget.RecyclerView
    public void onScrollStateChanged(int i) {
        super.onScrollStateChanged(i);
        this.moving = i != 0;
        if (!this.moving) {
            checkCardChanged();
        }
    }

    private void checkCardChanged() {
        int findFirstCompletelyVisibleItemPosition = this.layoutManager.findFirstCompletelyVisibleItemPosition();
        if (findFirstCompletelyVisibleItemPosition >= 0 && this.displayedCardNum != findFirstCompletelyVisibleItemPosition) {
            this.displayedCardNum = findFirstCompletelyVisibleItemPosition;
            if (this.onPromoCardListener != null && this.cards != null) {
                this.onPromoCardListener.onCardChange(this.layoutManager.findViewByPosition(this.displayedCardNum), this.cards.get(this.displayedCardNum));
            }
        }
    }

    /* loaded from: classes2.dex */
    public static abstract class PromoCardAdapter extends RecyclerView.Adapter<PromoCardViewHolder> {
        private View.OnClickListener cardClickListener;
        @NonNull
        private final List<NativePromoCard> nativePromoCards;

        public abstract PromoCardView getPromoCardView();

        public void setClickListener(View.OnClickListener onClickListener) {
            this.cardClickListener = onClickListener;
        }

        public PromoCardAdapter(@NonNull List<NativePromoCard> list) {
            this.nativePromoCards = list;
        }

        @NonNull
        public List<NativePromoCard> getNativePromoCards() {
            return this.nativePromoCards;
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        /* renamed from: onCreateViewHolder  reason: collision with other method in class */
        public PromoCardViewHolder mo1206onCreateViewHolder(ViewGroup viewGroup, int i) {
            return new PromoCardViewHolder(getPromoCardView());
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        public void onBindViewHolder(PromoCardViewHolder promoCardViewHolder, int i) {
            setBannerToView(this.nativePromoCards.get(i), promoCardViewHolder.getPromoCardView());
            promoCardViewHolder.getPromoCardView().getView().setOnClickListener(this.cardClickListener);
            promoCardViewHolder.getPromoCardView().getCtaButtonView().setOnClickListener(this.cardClickListener);
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        public void onViewRecycled(PromoCardViewHolder promoCardViewHolder) {
            promoCardViewHolder.getPromoCardView().getView().setOnClickListener(null);
            promoCardViewHolder.getPromoCardView().getCtaButtonView().setOnClickListener(null);
            super.onViewRecycled((PromoCardAdapter) promoCardViewHolder);
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        public int getItemCount() {
            return this.nativePromoCards.size();
        }

        private void setBannerToView(NativePromoCard nativePromoCard, PromoCardView promoCardView) {
            if (nativePromoCard.getImage() != null) {
                promoCardView.getMediaAdView().setPlaceHolderDimension(nativePromoCard.getImage().getWidth(), nativePromoCard.getImage().getHeight());
                if (nativePromoCard.getImage().getData() != null) {
                    promoCardView.getMediaAdView().getImageView().setImageBitmap(nativePromoCard.getImage().getData());
                } else {
                    b.a().a(nativePromoCard.getImage(), promoCardView.getMediaAdView().getImageView());
                }
            }
            promoCardView.getTitleTextView().setText(nativePromoCard.getTitle());
            promoCardView.getDescriptionTextView().setText(nativePromoCard.getDescription());
            promoCardView.getCtaButtonView().setText(nativePromoCard.getCtaText());
        }
    }

    /* loaded from: classes2.dex */
    public static class PromoCardViewHolder extends RecyclerView.ViewHolder {
        private final PromoCardView promoCardView;

        PromoCardView getPromoCardView() {
            return this.promoCardView;
        }

        PromoCardViewHolder(PromoCardView promoCardView) {
            super(promoCardView.getView());
            promoCardView.getView().setLayoutParams(new RelativeLayout.LayoutParams(-1, -2));
            this.promoCardView = promoCardView;
        }
    }
}
