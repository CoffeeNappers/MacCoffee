package android.support.v14.preference;

import android.os.Bundle;
import android.support.annotation.NonNull;
import android.support.annotation.RestrictTo;
import android.support.v7.preference.EditTextPreference;
import android.view.View;
import android.widget.EditText;
/* loaded from: classes.dex */
public class EditTextPreferenceDialogFragment extends PreferenceDialogFragment {
    private static final String SAVE_STATE_TEXT = "EditTextPreferenceDialogFragment.text";
    private EditText mEditText;
    private CharSequence mText;

    public static EditTextPreferenceDialogFragment newInstance(String key) {
        EditTextPreferenceDialogFragment fragment = new EditTextPreferenceDialogFragment();
        Bundle b = new Bundle(1);
        b.putString("key", key);
        fragment.setArguments(b);
        return fragment;
    }

    @Override // android.support.v14.preference.PreferenceDialogFragment, android.app.DialogFragment, android.app.Fragment
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        if (savedInstanceState == null) {
            this.mText = getEditTextPreference().getText();
        } else {
            this.mText = savedInstanceState.getCharSequence(SAVE_STATE_TEXT);
        }
    }

    @Override // android.support.v14.preference.PreferenceDialogFragment, android.app.DialogFragment, android.app.Fragment
    public void onSaveInstanceState(@NonNull Bundle outState) {
        super.onSaveInstanceState(outState);
        outState.putCharSequence(SAVE_STATE_TEXT, this.mText);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // android.support.v14.preference.PreferenceDialogFragment
    public void onBindDialogView(View view) {
        super.onBindDialogView(view);
        this.mEditText = (EditText) view.findViewById(16908291);
        if (this.mEditText == null) {
            throw new IllegalStateException("Dialog view must contain an EditText with id @android:id/edit");
        }
        this.mEditText.setText(this.mText);
    }

    private EditTextPreference getEditTextPreference() {
        return (EditTextPreference) getPreference();
    }

    @Override // android.support.v14.preference.PreferenceDialogFragment
    @RestrictTo({RestrictTo.Scope.LIBRARY_GROUP})
    protected boolean needInputMethod() {
        return true;
    }

    @Override // android.support.v14.preference.PreferenceDialogFragment
    public void onDialogClosed(boolean positiveResult) {
        if (positiveResult) {
            String value = this.mEditText.getText().toString();
            if (getEditTextPreference().callChangeListener(value)) {
                getEditTextPreference().setText(value);
            }
        }
    }
}
