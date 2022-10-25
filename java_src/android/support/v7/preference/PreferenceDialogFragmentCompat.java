package android.support.v7.preference;

import android.app.Dialog;
import android.content.Context;
import android.content.DialogInterface;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.os.Bundle;
import android.support.annotation.LayoutRes;
import android.support.annotation.NonNull;
import android.support.annotation.RestrictTo;
import android.support.v4.app.DialogFragment;
import android.support.v4.app.Fragment;
import android.support.v7.app.AlertDialog;
import android.support.v7.preference.DialogPreference;
import android.text.TextUtils;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.widget.TextView;
/* loaded from: classes.dex */
public abstract class PreferenceDialogFragmentCompat extends DialogFragment implements DialogInterface.OnClickListener {
    protected static final String ARG_KEY = "key";
    private static final String SAVE_STATE_ICON = "PreferenceDialogFragment.icon";
    private static final String SAVE_STATE_LAYOUT = "PreferenceDialogFragment.layout";
    private static final String SAVE_STATE_MESSAGE = "PreferenceDialogFragment.message";
    private static final String SAVE_STATE_NEGATIVE_TEXT = "PreferenceDialogFragment.negativeText";
    private static final String SAVE_STATE_POSITIVE_TEXT = "PreferenceDialogFragment.positiveText";
    private static final String SAVE_STATE_TITLE = "PreferenceDialogFragment.title";
    private BitmapDrawable mDialogIcon;
    @LayoutRes
    private int mDialogLayoutRes;
    private CharSequence mDialogMessage;
    private CharSequence mDialogTitle;
    private CharSequence mNegativeButtonText;
    private CharSequence mPositiveButtonText;
    private DialogPreference mPreference;
    private int mWhichButtonClicked;

    public abstract void onDialogClosed(boolean z);

