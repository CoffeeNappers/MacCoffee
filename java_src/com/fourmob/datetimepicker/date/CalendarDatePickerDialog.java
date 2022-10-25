package com.fourmob.datetimepicker.date;

import android.animation.ObjectAnimator;
import android.app.Activity;
import android.app.DialogFragment;
import android.content.res.Resources;
import android.os.Bundle;
import android.os.SystemClock;
import android.os.Vibrator;
import android.text.format.DateUtils;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.animation.AlphaAnimation;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.TextView;
import android.widget.ViewAnimator;
import com.fourmob.datetimepicker.R;
import com.fourmob.datetimepicker.Utils;
import com.fourmob.datetimepicker.date.SimpleMonthAdapter;
import java.text.DateFormatSymbols;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Locale;
/* loaded from: classes.dex */
public class CalendarDatePickerDialog extends DialogFragment implements View.OnClickListener, DatePickerController {
    private static final int MAX_YEAR = 2037;
    private static final int MIN_YEAR = 1902;
    private static final int VIEW_DATE_PICKER_MONTH_DAY = 0;
    private static final int VIEW_DATE_PICKER_YEAR = 1;
    private String doneButtonText;
    private ViewAnimator mAnimator;
    private OnDateSetListener mCallBack;
    private TextView mDayOfWeekView;
    private String mDayPickerDescription;
    private DayPickerView mDayPickerView;
    private Button mDoneButton;
    private long mLastVibrate;
    private LinearLayout mMonthAndDayView;
    private String mSelectDay;
    private String mSelectYear;
    private TextView mSelectedDayTextView;
    private TextView mSelectedMonthTextView;
    private Vibrator mVibrator;
    private String mYearPickerDescription;
    private YearPickerView mYearPickerView;
    private TextView mYearView;
    private int maxDay;
    private int minDay;
    private static SimpleDateFormat DAY_FORMAT = new SimpleDateFormat("dd", Locale.getDefault());
    private static SimpleDateFormat YEAR_FORMAT = new SimpleDateFormat("yyyy", Locale.getDefault());
    private final Calendar mCalendar = Calendar.getInstance();
    private int mCurrentView = -1;
    private boolean mDelayAnimation = true;
    private HashSet<OnDateChangedListener> mListeners = new HashSet<>();
    private int mMaxYear = MAX_YEAR;
    private int mMinYear = MIN_YEAR;
    private int mWeekStart = this.mCalendar.getFirstDayOfWeek();
    private DateFormatSymbols dateformartsymbols = new DateFormatSymbols();
    private boolean mVibrate = true;

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes.dex */
    public interface OnDateChangedListener {
        void onDateChanged();
    }

    /* loaded from: classes.dex */
    public interface OnDateSetListener {
        void onDateSet(CalendarDatePickerDialog calendarDatePickerDialog, int i, int i2, int i3);
    }

    private void adjustDayInMonthIfNeeded(int month, int year) {
        int currentDay = this.mCalendar.get(5);
        int day = Utils.getDaysInMonth(month, year);
        if (currentDay > day) {
            this.mCalendar.set(5, day);
        }
    }

    public static CalendarDatePickerDialog newInstance(OnDateSetListener onDateSetListener, int year, int month, int day) {
        return newInstance(onDateSetListener, year, month, day, true);
    }

    public static CalendarDatePickerDialog newInstance(OnDateSetListener onDateSetListener, int year, int month, int day, boolean vibrate) {
        CalendarDatePickerDialog datePickerDialog = new CalendarDatePickerDialog();
        datePickerDialog.initialize(onDateSetListener, year, month, day, vibrate);
        return datePickerDialog;
    }

    public void setVibrate(boolean vibrate) {
        this.mVibrate = vibrate;
    }

    private void setCurrentView(int currentView) {
        setCurrentView(currentView, false);
    }

