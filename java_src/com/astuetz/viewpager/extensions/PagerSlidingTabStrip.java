package com.astuetz.viewpager.extensions;

import android.annotation.SuppressLint;
import android.content.Context;
import android.content.res.ColorStateList;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Typeface;
import android.graphics.drawable.Drawable;
import android.os.Build;
import android.os.Parcel;
import android.os.Parcelable;
import android.support.v4.view.ViewPager;
import android.text.TextUtils;
import android.util.AttributeSet;
import android.util.DisplayMetrics;
import android.util.TypedValue;
import android.view.View;
import android.view.ViewTreeObserver;
import android.widget.FrameLayout;
import android.widget.HorizontalScrollView;
import android.widget.ImageButton;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;
import com.facebook.drawee.drawable.ScalingUtils;
import com.vk.imageloader.view.VKImageView;
import com.vkontakte.android.Global;
import com.vkontakte.android.R;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
/* loaded from: classes.dex */
public class PagerSlidingTabStrip extends HorizontalScrollView {
    private static final int[] ATTRS = {16842901, 16842904};
    private boolean autoExpand;
    private boolean checkedTabWidths;
    private int currentPosition;
    private float currentPositionOffset;
    private LinearLayout.LayoutParams defaultTabLayoutParams;
    public List<ViewPager.OnPageChangeListener> delegatePageListeners;
    private int dividerColor;
    private int dividerPadding;
    private Paint dividerPaint;
    private int dividerWidth;
    private LinearLayout.LayoutParams expandedTabLayoutParams;
    private int indicatorColor;
    private int indicatorHeight;
    private int lastScrollX;
    private Locale locale;
    private List<View> mFooterViews;
    private int mHeaderCount;
    private List<View> mHeaderViews;
    public final PageListener pageListener;
    private ViewPager pager;
    private Paint rectPaint;
    private int scrollOffset;
    private boolean shouldExpand;
    private int tabBackgroundResId;
    private ColorStateList tabColorStateList;
    private int tabCount;
    private int tabPadding;
    private int tabTextColor;
    private int tabTextSize;
    private Typeface tabTypeface;
    private int tabTypefaceStyle;
    private LinearLayout tabsContainer;
    private boolean textAllCaps;
    private int underlineColor;
    private int underlineHeight;

    /* loaded from: classes.dex */
    public interface BadgeTabProvider {
        String getPageBadgeValue(int i);
    }

    /* loaded from: classes.dex */
    public interface IconTabProvider {
        int getPageIconResId(int i);
    }

    /* loaded from: classes.dex */
    public interface TabIconDrawableProvider {
        Drawable getPageIconDrawable(int i);
    }

    /* loaded from: classes.dex */
    public interface TabIconUrlProvider {
        String getPageIconUrl(int i);
    }

    public ColorStateList getInactiveTabTextColor() {
        return this.tabColorStateList;
    }

    public void setTextColor(ColorStateList tabColorStateList) {
        this.tabColorStateList = tabColorStateList;
        updateTabStyles(false);
    }

    public void setDefaultTabLayoutParams(LinearLayout.LayoutParams defaultTabLayoutParams) {
        this.defaultTabLayoutParams = defaultTabLayoutParams;
    }

    public PagerSlidingTabStrip(Context context) {
        this(context, null);
    }

    public PagerSlidingTabStrip(Context context, AttributeSet attrs) {
        this(context, attrs, 0);
    }

