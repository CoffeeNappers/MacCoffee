package com.fourmob.datetimepicker.date;

import android.annotation.TargetApi;
import android.content.Context;
import android.os.Build;
import android.os.Handler;
import android.view.View;
import android.view.ViewConfiguration;
import android.widget.AbsListView;
import android.widget.ListAdapter;
import android.widget.ListView;
import com.fourmob.datetimepicker.date.CalendarDatePickerDialog;
import com.fourmob.datetimepicker.date.SimpleMonthAdapter;
/* loaded from: classes.dex */
public class DayPickerView extends ListView implements AbsListView.OnScrollListener, CalendarDatePickerDialog.OnDateChangedListener {
    public static int LIST_TOP_OFFSET = -1;
    protected SimpleMonthAdapter mAdapter;
    protected Context mContext;
    private final DatePickerController mController;
    protected int mCurrentMonthDisplayed;
    protected int mCurrentScrollState;
    protected int mDaysPerWeek;
    protected float mFriction;
    protected Handler mHandler;
    protected int mNumWeeks;
    private boolean mPerformingScroll;
    protected long mPreviousScrollPosition;
    protected int mPreviousScrollState;
    protected ScrollStateRunnable mScrollStateChangedRunnable;
    protected SimpleMonthAdapter.CalendarDay mSelectedDay;
    protected boolean mShowWeekNumber;
    protected SimpleMonthAdapter.CalendarDay mTempDay;

    public DayPickerView(Context context, DatePickerController datePickerController) {
        super(context);
        this.mCurrentScrollState = 0;
        this.mDaysPerWeek = 7;
        this.mFriction = 1.0f;
        this.mHandler = new Handler();
        this.mNumWeeks = 6;
        this.mPreviousScrollState = 0;
        this.mScrollStateChangedRunnable = new ScrollStateRunnable();
        this.mSelectedDay = new SimpleMonthAdapter.CalendarDay();
        this.mShowWeekNumber = false;
        this.mTempDay = new SimpleMonthAdapter.CalendarDay();
        this.mController = datePickerController;
        this.mController.registerOnDateChangedListener(this);
        setLayoutParams(new AbsListView.LayoutParams(-1, -1));
        setDrawSelectorOnTop(false);
        init(context);
        onDateChanged();
    }

    public int getMostVisiblePosition() {
        int firstVisiblePosition = getFirstVisiblePosition();
        int height = getHeight();
        int maxGap = 0;
        int mostVisiblePosition = 0;
        int childIndex = 0;
        int bottom = 0;
        while (true) {
            View childView = getChildAt(childIndex);
            if (childView != null) {
                if (bottom < height) {
                    bottom = childView.getBottom();
                    int gap = Math.min(bottom, height) - Math.max(0, childView.getTop());
                    if (gap > maxGap) {
                        mostVisiblePosition = childIndex;
                        maxGap = gap;
                    }
                    childIndex++;
                } else {
                    return firstVisiblePosition + mostVisiblePosition;
                }
            } else {
                return firstVisiblePosition + mostVisiblePosition;
            }
        }
    }

    public boolean goTo(SimpleMonthAdapter.CalendarDay calendarDay, boolean scrollToTop, boolean selectDay, boolean displayMonth) {
        if (selectDay) {
            this.mSelectedDay.set(calendarDay);
        }
        this.mTempDay.set(calendarDay);
        int monthIndex = ((calendarDay.year - this.mController.getMinYear()) * 12) + calendarDay.month;
        postSetSelection(monthIndex);
        return true;
    }

    public void init(Context paramContext) {
        this.mContext = paramContext;
        setUpListView();
        setUpAdapter();
        setAdapter((ListAdapter) this.mAdapter);
    }

    @Override // android.widget.ListView, android.widget.AbsListView
    protected void layoutChildren() {
        super.layoutChildren();
        if (this.mPerformingScroll) {
            this.mPerformingScroll = false;
        }
    }

    public void onChange() {
        setUpAdapter();
        setAdapter((ListAdapter) this.mAdapter);
    }

    @Override // com.fourmob.datetimepicker.date.CalendarDatePickerDialog.OnDateChangedListener
    public void onDateChanged() {
        goTo(this.mController.getSelectedDay(), false, true, true);
    }

    @Override // android.widget.AbsListView.OnScrollListener
    public void onScroll(AbsListView absListView, int firstVisibleItem, int visibleItemCount, int totalItemCount) {
        SimpleMonthView simpleMonthView = (SimpleMonthView) absListView.getChildAt(0);
        if (simpleMonthView != null) {
            this.mPreviousScrollPosition = (absListView.getFirstVisiblePosition() * simpleMonthView.getHeight()) - simpleMonthView.getBottom();
            this.mPreviousScrollState = this.mCurrentScrollState;
        }
    }

    @Override // android.widget.AbsListView.OnScrollListener
    public void onScrollStateChanged(AbsListView absListView, int scroll) {
        this.mScrollStateChangedRunnable.doScrollStateChange(absListView, scroll);
    }

    public void postSetSelection(final int position) {
        clearFocus();
        post(new Runnable() { // from class: com.fourmob.datetimepicker.date.DayPickerView.1
            @Override // java.lang.Runnable
            public void run() {
                DayPickerView.this.setSelection(position);
            }
        });
        onScrollStateChanged(this, 0);
    }

    protected void setMonthDisplayed(SimpleMonthAdapter.CalendarDay calendarDay) {
        this.mCurrentMonthDisplayed = calendarDay.month;
        invalidateViews();
    }

    protected void setUpAdapter() {
        if (this.mAdapter == null) {
            this.mAdapter = new SimpleMonthAdapter(getContext(), this.mController);
        }
        this.mAdapter.setSelectedDay(this.mSelectedDay);
        this.mAdapter.setMinDay(this.mController.getMinDay());
        this.mAdapter.setMaxDay(this.mController.getMaxDay());
        this.mAdapter.notifyDataSetChanged();
    }

    protected void setUpListView() {
        setCacheColorHint(0);
        setDivider(null);
        setItemsCanFocus(true);
        setFastScrollEnabled(false);
        setVerticalScrollBarEnabled(false);
        setOnScrollListener(this);
        setFadingEdgeLength(0);
        setFrictionIfSupported(ViewConfiguration.getScrollFriction() * this.mFriction);
    }

    @TargetApi(11)
    void setFrictionIfSupported(float friction) {
        if (Build.VERSION.SDK_INT >= 11) {
            setFriction(friction);
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    /* loaded from: classes.dex */
    public class ScrollStateRunnable implements Runnable {
        private int mNewState;

        protected ScrollStateRunnable() {
        }

        public void doScrollStateChange(AbsListView absListView, int newState) {
            DayPickerView.this.mHandler.removeCallbacks(this);
            this.mNewState = newState;
            DayPickerView.this.mHandler.postDelayed(this, 40L);
        }

        @Override // java.lang.Runnable
        public void run() {
        }
    }
}
