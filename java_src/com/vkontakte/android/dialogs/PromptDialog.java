package com.vkontakte.android.dialogs;

import android.app.Activity;
import android.app.AlertDialog;
import android.app.Dialog;
import android.content.DialogInterface;
import android.text.Editable;
import android.text.TextWatcher;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.EditText;
import com.vkontakte.android.R;
/* loaded from: classes2.dex */
public class PromptDialog {
    private final AlertDialog.Builder mBuilder;
    private AlertDialog mDialog;
    private final EditText mInput;
    private final DialogInterface.OnClickListener mInternalListener = new DialogInterface.OnClickListener() { // from class: com.vkontakte.android.dialogs.PromptDialog.1
        @Override // android.content.DialogInterface.OnClickListener
        public void onClick(DialogInterface dialog, int which) {
            if (which == -1 && PromptDialog.this.mListener != null && PromptDialog.this.mInput != null) {
                PromptDialog.this.mListener.onFinish(PromptDialog.this.mInput.getText());
            }
        }
    };
    private Listener mListener;
    private Button mOkButton;
    private CharSequence mOkText;
    private final View mRoot;
    private boolean mTextRequired;

    /* loaded from: classes2.dex */
    public interface Listener {
        void onFinish(CharSequence charSequence);
    }

    public PromptDialog(Activity host) {
        this.mBuilder = new AlertDialog.Builder(host);
        this.mRoot = host.getLayoutInflater().inflate(R.layout.dialog_prompt, (ViewGroup) null);
        this.mInput = (EditText) this.mRoot.findViewById(16908297);
        this.mOkText = host.getString(R.string.ok);
        TextWatcher mEmptyChecker = new TextWatcher() { // from class: com.vkontakte.android.dialogs.PromptDialog.2
            @Override // android.text.TextWatcher
            public void beforeTextChanged(CharSequence s, int start, int count, int after) {
            }

            @Override // android.text.TextWatcher
            public void onTextChanged(CharSequence s, int start, int before, int count) {
            }

            @Override // android.text.TextWatcher
            public void afterTextChanged(Editable s) {
                PromptDialog.this.refreshEnabledState(s);
            }
        };
        addTextChangedListener(mEmptyChecker);
    }

    public PromptDialog setTitle(CharSequence title) {
        this.mBuilder.setTitle(title);
        return this;
    }

    public PromptDialog setTitle(int title) {
        this.mBuilder.setTitle(title);
        return this;
    }

    public PromptDialog setHint(CharSequence title) {
        this.mInput.setHint(title);
        return this;
    }

    public PromptDialog setHint(int title) {
        this.mInput.setHint(title);
        return this;
    }

    public PromptDialog setText(CharSequence title) {
        this.mInput.setText(title);
        return this;
    }

    public PromptDialog setText(int title) {
        this.mInput.setText(title);
        return this;
    }

    public PromptDialog setOkText(int text) {
        this.mOkText = this.mBuilder.getContext().getString(text);
        return this;
    }

    public PromptDialog setOkText(CharSequence text) {
        this.mOkText = text;
        return this;
    }

    public PromptDialog addTextChangedListener(TextWatcher l) {
        this.mInput.addTextChangedListener(l);
        return this;
    }

    public PromptDialog setInputListener(Listener l) {
        this.mListener = l;
        return this;
    }

    public PromptDialog requireText() {
        this.mTextRequired = true;
        return this;
    }

    public void show() {
        create().show();
    }

    public EditText getEditText() {
        return this.mInput;
    }

    public Dialog create() {
        this.mDialog = this.mBuilder.setView(this.mRoot).setPositiveButton(this.mOkText, this.mInternalListener).setNegativeButton(R.string.cancel, this.mInternalListener).create();
        this.mDialog.setOnShowListener(new DialogInterface.OnShowListener() { // from class: com.vkontakte.android.dialogs.PromptDialog.3
            @Override // android.content.DialogInterface.OnShowListener
            public void onShow(DialogInterface dialog) {
                PromptDialog.this.mOkButton = PromptDialog.this.mDialog.getButton(-1);
                PromptDialog.this.refreshEnabledState(PromptDialog.this.mInput.getText());
            }
        });
        return this.mDialog;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void refreshEnabledState(Editable s) {
        this.mOkButton = this.mDialog.getButton(-1);
        if (this.mTextRequired && this.mOkButton != null) {
            this.mOkButton.setEnabled(s.length() > 0);
        }
    }
}
