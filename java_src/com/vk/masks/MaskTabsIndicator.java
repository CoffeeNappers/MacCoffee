package com.vk.masks;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.support.annotation.Nullable;
import android.support.v4.view.ViewPager;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.util.AttributeSet;
import com.vk.core.util.Screen;
import com.vk.masks.MaskTabsHolder;
import com.vk.masks.model.MaskSection;
import java.util.ArrayList;
/* loaded from: classes2.dex */
public class MaskTabsIndicator extends RecyclerView implements ViewPager.OnPageChangeListener, MaskTabsHolder.OnMaskTabClick {
    private Paint bottomDividerPaint;
    private float halfDp;
    private ViewPager pager;

    public MaskTabsIndicator(Context context) {
        super(context);
        init();
    }

    public MaskTabsIndicator(Context context, @Nullable AttributeSet attrs) {
        super(context, attrs);
        init();
    }

    public MaskTabsIndicator(Context context, @Nullable AttributeSet attrs, int defStyle) {
        super(context, attrs, defStyle);
        init();
    }

    private void init() {
        setAdapter(new MaskTabsAdapter(getContext(), this));
        setLayoutManager(new LinearLayoutManager(getContext(), 0, false));
        setWillNotDraw(false);
        this.halfDp = Screen.dp(0.5f);
        this.bottomDividerPaint = new Paint();
        this.bottomDividerPaint.setColor(520093695);
    }

    public void setSections(ArrayList<MaskSection> sections) {
        ((MaskTabsAdapter) mo1204getAdapter()).setSections(sections);
    }

    @Override // android.support.v4.view.ViewPager.OnPageChangeListener
    public void onPageScrolled(int position, float positionOffset, int positionOffsetPixels) {
    }

    @Override // android.support.v4.view.ViewPager.OnPageChangeListener
    public void onPageSelected(int position) {
        ((MaskTabsAdapter) mo1204getAdapter()).setSelectionPosition(position);
        scrollToPosition(position);
    }

    @Override // android.support.v4.view.ViewPager.OnPageChangeListener
    public void onPageScrollStateChanged(int state) {
    }

    @Override // com.vk.masks.MaskTabsHolder.OnMaskTabClick
    public void onClick(int position) {
        boolean z = true;
        ViewPager viewPager = this.pager;
        if (Math.abs(this.pager.getCurrentItem() - position) > 1) {
            z = false;
        }
        viewPager.setCurrentItem(position, z);
    }

    @Override // android.support.v7.widget.RecyclerView, android.view.View
    public void onDraw(Canvas c) {
        super.onDraw(c);
        c.drawRect(0.0f, c.getHeight() - this.halfDp, c.getWidth(), c.getHeight(), this.bottomDividerPaint);
    }

    public void setPager(ViewPager pager) {
        this.pager = pager;
    }
}
