package com.vkontakte.android.ui.holder.money;

import android.content.Context;
import android.view.View;
import android.widget.TextView;
import com.vk.imageloader.view.VKImageView;
import com.vkontakte.android.Photo;
import com.vkontakte.android.R;
import com.vkontakte.android.ViewUtils;
import com.vkontakte.android.data.Subscription;
import com.vkontakte.android.ui.holder.RecyclerHolder;
import java.util.Calendar;
import me.grishka.appkit.utils.V;
/* loaded from: classes3.dex */
public class SubscriptionHeaderHolder extends RecyclerHolder<Subscription> {
    private final TextView billing_type;
    private final TextView cost;
    private final TextView description;
    private final VKImageView icon;
    private final View nextBillTitle;
    private final View not_purchased_block;
    private final View purchased_block;
    private final TextView subtitle;
    private final TextView tillDate;
    private final TextView title;

    public SubscriptionHeaderHolder(Context ctx) {
        super((int) R.layout.subscription_header_holder, ctx);
        this.title = (TextView) $(R.id.title);
        this.subtitle = (TextView) $(R.id.subtitle);
        this.description = (TextView) $(R.id.description);
        this.billing_type = (TextView) $(R.id.bill_type);
        this.tillDate = (TextView) $(R.id.next_bill);
        this.nextBillTitle = $(R.id.next_bill_title);
        this.icon = (VKImageView) $(16908294);
        this.not_purchased_block = $(R.id.not_purchased_block);
        this.purchased_block = $(R.id.purchased_block);
        this.cost = (TextView) $(R.id.cost);
    }

    @Override // com.vkontakte.android.ui.holder.RecyclerHolder
    public void onBind(Subscription item) {
        int i = 8;
        this.title.setText(item.title);
        ViewUtils.setText(this.subtitle, item.subtitle, true);
        this.description.setText(item.description);
        this.billing_type.setText(item.merchant_title);
        Photo.Image image = item.photo.getImageByWidth(V.dp(40.0f));
        if (image != null) {
            this.icon.load(image.url);
        } else {
            this.icon.clear();
        }
        String expireDate = getExpiredDateText(this, item);
        if (expireDate != null) {
            this.tillDate.setText(expireDate);
            this.tillDate.setVisibility(0);
            this.nextBillTitle.setVisibility(0);
        } else {
            this.tillDate.setVisibility(8);
            this.nextBillTitle.setVisibility(8);
        }
        this.not_purchased_block.setVisibility(!item.purchased ? 0 : 8);
        View view = this.purchased_block;
        if (item.purchased) {
            i = 0;
        }
        view.setVisibility(i);
        this.cost.setText(getContext().getString(R.string.music_subs_buy_price, item.priceStr));
    }

    private static String getExpiredDateText(RecyclerHolder holder, Subscription subscription) {
        if (subscription.expiredDate <= 0) {
            return null;
        }
        Calendar calendar = Calendar.getInstance();
        int currentYear = calendar.get(1);
        calendar.setTimeInMillis(subscription.expiredDate * 1000);
        int day = calendar.get(5);
        int month = calendar.get(2);
        int year = calendar.get(1);
        if (currentYear != year) {
            return String.format("%d %s %d", Integer.valueOf(day), holder.getResources().getStringArray(R.array.months_full)[Math.min(11, month)], Integer.valueOf(year));
        }
        return String.format("%d %s", Integer.valueOf(day), holder.getResources().getStringArray(R.array.months_full)[Math.min(11, month)]);
    }
}
