package com.vkontakte.android;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.graphics.Typeface;
import android.os.Bundle;
import android.text.Editable;
import android.text.TextWatcher;
import android.view.View;
import android.widget.TextView;
import android.widget.Toast;
import com.vkontakte.android.VKAlertDialog;
import com.vkontakte.android.activities.LogoutReceiver;
import com.vkontakte.android.api.SimpleCallback;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.api.account.AccountChangePassword;
import com.vkontakte.android.auth.VKAccountManager;
/* loaded from: classes2.dex */
public class ChangePasswordActivity extends Activity {
    private AlertDialog dlg;
    private LogoutReceiver logoutReceiver = null;
    private TextWatcher textListener = new TextWatcher() { // from class: com.vkontakte.android.ChangePasswordActivity.1
        @Override // android.text.TextWatcher
        public void afterTextChanged(Editable arg0) {
            String old = ((TextView) ChangePasswordActivity.this.view.findViewById(R.id.old_password)).getText().toString();
            String new1 = ((TextView) ChangePasswordActivity.this.view.findViewById(R.id.new_password)).getText().toString();
            String new2 = ((TextView) ChangePasswordActivity.this.view.findViewById(R.id.new_password2)).getText().toString();
            ChangePasswordActivity.this.dlg.getButton(-1).setEnabled(old.length() > 0 && new1.length() > 0 && new2.length() > 0);
        }

        @Override // android.text.TextWatcher
        public void beforeTextChanged(CharSequence s, int start, int count, int after) {
        }

        @Override // android.text.TextWatcher
        public void onTextChanged(CharSequence s, int start, int before, int count) {
        }
    };
    private View view;

    @Override // android.app.Activity
    public void onCreate(Bundle b) {
        super.onCreate(b);
        this.logoutReceiver = LogoutReceiver.register(this);
        this.view = View.inflate(this, R.layout.change_password, null);
        ((TextView) this.view.findViewById(R.id.old_password)).setTypeface(Typeface.DEFAULT);
        ((TextView) this.view.findViewById(R.id.new_password)).setTypeface(Typeface.DEFAULT);
        ((TextView) this.view.findViewById(R.id.new_password2)).setTypeface(Typeface.DEFAULT);
        ((TextView) this.view.findViewById(R.id.old_password)).addTextChangedListener(this.textListener);
        ((TextView) this.view.findViewById(R.id.new_password)).addTextChangedListener(this.textListener);
        ((TextView) this.view.findViewById(R.id.new_password2)).addTextChangedListener(this.textListener);
        this.dlg = new VKAlertDialog.Builder(this).setTitle(R.string.change_password).setView(this.view).setPositiveButton(R.string.ok, (DialogInterface.OnClickListener) null).setNegativeButton(R.string.cancel, (DialogInterface.OnClickListener) null).create();
        this.dlg.getWindow().setSoftInputMode(4);
        this.dlg.show();
        this.dlg.setOnDismissListener(ChangePasswordActivity$$Lambda$1.lambdaFactory$(this));
        this.dlg.getButton(-1).setEnabled(false);
        this.dlg.getButton(-1).setOnClickListener(ChangePasswordActivity$$Lambda$2.lambdaFactory$(this));
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$onCreate$0(DialogInterface dialog) {
        finish();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$onCreate$1(View v) {
        String old = ((TextView) this.view.findViewById(R.id.old_password)).getText().toString();
        String new1 = ((TextView) this.view.findViewById(R.id.new_password)).getText().toString();
        String new2 = ((TextView) this.view.findViewById(R.id.new_password2)).getText().toString();
        if (old.length() >= 4) {
            if (!new1.equals(new2)) {
                Toast.makeText(this, (int) R.string.passwords_not_match, 0).show();
            } else if (new1.length() < 6) {
                Toast.makeText(this, (int) R.string.signup_pass_too_short, 0).show();
            } else {
                changePassword(old, new1);
            }
        }
    }

    @Override // android.app.Activity
    protected void onDestroy() {
        this.logoutReceiver.unregister();
        super.onDestroy();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: com.vkontakte.android.ChangePasswordActivity$2  reason: invalid class name */
    /* loaded from: classes2.dex */
    public class AnonymousClass2 extends SimpleCallback<AccountChangePassword.Result> {
        AnonymousClass2(Context context) {
            super(context);
        }

        @Override // com.vkontakte.android.api.Callback
        public void success(AccountChangePassword.Result result) {
            VKAccountManager.editCurrent().setAccessToken(result.token).setSecret(result.secret).commit();
            ChangePasswordActivity.this.runOnUiThread(ChangePasswordActivity$2$$Lambda$1.lambdaFactory$(this));
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public /* synthetic */ void lambda$success$0() {
            Toast.makeText(ChangePasswordActivity.this, (int) R.string.password_changed, 0).show();
            ChangePasswordActivity.this.finish();
        }

        @Override // com.vkontakte.android.api.SimpleCallback, com.vkontakte.android.api.Callback
        public void fail(VKAPIRequest.VKErrorResponse error) {
            if (error.getCodeValue() == 15) {
                ChangePasswordActivity.this.runOnUiThread(ChangePasswordActivity$2$$Lambda$2.lambdaFactory$(this));
            } else {
                super.fail(error);
            }
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public /* synthetic */ void lambda$fail$1() {
            Toast.makeText(ChangePasswordActivity.this, (int) R.string.old_password_incorrect, 0).show();
        }
    }

    private void changePassword(String old, String nw) {
        new AccountChangePassword(old, nw).setCallback(new AnonymousClass2(this)).wrapProgress(this).exec();
    }
}