    public PagerSlidingTabStrip(Context context, AttributeSet attrs, int defStyle) {
        super(context, attrs, defStyle);
        this.pageListener = new PageListener();
        this.currentPosition = 0;
        this.currentPositionOffset = 0.0f;
        this.checkedTabWidths = false;
        this.indicatorColor = -10066330;
        this.underlineColor = 436207616;
        this.dividerColor = 436207616;
        this.shouldExpand = false;
        this.autoExpand = true;
        this.textAllCaps = true;
        this.scrollOffset = 52;
        this.indicatorHeight = 8;
        this.underlineHeight = 2;
        this.dividerPadding = 12;
        this.tabPadding = 24;
        this.dividerWidth = 1;
        this.tabTextSize = 12;
        this.tabTextColor = -10066330;
        this.tabTypeface = null;
        this.tabTypefaceStyle = 1;
        this.lastScrollX = 0;
        this.tabBackgroundResId = R.drawable.background_tab;
        setFillViewport(true);
        setWillNotDraw(false);
        this.tabsContainer = new LinearLayout(context);
        this.tabsContainer.setOrientation(0);
        this.tabsContainer.setLayoutParams(new FrameLayout.LayoutParams(-1, -1));
        addView(this.tabsContainer);
        DisplayMetrics dm = getResources().getDisplayMetrics();
        this.scrollOffset = (int) TypedValue.applyDimension(1, this.scrollOffset, dm);
        this.indicatorHeight = (int) TypedValue.applyDimension(1, this.indicatorHeight, dm);
        this.underlineHeight = (int) TypedValue.applyDimension(1, this.underlineHeight, dm);
        this.dividerPadding = (int) TypedValue.applyDimension(1, this.dividerPadding, dm);
        this.tabPadding = (int) TypedValue.applyDimension(1, this.tabPadding, dm);
        this.dividerWidth = (int) TypedValue.applyDimension(1, this.dividerWidth, dm);
        this.tabTextSize = (int) TypedValue.applyDimension(1, this.tabTextSize, dm);
        TypedArray a = context.obtainStyledAttributes(attrs, ATTRS);
        this.tabTextSize = a.getDimensionPixelSize(0, this.tabTextSize);
        this.tabTextColor = a.getColor(1, this.tabTextColor);
        a.recycle();
        TypedArray a2 = context.obtainStyledAttributes(attrs, R.styleable.PagerSlidingTabStrip);
        this.indicatorColor = a2.getColor(0, this.indicatorColor);
        this.underlineColor = a2.getColor(1, this.underlineColor);
        this.dividerColor = a2.getColor(2, this.dividerColor);
        this.indicatorHeight = a2.getDimensionPixelSize(3, this.indicatorHeight);
        this.underlineHeight = a2.getDimensionPixelSize(4, this.underlineHeight);
        this.tabPadding = a2.getDimensionPixelSize(5, this.tabPadding);
        this.tabBackgroundResId = a2.getResourceId(7, this.tabBackgroundResId);
        this.shouldExpand = a2.getBoolean(8, this.shouldExpand);
        this.scrollOffset = a2.getDimensionPixelSize(6, this.scrollOffset);
        a2.recycle();
        this.rectPaint = new Paint();
        this.rectPaint.setAntiAlias(true);
        this.rectPaint.setStyle(Paint.Style.FILL);
        this.dividerPaint = new Paint();
        this.dividerPaint.setAntiAlias(true);
        this.dividerPaint.setStrokeWidth(this.dividerWidth);
        this.defaultTabLayoutParams = new LinearLayout.LayoutParams(-2, -1, 0.0f);
        this.expandedTabLayoutParams = new LinearLayout.LayoutParams(0, -1, 1.0f);
        if (this.locale == null) {
            this.locale = getResources().getConfiguration().locale;
        }
    }

    public void addHeaderView(View header) {
        if (this.mHeaderViews == null) {
            this.mHeaderViews = new ArrayList(1);
        }
        this.mHeaderViews.add(header);
        this.mHeaderCount++;
    }

    public void addFooterView(View footer) {
        if (this.mFooterViews == null) {
            this.mFooterViews = new ArrayList(1);
        }
        this.mFooterViews.add(footer);
    }

    public void setViewPager(ViewPager pager) {
        this.pager = pager;
        if (pager.mo1110getAdapter() == null) {
            throw new IllegalStateException("ViewPager does not have adapter instance.");
        }
        pager.setOnPageChangeListener(this.pageListener);
        notifyDataSetChanged();
    }

    @Deprecated
    public void setOnPageChangeListener(ViewPager.OnPageChangeListener listener) {
        addOnPageChangeListener(listener);
    }

    public void addOnPageChangeListener(ViewPager.OnPageChangeListener l) {
        if (this.delegatePageListeners == null) {
            this.delegatePageListeners = new ArrayList();
        }
        this.delegatePageListeners.add(l);
    }

