package android.support.v7.preference;

import android.content.Context;
import android.support.annotation.NonNull;
import android.support.annotation.RestrictTo;
import android.util.AttributeSet;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.Spinner;
import android.widget.SpinnerAdapter;
/* loaded from: classes.dex */
public class DropDownPreference extends ListPreference {
    private final ArrayAdapter<String> mAdapter;
    private final Context mContext;
    private final AdapterView.OnItemSelectedListener mItemSelectedListener;
    private Spinner mSpinner;

    public DropDownPreference(Context context) {
        this(context, null);
    }

    public DropDownPreference(Context context, AttributeSet attrs) {
        this(context, attrs, R.attr.dropdownPreferenceStyle);
    }

    public DropDownPreference(Context context, AttributeSet attrs, int defStyle) {
        this(context, attrs, defStyle, 0);
    }

    public DropDownPreference(Context context, AttributeSet attrs, int defStyleAttr, int defStyleRes) {
        super(context, attrs, defStyleAttr, defStyleRes);
        this.mItemSelectedListener = new AdapterView.OnItemSelectedListener() { // from class: android.support.v7.preference.DropDownPreference.1
            @Override // android.widget.AdapterView.OnItemSelectedListener
            public void onItemSelected(AdapterView<?> parent, View v, int position, long id) {
                if (position >= 0) {
                    String value = DropDownPreference.this.getEntryValues()[position].toString();
                    if (!value.equals(DropDownPreference.this.getValue()) && DropDownPreference.this.callChangeListener(value)) {
                        DropDownPreference.this.setValue(value);
                    }
                }
            }

            @Override // android.widget.AdapterView.OnItemSelectedListener
            public void onNothingSelected(AdapterView<?> parent) {
            }
        };
        this.mContext = context;
        this.mAdapter = createAdapter();
        updateEntries();
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // android.support.v7.preference.DialogPreference, android.support.v7.preference.Preference
    public void onClick() {
        this.mSpinner.performClick();
    }

    @Override // android.support.v7.preference.ListPreference
    public void setEntries(@NonNull CharSequence[] entries) {
        super.setEntries(entries);
        updateEntries();
    }

    protected ArrayAdapter createAdapter() {
        return new ArrayAdapter(this.mContext, 17367049);
    }

    private void updateEntries() {
        CharSequence[] entries;
        this.mAdapter.clear();
        if (getEntries() != null) {
            for (CharSequence c : getEntries()) {
                this.mAdapter.add(c.toString());
            }
        }
    }

    @Override // android.support.v7.preference.ListPreference
    public void setValueIndex(int index) {
        setValue(getEntryValues()[index].toString());
    }

    @RestrictTo({RestrictTo.Scope.LIBRARY_GROUP})
    public int findSpinnerIndexOfValue(String value) {
        CharSequence[] entryValues = getEntryValues();
        if (value != null && entryValues != null) {
            for (int i = entryValues.length - 1; i >= 0; i--) {
                if (entryValues[i].equals(value)) {
                    return i;
                }
            }
        }
        return -1;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // android.support.v7.preference.Preference
    public void notifyChanged() {
        super.notifyChanged();
        this.mAdapter.notifyDataSetChanged();
    }

    @Override // android.support.v7.preference.Preference
    public void onBindViewHolder(PreferenceViewHolder view) {
        this.mSpinner = (Spinner) view.itemView.findViewById(R.id.spinner);
        this.mSpinner.setAdapter((SpinnerAdapter) this.mAdapter);
        this.mSpinner.setOnItemSelectedListener(this.mItemSelectedListener);
        this.mSpinner.setSelection(findSpinnerIndexOfValue(getValue()));
        super.onBindViewHolder(view);
    }
}
