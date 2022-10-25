package com.vkontakte.android.ui.infiniteviewpager;

import android.content.Context;
import android.support.v4.view.PagerAdapter;
import android.support.v4.view.ViewPager;
import android.util.AttributeSet;
/* loaded from: classes3.dex */
public class InfiniteViewPager extends ViewPager {
    public InfiniteViewPager(Context context) {
        super(context);
    }

    public InfiniteViewPager(Context context, AttributeSet attrs) {
        super(context, attrs);
    }

    @Override // android.support.v4.view.ViewPager
    public void setAdapter(PagerAdapter adapter) {
        super.setAdapter(adapter);
        setCurrentItem(0);
    }

    @Override // android.support.v4.view.ViewPager
    public void setCurrentItem(int item) {
        setCurrentItem(item, false);
    }

    @Override // android.support.v4.view.ViewPager
    public void setCurrentItem(int item, boolean smoothScroll) {
        if (mo1110getAdapter().getCount() == 0) {
            super.setCurrentItem(item, smoothScroll);
        } else {
            super.setCurrentItem(getOffsetAmount() + (item % mo1110getAdapter().getCount()), smoothScroll);
        }
    }

    @Override // android.support.v4.view.ViewPager
    public int getCurrentItem() {
        if (mo1110getAdapter().getCount() == 0) {
            return super.getCurrentItem();
        }
        int position = super.getCurrentItem();
        if (mo1110getAdapter() instanceof InfinitePagerAdapter) {
            InfinitePagerAdapter infAdapter = (InfinitePagerAdapter) mo1110getAdapter();
            return position % infAdapter.getRealCount();
        }
        return super.getCurrentItem();
    }

    private int getOffsetAmount() {
        if (mo1110getAdapter().getCount() != 0 && (mo1110getAdapter() instanceof InfinitePagerAdapter)) {
            InfinitePagerAdapter infAdapter = (InfinitePagerAdapter) mo1110getAdapter();
            return infAdapter.getRealCount() * 100;
        }
        return 0;
    }
}
