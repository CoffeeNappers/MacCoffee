package com.vkontakte.android.auth;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.DialogInterface;
import android.content.Intent;
import android.support.annotation.NonNull;
import android.text.TextUtils;
import android.widget.Toast;
import com.vkontakte.android.R;
import com.vkontakte.android.VKAlertDialog;
import com.vkontakte.android.VKApplication;
import com.vkontakte.android.ValidationActivity;
import com.vkontakte.android.auth.VKAuth;
import com.vkontakte.android.fragments.AuthCheckFragment;
import com.vkontakte.android.fragments.SignupPhoneFragment;
/* loaded from: classes2.dex */
public abstract class VKAuthHelper implements VKAuth.AuthListener {
    private static final int REQUEST_PHONE = 23665;
    private static final int REQUEST_RECEIVE_LIBVERIFY_TOKEN = 23663;
    private static final int REQUEST_RECEIVE_PHONE_CODE = 23662;
    public static final int REQUEST_VALIDATE_URL = 23664;
    @NonNull
    private final Activity activity;
    private VKAuthState tmpState = null;
    private VKAuth.AuthAnswer tmpAnswer = null;

    public VKAuthHelper(@NonNull Activity activity) {
        this.activity = activity;
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    @Override // com.vkontakte.android.auth.VKAuth.AuthListener
    public void onAuthNeedValidation(VKAuthState helper, VKAuth.AuthAnswer answer) {
        boolean isSms = false;
        switch (answer.validateType) {
            case 0:
                this.activity.startActivityForResult(new Intent(this.activity, ValidationActivity.class).putExtra("url", answer.redirectUrl).putExtra(ValidationActivity.KEY_RETURN_RESULT, true).putExtra("auth_state", helper), REQUEST_VALIDATE_URL);
                return;
            case 1:
                isSms = true;
                break;
            case 2:
                break;
            case 3:
                new AuthCheckFragment.Builder(null, answer.phoneMask, true, answer.validationSid).setLoginHelper(helper).setIsLibverify(helper.getUserName()).forResult(this.activity, REQUEST_RECEIVE_LIBVERIFY_TOKEN);
                return;
            case 4:
                this.tmpState = helper;
                this.tmpAnswer = answer;
                new SignupPhoneFragment.Builder().forResult(this.activity, REQUEST_PHONE);
                return;
            default:
                Toast.makeText(VKApplication.context, "unknown validation type", 0).show();
                return;
        }
        new AuthCheckFragment.Builder(null, answer.phoneMask, isSms, answer.validationSid).setLoginHelper(helper).forResult(this.activity, REQUEST_RECEIVE_PHONE_CODE);
    }

    public boolean onActivityResult(int requestCode, int resultCode, Intent intent) {
        if (requestCode == REQUEST_RECEIVE_LIBVERIFY_TOKEN) {
            if (resultCode == -1) {
                VKAuthState helper = (VKAuthState) intent.getParcelableExtra("auth_state");
                String session = intent.getStringExtra("session");
                String token = intent.getStringExtra(AuthCheckFragment.KEY_TOKEN);
                if (helper != null && !TextUtils.isEmpty(session) && !TextUtils.isEmpty(token)) {
                    VKAuth.authAsync(helper.setLibverifyToken(session, token), this);
                }
            }
            return true;
        } else if (requestCode == REQUEST_RECEIVE_PHONE_CODE) {
            if (resultCode == -1) {
                VKAuthState helper2 = (VKAuthState) intent.getParcelableExtra("auth_state");
                String code = intent.getStringExtra(AuthCheckFragment.KEY_CODE);
                if (helper2 != null && !TextUtils.isEmpty(code)) {
                    VKAuth.authAsync(helper2.setValidateCode(code), this);
                }
            }
            return true;
        } else if (requestCode == 23664) {
            if (resultCode == -1 && intent != null) {
                String accessToken = intent.getStringExtra("access_token");
                String secret = intent.getStringExtra("secret");
                int userId = intent.getIntExtra("user_id", 0);
                VKAuthState helper3 = (VKAuthState) intent.getParcelableExtra("auth_state");
                if (userId != 0 && !TextUtils.isEmpty(accessToken) && !TextUtils.isEmpty(secret)) {
                    VKAuth.authAsync(VKAuthState.byAuthData(accessToken, secret, userId), this);
                } else if (helper3 != null) {
                    VKAuth.authAsync(helper3, this);
                }
            }
            return true;
        } else if (requestCode == REQUEST_PHONE) {
            if (resultCode == -1 && this.tmpState != null && this.tmpAnswer != null && intent != null) {
                String phone = intent.getStringExtra(SignupPhoneFragment.KEY_PHONE);
                if (!TextUtils.isEmpty(phone)) {
                    new AuthCheckFragment.Builder(phone, phone, true, this.tmpAnswer.validationSid).validatePhoneOnStart().setLoginHelper(this.tmpState).forResult(this.activity, REQUEST_RECEIVE_PHONE_CODE);
                }
            }
            this.tmpState = null;
            this.tmpAnswer = null;
            return true;
        } else {
            return false;
        }
    }

    private boolean contains(String s1, String s2) {
        return s1 != null && s1.contains(s2);
    }

    public void showErrorMessage(Activity activity, boolean closeOnError, int result, VKAuth.AuthAnswer answer) {
        String msg;
        if (result == 3) {
            String extraMessage = answer.errorDescription;
            if (TextUtils.isEmpty(extraMessage)) {
                msg = activity.getResources().getString(R.string.auth_error);
            } else {
                msg = extraMessage;
            }
            if (contains(answer.concatError, "code is invalid") || contains(answer.concatError, "wrong code")) {
                msg = activity.getString(R.string.auth_wrong_code);
            } else if (contains(answer.concatError, "too") && contains(answer.concatError, "tries")) {
                msg = activity.getString(R.string.auth_out_of_tries);
            } else if (contains(answer.concatError, "email") && contains(answer.concatError, "registered")) {
                msg = activity.getString(R.string.external_auth_email_taken);
            }
        } else {
            msg = activity.getResources().getString(R.string.auth_error_network);
        }
        AlertDialog dlg = new VKAlertDialog.Builder(activity).setMessage(msg).setTitle(R.string.auth_error_title).setPositiveButton(R.string.ok, (DialogInterface.OnClickListener) null).show();
        if (closeOnError) {
            dlg.setOnDismissListener(VKAuthHelper$$Lambda$1.lambdaFactory$(activity));
        }
    }

    public static /* synthetic */ void lambda$showErrorMessage$0(Activity activity, DialogInterface dialog) {
        activity.setResult(0);
        activity.finish();
    }
}