    public void notifyDataSetChanged() {
        this.tabsContainer.removeAllViews();
        if (this.mHeaderViews != null) {
            for (View view : this.mHeaderViews) {
                this.tabsContainer.addView(view);
            }
        }
        this.tabCount = this.pager.mo1110getAdapter().getCount();
        for (int i = 0; i < this.tabCount; i++) {
            if (this.pager.mo1110getAdapter() instanceof IconTabProvider) {
                addIconTab(i, ((IconTabProvider) this.pager.mo1110getAdapter()).getPageIconResId(i));
            } else if ((this.pager.mo1110getAdapter() instanceof TabIconUrlProvider) && (this.pager.mo1110getAdapter() instanceof TabIconDrawableProvider)) {
                String url = ((TabIconUrlProvider) this.pager.mo1110getAdapter()).getPageIconUrl(i);
                if (!TextUtils.isEmpty(url)) {
                    addUrlTab(i, (TabIconUrlProvider) this.pager.mo1110getAdapter());
                } else {
                    addDrawableTab(i, (TabIconDrawableProvider) this.pager.mo1110getAdapter());
                }
            } else if (this.pager.mo1110getAdapter() instanceof TabIconUrlProvider) {
                addUrlTab(i, (TabIconUrlProvider) this.pager.mo1110getAdapter());
            } else if (this.pager.mo1110getAdapter() instanceof TabIconDrawableProvider) {
                addDrawableTab(i, (TabIconDrawableProvider) this.pager.mo1110getAdapter());
            } else if (this.pager.mo1110getAdapter() instanceof BadgeTabProvider) {
                addBadgeTextTab(i, this.pager.mo1110getAdapter().getPageTitle(i), ((BadgeTabProvider) this.pager.mo1110getAdapter()).getPageBadgeValue(i));
            } else {
                addTextTab(i, this.pager.mo1110getAdapter().getPageTitle(i));
            }
        }
        if (this.mFooterViews != null) {
            for (View view2 : this.mFooterViews) {
                this.tabsContainer.addView(view2);
            }
        }
        updateTabStyles(false);
        this.checkedTabWidths = false;
        getViewTreeObserver().addOnGlobalLayoutListener(new ViewTreeObserver.OnGlobalLayoutListener() { // from class: com.astuetz.viewpager.extensions.PagerSlidingTabStrip.1
            @Override // android.view.ViewTreeObserver.OnGlobalLayoutListener
            @SuppressLint({"NewApi"})
            public void onGlobalLayout() {
                if (Build.VERSION.SDK_INT < 16) {
                    PagerSlidingTabStrip.this.getViewTreeObserver().removeGlobalOnLayoutListener(this);
                } else {
                    PagerSlidingTabStrip.this.getViewTreeObserver().removeOnGlobalLayoutListener(this);
                }
                PagerSlidingTabStrip.this.currentPosition = PagerSlidingTabStrip.this.pager.getCurrentItem() + PagerSlidingTabStrip.this.mHeaderCount;
                PagerSlidingTabStrip.this.scrollToChild(PagerSlidingTabStrip.this.currentPosition, 0);
            }
        });
        updateExpanded();
    }

    private void addTextTab(final int position, CharSequence title) {
        TextView tab = new TextView(getContext());
        tab.setText(title);
        tab.setFocusable(true);
        tab.setGravity(17);
        tab.setSingleLine();
        tab.setOnClickListener(new View.OnClickListener() { // from class: com.astuetz.viewpager.extensions.PagerSlidingTabStrip.2
            @Override // android.view.View.OnClickListener
            public void onClick(View v) {
                PagerSlidingTabStrip.this.pager.setCurrentItem(position);
            }
        });
        setStyle(tab);
        this.tabsContainer.addView(tab);
    }