    private void setCurrentView(int currentView, boolean forceRefresh) {
        long timeInMillis = this.mCalendar.getTimeInMillis();
        switch (currentView) {
            case 0:
                ObjectAnimator monthDayAnim = Utils.getPulseAnimator(this.mMonthAndDayView, 0.9f, 1.05f);
                if (this.mDelayAnimation) {
                    monthDayAnim.setStartDelay(500L);
                    this.mDelayAnimation = false;
                }
                this.mDayPickerView.onDateChanged();
                if (this.mCurrentView != currentView || forceRefresh) {
                    this.mMonthAndDayView.setSelected(true);
                    this.mYearView.setSelected(false);
                    this.mAnimator.setDisplayedChild(0);
                    this.mCurrentView = currentView;
                }
                monthDayAnim.start();
                String monthDayDesc = DateUtils.formatDateTime(getActivity(), timeInMillis, 16);
                this.mAnimator.setContentDescription(this.mDayPickerDescription + ": " + monthDayDesc);
                return;
            case 1:
                ObjectAnimator yearAnim = Utils.getPulseAnimator(this.mYearView, 0.85f, 1.1f);
                if (this.mDelayAnimation) {
                    yearAnim.setStartDelay(500L);
                    this.mDelayAnimation = false;
                }
                this.mYearPickerView.onDateChanged();
                if (this.mCurrentView != currentView || forceRefresh) {
                    this.mMonthAndDayView.setSelected(false);
                    this.mYearView.setSelected(true);
                    this.mAnimator.setDisplayedChild(1);
                    this.mCurrentView = currentView;
                }
                yearAnim.start();
                String dayDesc = YEAR_FORMAT.format(Long.valueOf(timeInMillis));
                this.mAnimator.setContentDescription(this.mYearPickerDescription + ": " + dayDesc);
                return;
            default:
                return;
        }
    }

    private void updateDisplay() {
        if (this.mDayOfWeekView != null) {
            this.mCalendar.setFirstDayOfWeek(this.mWeekStart);
            this.mDayOfWeekView.setText(this.dateformartsymbols.getWeekdays()[this.mCalendar.get(7)].toUpperCase(Locale.getDefault()));
        }
        this.mSelectedMonthTextView.setText(this.dateformartsymbols.getMonths()[this.mCalendar.get(2)].toUpperCase(Locale.getDefault()));
        this.mSelectedDayTextView.setText(DAY_FORMAT.format(this.mCalendar.getTime()));
        this.mYearView.setText(YEAR_FORMAT.format(this.mCalendar.getTime()));
        long timeInMillis = this.mCalendar.getTimeInMillis();
        String desc = DateUtils.formatDateTime(getActivity(), timeInMillis, 24);
        this.mMonthAndDayView.setContentDescription(desc);
    }

    private void updatePickers() {
        Iterator<OnDateChangedListener> it = this.mListeners.iterator();
        while (it.hasNext()) {
            it.next().onDateChanged();
        }
    }

    @Override // com.fourmob.datetimepicker.date.DatePickerController
    public int getFirstDayOfWeek() {
        return this.mWeekStart;
    }

    @Override // com.fourmob.datetimepicker.date.DatePickerController
    public int getMaxYear() {
        return this.mMaxYear;
    }

    @Override // com.fourmob.datetimepicker.date.DatePickerController
    public int getMinYear() {
        return this.mMinYear;
    }

    @Override // com.fourmob.datetimepicker.date.DatePickerController
    public SimpleMonthAdapter.CalendarDay getSelectedDay() {
        return new SimpleMonthAdapter.CalendarDay(this.mCalendar);
    }

    public void initialize(OnDateSetListener onDateSetListener, int year, int month, int day, boolean vibrate) {
        if (year > MAX_YEAR) {
            throw new IllegalArgumentException("year end must < 2037");
        }
        if (year < MIN_YEAR) {
            throw new IllegalArgumentException("year end must > 1902");
        }
        this.mCallBack = onDateSetListener;
        this.mCalendar.set(1, year);
        this.mCalendar.set(2, month);
        this.mCalendar.set(5, day);
        this.mVibrate = vibrate;
    }

    @Override // android.view.View.OnClickListener
    public void onClick(View view) {
        tryVibrate();
        if (view.getId() == R.id.date_picker_year) {
            setCurrentView(1);
        } else if (view.getId() == R.id.date_picker_month_and_day) {
            setCurrentView(0);
        }
    }

