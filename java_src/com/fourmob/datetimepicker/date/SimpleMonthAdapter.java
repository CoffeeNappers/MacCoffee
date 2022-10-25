package com.fourmob.datetimepicker.date;

import android.content.Context;
import android.util.Log;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AbsListView;
import android.widget.BaseAdapter;
import com.fourmob.datetimepicker.date.SimpleMonthView;
import java.util.Calendar;
import java.util.HashMap;
/* loaded from: classes.dex */
public class SimpleMonthAdapter extends BaseAdapter implements SimpleMonthView.OnDayClickListener {
    protected static int WEEK_7_OVERHANG_HEIGHT = 7;
    private final Context mContext;
    private final DatePickerController mController;
    private CalendarDay mSelectedDay;
    private int minDay = -1;
    private int maxDay = -1;

    public SimpleMonthAdapter(Context context, DatePickerController datePickerController) {
        this.mContext = context;
        this.mController = datePickerController;
        init();
        setSelectedDay(this.mController.getSelectedDay());
    }

    private boolean isSelectedDayInMonth(int year, int month) {
        return this.mSelectedDay.year == year && this.mSelectedDay.month == month;
    }

    @Override // android.widget.Adapter
    public int getCount() {
        return ((this.mController.getMaxYear() - this.mController.getMinYear()) + 1) * 12;
    }

    @Override // android.widget.Adapter
    public Object getItem(int position) {
        return null;
    }

    @Override // android.widget.Adapter
    public long getItemId(int position) {
        return position;
    }

    @Override // android.widget.Adapter
    public View getView(int position, View convertView, ViewGroup parent) {
        SimpleMonthView simpleMonthView;
        if (convertView != null) {
            simpleMonthView = (SimpleMonthView) convertView;
        } else {
            simpleMonthView = new SimpleMonthView(this.mContext);
            simpleMonthView.setLayoutParams(new AbsListView.LayoutParams(-1, -1));
            simpleMonthView.setClickable(true);
            simpleMonthView.setOnDayClickListener(this);
        }
        HashMap<String, Integer> monthParams = (HashMap) simpleMonthView.getTag();
        if (monthParams == null) {
            monthParams = new HashMap<>();
        }
        monthParams.clear();
        int month = position % 12;
        int year = (position / 12) + this.mController.getMinYear();
        Log.d("SimpleMonthAdapter", "Year: " + year + ", Month: " + month);
        int selectedDay = -1;
        if (isSelectedDayInMonth(year, month)) {
            selectedDay = this.mSelectedDay.day;
        }
        simpleMonthView.reuse();
        monthParams.put("selected_day", Integer.valueOf(selectedDay));
        monthParams.put("year", Integer.valueOf(year));
        monthParams.put("month", Integer.valueOf(month));
        monthParams.put("week_start", Integer.valueOf(this.mController.getFirstDayOfWeek()));
        monthParams.put("min_day", Integer.valueOf(this.minDay));
        monthParams.put("max_day", Integer.valueOf(this.maxDay));
        simpleMonthView.setMonthParams(monthParams);
        simpleMonthView.invalidate();
        return simpleMonthView;
    }

    protected void init() {
        this.mSelectedDay = new CalendarDay(System.currentTimeMillis());
    }

    @Override // com.fourmob.datetimepicker.date.SimpleMonthView.OnDayClickListener
    public void onDayClick(SimpleMonthView simpleMonthView, CalendarDay calendarDay) {
        if (calendarDay != null) {
            onDayTapped(calendarDay);
        }
    }

    protected void onDayTapped(CalendarDay calendarDay) {
        this.mController.tryVibrate();
        this.mController.onDayOfMonthSelected(calendarDay.year, calendarDay.month, calendarDay.day);
        setSelectedDay(calendarDay);
    }

    public void setSelectedDay(CalendarDay calendarDay) {
        this.mSelectedDay = calendarDay;
        notifyDataSetChanged();
    }

    public void setMinDay(int day) {
        this.minDay = day;
    }

    public void setMaxDay(int day) {
        this.maxDay = day;
    }

    /* loaded from: classes.dex */
    public static class CalendarDay {
        private Calendar calendar;
        int day;
        int month;
        int year;

        public CalendarDay() {
            setTime(System.currentTimeMillis());
        }

        public CalendarDay(int year, int month, int day) {
            setDay(year, month, day);
        }

        public CalendarDay(long timeInMillis) {
            setTime(timeInMillis);
        }

        public CalendarDay(Calendar calendar) {
            this.year = calendar.get(1);
            this.month = calendar.get(2);
            this.day = calendar.get(5);
        }

        private void setTime(long timeInMillis) {
            if (this.calendar == null) {
                this.calendar = Calendar.getInstance();
            }
            this.calendar.setTimeInMillis(timeInMillis);
            this.month = this.calendar.get(2);
            this.year = this.calendar.get(1);
            this.day = this.calendar.get(5);
        }

        public void set(CalendarDay calendarDay) {
            this.year = calendarDay.year;
            this.month = calendarDay.month;
            this.day = calendarDay.day;
        }

        public void setDay(int year, int month, int day) {
            this.year = year;
            this.month = month;
            this.day = day;
        }
    }
}
