package com.vkontakte.android.fragments.stickers;

import android.graphics.drawable.Drawable;
import android.support.annotation.NonNull;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ProgressBar;
import android.widget.TextView;
import com.vk.core.util.ToastUtils;
import com.vk.imageloader.view.VKImageView;
import com.vkontakte.android.Global;
import com.vkontakte.android.R;
import com.vkontakte.android.api.models.PaymentType;
import com.vkontakte.android.data.PurchasesManager;
import com.vkontakte.android.data.orm.StickerStockItem;
import com.vkontakte.android.ui.CircularProgressDrawable;
import com.vkontakte.android.ui.holder.RecyclerHolder;
/* loaded from: classes3.dex */
public class StickerStoreListHolder extends RecyclerHolder<StickerStockItem> implements View.OnClickListener {
    private final View.OnClickListener mActionListener;
    private View mError;
    private View mOkButton;
    private VKImageView mPhoto;
    private ProgressBar mProgress;
    private TextView mStickerButton;
    private TextView mSubtitle;
    private TextView mTitle;

    public static boolean getIsPurchaseNotAllowedWithReason(StickerStockItem data) {
        return data != null && !data.can_purchase && data.no_purchase_reason != null && !data.no_purchase_reason.isEmpty();
    }

    public StickerStoreListHolder(@NonNull ViewGroup parent, View.OnClickListener actionListener) {
        super((int) R.layout.store_item, parent);
        this.mActionListener = actionListener;
        CircularProgressDrawable pd = new CircularProgressDrawable(false);
        pd.setColors(0, -11435592);
        pd.setThickness(2.0f);
        pd.setPad(false);
        pd.setDimBackground(false);
        this.mStickerButton = (TextView) $(R.id.sticker_button);
        this.mOkButton = $(R.id.sticker_ok);
        this.mProgress = (ProgressBar) $(R.id.sticker_progress);
        this.mError = $(R.id.sticker_error);
        this.mPhoto = (VKImageView) $(R.id.photo);
        this.mTitle = (TextView) $(R.id.title);
        this.mSubtitle = (TextView) $(R.id.subtitle);
        this.mProgress.setProgressDrawable(pd);
        this.mStickerButton.setOnClickListener(this.mActionListener);
        this.mError.setOnClickListener(new View.OnClickListener() { // from class: com.vkontakte.android.fragments.stickers.StickerStoreListHolder.1
            @Override // android.view.View.OnClickListener
            public void onClick(View v) {
                if (!StickerStoreListHolder.getIsPurchaseNotAllowedWithReason(StickerStoreListHolder.this.getItem())) {
                    StickerStoreListHolder.this.mActionListener.onClick(v);
                } else {
                    ToastUtils.showToast(StickerStoreListHolder.this.getItem().no_purchase_reason);
                }
            }
        });
        this.itemView.setOnClickListener(this);
    }

    public static void bindButtons(StickerStockItem data, TextView stickerButton, View okButton, ProgressBar progress, View error) {
        if (data.purchased) {
            stickerButton.setVisibility(4);
            progress.setVisibility(8);
            okButton.setVisibility(0);
            error.setVisibility(8);
            return;
        }
        okButton.setVisibility(8);
        progress.setVisibility(8);
        stickerButton.setVisibility(0);
        error.setVisibility(8);
        if (getIsPurchaseNotAllowedWithReason(data)) {
            stickerButton.setVisibility(8);
            error.setVisibility(0);
        } else if ((data.payment_type == PaymentType.Inapp && !PurchasesManager.canUseInApps()) || !data.can_purchase) {
            stickerButton.setText(R.string.unavailable);
            stickerButton.setEnabled(false);
            stickerButton.getBackground().setAlpha(128);
        } else {
            stickerButton.setText(data.free ? stickerButton.getContext().getString(R.string.price_free) : data.price_str);
            stickerButton.setEnabled(true);
            stickerButton.getBackground().setAlpha(255);
        }
    }

    @Override // com.vkontakte.android.ui.holder.RecyclerHolder
    public void onBind(StickerStockItem data) {
        this.mPhoto.load(data.getThumbUrl());
        this.mTitle.setText(data.title);
        if (data.isNew) {
            Drawable drawable = getResources().getDrawable(R.drawable.ic_stickers_list_new);
            drawable.setBounds(0, 0, Global.scale(7.0f), Global.scale(7.0f));
            this.mTitle.setCompoundDrawables(drawable, null, null, null);
            this.mTitle.setCompoundDrawablePadding(Global.scale(8.0f));
        } else {
            this.mTitle.setCompoundDrawables(null, null, null, null);
        }
        this.mSubtitle.setText(data.author);
        bindButtons(data, this.mStickerButton, this.mOkButton, this.mProgress, this.mError);
        this.mStickerButton.setTag(data);
        this.mError.setTag(data);
    }

    @Override // android.view.View.OnClickListener
    public void onClick(View v) {
        if (v == this.itemView) {
            getItem().referrer = "store";
            StickersDetailsFragment.show(getItem(), getContext());
        }
    }
}
