package com.fourmob.datetimepicker.date;

import com.fourmob.datetimepicker.date.CalendarDatePickerDialog;
import com.fourmob.datetimepicker.date.SimpleMonthAdapter;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public interface DatePickerController {
    int getFirstDayOfWeek();

    int getMaxDay();

    int getMaxYear();

    int getMinDay();

    int getMinYear();

    SimpleMonthAdapter.CalendarDay getSelectedDay();

    void onDayOfMonthSelected(int i, int i2, int i3);

    void onYearSelected(int i);

    void registerOnDateChangedListener(CalendarDatePickerDialog.OnDateChangedListener onDateChangedListener);

    void tryVibrate();
}
