package com.vkontakte.android.ui.holder.market;

import android.graphics.PointF;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;
import com.facebook.drawee.drawable.ScalingUtils;
import com.vk.imageloader.view.VKImageView;
import com.vkontakte.android.R;
import com.vkontakte.android.data.GoodAlbum;
import com.vkontakte.android.fragments.market.MarketFragment;
import com.vkontakte.android.ui.holder.RecyclerHolder;
import me.grishka.appkit.utils.V;
/* loaded from: classes3.dex */
public class GoodAlbumGridItemHolder extends RecyclerHolder<GoodAlbum> implements View.OnClickListener {
    final VKImageView image;
    final TextView text1;
    final TextView text2;

    public GoodAlbumGridItemHolder(ViewGroup parent) {
        super((int) R.layout.market_good_album_grid_item, parent);
        this.text1 = (TextView) $(16908308);
        this.text2 = (TextView) $(16908309);
        this.image = (VKImageView) $(16908294);
        this.itemView.setOnClickListener(this);
        this.image.setAspectRatio(1.5172414f);
        this.image.setActualScaleType(ScalingUtils.ScaleType.FOCUS_CROP);
        this.image.getHierarchy().setActualImageFocusPoint(new PointF(0.5f, 0.0f));
    }

    @Override // com.vkontakte.android.ui.holder.RecyclerHolder
    public void onBind(GoodAlbum item) {
        if (item == null) {
            this.itemView.setVisibility(4);
            return;
        }
        this.itemView.setVisibility(0);
        String url = item.photo != null ? item.photo.getImageByWidth(V.dp(176.0f)).url : null;
        this.image.load(url);
        this.text1.setText(item.title);
        this.text2.setText(getResources().getQuantityString(R.plurals.goods_count, item.count, Integer.valueOf(item.count)));
    }

    @Override // android.view.View.OnClickListener
    public void onClick(View v) {
        new MarketFragment.Builder(getItem().owner_id).setAlbum(getItem().id).setTitle(getItem().title).go(v.getContext());
    }
}
