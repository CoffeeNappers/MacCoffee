package com.vkontakte.android.fragments.gifts;

import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;
import com.vk.imageloader.view.VKImageView;
import com.vkontakte.android.R;
import com.vkontakte.android.api.models.CatalogedGift;
import com.vkontakte.android.functions.VoidF1;
import com.vkontakte.android.ui.Font;
import com.vkontakte.android.ui.holder.RecyclerHolder;
/* loaded from: classes2.dex */
class GiftHolder extends RecyclerHolder<CatalogedGift> implements View.OnClickListener {
    private int mItemMinSize;
    private VoidF1<CatalogedGift> mListener;
    private final VKImageView mPhoto;
    private int mSize;
    private final TextView mTitle;

    public GiftHolder(ViewGroup parent) {
        super((int) R.layout.gifts_catalog_item, parent);
        this.mItemMinSize = getResources().getDimensionPixelSize(R.dimen.gift_category_min_size);
        this.mPhoto = (VKImageView) $(R.id.photo);
        this.mTitle = (TextView) $(R.id.title);
        this.mPhoto.setOnClickListener(this);
        this.itemView.setOnClickListener(this);
        this.mPhoto.setFixedSize(this.mSize);
    }

    public GiftHolder setSize(int size) {
        if (size != this.mSize) {
            this.mSize = size;
            this.mPhoto.setFixedSize(this.mSize);
        }
        return this;
    }

    public GiftHolder onClick(VoidF1<CatalogedGift> callback) {
        this.mListener = callback;
        return this;
    }

    @Override // com.vkontakte.android.ui.holder.RecyclerHolder
    public void onBind(CatalogedGift item) {
        String quantityString;
        boolean free = item.isFree() && !item.disabled && item.gifts_left != null && item.gifts_left.intValue() > 0;
        this.mPhoto.setAlpha(item.disabled ? 0.5f : 1.0f);
        this.mTitle.setTypeface(free ? Font.Medium.typeface : null);
        this.mTitle.setTextColor(free ? -11435592 : -7301991);
        TextView textView = this.mTitle;
        if (item.disabled) {
            quantityString = getString(R.string.unavailable);
        } else {
            quantityString = free ? getQuantityString(R.plurals.gifts_remains, item.gifts_left.intValue(), item.gifts_left) : getQuantityString(R.plurals.balance_votes, item.price, Integer.valueOf(item.price));
        }
        textView.setText(quantityString);
        this.mPhoto.load(item.gift.getImage(this.mItemMinSize));
    }

    @Override // android.view.View.OnClickListener
    public void onClick(View v) {
        if (this.mListener != null) {
            this.mListener.f(getItem());
        }
    }
}