    @Override // android.support.v4.app.DialogFragment, android.support.v4.app.Fragment
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        Fragment rawFragment = getTargetFragment();
        if (!(rawFragment instanceof DialogPreference.TargetFragment)) {
            throw new IllegalStateException("Target fragment must implement TargetFragment interface");
        }
        DialogPreference.TargetFragment fragment = (DialogPreference.TargetFragment) rawFragment;
        String key = getArguments().getString("key");
        if (savedInstanceState == null) {
            this.mPreference = (DialogPreference) fragment.findPreference(key);
            this.mDialogTitle = this.mPreference.getDialogTitle();
            this.mPositiveButtonText = this.mPreference.getPositiveButtonText();
            this.mNegativeButtonText = this.mPreference.getNegativeButtonText();
            this.mDialogMessage = this.mPreference.getDialogMessage();
            this.mDialogLayoutRes = this.mPreference.getDialogLayoutResource();
            Drawable icon = this.mPreference.getDialogIcon();
            if (icon == null || (icon instanceof BitmapDrawable)) {
                this.mDialogIcon = (BitmapDrawable) icon;
                return;
            }
            Bitmap bitmap = Bitmap.createBitmap(icon.getIntrinsicWidth(), icon.getIntrinsicHeight(), Bitmap.Config.ARGB_8888);
            Canvas canvas = new Canvas(bitmap);
            icon.setBounds(0, 0, canvas.getWidth(), canvas.getHeight());
            icon.draw(canvas);
            this.mDialogIcon = new BitmapDrawable(getResources(), bitmap);
            return;
        }
        this.mDialogTitle = savedInstanceState.getCharSequence(SAVE_STATE_TITLE);
        this.mPositiveButtonText = savedInstanceState.getCharSequence(SAVE_STATE_POSITIVE_TEXT);
        this.mNegativeButtonText = savedInstanceState.getCharSequence(SAVE_STATE_NEGATIVE_TEXT);
        this.mDialogMessage = savedInstanceState.getCharSequence(SAVE_STATE_MESSAGE);
        this.mDialogLayoutRes = savedInstanceState.getInt(SAVE_STATE_LAYOUT, 0);
        Bitmap bitmap2 = (Bitmap) savedInstanceState.getParcelable(SAVE_STATE_ICON);
        if (bitmap2 != null) {
            this.mDialogIcon = new BitmapDrawable(getResources(), bitmap2);
        }
    }

    @Override // android.support.v4.app.DialogFragment, android.support.v4.app.Fragment
    public void onSaveInstanceState(@NonNull Bundle outState) {
        super.onSaveInstanceState(outState);
        outState.putCharSequence(SAVE_STATE_TITLE, this.mDialogTitle);
        outState.putCharSequence(SAVE_STATE_POSITIVE_TEXT, this.mPositiveButtonText);
        outState.putCharSequence(SAVE_STATE_NEGATIVE_TEXT, this.mNegativeButtonText);
        outState.putCharSequence(SAVE_STATE_MESSAGE, this.mDialogMessage);
        outState.putInt(SAVE_STATE_LAYOUT, this.mDialogLayoutRes);
        if (this.mDialogIcon != null) {
            outState.putParcelable(SAVE_STATE_ICON, this.mDialogIcon.getBitmap());
        }
    }

    @Override // android.support.v4.app.DialogFragment
    @NonNull
    public Dialog onCreateDialog(Bundle savedInstanceState) {
        Context context = getActivity();
        this.mWhichButtonClicked = -2;
        AlertDialog.Builder builder = new AlertDialog.Builder(context).setTitle(this.mDialogTitle).setIcon(this.mDialogIcon).setPositiveButton(this.mPositiveButtonText, this).setNegativeButton(this.mNegativeButtonText, this);
        View contentView = onCreateDialogView(context);
        if (contentView != null) {
            onBindDialogView(contentView);
            builder.setView(contentView);
        } else {
            builder.setMessage(this.mDialogMessage);
        }
        onPrepareDialogBuilder(builder);
        Dialog dialog = builder.create();
        if (needInputMethod()) {
            requestInputMethod(dialog);
        }
        return dialog;
    }

    public DialogPreference getPreference() {
        if (this.mPreference == null) {
            String key = getArguments().getString("key");
            DialogPreference.TargetFragment fragment = (DialogPreference.TargetFragment) getTargetFragment();
            this.mPreference = (DialogPreference) fragment.findPreference(key);
        }
        return this.mPreference;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void onPrepareDialogBuilder(AlertDialog.Builder builder) {
    }

    @RestrictTo({RestrictTo.Scope.LIBRARY_GROUP})
    protected boolean needInputMethod() {
        return false;
    }

    private void requestInputMethod(Dialog dialog) {
        Window window = dialog.getWindow();
        window.setSoftInputMode(5);
    }

    protected View onCreateDialogView(Context context) {
        int resId = this.mDialogLayoutRes;
        if (resId == 0) {
            return null;
        }
        LayoutInflater inflater = LayoutInflater.from(context);
        return inflater.inflate(resId, (ViewGroup) null);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void onBindDialogView(View view) {
        View dialogMessageView = view.findViewById(16908299);
        if (dialogMessageView != null) {
            CharSequence message = this.mDialogMessage;
            int newVisibility = 8;
            if (!TextUtils.isEmpty(message)) {
                if (dialogMessageView instanceof TextView) {
                    ((TextView) dialogMessageView).setText(message);
                }
                newVisibility = 0;
            }
            if (dialogMessageView.getVisibility() != newVisibility) {
                dialogMessageView.setVisibility(newVisibility);
            }
        }
    }

    @Override // android.content.DialogInterface.OnClickListener
    public void onClick(DialogInterface dialog, int which) {
        this.mWhichButtonClicked = which;
    }

    @Override // android.support.v4.app.DialogFragment, android.content.DialogInterface.OnDismissListener
    public void onDismiss(DialogInterface dialog) {
        super.onDismiss(dialog);
        onDialogClosed(this.mWhichButtonClicked == -1);
    }
}
