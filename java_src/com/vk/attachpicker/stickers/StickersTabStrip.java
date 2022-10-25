package com.vk.attachpicker.stickers;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.support.v4.content.ContextCompat;
import android.view.View;
import android.widget.FrameLayout;
import android.widget.HorizontalScrollView;
import android.widget.ImageView;
import android.widget.LinearLayout;
import com.facebook.drawee.drawable.ScalingUtils;
import com.vk.attachpicker.Picker;
import com.vk.core.util.Screen;
import com.vk.imageloader.view.VKImageView;
import com.vkontakte.android.R;
import com.vkontakte.android.data.orm.StickerStockItem;
import com.vkontakte.android.utils.OsUtil;
/* loaded from: classes2.dex */
public class StickersTabStrip extends HorizontalScrollView {
    private int currentPosition;
    private ScrollSlidingTabStripDelegate delegate;
    private int indicatorColor;
    private int lastScrollX;
    private Paint rectPaint;
    private int scrollOffset;
    private int selectionRadius;
    private int tabCount;
    private LinearLayout tabsContainer;
    private int underlineColor;
    private int underlineHeight;

    /* loaded from: classes2.dex */
    public interface ScrollSlidingTabStripDelegate {
        void onPageSelected(int i);
    }

    public StickersTabStrip(Context context) {
        super(context);
        this.currentPosition = 0;
        this.indicatorColor = -1644309;
        this.underlineColor = 0;
        this.selectionRadius = Screen.dp(20);
        this.scrollOffset = Screen.dp(52);
        this.underlineHeight = Screen.dp(2);
        this.lastScrollX = 0;
        setFillViewport(true);
        setWillNotDraw(false);
        setHorizontalScrollBarEnabled(false);
        this.tabsContainer = new LinearLayout(context);
        this.tabsContainer.setOrientation(0);
        this.tabsContainer.setLayoutParams(new FrameLayout.LayoutParams(-1, -1));
        addView(this.tabsContainer);
        this.rectPaint = new Paint();
        this.rectPaint.setAntiAlias(true);
        this.rectPaint.setStyle(Paint.Style.FILL);
    }

    public void setDelegate(ScrollSlidingTabStripDelegate scrollSlidingTabStripDelegate) {
        this.delegate = scrollSlidingTabStripDelegate;
    }

    public void removeTabs() {
        this.tabsContainer.removeAllViews();
        this.tabCount = 0;
        this.currentPosition = 0;
    }

    public void selectTab(int num) {
        if (num >= 0 && num < this.tabCount - 1) {
            onPageScrolled(num, 0);
        }
    }

    public void addIconTab(int resId) {
        final int position = this.tabCount;
        this.tabCount = position + 1;
        FrameLayout tab = new FrameLayout(getContext());
        if (OsUtil.isAtLeastKLP()) {
            tab.setForeground(ContextCompat.getDrawable(getContext(), R.drawable.picker_white_ripple_bounded));
        }
        tab.setFocusable(true);
        tab.setOnClickListener(new View.OnClickListener() { // from class: com.vk.attachpicker.stickers.StickersTabStrip.1
            @Override // android.view.View.OnClickListener
            public void onClick(View v) {
                StickersTabStrip.this.selectTab(position);
                StickersTabStrip.this.delegate.onPageSelected(position);
            }
        });
        ImageView imageView = new ImageView(getContext());
        imageView.setColorFilter(Picker.color(R.color.picker_dark_icon));
        imageView.setImageResource(resId);
        imageView.setScaleType(ImageView.ScaleType.CENTER_INSIDE);
        tab.addView(imageView, new FrameLayout.LayoutParams(Screen.dp(48), Screen.dp(48), 17));
        this.tabsContainer.addView(tab);
    }

