package com.vkontakte.android.ui.holder.market;

import android.support.v4.view.ViewPager;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;
import com.vk.imageloader.view.VKImageView;
import com.vkontakte.android.Photo;
import com.vkontakte.android.R;
import com.vkontakte.android.TimeUtils;
import com.vkontakte.android.VKApplication;
import com.vkontakte.android.ViewUtils;
import com.vkontakte.android.data.Good;
import com.vkontakte.android.fragments.ProfileFragment;
import com.vkontakte.android.ui.drawable.RecoloredDrawable;
import com.vkontakte.android.ui.holder.RecyclerHolder;
import com.vkontakte.android.ui.holder.market.SquareGalleryHolder;
import com.vkontakte.android.ui.widget.GoodGalleryContainer;
import com.vkontakte.android.ui.widget.PageIndicator;
/* loaded from: classes3.dex */
public class GoodTabletHeaderHolder extends RecyclerHolder<Data> implements ViewPager.OnPageChangeListener, View.OnClickListener {
    final SquareGalleryHolder.Adapter adapter;
    final View arrowBlock;
    final TextView extText;
    final GoodGalleryContainer goodGalleryContainer;
    final TextView goodName;
    final TextView goodPrice;
    final TextView groupCategory;
    final VKImageView groupIcon;
    final TextView groupName;
    int lastGroupId;
    final PageIndicator pageIndicator;
    final ViewPager viewPager;
    final TextView wikiSubtitle;
    final TextView wikiTitle;
    final View writeButton;

    /* loaded from: classes3.dex */
    public static class Data {
        final View.OnClickListener arrowOnClickListener;
        final String arrowSubtitle;
        final String extText;
        final Good good;
        final String groupName;
        final String groupPhoto;
        final View.OnClickListener writeButtonOnClickListener;

        public Data(Good good, String arrowSubtitle, View.OnClickListener arrowOnClickListener, String groupName, String groupPhoto, View.OnClickListener writeButtonOnClickListener) {
            this.good = good;
            this.arrowSubtitle = arrowSubtitle;
            this.arrowOnClickListener = arrowOnClickListener;
            this.groupName = groupName;
            this.groupPhoto = groupPhoto;
            this.writeButtonOnClickListener = writeButtonOnClickListener;
            this.extText = VKApplication.context.getString(R.string.good_add_at, new StringBuilder(TimeUtils.langDate(good.date, true)).append((char) 160).append((char) 183).append((char) 160).append(VKApplication.context.getResources().getQuantityString(R.plurals.video_views, good.views_count, Integer.valueOf(good.views_count))));
        }
    }

    public GoodTabletHeaderHolder(ViewGroup parent) {
        super((int) R.layout.good_tablet_header, parent);
        this.viewPager = (ViewPager) $(R.id.pager);
        this.adapter = new SquareGalleryHolder.Adapter(this.viewPager, this);
        this.viewPager.setAdapter(this.adapter);
        this.viewPager.addOnPageChangeListener(this);
        this.pageIndicator = (PageIndicator) $(R.id.page_indicator);
        this.groupIcon = (VKImageView) $(R.id.groupIcon);
        this.groupName = (TextView) $(R.id.groupName);
        this.groupCategory = (TextView) $(R.id.groupCategory);
        this.goodName = (TextView) $(R.id.goodName);
        this.goodPrice = (TextView) $(R.id.goodPrice);
        this.wikiTitle = (TextView) $(16908308);
        this.wikiSubtitle = (TextView) $(16908309);
        this.arrowBlock = $(R.id.arrowBlock);
        this.writeButton = $(16908313);
        this.extText = (TextView) $(R.id.extText);
        this.goodGalleryContainer = (GoodGalleryContainer) $(R.id.goodGalleryContainer);
        this.goodGalleryContainer.setIsTablet(true);
        $(R.id.groupBlock).setOnClickListener(this);
        $(16908294).setBackgroundDrawable(new RecoloredDrawable(getDrawable(R.drawable.ic_chevron_right_24dp), -5591373));
    }

    @Override // android.support.v4.view.ViewPager.OnPageChangeListener
    public void onPageScrolled(int position, float positionOffset, int positionOffsetPixels) {
    }

    @Override // android.support.v4.view.ViewPager.OnPageChangeListener
    public void onPageSelected(int position) {
        this.pageIndicator.setIndexOfCurrentPage(position, true);
    }

    @Override // android.support.v4.view.ViewPager.OnPageChangeListener
    public void onPageScrollStateChanged(int state) {
    }

    @Override // com.vkontakte.android.ui.holder.RecyclerHolder
    public void onBind(Data item) {
        boolean z = false;
        Photo[] photos = item.good.photos;
        if (photos == null) {
            this.pageIndicator.setVisibility(8);
            this.adapter.setPhotos(new Photo[0]);
        } else {
            this.pageIndicator.setCountOfPages(photos.length);
            this.pageIndicator.setVisibility(photos.length > 1 ? 0 : 8);
            this.adapter.setPhotos(photos);
        }
        this.goodName.setText(item.good.title);
        this.goodPrice.setText(item.good.price_text);
        this.wikiSubtitle.setText(item.arrowSubtitle);
        if (item.arrowOnClickListener == null) {
            this.arrowBlock.setVisibility(8);
        } else {
            this.arrowBlock.setVisibility(0);
            this.arrowBlock.setOnClickListener(item.arrowOnClickListener);
        }
        this.groupName.setText(item.groupName);
        this.groupCategory.setText(item.good.category_name);
        this.groupIcon.load(item.groupPhoto);
        this.lastGroupId = item.good.owner_id;
        this.writeButton.setOnClickListener(item.writeButtonOnClickListener);
        View view = this.writeButton;
        if (item.good.availability == 0) {
            z = true;
        }
        ViewUtils.setEnabled(view, z);
        this.extText.setText(item.extText);
    }

    @Override // android.view.View.OnClickListener
    public void onClick(View v) {
        switch (v.getId()) {
            case R.id.groupBlock /* 2131755728 */:
                if (this.lastGroupId != 0) {
                    new ProfileFragment.Builder(this.lastGroupId).go(getContext());
                    return;
                }
                return;
            default:
                return;
        }
    }
}