    private void addBadgeTextTab(final int position, CharSequence title, String badge) {
        if (badge == null) {
            addTextTab(position, title);
            return;
        }
        TextView tab = new TextView(getContext());
        tab.setText(title);
        tab.setFocusable(true);
        tab.setGravity(17);
        tab.setSingleLine();
        tab.setPadding(0, 0, Global.scale(5.0f), 0);
        TextView bv = new TextView(getContext());
        bv.setText(badge);
        bv.setTextColor(-1);
        bv.setTextSize(13.0f);
        bv.setTypeface(Typeface.DEFAULT_BOLD);
        bv.setBackgroundResource(R.drawable.badge_tab);
        LinearLayout ll = new LinearLayout(getContext());
        ll.setOrientation(0);
        ll.setGravity(17);
        ll.addView(tab);
        ll.addView(bv);
        ll.setOnClickListener(new View.OnClickListener() { // from class: com.astuetz.viewpager.extensions.PagerSlidingTabStrip.3
            @Override // android.view.View.OnClickListener
            public void onClick(View v) {
                PagerSlidingTabStrip.this.pager.setCurrentItem(position);
            }
        });
        this.tabsContainer.addView(ll);
    }

    private void addIconTab(final int position, int resId) {
        ImageButton tab = new ImageButton(getContext());
        tab.setFocusable(true);
        tab.setImageResource(resId);
        tab.setOnClickListener(new View.OnClickListener() { // from class: com.astuetz.viewpager.extensions.PagerSlidingTabStrip.4
            @Override // android.view.View.OnClickListener
            public void onClick(View v) {
                PagerSlidingTabStrip.this.pager.setCurrentItem(position);
            }
        });
        this.tabsContainer.addView(tab);
    }

    private void addUrlTab(final int position, TabIconUrlProvider provider) {
        VKImageView tab = new VKImageView(getContext());
        tab.setFocusable(true);
        tab.getHierarchy().setActualImageScaleType(ScalingUtils.ScaleType.CENTER_INSIDE);
        tab.load(provider.getPageIconUrl(position));
        tab.setOnClickListener(new View.OnClickListener() { // from class: com.astuetz.viewpager.extensions.PagerSlidingTabStrip.5
            @Override // android.view.View.OnClickListener
            public void onClick(View v) {
                PagerSlidingTabStrip.this.pager.setCurrentItem(position);
            }
        });
        this.tabsContainer.addView(tab);
    }

    private void addDrawableTab(final int position, TabIconDrawableProvider provider) {
        ImageButton tab = new ImageButton(getContext());
        tab.setFocusable(true);
        tab.setScaleType(ImageView.ScaleType.CENTER);
        tab.setImageDrawable(provider.getPageIconDrawable(position));
        tab.setOnClickListener(new View.OnClickListener() { // from class: com.astuetz.viewpager.extensions.PagerSlidingTabStrip.6
            @Override // android.view.View.OnClickListener
            public void onClick(View v) {
                PagerSlidingTabStrip.this.pager.setCurrentItem(position);
            }
        });
        this.tabsContainer.addView(tab);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void updateTabStyles(boolean selectedOnly) {
        int i = this.mHeaderCount;
        while (i < this.tabCount + this.mHeaderCount) {
            View v = this.tabsContainer.getChildAt(i);
            v.setLayoutParams(this.defaultTabLayoutParams);
            v.setBackgroundResource(this.tabBackgroundResId);
            if (this.shouldExpand) {
                v.setPadding(0, 0, 0, 0);
                v.setLayoutParams(new LinearLayout.LayoutParams(-1, -1, 1.0f));
            } else {
                v.setPadding(this.tabPadding, 0, this.tabPadding, 0);
            }
            if (v instanceof TextView) {
                setStyle((TextView) v);
            }
            if (v instanceof LinearLayout) {
                setStyle((TextView) ((LinearLayout) v).getChildAt(0));
            }
            v.setSelected(i == this.currentPosition);
            i++;
        }
    }

    private void setStyle(TextView tab) {
        tab.setTextSize(0, this.tabTextSize);
        tab.setTypeface(this.tabTypeface, this.tabTypefaceStyle);
        if (this.tabColorStateList == null) {
            tab.setTextColor(this.tabTextColor);
        } else {
            tab.setTextColor(this.tabColorStateList);
        }
        if (this.textAllCaps) {
            if (Build.VERSION.SDK_INT >= 14) {
                tab.setAllCaps(true);
            } else {
                tab.setText(tab.getText().toString().toUpperCase(this.locale));
            }
        }
    }

    @Override // android.widget.HorizontalScrollView, android.widget.FrameLayout, android.view.View
    protected void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
        super.onMeasure(widthMeasureSpec, heightMeasureSpec);
        if (this.shouldExpand && View.MeasureSpec.getMode(widthMeasureSpec) != 0) {
            int myWidth = getMeasuredWidth();
            this.tabsContainer.measure(1073741824 | myWidth, heightMeasureSpec);
        }
    }

