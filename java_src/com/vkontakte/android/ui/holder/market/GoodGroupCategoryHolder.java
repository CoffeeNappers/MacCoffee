package com.vkontakte.android.ui.holder.market;

import android.view.ViewGroup;
import android.widget.TextView;
import com.vk.imageloader.view.VKImageView;
import com.vkontakte.android.R;
import com.vkontakte.android.TimeUtils;
import com.vkontakte.android.data.Good;
import com.vkontakte.android.fragments.ProfileFragment;
import com.vkontakte.android.ui.holder.RecyclerHolder;
import me.grishka.appkit.views.UsableRecyclerView;
/* loaded from: classes3.dex */
public class GoodGroupCategoryHolder extends RecyclerHolder<Object[]> implements UsableRecyclerView.Clickable {
    final VKImageView image;
    int lastGroupId;
    final TextView text1;
    final TextView text2;

    public GoodGroupCategoryHolder(ViewGroup parent) {
        super((int) R.layout.good_group_category_holder, parent);
        this.lastGroupId = 0;
        this.image = (VKImageView) $(16908294);
        this.text1 = (TextView) $(16908308);
        this.text2 = (TextView) $(16908309);
    }

    @Override // com.vkontakte.android.ui.holder.RecyclerHolder
    public void onBind(Object[] item) {
        Good good = (Good) item[0];
        String groupName = (String) item[1];
        String groupPhoto = (String) item[2];
        this.lastGroupId = ((Integer) item[3]).intValue();
        this.text1.setText(groupName);
        this.text2.setText(new StringBuilder(TimeUtils.langDate(good.date, true)).append((char) 160).append((char) 183).append((char) 160).append(getContext().getResources().getQuantityString(R.plurals.video_views, good.views_count, Integer.valueOf(good.views_count))).append('\n').append(getContext().getString(R.string.category, good.category_name)));
        this.image.load(groupPhoto);
    }

    @Override // me.grishka.appkit.views.UsableRecyclerView.Clickable
    public void onClick() {
        if (this.lastGroupId != 0) {
            new ProfileFragment.Builder(this.lastGroupId).go(getContext());
        }
    }
}