    public void addStickerTab(StickerStockItem sticker) {
        boolean z = true;
        final int position = this.tabCount;
        this.tabCount = position + 1;
        FrameLayout tab = new FrameLayout(getContext());
        if (OsUtil.isAtLeastKLP()) {
            tab.setForeground(ContextCompat.getDrawable(getContext(), R.drawable.picker_white_ripple_bounded));
        }
        tab.setFocusable(true);
        tab.setOnClickListener(new View.OnClickListener() { // from class: com.vk.attachpicker.stickers.StickersTabStrip.2
            @Override // android.view.View.OnClickListener
            public void onClick(View v) {
                StickersTabStrip.this.selectTab(position);
                StickersTabStrip.this.delegate.onPageSelected(position);
            }
        });
        this.tabsContainer.addView(tab);
        if (position != this.currentPosition) {
            z = false;
        }
        tab.setSelected(z);
        VKImageView imageView = new VKImageView(getContext());
        imageView.getHierarchy().setActualImageScaleType(ScalingUtils.ScaleType.CENTER_INSIDE);
        imageView.load(sticker.getServerIconURL());
        tab.addView(imageView, new FrameLayout.LayoutParams(Screen.dp(48), Screen.dp(48), 17));
    }

    private void scrollToChild(int position) {
        if (this.tabCount != 0 && this.tabsContainer.getChildAt(position) != null) {
            int newScrollX = this.tabsContainer.getChildAt(position).getLeft();
            if (position > 0) {
                newScrollX -= this.scrollOffset;
            }
            int currentScrollX = getScrollX();
            if (newScrollX != this.lastScrollX) {
                if (newScrollX < currentScrollX) {
                    this.lastScrollX = newScrollX;
                    smoothScrollTo(this.lastScrollX, 0);
                } else if (this.scrollOffset + newScrollX > (getWidth() + currentScrollX) - (this.scrollOffset * 2)) {
                    this.lastScrollX = (newScrollX - getWidth()) + (this.scrollOffset * 3);
                    smoothScrollTo(this.lastScrollX, 0);
                }
            }
        }
    }

    @Override // android.view.View
    protected void onScrollChanged(int l, int t, int oldl, int oldt) {
        super.onScrollChanged(l, t, oldl, oldt);
    }

    @Override // android.view.View
    protected void onDraw(Canvas canvas) {
        super.onDraw(canvas);
        if (!isInEditMode() && this.tabCount != 0) {
            int height = getHeight();
            this.rectPaint.setColor(this.underlineColor);
            canvas.drawRect(0.0f, height - this.underlineHeight, this.tabsContainer.getWidth(), height, this.rectPaint);
            View currentTab = this.tabsContainer.getChildAt(this.currentPosition);
            float lineLeft = 0.0f;
            float lineRight = 0.0f;
            if (currentTab != null) {
                lineLeft = currentTab.getLeft();
                lineRight = currentTab.getRight();
            }
            this.rectPaint.setColor(this.indicatorColor);
            canvas.drawCircle(((lineRight - lineLeft) / 2.0f) + lineLeft, (getMeasuredHeight() / 2) - getPaddingTop(), this.selectionRadius, this.rectPaint);
        }
    }

    public int getCurrentPosition() {
        return this.currentPosition;
    }

    public void onPageScrolled(int position, int first) {
        if (this.currentPosition != position) {
            this.currentPosition = position;
            if (position < this.tabsContainer.getChildCount()) {
                int a = 0;
                while (a < this.tabsContainer.getChildCount()) {
                    FrameLayout fl = (FrameLayout) this.tabsContainer.getChildAt(a);
                    fl.setSelected(a == position);
                    View v = fl.getChildAt(0);
                    if (v.getClass() == ImageView.class) {
                        ((ImageView) v).setColorFilter(a == position ? -11433012 : -7301991);
                    }
                    a++;
                }
                if (first == position && position > 1) {
                    scrollToChild(position - 1);
                } else {
                    scrollToChild(position);
                }
                invalidate();
            }
        }
    }

    public void setIndicatorColor(int indicatorColor) {
        this.indicatorColor = indicatorColor;
        invalidate();
    }

    public void setUnderlineColor(int underlineColor) {
        this.underlineColor = underlineColor;
        invalidate();
    }

    public void setUnderlineColorResource(int resId) {
        this.underlineColor = getResources().getColor(resId);
        invalidate();
    }

    public void setUnderlineHeight(int underlineHeightPx) {
        this.underlineHeight = underlineHeightPx;
        invalidate();
    }
}