    @Override // android.app.DialogFragment, android.app.Fragment
    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        Activity activity = getActivity();
        activity.getWindow().setSoftInputMode(3);
        this.mVibrator = (Vibrator) activity.getSystemService("vibrator");
        if (bundle != null) {
            this.mCalendar.set(1, bundle.getInt("year"));
            this.mCalendar.set(2, bundle.getInt("month"));
            this.mCalendar.set(5, bundle.getInt("day"));
            this.mVibrate = bundle.getBoolean("vibrate");
        }
    }

    @Override // android.app.Fragment
    public View onCreateView(LayoutInflater layoutInflater, ViewGroup parent, Bundle bundle) {
        Log.d("DatePickerDialog", "onCreateView: ");
        getDialog().getWindow().requestFeature(1);
        View view = layoutInflater.inflate(R.layout.date_picker_dialog, (ViewGroup) null);
        this.mDayOfWeekView = (TextView) view.findViewById(R.id.date_picker_header);
        this.mMonthAndDayView = (LinearLayout) view.findViewById(R.id.date_picker_month_and_day);
        this.mMonthAndDayView.setOnClickListener(this);
        this.mSelectedMonthTextView = (TextView) view.findViewById(R.id.date_picker_month);
        this.mSelectedDayTextView = (TextView) view.findViewById(R.id.date_picker_day);
        this.mYearView = (TextView) view.findViewById(R.id.date_picker_year);
        this.mYearView.setOnClickListener(this);
        int listPosition = -1;
        int currentView = 0;
        int listPositionOffset = 0;
        if (bundle != null) {
            this.mWeekStart = bundle.getInt("week_start");
            this.mMinYear = bundle.getInt("year_start");
            this.mMaxYear = bundle.getInt("year_end");
            currentView = bundle.getInt("current_view");
            listPosition = bundle.getInt("list_position");
            listPositionOffset = bundle.getInt("list_position_offset");
        }
        Activity activity = getActivity();
        this.mDayPickerView = new DayPickerView(activity, this);
        this.mYearPickerView = new YearPickerView(activity, this);
        Resources resources = getResources();
        this.mDayPickerDescription = resources.getString(R.string.day_picker_description);
        this.mSelectDay = resources.getString(R.string.select_day);
        this.mYearPickerDescription = resources.getString(R.string.year_picker_description);
        this.mSelectYear = resources.getString(R.string.select_year);
        this.mAnimator = (ViewAnimator) view.findViewById(R.id.animator);
        this.mAnimator.addView(this.mDayPickerView);
        this.mAnimator.addView(this.mYearPickerView);
        AlphaAnimation inAlphaAnimation = new AlphaAnimation(0.0f, 1.0f);
        inAlphaAnimation.setDuration(300L);
        this.mAnimator.setInAnimation(inAlphaAnimation);
        AlphaAnimation outAlphaAnimation = new AlphaAnimation(1.0f, 0.0f);
        outAlphaAnimation.setDuration(300L);
        this.mAnimator.setOutAnimation(outAlphaAnimation);
        this.mDoneButton = (Button) view.findViewById(R.id.done);
        this.mDoneButton.setOnClickListener(new View.OnClickListener() { // from class: com.fourmob.datetimepicker.date.CalendarDatePickerDialog.1
            @Override // android.view.View.OnClickListener
            public void onClick(View view2) {
                CalendarDatePickerDialog.this.tryVibrate();
                if (CalendarDatePickerDialog.this.mCallBack != null) {
                    CalendarDatePickerDialog.this.mCallBack.onDateSet(CalendarDatePickerDialog.this, CalendarDatePickerDialog.this.mCalendar.get(1), CalendarDatePickerDialog.this.mCalendar.get(2), CalendarDatePickerDialog.this.mCalendar.get(5));
                }
                CalendarDatePickerDialog.this.dismiss();
            }
        });
        if (this.doneButtonText != null) {
            this.mDoneButton.setText(this.doneButtonText);
        }
        updateDisplay();
        setCurrentView(currentView, true);
        if (listPosition != -1) {
            if (currentView == 0) {
                this.mDayPickerView.postSetSelection(listPosition);
            }
            if (currentView == 1) {
                this.mYearPickerView.postSetSelectionFromTop(listPosition, listPositionOffset);
            }
        }
        return view;
    }

    public void setDoneButtonText(String text) {
        this.doneButtonText = text;
        if (this.mDoneButton != null) {
            this.mDoneButton.setText(text);
        }
    }

    @Override // com.fourmob.datetimepicker.date.DatePickerController
    public void onDayOfMonthSelected(int year, int month, int day) {
        this.mCalendar.set(1, year);
        this.mCalendar.set(2, month);
        this.mCalendar.set(5, day);
        updatePickers();
        updateDisplay();
    }

    @Override // android.app.DialogFragment, android.app.Fragment
    public void onSaveInstanceState(Bundle bundle) {
        super.onSaveInstanceState(bundle);
        bundle.putInt("year", this.mCalendar.get(1));
        bundle.putInt("month", this.mCalendar.get(2));
        bundle.putInt("day", this.mCalendar.get(5));
        bundle.putInt("week_start", this.mWeekStart);
        bundle.putInt("year_start", this.mMinYear);
        bundle.putInt("year_end", this.mMaxYear);
        bundle.putInt("current_view", this.mCurrentView);
        int mostVisiblePosition = -1;
        if (this.mCurrentView == 0) {
            mostVisiblePosition = this.mDayPickerView.getMostVisiblePosition();
        }
        bundle.putInt("list_position", mostVisiblePosition);
        if (this.mCurrentView == 1) {
            this.mYearPickerView.getFirstVisiblePosition();
            bundle.putInt("list_position_offset", this.mYearPickerView.getFirstPositionOffset());
        }
        bundle.putBoolean("vibrate", this.mVibrate);
    }

    @Override // com.fourmob.datetimepicker.date.DatePickerController
    public void onYearSelected(int year) {
        adjustDayInMonthIfNeeded(this.mCalendar.get(2), year);
        this.mCalendar.set(1, year);
        updatePickers();
        setCurrentView(0);
        updateDisplay();
    }

    @Override // com.fourmob.datetimepicker.date.DatePickerController
    public void registerOnDateChangedListener(OnDateChangedListener onDateChangedListener) {
        this.mListeners.add(onDateChangedListener);
    }

    public void setFirstDayOfWeek(int weekStart) {
        if (weekStart < 1 || weekStart > 7) {
            throw new IllegalArgumentException("Value must be between Calendar.SUNDAY and Calendar.SATURDAY");
        }
        this.mWeekStart = weekStart;
        if (this.mDayPickerView != null) {
            this.mDayPickerView.onChange();
        }
    }

    public void setOnDateSetListener(OnDateSetListener onDateSetListener) {
        this.mCallBack = onDateSetListener;
    }

    public void setYearRange(int minYear, int maxYear) {
        if (maxYear <= minYear) {
            throw new IllegalArgumentException("Year end must be larger than year start");
        }
        if (maxYear > MAX_YEAR) {
            throw new IllegalArgumentException("max year end must < 2037");
        }
        if (minYear < MIN_YEAR) {
            throw new IllegalArgumentException("min year end must > 1902");
        }
        this.mMinYear = minYear;
        this.mMaxYear = maxYear;
        if (this.mDayPickerView != null) {
            this.mDayPickerView.onChange();
        }
    }

    @Override // com.fourmob.datetimepicker.date.DatePickerController
    public void tryVibrate() {
        if (this.mVibrator != null && this.mVibrate) {
            long timeInMillis = SystemClock.uptimeMillis();
            if (timeInMillis - this.mLastVibrate >= 125) {
                this.mVibrator.vibrate(5L);
                this.mLastVibrate = timeInMillis;
            }
        }
    }

    @Override // com.fourmob.datetimepicker.date.DatePickerController
    public int getMinDay() {
        return this.minDay;
    }

    @Override // com.fourmob.datetimepicker.date.DatePickerController
    public int getMaxDay() {
        return this.maxDay;
    }

    public void setMinDay(int d, int m, int y) {
        if (y == 0) {
            this.minDay = -1;
        } else {
            this.minDay = (m * 10) + d + (y * 10000);
        }
        Log.i("vk", "min day " + this.minDay);
    }

    public void setMaxDay(int d, int m, int y) {
        if (y == 0) {
            this.maxDay = -1;
        } else {
            this.maxDay = (m * 10) + d + (y * 10000);
        }
    }
}
