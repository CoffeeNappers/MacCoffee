package com.vkontakte.android.fragments;

import android.app.AlertDialog;
import android.app.Dialog;
import android.app.DialogFragment;
import android.content.DialogInterface;
import android.os.Bundle;
import android.view.View;
import android.widget.TextView;
import android.widget.Toast;
import com.fourmob.datetimepicker.date.CalendarDatePickerDialog;
import com.fourmob.datetimepicker.time.RadialPickerLayout;
import com.fourmob.datetimepicker.time.RadialTimePickerDialog;
import com.vkontakte.android.R;
import com.vkontakte.android.TimeUtils;
import com.vkontakte.android.VKAlertDialog;
import com.vkontakte.android.data.ServerKeys;
import java.util.Calendar;
/* loaded from: classes2.dex */
public class DateTimePickerDialogFragment extends DialogFragment {
    private Calendar date;
    private OnSelectedListener listener;
    private View view;

    /* loaded from: classes2.dex */
    public interface OnSelectedListener {
        void onDateSelected(Calendar calendar);
    }

    @Override // android.app.DialogFragment, android.app.Fragment
    public void onCreate(Bundle b) {
        super.onCreate(b);
        this.date = TimeUtils.getCalendar();
        if (getArguments() == null) {
            this.date.add(11, 4);
            this.date.set(13, 0);
            this.date.set(14, 0);
            this.date.set(12, Math.round(this.date.get(12) / 5.0f) * 5);
        } else {
            this.date.setTimeInMillis(getArguments().getLong(ServerKeys.DATE));
        }
        updateTimer();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void updateTimer() {
        if (this.view != null) {
            int date = (int) (this.date.getTimeInMillis() / 1000);
            ((TextView) this.view.findViewById(R.id.btn_date)).setText(TimeUtils.langDateDay(date));
            ((TextView) this.view.findViewById(R.id.btn_time)).setText(String.format("%d:%02d", Integer.valueOf(this.date.get(11)), Integer.valueOf(this.date.get(12))));
        }
    }

    public void setOnSelectedListener(OnSelectedListener l) {
        this.listener = l;
    }

    @Override // android.app.DialogFragment
    public Dialog onCreateDialog(Bundle savedInstanceState) {
        AlertDialog.Builder adb = new VKAlertDialog.Builder(getActivity()).setTitle(R.string.publish_date).setPositiveButton(R.string.ok, new DialogInterface.OnClickListener() { // from class: com.vkontakte.android.fragments.DateTimePickerDialogFragment.1
            @Override // android.content.DialogInterface.OnClickListener
            public void onClick(DialogInterface dialog, int which) {
                if (DateTimePickerDialogFragment.this.listener != null) {
                    DateTimePickerDialogFragment.this.listener.onDateSelected(DateTimePickerDialogFragment.this.date);
                }
            }
        }).setNegativeButton(R.string.cancel, (DialogInterface.OnClickListener) null);
        if (getArguments() != null) {
            adb.setNeutralButton(R.string.reset, new DialogInterface.OnClickListener() { // from class: com.vkontakte.android.fragments.DateTimePickerDialogFragment.2
                @Override // android.content.DialogInterface.OnClickListener
                public void onClick(DialogInterface dialog, int which) {
                    if (DateTimePickerDialogFragment.this.listener != null) {
                        DateTimePickerDialogFragment.this.listener.onDateSelected(null);
                    }
                }
            });
        }
        this.view = View.inflate(getActivity(), R.layout.date_time_picker, null);
        this.view.findViewById(R.id.btn_time).setOnClickListener(new View.OnClickListener() { // from class: com.vkontakte.android.fragments.DateTimePickerDialogFragment.3
            @Override // android.view.View.OnClickListener
            public void onClick(View v) {
                RadialTimePickerDialog dlg = RadialTimePickerDialog.newInstance(new RadialTimePickerDialog.OnTimeSetListener() { // from class: com.vkontakte.android.fragments.DateTimePickerDialogFragment.3.1
                    @Override // com.fourmob.datetimepicker.time.RadialTimePickerDialog.OnTimeSetListener
                    public void onTimeSet(RadialPickerLayout view, int hourOfDay, int minute) {
                        DateTimePickerDialogFragment.this.date.set(11, hourOfDay);
                        DateTimePickerDialogFragment.this.date.set(12, Math.round(minute / 5.0f) * 5);
                        DateTimePickerDialogFragment.this.updateTimer();
                    }
                }, DateTimePickerDialogFragment.this.date.get(11), DateTimePickerDialogFragment.this.date.get(12), true);
                dlg.show(DateTimePickerDialogFragment.this.getActivity().getFragmentManager(), "timepicker");
                dlg.setDoneButtonText(DateTimePickerDialogFragment.this.getString(R.string.done));
            }
        });
        this.view.findViewById(R.id.btn_date).setOnClickListener(new View.OnClickListener() { // from class: com.vkontakte.android.fragments.DateTimePickerDialogFragment.4
            @Override // android.view.View.OnClickListener
            public void onClick(View v) {
                Calendar now = Calendar.getInstance();
                CalendarDatePickerDialog dlg = CalendarDatePickerDialog.newInstance(new CalendarDatePickerDialog.OnDateSetListener() { // from class: com.vkontakte.android.fragments.DateTimePickerDialogFragment.4.1
                    @Override // com.fourmob.datetimepicker.date.CalendarDatePickerDialog.OnDateSetListener
                    public void onDateSet(CalendarDatePickerDialog view, int year, int monthOfYear, int dayOfMonth) {
                        Calendar c = Calendar.getInstance();
                        c.set(year, monthOfYear, dayOfMonth);
                        if (c.getTimeInMillis() >= System.currentTimeMillis() - 1000 && c.getTimeInMillis() <= System.currentTimeMillis() + TimeUtils.YEAR) {
                            DateTimePickerDialogFragment.this.date.set(year, monthOfYear, dayOfMonth);
                            DateTimePickerDialogFragment.this.updateTimer();
                            return;
                        }
                        Toast.makeText(DateTimePickerDialogFragment.this.getActivity(), (int) R.string.invalid_date, 0).show();
                    }
                }, DateTimePickerDialogFragment.this.date.get(1), DateTimePickerDialogFragment.this.date.get(2), DateTimePickerDialogFragment.this.date.get(5));
                dlg.setMinDay(now.get(5), now.get(2), now.get(1));
                dlg.setMaxDay(now.get(5), now.get(2), now.get(1) + 1);
                dlg.show(DateTimePickerDialogFragment.this.getActivity().getFragmentManager(), "datepicker");
                dlg.setDoneButtonText(DateTimePickerDialogFragment.this.getString(R.string.done));
            }
        });
        updateTimer();
        adb.setView(this.view);
        return adb.create();
    }
}
