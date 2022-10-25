package com.vkontakte.android.ui.widget;

import android.content.Context;
import android.support.annotation.Nullable;
import android.support.v4.view.ViewPager;
import android.util.AttributeSet;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;
import com.vkontakte.android.ui.Font;
import com.vkontakte.android.ui.widget.SubPagerOfList;
/* loaded from: classes3.dex */
public class PagerSlidingTabStrip extends com.astuetz.viewpager.extensions.PagerSlidingTabStrip implements SubPagerOfList.Decor {
    private ViewPager pager;

    public PagerSlidingTabStrip(Context context) {
        super(context);
        init();
    }

    public PagerSlidingTabStrip(Context context, AttributeSet attrs) {
        super(context, attrs);
        init();
    }

    public PagerSlidingTabStrip(Context context, AttributeSet attrs, int defStyle) {
        super(context, attrs, defStyle);
        init();
    }

    private void init() {
        setTypeface(Font.Medium.typeface, 0);
        addOnPageChangeListener(new ViewPager.OnPageChangeListener() { // from class: com.vkontakte.android.ui.widget.PagerSlidingTabStrip.1
            @Override // android.support.v4.view.ViewPager.OnPageChangeListener
            public void onPageScrolled(int position, float positionOffset, int positionOffsetPixels) {
            }

            @Override // android.support.v4.view.ViewPager.OnPageChangeListener
            public void onPageSelected(int position) {
                PagerSlidingTabStrip.this.updateTabsState(position);
            }

            @Override // android.support.v4.view.ViewPager.OnPageChangeListener
            public void onPageScrollStateChanged(int state) {
            }
        });
    }

    @Override // com.astuetz.viewpager.extensions.PagerSlidingTabStrip
    public void notifyDataSetChanged() {
        super.notifyDataSetChanged();
        updateTabsState(this.pager.getCurrentItem());
    }

    @Override // com.astuetz.viewpager.extensions.PagerSlidingTabStrip
    public void setViewPager(ViewPager pager) {
        this.pager = pager;
        super.setViewPager(pager);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void updateTabsState(int currentSelect) {
        ViewGroup tabsContainer = getTabsContainer();
        if (tabsContainer != null) {
            for (int i = tabsContainer.getChildCount() - 1; i >= 0; i--) {
                View view = tabsContainer.getChildAt(i);
                if (view instanceof TextView) {
                    if (i == currentSelect) {
                        ((TextView) view).setTextColor(-11435592);
                    } else {
                        ((TextView) view).setTextColor(-1705934408);
                    }
                }
            }
        }
    }

    @Nullable
    private ViewGroup getTabsContainer() {
        View tabsContainer = getChildCount() > 0 ? getChildAt(0) : null;
        if (tabsContainer instanceof ViewGroup) {
            return (ViewGroup) tabsContainer;
        }
        return null;
    }
}
