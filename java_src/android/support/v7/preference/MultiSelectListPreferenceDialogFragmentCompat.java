package android.support.v7.preference;

import android.content.DialogInterface;
import android.os.Bundle;
import android.support.annotation.NonNull;
import android.support.v7.app.AlertDialog;
import android.support.v7.preference.internal.AbstractMultiSelectListPreference;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Set;
/* loaded from: classes.dex */
public class MultiSelectListPreferenceDialogFragmentCompat extends PreferenceDialogFragmentCompat {
    private static final String SAVE_STATE_CHANGED = "MultiSelectListPreferenceDialogFragmentCompat.changed";
    private static final String SAVE_STATE_ENTRIES = "MultiSelectListPreferenceDialogFragmentCompat.entries";
    private static final String SAVE_STATE_ENTRY_VALUES = "MultiSelectListPreferenceDialogFragmentCompat.entryValues";
    private static final String SAVE_STATE_VALUES = "MultiSelectListPreferenceDialogFragmentCompat.values";
    private CharSequence[] mEntries;
    private CharSequence[] mEntryValues;
    private Set<String> mNewValues = new HashSet();
    private boolean mPreferenceChanged;

    public static MultiSelectListPreferenceDialogFragmentCompat newInstance(String key) {
        MultiSelectListPreferenceDialogFragmentCompat fragment = new MultiSelectListPreferenceDialogFragmentCompat();
        Bundle b = new Bundle(1);
        b.putString("key", key);
        fragment.setArguments(b);
        return fragment;
    }

    @Override // android.support.v7.preference.PreferenceDialogFragmentCompat, android.support.v4.app.DialogFragment, android.support.v4.app.Fragment
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        if (savedInstanceState == null) {
            AbstractMultiSelectListPreference preference = getListPreference();
            if (preference.getEntries() == null || preference.getEntryValues() == null) {
                throw new IllegalStateException("MultiSelectListPreference requires an entries array and an entryValues array.");
            }
            this.mNewValues.clear();
            this.mNewValues.addAll(preference.getValues());
            this.mPreferenceChanged = false;
            this.mEntries = preference.getEntries();
            this.mEntryValues = preference.getEntryValues();
            return;
        }
        this.mNewValues.clear();
        this.mNewValues.addAll(savedInstanceState.getStringArrayList(SAVE_STATE_VALUES));
        this.mPreferenceChanged = savedInstanceState.getBoolean(SAVE_STATE_CHANGED, false);
        this.mEntries = savedInstanceState.getCharSequenceArray(SAVE_STATE_ENTRIES);
        this.mEntryValues = savedInstanceState.getCharSequenceArray(SAVE_STATE_ENTRY_VALUES);
    }

    @Override // android.support.v7.preference.PreferenceDialogFragmentCompat, android.support.v4.app.DialogFragment, android.support.v4.app.Fragment
    public void onSaveInstanceState(@NonNull Bundle outState) {
        super.onSaveInstanceState(outState);
        outState.putStringArrayList(SAVE_STATE_VALUES, new ArrayList<>(this.mNewValues));
        outState.putBoolean(SAVE_STATE_CHANGED, this.mPreferenceChanged);
        outState.putCharSequenceArray(SAVE_STATE_ENTRIES, this.mEntries);
        outState.putCharSequenceArray(SAVE_STATE_ENTRY_VALUES, this.mEntryValues);
    }

    private AbstractMultiSelectListPreference getListPreference() {
        return (AbstractMultiSelectListPreference) getPreference();
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // android.support.v7.preference.PreferenceDialogFragmentCompat
    public void onPrepareDialogBuilder(AlertDialog.Builder builder) {
        super.onPrepareDialogBuilder(builder);
        int entryCount = this.mEntryValues.length;
        boolean[] checkedItems = new boolean[entryCount];
        for (int i = 0; i < entryCount; i++) {
            checkedItems[i] = this.mNewValues.contains(this.mEntryValues[i].toString());
        }
        builder.setMultiChoiceItems(this.mEntries, checkedItems, new DialogInterface.OnMultiChoiceClickListener() { // from class: android.support.v7.preference.MultiSelectListPreferenceDialogFragmentCompat.1
            @Override // android.content.DialogInterface.OnMultiChoiceClickListener
            public void onClick(DialogInterface dialog, int which, boolean isChecked) {
                if (isChecked) {
                    MultiSelectListPreferenceDialogFragmentCompat.this.mPreferenceChanged |= MultiSelectListPreferenceDialogFragmentCompat.this.mNewValues.add(MultiSelectListPreferenceDialogFragmentCompat.this.mEntryValues[which].toString());
                    return;
                }
                MultiSelectListPreferenceDialogFragmentCompat.this.mPreferenceChanged |= MultiSelectListPreferenceDialogFragmentCompat.this.mNewValues.remove(MultiSelectListPreferenceDialogFragmentCompat.this.mEntryValues[which].toString());
            }
        });
    }

    @Override // android.support.v7.preference.PreferenceDialogFragmentCompat
    public void onDialogClosed(boolean positiveResult) {
        AbstractMultiSelectListPreference preference = getListPreference();
        if (positiveResult && this.mPreferenceChanged) {
            Set<String> values = this.mNewValues;
            if (preference.callChangeListener(values)) {
                preference.setValues(values);
            }
        }
        this.mPreferenceChanged = false;
    }
}
