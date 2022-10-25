package android.support.v14.preference;

import android.app.AlertDialog;
import android.content.DialogInterface;
import android.os.Bundle;
import android.support.annotation.NonNull;
import android.support.v7.preference.ListPreference;
/* loaded from: classes.dex */
public class ListPreferenceDialogFragment extends PreferenceDialogFragment {
    private static final String SAVE_STATE_ENTRIES = "ListPreferenceDialogFragment.entries";
    private static final String SAVE_STATE_ENTRY_VALUES = "ListPreferenceDialogFragment.entryValues";
    private static final String SAVE_STATE_INDEX = "ListPreferenceDialogFragment.index";
    private int mClickedDialogEntryIndex;
    private CharSequence[] mEntries;
    private CharSequence[] mEntryValues;

    public static ListPreferenceDialogFragment newInstance(String key) {
        ListPreferenceDialogFragment fragment = new ListPreferenceDialogFragment();
        Bundle b = new Bundle(1);
        b.putString("key", key);
        fragment.setArguments(b);
        return fragment;
    }

    @Override // android.support.v14.preference.PreferenceDialogFragment, android.app.DialogFragment, android.app.Fragment
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        if (savedInstanceState == null) {
            ListPreference preference = getListPreference();
            if (preference.getEntries() == null || preference.getEntryValues() == null) {
                throw new IllegalStateException("ListPreference requires an entries array and an entryValues array.");
            }
            this.mClickedDialogEntryIndex = preference.findIndexOfValue(preference.getValue());
            this.mEntries = preference.getEntries();
            this.mEntryValues = preference.getEntryValues();
            return;
        }
        this.mClickedDialogEntryIndex = savedInstanceState.getInt(SAVE_STATE_INDEX, 0);
        this.mEntries = savedInstanceState.getCharSequenceArray(SAVE_STATE_ENTRIES);
        this.mEntryValues = savedInstanceState.getCharSequenceArray(SAVE_STATE_ENTRY_VALUES);
    }

    @Override // android.support.v14.preference.PreferenceDialogFragment, android.app.DialogFragment, android.app.Fragment
    public void onSaveInstanceState(@NonNull Bundle outState) {
        super.onSaveInstanceState(outState);
        outState.putInt(SAVE_STATE_INDEX, this.mClickedDialogEntryIndex);
        outState.putCharSequenceArray(SAVE_STATE_ENTRIES, this.mEntries);
        outState.putCharSequenceArray(SAVE_STATE_ENTRY_VALUES, this.mEntryValues);
    }

    private ListPreference getListPreference() {
        return (ListPreference) getPreference();
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // android.support.v14.preference.PreferenceDialogFragment
    public void onPrepareDialogBuilder(AlertDialog.Builder builder) {
        super.onPrepareDialogBuilder(builder);
        builder.setSingleChoiceItems(this.mEntries, this.mClickedDialogEntryIndex, new DialogInterface.OnClickListener() { // from class: android.support.v14.preference.ListPreferenceDialogFragment.1
            @Override // android.content.DialogInterface.OnClickListener
            public void onClick(DialogInterface dialog, int which) {
                ListPreferenceDialogFragment.this.mClickedDialogEntryIndex = which;
                ListPreferenceDialogFragment.this.onClick(dialog, -1);
                dialog.dismiss();
            }
        });
        builder.setPositiveButton((CharSequence) null, (DialogInterface.OnClickListener) null);
    }

    @Override // android.support.v14.preference.PreferenceDialogFragment
    public void onDialogClosed(boolean positiveResult) {
        ListPreference preference = getListPreference();
        if (positiveResult && this.mClickedDialogEntryIndex >= 0) {
            String value = this.mEntryValues[this.mClickedDialogEntryIndex].toString();
            if (preference.callChangeListener(value)) {
                preference.setValue(value);
            }
        }
    }
}
