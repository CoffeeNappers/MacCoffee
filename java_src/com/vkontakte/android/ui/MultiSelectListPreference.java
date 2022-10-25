package com.vkontakte.android.ui;

import android.app.AlertDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.res.TypedArray;
import android.preference.ListPreference;
import android.util.AttributeSet;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;
/* loaded from: classes3.dex */
public class MultiSelectListPreference extends ListPreference {
    private static final String DEFAULT_SEPARATOR = ";";
    private boolean[] entryChecked;
    private String separator;

    public MultiSelectListPreference(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        this.entryChecked = new boolean[getEntries().length];
        this.separator = DEFAULT_SEPARATOR;
    }

    public MultiSelectListPreference(Context context) {
        this(context, null);
    }

    @Override // android.preference.ListPreference, android.preference.DialogPreference
    protected void onPrepareDialogBuilder(AlertDialog.Builder builder) {
        CharSequence[] entries = getEntries();
        CharSequence[] entryValues = getEntryValues();
        if (entries == null || entryValues == null || entries.length != entryValues.length) {
            throw new IllegalStateException("MultiSelectListPreference requires an entries array and an entryValues array which are both the same length");
        }
        restoreCheckedEntries();
        DialogInterface.OnMultiChoiceClickListener listener = new DialogInterface.OnMultiChoiceClickListener() { // from class: com.vkontakte.android.ui.MultiSelectListPreference.1
            @Override // android.content.DialogInterface.OnMultiChoiceClickListener
            public void onClick(DialogInterface dialog, int which, boolean val) {
                MultiSelectListPreference.this.entryChecked[which] = val;
            }
        };
        builder.setMultiChoiceItems(entries, this.entryChecked, listener);
    }

    private CharSequence[] unpack(CharSequence val) {
        return (val == null || "".equals(val)) ? new CharSequence[0] : ((String) val).split(this.separator);
    }

    public CharSequence[] getCheckedValues() {
        return unpack(getValue());
    }

    private void restoreCheckedEntries() {
        CharSequence[] entryValues = getEntryValues();
        CharSequence[] vals = unpack(getValue());
        if (vals != null) {
            List<CharSequence> valuesList = Arrays.asList(vals);
            for (int i = 0; i < entryValues.length; i++) {
                CharSequence entry = entryValues[i];
                this.entryChecked[i] = valuesList.contains(entry);
            }
        }
    }

    @Override // android.preference.ListPreference, android.preference.DialogPreference
    protected void onDialogClosed(boolean positiveResult) {
        List<CharSequence> values = new ArrayList<>();
        CharSequence[] entryValues = getEntryValues();
        if (positiveResult && entryValues != null) {
            for (int i = 0; i < entryValues.length; i++) {
                if (this.entryChecked[i]) {
                    String val = (String) entryValues[i];
                    values.add(val);
                }
            }
            String value = join(values, this.separator);
            setSummary(prepareSummary(values));
            setValueAndEvent(value);
        }
    }

    private void setValueAndEvent(String value) {
        if (callChangeListener(unpack(value))) {
            setValue(value);
        }
    }

    private CharSequence prepareSummary(List<CharSequence> joined) {
        List<String> titles = new ArrayList<>();
        CharSequence[] entryTitle = getEntries();
        CharSequence[] entryValues = getEntryValues();
        int ix = 0;
        for (CharSequence value : entryValues) {
            if (joined.contains(value)) {
                titles.add((String) entryTitle[ix]);
            }
            ix++;
        }
        return join(titles, ", ");
    }

    @Override // android.preference.ListPreference, android.preference.Preference
    protected Object onGetDefaultValue(TypedArray typedArray, int index) {
        return typedArray.getTextArray(index);
    }

    @Override // android.preference.ListPreference, android.preference.Preference
    protected void onSetInitialValue(boolean restoreValue, Object rawDefaultValue) {
        CharSequence[] defaultValue;
        String value;
        if (rawDefaultValue == null) {
            defaultValue = new CharSequence[0];
        } else {
            defaultValue = (CharSequence[]) rawDefaultValue;
        }
        List<CharSequence> joined = Arrays.asList(defaultValue);
        String joinedDefaultValue = join(joined, this.separator);
        if (restoreValue) {
            value = getPersistedString(joinedDefaultValue);
        } else {
            value = joinedDefaultValue;
        }
        setSummary(prepareSummary(Arrays.asList(unpack(value))));
        setValueAndEvent(value);
    }

    protected static String join(Iterable<?> iterable, String separator) {
        if (iterable != null) {
            Iterator<?> oIter = iterable.iterator();
            if (oIter.hasNext()) {
                StringBuilder oBuilder = new StringBuilder(String.valueOf(oIter.next()));
                while (oIter.hasNext()) {
                    oBuilder.append(separator).append(oIter.next());
                }
                return oBuilder.toString();
            }
        }
        return "";
    }
}
