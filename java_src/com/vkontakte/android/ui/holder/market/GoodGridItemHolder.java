package com.vkontakte.android.ui.holder.market;

import android.graphics.PointF;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;
import com.facebook.drawee.drawable.ScalingUtils;
import com.vk.imageloader.view.VKImageView;
import com.vkontakte.android.R;
import com.vkontakte.android.data.Good;
import com.vkontakte.android.fragments.market.GoodFragment;
import com.vkontakte.android.ui.holder.RecyclerHolder;
import me.grishka.appkit.utils.V;
/* loaded from: classes3.dex */
public class GoodGridItemHolder extends RecyclerHolder<Good> implements View.OnClickListener {
    final VKImageView image;
    final TextView text1;
    final TextView text2;

    public GoodGridItemHolder(ViewGroup parent) {
        super((int) R.layout.market_good_grid_item, parent);
        this.text1 = (TextView) $(16908308);
        this.text2 = (TextView) $(16908309);
        this.image = (VKImageView) $(16908294);
        this.itemView.setOnClickListener(this);
        this.image.setAspectRatio(1.0f);
        this.image.setActualScaleType(ScalingUtils.ScaleType.FOCUS_CROP);
        this.image.getHierarchy().setActualImageFocusPoint(new PointF(0.5f, 0.0f));
    }

    @Override // com.vkontakte.android.ui.holder.RecyclerHolder
    public void onBind(Good item) {
        if (item == null) {
            this.itemView.setVisibility(4);
            return;
        }
        this.itemView.setVisibility(0);
        String url = (item.photos == null || item.photos.length <= 0) ? null : item.photos[0].getImageByWidth(V.dp(176.0f)).url;
        this.image.load(url);
        this.text1.setText(item.title);
        this.text2.setText(item.price_text);
    }

    @Override // android.view.View.OnClickListener
    public void onClick(View v) {
        if (getItem() != null) {
            new GoodFragment.Builder(GoodFragment.Builder.Source.market, getItem().owner_id, getItem().id).go(v.getContext());
        }
    }
}
