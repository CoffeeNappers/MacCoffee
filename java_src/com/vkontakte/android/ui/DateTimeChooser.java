package com.vkontakte.android.ui;

import android.app.Activity;
import android.view.View;
import android.widget.Toast;
import com.fourmob.datetimepicker.date.CalendarDatePickerDialog;
import com.fourmob.datetimepicker.time.RadialPickerLayout;
import com.fourmob.datetimepicker.time.RadialTimePickerDialog;
import com.vkontakte.android.R;
import com.vkontakte.android.TimeUtils;
import java.util.Calendar;
/* loaded from: classes3.dex */
public class DateTimeChooser {
    private Activity act;
    private Calendar date = Calendar.getInstance();
    private android.widget.TextView dateButton;
    private OnSelectedListener listener;
    private android.widget.TextView timeButton;

    /* loaded from: classes3.dex */
    public interface OnSelectedListener {
        void onDateSelected(Calendar calendar);
    }

    public DateTimeChooser(android.widget.TextView _date, android.widget.TextView _time, Activity activity) {
        this.dateButton = _date;
        this.timeButton = _time;
        this.act = activity;
        this.timeButton.setOnClickListener(new View.OnClickListener() { // from class: com.vkontakte.android.ui.DateTimeChooser.1
            @Override // android.view.View.OnClickListener
            public void onClick(View v) {
                RadialTimePickerDialog dlg = RadialTimePickerDialog.newInstance(new RadialTimePickerDialog.OnTimeSetListener() { // from class: com.vkontakte.android.ui.DateTimeChooser.1.1
                    @Override // com.fourmob.datetimepicker.time.RadialTimePickerDialog.OnTimeSetListener
                    public void onTimeSet(RadialPickerLayout view, int hourOfDay, int minute) {
                        DateTimeChooser.this.date.set(11, hourOfDay);
                        DateTimeChooser.this.date.set(12, minute);
                        DateTimeChooser.this.updateTimer();
                    }
                }, DateTimeChooser.this.date.get(11), DateTimeChooser.this.date.get(12), true);
                dlg.show(DateTimeChooser.this.act.getFragmentManager(), "timepicker");
                dlg.setDoneButtonText(DateTimeChooser.this.act.getString(R.string.done));
            }
        });
        this.dateButton.setOnClickListener(new View.OnClickListener() { // from class: com.vkontakte.android.ui.DateTimeChooser.2
            @Override // android.view.View.OnClickListener
            public void onClick(View v) {
                Calendar.getInstance();
                CalendarDatePickerDialog dlg = CalendarDatePickerDialog.newInstance(new CalendarDatePickerDialog.OnDateSetListener() { // from class: com.vkontakte.android.ui.DateTimeChooser.2.1
                    @Override // com.fourmob.datetimepicker.date.CalendarDatePickerDialog.OnDateSetListener
                    public void onDateSet(CalendarDatePickerDialog view, int year, int monthOfYear, int dayOfMonth) {
                        Calendar c = Calendar.getInstance();
                        c.set(year, monthOfYear, dayOfMonth);
                        if (c.getTimeInMillis() < System.currentTimeMillis() - 1000 || c.getTimeInMillis() > System.currentTimeMillis() + TimeUtils.YEAR) {
                            Toast.makeText(DateTimeChooser.this.act, (int) R.string.invalid_date, 0).show();
                            return;
                        }
                        DateTimeChooser.this.date.set(year, monthOfYear, dayOfMonth);
                        DateTimeChooser.this.updateTimer();
                    }
                }, DateTimeChooser.this.date.get(1), DateTimeChooser.this.date.get(2), DateTimeChooser.this.date.get(5));
                dlg.show(DateTimeChooser.this.act.getFragmentManager(), "datepicker");
                dlg.setDoneButtonText(DateTimeChooser.this.act.getString(R.string.done));
            }
        });
    }

    public void setDate(int unixtime) {
        this.date.setTimeInMillis(unixtime * 1000);
        updateTimer();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void updateTimer() {
        int date = (int) (this.date.getTimeInMillis() / 1000);
        this.dateButton.setText(TimeUtils.langDateDay(date));
        this.timeButton.setText(String.format("%d:%02d", Integer.valueOf(this.date.get(11)), Integer.valueOf(this.date.get(12))));
    }

    public Calendar getDate() {
        return this.date;
    }
}