    private void updateExpanded() {
        if (getWidth() > 0) {
            doUpdateExpanded();
        } else {
            getViewTreeObserver().addOnPreDrawListener(new ViewTreeObserver.OnPreDrawListener() { // from class: com.astuetz.viewpager.extensions.PagerSlidingTabStrip.7
                @Override // android.view.ViewTreeObserver.OnPreDrawListener
                @SuppressLint({"NewApi"})
                public boolean onPreDraw() {
                    PagerSlidingTabStrip.this.getViewTreeObserver().removeOnPreDrawListener(this);
                    PagerSlidingTabStrip.this.doUpdateExpanded();
                    return true;
                }
            });
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void doUpdateExpanded() {
        int w = getWidth();
        int wSum = 0;
        for (int i = 0; i < this.tabsContainer.getChildCount(); i++) {
            this.tabsContainer.getChildAt(i).measure(Integer.MIN_VALUE | w, 1073741824 | getHeight());
            int tw = this.tabsContainer.getChildAt(i).getMeasuredWidth();
            wSum += tw;
        }
        boolean expand = (Math.abs(w - wSum) < Global.scale(50.0f) && this.autoExpand) || this.shouldExpand;
        for (int i2 = 0; i2 < this.tabsContainer.getChildCount(); i2++) {
            View v = this.tabsContainer.getChildAt(i2);
            if (expand) {
                if (i2 >= this.mHeaderCount) {
                    v.setPadding(0, 0, 0, 0);
                }
                v.setLayoutParams(new LinearLayout.LayoutParams(-1, -1, 1.0f));
            } else {
                if (i2 >= this.mHeaderCount) {
                    v.setPadding(this.tabPadding, 0, this.tabPadding, 0);
                }
                v.setLayoutParams(this.defaultTabLayoutParams);
            }
        }
    }

    @Override // android.widget.HorizontalScrollView, android.view.View
    public void onSizeChanged(int w, int h, int ow, int oh) {
        if (!this.shouldExpand) {
            post(new Runnable() { // from class: com.astuetz.viewpager.extensions.PagerSlidingTabStrip.8
                @Override // java.lang.Runnable
                public void run() {
                    PagerSlidingTabStrip.this.notifyDataSetChanged();
                }
            });
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void scrollToChild(int position, int offset) {
        if (this.tabCount != 0 && position < this.tabsContainer.getChildCount() && position >= 0) {
            int newScrollX = this.tabsContainer.getChildAt(position).getLeft() + offset;
            if (position > 0 || offset > 0) {
                newScrollX -= this.scrollOffset;
            }
            if (newScrollX != this.lastScrollX) {
                this.lastScrollX = newScrollX;
                scrollTo(newScrollX, 0);
            }
        }
    }

    @Override // android.view.View
    protected void onDraw(Canvas canvas) {
        super.onDraw(canvas);
        if (!isInEditMode() && this.tabCount != 0) {
            int height = getHeight();
            this.rectPaint.setColor(this.indicatorColor);
            int tabCount = this.tabCount + this.mHeaderCount;
            View currentTab = this.tabsContainer.getChildAt(this.currentPosition);
            if (currentTab != null) {
                float lineLeft = currentTab.getLeft();
                float lineRight = currentTab.getRight();
                if (this.currentPositionOffset > 0.0f && this.currentPosition < tabCount - 1) {
                    View nextTab = this.tabsContainer.getChildAt(this.currentPosition + 1);
                    float nextTabLeft = nextTab.getLeft();
                    float nextTabRight = nextTab.getRight();
                    lineLeft = (this.currentPositionOffset * nextTabLeft) + ((1.0f - this.currentPositionOffset) * lineLeft);
                    lineRight = (this.currentPositionOffset * nextTabRight) + ((1.0f - this.currentPositionOffset) * lineRight);
                }
                canvas.drawRect(lineLeft, height - this.indicatorHeight, lineRight, height, this.rectPaint);
                this.rectPaint.setColor(this.underlineColor);
                canvas.drawRect(0.0f, height - this.underlineHeight, this.tabsContainer.getWidth(), height, this.rectPaint);
                this.dividerPaint.setColor(this.dividerColor);
                for (int i = 0; i < tabCount - 1; i++) {
                    View tab = this.tabsContainer.getChildAt(i);
                    canvas.drawLine(tab.getRight(), this.dividerPadding, tab.getRight(), height - this.dividerPadding, this.dividerPaint);
                }
            }
        }
    }

    /* loaded from: classes.dex */
    public class PageListener implements ViewPager.OnPageChangeListener {
        public PageListener() {
        }

        @Override // android.support.v4.view.ViewPager.OnPageChangeListener
        public void onPageScrolled(int position, float positionOffset, int positionOffsetPixels) {
            View v = PagerSlidingTabStrip.this.tabsContainer.getChildAt(PagerSlidingTabStrip.this.mHeaderCount + position);
            if (v != null) {
                PagerSlidingTabStrip.this.currentPosition = PagerSlidingTabStrip.this.mHeaderCount + position;
                PagerSlidingTabStrip.this.currentPositionOffset = positionOffset;
                PagerSlidingTabStrip.this.scrollToChild(PagerSlidingTabStrip.this.mHeaderCount + position, (int) (v.getWidth() * positionOffset));
                PagerSlidingTabStrip.this.invalidate();
                if (PagerSlidingTabStrip.this.delegatePageListeners != null) {
                    for (ViewPager.OnPageChangeListener delegatePageListener : PagerSlidingTabStrip.this.delegatePageListeners) {
                        delegatePageListener.onPageScrolled(position, positionOffset, positionOffsetPixels);
                    }
                }
            }
        }

        @Override // android.support.v4.view.ViewPager.OnPageChangeListener
        public void onPageScrollStateChanged(int state) {
            if (state == 0) {
                PagerSlidingTabStrip.this.scrollToChild(PagerSlidingTabStrip.this.pager.getCurrentItem() + PagerSlidingTabStrip.this.mHeaderCount, 0);
            }
            if (PagerSlidingTabStrip.this.delegatePageListeners != null) {
                for (ViewPager.OnPageChangeListener delegatePageListener : PagerSlidingTabStrip.this.delegatePageListeners) {
                    delegatePageListener.onPageScrollStateChanged(state);
                }
            }
        }

        @Override // android.support.v4.view.ViewPager.OnPageChangeListener
        public void onPageSelected(int position) {
            if (PagerSlidingTabStrip.this.delegatePageListeners != null) {
                for (ViewPager.OnPageChangeListener delegatePageListener : PagerSlidingTabStrip.this.delegatePageListeners) {
                    delegatePageListener.onPageSelected(position);
                }
            }
            PagerSlidingTabStrip.this.currentPosition = PagerSlidingTabStrip.this.mHeaderCount + position;
            PagerSlidingTabStrip.this.updateTabStyles(true);
        }
    }

    public void setIndicatorColor(int indicatorColor) {
        this.indicatorColor = indicatorColor;
        invalidate();
    }

    public void setIndicatorColorResource(int resId) {
        this.indicatorColor = getResources().getColor(resId);
        invalidate();
    }

    public int getIndicatorColor() {
        return this.indicatorColor;
    }

    public void setIndicatorHeight(int indicatorLineHeightPx) {
        this.indicatorHeight = indicatorLineHeightPx;
        invalidate();
    }

    public int getIndicatorHeight() {
        return this.indicatorHeight;
    }

    public void setUnderlineColor(int underlineColor) {
        this.underlineColor = underlineColor;
        invalidate();
    }

    public void setUnderlineColorResource(int resId) {
        this.underlineColor = getResources().getColor(resId);
        invalidate();
    }

    public int getUnderlineColor() {
        return this.underlineColor;
    }

    public void setDividerColor(int dividerColor) {
        this.dividerColor = dividerColor;
        invalidate();
    }

    public void setDividerColorResource(int resId) {
        this.dividerColor = getResources().getColor(resId);
        invalidate();
    }

    public int getDividerColor() {
        return this.dividerColor;
    }

    public void setUnderlineHeight(int underlineHeightPx) {
        this.underlineHeight = underlineHeightPx;
        invalidate();
    }

    public int getUnderlineHeight() {
        return this.underlineHeight;
    }

    public void setDividerPadding(int dividerPaddingPx) {
        this.dividerPadding = dividerPaddingPx;
        invalidate();
    }

    public int getDividerPadding() {
        return this.dividerPadding;
    }

    public void setScrollOffset(int scrollOffsetPx) {
        this.scrollOffset = scrollOffsetPx;
        invalidate();
    }

    public int getScrollOffset() {
        return this.scrollOffset;
    }

    public void setShouldExpand(boolean shouldExpand) {
        this.shouldExpand = shouldExpand;
        this.tabsContainer.setLayoutParams(new FrameLayout.LayoutParams(-1, -1));
        updateTabStyles(false);
        requestLayout();
    }

    public void setAutoExpand(boolean autoExpand) {
        this.autoExpand = autoExpand;
        this.tabsContainer.setLayoutParams(new FrameLayout.LayoutParams(-1, -1));
        updateTabStyles(false);
        requestLayout();
    }

    public boolean getShouldExpand() {
        return this.shouldExpand;
    }

    public boolean isTextAllCaps() {
        return this.textAllCaps;
    }

    public void setAllCaps(boolean textAllCaps) {
        this.textAllCaps = textAllCaps;
    }

    public void setTextSize(int textSizePx) {
        this.tabTextSize = textSizePx;
        updateTabStyles(false);
    }

    public int getTextSize() {
        return this.tabTextSize;
    }

    public void setTextColor(int textColor) {
        this.tabTextColor = textColor;
        updateTabStyles(false);
    }

    public void setTextColorResource(int resId) {
        this.tabTextColor = getResources().getColor(resId);
        updateTabStyles(false);
    }

    public int getTextColor() {
        return this.tabTextColor;
    }

    public void setTypeface(Typeface typeface, int style) {
        this.tabTypeface = typeface;
        this.tabTypefaceStyle = style;
        updateTabStyles(false);
    }

    public void setTabBackground(int resId) {
        this.tabBackgroundResId = resId;
        updateTabStyles(false);
    }

    public int getTabBackground() {
        return this.tabBackgroundResId;
    }

    public void setTabPaddingLeftRight(int paddingPx) {
        this.tabPadding = paddingPx;
        updateTabStyles(false);
    }

    public int getTabPaddingLeftRight() {
        return this.tabPadding;
    }

    @Override // android.widget.HorizontalScrollView, android.view.View
    public void onRestoreInstanceState(Parcelable state) {
        SavedState savedState = (SavedState) state;
        super.onRestoreInstanceState(savedState.getSuperState());
        this.currentPosition = savedState.currentPosition;
        requestLayout();
    }

    @Override // android.widget.HorizontalScrollView, android.view.View
    public Parcelable onSaveInstanceState() {
        Parcelable superState = super.onSaveInstanceState();
        SavedState savedState = new SavedState(superState);
        savedState.currentPosition = this.currentPosition;
        return savedState;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes.dex */
    public static class SavedState extends View.BaseSavedState {
        public static final Parcelable.Creator<SavedState> CREATOR = new Parcelable.Creator<SavedState>() { // from class: com.astuetz.viewpager.extensions.PagerSlidingTabStrip.SavedState.1
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // android.os.Parcelable.Creator
            /* renamed from: createFromParcel */
            public SavedState mo168createFromParcel(Parcel in) {
                return new SavedState(in);
            }

            /* JADX WARN: Can't rename method to resolve collision */
            @Override // android.os.Parcelable.Creator
            /* renamed from: newArray */
            public SavedState[] mo169newArray(int size) {
                return new SavedState[size];
            }
        };
        int currentPosition;

        public SavedState(Parcelable superState) {
            super(superState);
        }

        private SavedState(Parcel in) {
            super(in);
            this.currentPosition = in.readInt();
        }

        @Override // android.view.View.BaseSavedState, android.view.AbsSavedState, android.os.Parcelable
        public void writeToParcel(Parcel dest, int flags) {
            super.writeToParcel(dest, flags);
            dest.writeInt(this.currentPosition);
        }
    }
}
