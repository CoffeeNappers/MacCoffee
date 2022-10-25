package com.vkontakte.android.ui.holder;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.support.v4.view.ViewCompat;
import android.text.TextUtils;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;
import com.vk.imageloader.view.VKImageView;
import com.vkontakte.android.Log;
import com.vkontakte.android.MoneyTransfer;
import com.vkontakte.android.R;
import com.vkontakte.android.TimeUtils;
import com.vkontakte.android.api.SimpleCallback;
import com.vkontakte.android.api.money.MoneyDeclineTransfer;
import com.vkontakte.android.api.money.MoneyGetTransfer;
import com.vkontakte.android.fragments.money.MoneyTransferActions;
import com.vkontakte.android.fragments.money.MoneyTransferDetailsFragment;
import com.vkontakte.android.fragments.money.MoneyWebViewFragment;
import com.vkontakte.android.utils.Utils;
/* loaded from: classes3.dex */
public class MoneyTransferHolder extends RecyclerHolder<MoneyTransfer> implements View.OnClickListener {
    private static final String TAG = "MoneyTransferHolder";
    private final TextView mInfo;
    private final TextView mNegativeButton;
    private final VKImageView mPhoto;
    private final TextView mPositiveButton;
    private final TextView mSubtitle;
    private final TextView mSum;
    private final TextView mTitle;

    public MoneyTransferHolder(ViewGroup parent) {
        super((int) R.layout.money_transfer_item, parent);
        this.mTitle = (TextView) $(R.id.title);
        this.mSubtitle = (TextView) $(R.id.subtitle);
        this.mInfo = (TextView) $(R.id.info);
        this.mPhoto = (VKImageView) $(R.id.photo);
        this.mPositiveButton = (TextView) $(R.id.positive);
        this.mNegativeButton = (TextView) $(R.id.negative);
        this.mSum = (TextView) $(R.id.tv_mt_sum);
        this.mPositiveButton.setOnClickListener(this);
        this.mNegativeButton.setOnClickListener(this);
        this.itemView.setOnClickListener(this);
    }

    @Override // com.vkontakte.android.ui.holder.RecyclerHolder
    public void onBind(MoneyTransfer item) {
        int i = 8;
        boolean isPendingOutgoing = true;
        try {
            Log.v(TAG, "bind " + item.toString());
            this.mPhoto.load(item.getPeerUser().photo);
            this.mTitle.setText(formatTitle());
            boolean haveComment = !TextUtils.isEmpty(item.displayableComment);
            this.mSubtitle.setText(haveComment ? item.displayableComment : "");
            TextView textView = this.mSubtitle;
            if (haveComment) {
                i = 0;
            }
            textView.setVisibility(i);
            this.mInfo.setText(TimeUtils.langDate(item.date, false));
            boolean isPendingIncoming = item.isIncoming() && item.status == 0;
            if (item.isIncoming() || item.status != 0) {
                isPendingOutgoing = false;
            }
            this.mPositiveButton.setVisibility(8);
            this.mNegativeButton.setVisibility(8);
            if (isPendingIncoming) {
                this.mNegativeButton.setText(getString(R.string.money_transfer_decline));
            } else if (isPendingOutgoing) {
                this.mNegativeButton.setText(getString(R.string.money_transfer_cancel));
            }
            this.mSum.setText(item.getSignedAmountWithCurrencyFormatted());
            switch (item.status) {
                case 0:
                    this.mSum.setTextColor(-7301991);
                    return;
                case 1:
                    this.mSum.setTextColor(ViewCompat.MEASURED_STATE_MASK);
                    return;
                case 2:
                    this.mSum.setTextColor(-1685946);
                    return;
                default:
                    return;
            }
        } catch (Exception exc) {
            Log.e(TAG, exc.toString());
        }
    }

    private String formatTitle() {
        return getItem().isIncoming() ? getString(R.string.money_transfer_from, getItem().fromUser.getNameInCase(1)) : getString(R.string.money_transfer_to, getItem().toUser.getNameInCase(2));
    }

    @Override // android.view.View.OnClickListener
    public void onClick(final View view) {
        if (view == this.mPositiveButton) {
            new MoneyGetTransfer(getItem().id, getItem().from_id, getItem().to_id).setCallback(new SimpleCallback<MoneyTransfer>() { // from class: com.vkontakte.android.ui.holder.MoneyTransferHolder.1
                @Override // com.vkontakte.android.api.Callback
                public void success(MoneyTransfer result) {
                    MoneyWebViewFragment.start((Activity) view.getContext(), result.acceptUrl, result.id, 2);
                }
            }).wrapProgress((Activity) view.getContext()).exec((Context) ((Activity) view.getContext()));
        } else if (view == this.mNegativeButton) {
            final int id = getItem().id;
            new MoneyDeclineTransfer(id).setCallback(new SimpleCallback<Integer>() { // from class: com.vkontakte.android.ui.holder.MoneyTransferHolder.2
                @Override // com.vkontakte.android.api.Callback
                public void success(Integer result) {
                    if (view != null && view.getContext() != null) {
                        Intent broadcastIntent = new Intent(MoneyTransferActions.ACTION_MONEY_TRANSFER_CANCELLED);
                        broadcastIntent.putExtra(MoneyTransferActions.RESULT_EXTRA_TRANSFER_ID_ARG, id);
                        view.getContext().sendBroadcast(broadcastIntent, "com.vkontakte.android.permission.ACCESS_DATA");
                    }
                }
            }).wrapProgress(view.getContext()).exec(view.getContext());
        } else {
            MoneyTransferDetailsFragment.show(getItem(), Utils.castToActivity(view.getContext()));
        }
    }
}
