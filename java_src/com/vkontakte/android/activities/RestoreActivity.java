package com.vkontakte.android.activities;

import android.app.FragmentTransaction;
import android.app.ProgressDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.os.Bundle;
import android.os.PersistableBundle;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.v7.app.ActionBar;
import android.support.v7.widget.Toolbar;
import android.text.TextUtils;
import android.util.Pair;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.FrameLayout;
import com.vkontakte.android.R;
import com.vkontakte.android.VKAlertDialog;
import com.vkontakte.android.ViewUtils;
import com.vkontakte.android.api.Callback;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.api.account.AccountChangePassword;
import com.vkontakte.android.api.auth.AuthRestore;
import com.vkontakte.android.auth.VKAuth;
import com.vkontakte.android.auth.VKAuthHelper;
import com.vkontakte.android.auth.VKAuthState;
import com.vkontakte.android.auth.libverify.VerificationControllerImpl;
import com.vkontakte.android.fragments.AuthCheckFragment;
import com.vkontakte.android.fragments.SignupCodeFragment;
import com.vkontakte.android.fragments.SignupPasswordFragment;
import com.vkontakte.android.fragments.SignupPhoneFragment;
import com.vkontakte.android.ui.ActionBarHacks;
import com.vkontakte.android.ui.ActionBarProgressDrawable;
import com.vkontakte.android.utils.L;
import ru.mail.libverify.api.VerificationApi;
import ru.mail.libverify.controls.VerificationController;
import ru.mail.libverify.controls.VerificationListener;
/* loaded from: classes2.dex */
public class RestoreActivity extends TabletsDialogActivity implements VerificationListener {
    public static final String KEY_ACCESS_TOKEN = "access_token";
    public static final String KEY_SECRET = "secret";
    public static final String KEY_USER_ID = "user_id";
    private static final int[] titles = {R.string.forgot_pass, R.string.signup_code_title, R.string.restore_password_title};
    private String accessToken;
    private SignupCodeFragment codeFragment;
    private VerificationControllerImpl controller;
    private String number;
    private String passHash;
    private String password;
    private SignupPasswordFragment passwordFragment;
    private SignupPhoneFragment phoneFragment;
    private ActionBarProgressDrawable progress;
    private ProgressDialog progressDialog;
    private String secret;
    private String sid;
    private int userId;
    private FrameLayout wrap;
    private int curStep = 0;
    private boolean libverifySupport = false;
    private VKAuthHelper authHelper = new VKAuthHelper(this) { // from class: com.vkontakte.android.activities.RestoreActivity.1
        {
            RestoreActivity.this = this;
        }

        @Override // com.vkontakte.android.auth.VKAuth.AuthListener
        public void onAuthStart() {
            RestoreActivity.this.showProgress();
        }

        @Override // com.vkontakte.android.auth.VKAuth.AuthListener
        public void onAuthFinish(int result, @Nullable VKAuth.AuthAnswer answer) {
            RestoreActivity.this.hideProgress();
            if (result == 2 && answer != null) {
                RestoreActivity.this.passHash = answer.changePasswordHash;
                RestoreActivity.this.userId = answer.userId;
                RestoreActivity.this.accessToken = answer.accessToken;
                RestoreActivity.this.secret = answer.secret;
                RestoreActivity.this.setStep(2);
            } else if (answer == null) {
                RestoreActivity.this.showError(RestoreActivity.this.getString(R.string.signup_flood));
            } else if (TextUtils.isEmpty(answer.concatError) || !answer.concatError.contains(AuthCheckFragment.KEY_CODE)) {
                RestoreActivity.this.showError(answer.concatError);
            } else {
                RestoreActivity.this.showError(RestoreActivity.this.getString(R.string.signup_code_incorrect));
            }
        }

        @Override // com.vkontakte.android.auth.VKAuthHelper, com.vkontakte.android.auth.VKAuth.AuthListener
        public void onAuthNeedValidation(VKAuthState helper, VKAuth.AuthAnswer answer) {
            super.onAuthNeedValidation(helper, answer);
            RestoreActivity.this.hideProgress();
        }
    };

    public void showProgress() {
        ViewUtils.showDialogSafety(this.progressDialog);
    }

    public void hideProgress() {
        ViewUtils.dismissDialogSafety(this.progressDialog);
    }

    @Override // android.app.Activity
    public void onSaveInstanceState(Bundle outState, PersistableBundle outPersistentState) {
        super.onSaveInstanceState(outState, outPersistentState);
        outState.putString("restore_activity_number", this.number);
        outState.putString("restore_activity_sid", this.sid);
        outState.putString("restore_activity_password", this.password);
        outState.putString("restore_activity_passHash", this.passHash);
        outState.putInt("restore_activity_userId", this.userId);
        outState.putString("restore_activity_accessToken", this.accessToken);
        outState.putString("restore_activity_secret", this.secret);
        outState.putBoolean("restore_activity_libverifySupport", this.libverifySupport);
    }

    @Override // com.vkontakte.android.activities.TabletsDialogActivity, com.vkontakte.android.VKActivity, android.support.v7.app.AppCompatActivity, android.support.v4.app.FragmentActivity, android.support.v4.app.BaseFragmentActivityGingerbread, android.app.Activity
    public void onCreate(Bundle b) {
        super.onCreate(b);
        try {
            if (this.controller == null) {
                this.controller = VerificationControllerImpl.restore(this);
            }
        } catch (Exception e) {
            L.e(e, new Object[0]);
        }
        if (b != null) {
            this.number = b.getString("restore_activity_number");
            this.sid = b.getString("restore_activity_sid");
            this.password = b.getString("restore_activity_password");
            this.passHash = b.getString("restore_activity_passHash");
            this.userId = b.getInt("restore_activity_userId");
            this.accessToken = b.getString("restore_activity_accessToken");
            this.secret = b.getString("restore_activity_secret");
            this.libverifySupport = b.getBoolean("restore_activity_libverifySupport", false);
        }
        setDialogWindowBackgroundResource(R.color.cards_bg);
        setContentView(R.layout.toolbar_activity);
        Toolbar toolbar = (Toolbar) findViewById(R.id.toolbar);
        this.progress = new ActionBarProgressDrawable(toolbar.getBackground()) { // from class: com.vkontakte.android.activities.RestoreActivity.2
            {
                RestoreActivity.this = this;
            }

            @Override // android.graphics.drawable.Drawable
            public void invalidateSelf() {
                super.invalidateSelf();
                View abv = ActionBarHacks.getActionBar(RestoreActivity.this);
                if (abv != null) {
                    abv.postInvalidate();
                }
            }
        };
        setSupportActionBar(toolbar);
        this.progressDialog = new ProgressDialog(this);
        this.progressDialog.setMessage(getString(R.string.loading));
        ActionBar actionBar = getSupportActionBar();
        if (actionBar != null) {
            actionBar.setBackgroundDrawable(this.progress);
            actionBar.setDisplayHomeAsUpEnabled(true);
        }
        this.progress.setStepCount(3);
        this.wrap = (FrameLayout) findViewById(R.id.fragment_wrapper);
        this.phoneFragment = new SignupPhoneFragment();
        this.phoneFragment.setOnDoneFunc(RestoreActivity$$Lambda$1.lambdaFactory$(this));
        if (getIntent().hasExtra(SignupPhoneFragment.KEY_PHONE)) {
            this.wrap.postDelayed(RestoreActivity$$Lambda$2.lambdaFactory$(this), 200L);
        }
        FragmentTransaction ft = getFragmentManager().beginTransaction();
        ft.add(R.id.fragment_wrapper, this.phoneFragment).commit();
        this.phoneFragment.setShowForgitButton(true);
    }

    public /* synthetic */ void lambda$onCreate$0() {
        this.phoneFragment.setNumber(getIntent().getStringExtra(SignupPhoneFragment.KEY_PHONE));
    }

    @Override // com.vkontakte.android.VKActivity, android.support.v4.app.FragmentActivity, android.app.Activity
    public void onPause() {
        super.onPause();
        try {
            this.controller.setListener(null);
        } catch (Exception e) {
            L.e(e, new Object[0]);
        }
    }

    @Override // com.vkontakte.android.VKActivity, android.support.v4.app.FragmentActivity, android.app.Activity
    public void onResume() {
        super.onResume();
        try {
            this.controller.setListener(this);
        } catch (Exception e) {
            L.e(e, new Object[0]);
        }
    }

    public void onPhoneDone() {
        if (this.phoneFragment.isFilled()) {
            this.number = this.phoneFragment.getNumber();
            requestCode(this.sid, false, RestoreActivity$$Lambda$3.lambdaFactory$(this), true);
        }
    }

    public /* synthetic */ void lambda$onPhoneDone$1() {
        setStep(1);
    }

    public void setStep(int step) {
        this.curStep = step;
        this.wrap.postDelayed(RestoreActivity$$Lambda$4.lambdaFactory$(this), 100L);
        setTitle(titles[step]);
        if (step == 0) {
            FragmentTransaction ft = getFragmentManager().beginTransaction();
            ft.replace(R.id.fragment_wrapper, this.phoneFragment).commit();
        }
        if (step == 1) {
            String phoneNumber = this.phoneFragment.getNumber();
            if (this.codeFragment == null) {
                this.codeFragment = SignupCodeFragment.create(phoneNumber, this.libverifySupport);
                this.codeFragment.setOnResendListener(RestoreActivity$$Lambda$5.lambdaFactory$(this));
                this.codeFragment.setOnDoneFunc(RestoreActivity$$Lambda$6.lambdaFactory$(this));
            }
            FragmentTransaction ft2 = getFragmentManager().beginTransaction();
            ft2.replace(R.id.fragment_wrapper, this.codeFragment).commit();
            if (this.libverifySupport) {
                try {
                    this.controller.onStart(phoneNumber);
                } catch (Exception e) {
                    L.e(e, new Object[0]);
                }
            }
        }
        if (step == 2) {
            if (this.passwordFragment == null) {
                this.passwordFragment = new SignupPasswordFragment();
                this.passwordFragment.setOnDoneFunc(RestoreActivity$$Lambda$7.lambdaFactory$(this));
                this.passwordFragment.setExplainText(getString(R.string.restore_password_explain));
            }
            FragmentTransaction ft3 = getFragmentManager().beginTransaction();
            ft3.replace(R.id.fragment_wrapper, this.passwordFragment).commitAllowingStateLoss();
        }
    }

    public /* synthetic */ void lambda$setStep$2() {
        this.progress.setStepAnimated(this.curStep);
    }

    public /* synthetic */ void lambda$setStep$3(boolean voice, Runnable action) {
        if (this.libverifySupport) {
            try {
                this.controller.onResendSms();
                action.run();
                return;
            } catch (Exception e) {
                L.e(e, new Object[0]);
                return;
            }
        }
        requestCode(this.sid, voice, action, false);
    }

    public void onPassDone() {
        this.password = this.passwordFragment.getPassword();
        if (this.password.length() < 6) {
            showError(getString(R.string.signup_pass_too_short));
        } else {
            completeRestore(this.sid, this.passHash, this.password, this.accessToken, this.secret);
        }
    }

    public void onCodeDone() {
        verifyCode(this.codeFragment.getCode());
    }

    private void requestCode(String sid, boolean voice, final Runnable runAfter, boolean libverifySupport) {
        new AuthRestore(this.number, sid, voice, libverifySupport).setCallback(new Callback<Pair<String, Boolean>>() { // from class: com.vkontakte.android.activities.RestoreActivity.3
            {
                RestoreActivity.this = this;
            }

            @Override // com.vkontakte.android.api.Callback
            public void success(Pair<String, Boolean> answer) {
                RestoreActivity.this.sid = (String) answer.first;
                RestoreActivity.this.libverifySupport = ((Boolean) answer.second).booleanValue();
                if (runAfter != null) {
                    runAfter.run();
                }
            }

            @Override // com.vkontakte.android.api.Callback
            public void fail(VKAPIRequest.VKErrorResponse error) {
                int errorCode = error.getCodeValue();
                if (errorCode != 14) {
                    if (errorCode == -1) {
                        RestoreActivity.this.showError(RestoreActivity.this.getString(R.string.err_text));
                    } else if (errorCode == 9 || errorCode == 1112) {
                        if (TextUtils.isEmpty(error.description)) {
                            RestoreActivity.this.showError(RestoreActivity.this.getString(R.string.signup_flood));
                        } else {
                            RestoreActivity.this.showError(error.description);
                        }
                    } else if (errorCode == 1000) {
                        RestoreActivity.this.showError(RestoreActivity.this.getString(R.string.signup_invalid_phone));
                    } else if (errorCode == 100) {
                        if (error.message.contains("first_name") || error.message.contains("last_name")) {
                            RestoreActivity.this.showError(RestoreActivity.this.getString(R.string.signup_invalid_name));
                            RestoreActivity.this.setStep(0);
                        } else if (error.message.contains(SignupPhoneFragment.KEY_PHONE)) {
                            RestoreActivity.this.showError(RestoreActivity.this.getString(R.string.signup_invalid_phone_format));
                        } else {
                            RestoreActivity.this.showError(error);
                        }
                    } else if (errorCode != 15) {
                        RestoreActivity.this.showError(error);
                    } else if (error.message.contains("user not found")) {
                        RestoreActivity.this.showError(RestoreActivity.this.getString(R.string.error_user_not_found));
                    } else if (error.message.contains("not available")) {
                        RestoreActivity.this.showError(RestoreActivity.this.getString(R.string.error_not_avail_for_user));
                    } else {
                        RestoreActivity.this.showError(error);
                    }
                }
            }
        }).wrapProgress(this).exec((Context) this);
    }

    @Override // android.app.Activity
    public boolean onCreateOptionsMenu(Menu menu) {
        getMenuInflater().inflate(R.menu.registration, menu);
        return super.onCreateOptionsMenu(menu);
    }

    @Override // com.vkontakte.android.VKActivity, android.app.Activity
    public boolean onOptionsItemSelected(MenuItem item) {
        switch (item.getItemId()) {
            case 16908332:
                onBackPressed();
                return true;
            case R.id.next /* 2131755549 */:
                switch (this.curStep) {
                    case 0:
                        onPhoneDone();
                        return true;
                    case 1:
                        onCodeDone();
                        return true;
                    case 2:
                        onPassDone();
                        return true;
                    default:
                        return true;
                }
            default:
                return super.onOptionsItemSelected(item);
        }
    }

    private void verifyCode(String code) {
        if (!TextUtils.isEmpty(code) && !TextUtils.isEmpty(this.sid)) {
            if (this.libverifySupport) {
                try {
                    if (this.controller.isValidSmsCode(code)) {
                        this.controller.onEnterSmsCode(code);
                    } else {
                        onError(VerificationApi.FailReason.INCORRECT_SMS_CODE);
                    }
                    return;
                } catch (Exception e) {
                    L.e(e, new Object[0]);
                    return;
                }
            }
            VKAuth.authAsync(VKAuthState.restoreWithCode(this.sid, code), this.authHelper);
        }
    }

    private void verifyLibverifyToken(String session, String token) {
        if (!TextUtils.isEmpty(session) && !TextUtils.isEmpty(token) && !TextUtils.isEmpty(this.sid)) {
            VKAuth.authAsync(VKAuthState.restoreWithLibverifyToken(this.sid, session, token), this.authHelper);
        }
    }

    /* renamed from: com.vkontakte.android.activities.RestoreActivity$4 */
    /* loaded from: classes2.dex */
    public class AnonymousClass4 implements Callback<AccountChangePassword.Result> {
        AnonymousClass4() {
            RestoreActivity.this = this$0;
        }

        @Override // com.vkontakte.android.api.Callback
        public void success(AccountChangePassword.Result result) {
            Intent intent = new Intent();
            intent.putExtra("access_token", result.token);
            intent.putExtra("secret", result.secret);
            intent.putExtra("user_id", RestoreActivity.this.userId);
            RestoreActivity.this.setResult(-1, intent);
            RestoreActivity.this.finish();
        }

        @Override // com.vkontakte.android.api.Callback
        public void fail(VKAPIRequest.VKErrorResponse error) {
            int errorCode = error.getCodeValue();
            if (errorCode != 14) {
                RestoreActivity.this.runOnUiThread(RestoreActivity$4$$Lambda$1.lambdaFactory$(this, errorCode, error));
            }
        }

        public /* synthetic */ void lambda$fail$0(int errorCode, VKAPIRequest.VKErrorResponse error) {
            if (errorCode == 1110) {
                RestoreActivity.this.showError(RestoreActivity.this.getString(R.string.signup_code_incorrect));
            } else if (errorCode != 1111) {
                if (errorCode == -1) {
                    RestoreActivity.this.showError(RestoreActivity.this.getString(R.string.err_text));
                } else if (errorCode == 15) {
                    if (error.message.contains("change_password_hash")) {
                        RestoreActivity.this.showError(RestoreActivity.this.getString(R.string.error_cphash_obsolete));
                    } else {
                        RestoreActivity.this.showError(error);
                    }
                } else if (errorCode != 100) {
                    RestoreActivity.this.showError(error);
                } else if (error.message.contains("compromised")) {
                    RestoreActivity.this.showError(RestoreActivity.this.getString(R.string.error_pass_compromised));
                } else {
                    RestoreActivity.this.showError(error);
                }
            }
        }
    }

    private void completeRestore(String sid, String passHash, String password, String accessToken, String secret) {
        VKAPIRequest<AccountChangePassword.Result> request = new AccountChangePassword(sid, passHash, password).setCallback(new AnonymousClass4());
        request.param("access_token", accessToken);
        request.param("sig", request.getSig(secret)).persistWithToken();
        request.wrapProgress(this).exec();
    }

    public void showError(VKAPIRequest.VKErrorResponse error) {
        showError(error.message);
    }

    public void showError(String err) {
        new VKAlertDialog.Builder(this).setTitle(R.string.error).setMessage(err).setPositiveButton(R.string.ok, (DialogInterface.OnClickListener) null).show();
    }

    @Override // com.vkontakte.android.VKActivity, android.support.v4.app.FragmentActivity, android.app.Activity
    public void onBackPressed() {
        try {
            if (this.controller.onCancel()) {
                return;
            }
        } catch (Exception e) {
            L.e(e, new Object[0]);
        }
        if (this.curStep == 2) {
            setStep(0);
        } else if (this.curStep == 0) {
            super.onBackPressed();
        } else {
            setStep(this.curStep - 1);
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.vkontakte.android.VKActivity, android.support.v4.app.FragmentActivity, android.app.Activity
    public void onActivityResult(int requestCode, int resultCode, Intent data) {
        if (!this.authHelper.onActivityResult(requestCode, resultCode, data)) {
            super.onActivityResult(requestCode, resultCode, data);
        }
    }

    @Override // ru.mail.libverify.controls.VerificationListener
    public void onStateChanged(VerificationController.State state) {
        L.e(state);
    }

    @Override // ru.mail.libverify.controls.VerificationListener
    public void onProgress(boolean show) {
        if (show) {
            showProgress();
        } else {
            hideProgress();
        }
    }

    @Override // ru.mail.libverify.controls.VerificationListener
    public void onError(VerificationApi.FailReason reason) {
        switch (reason) {
            case OK:
                break;
            case INCORRECT_PHONE_NUMBER:
                showError(getString(R.string.signup_invalid_phone));
                break;
            case UNSUPPORTED_NUMBER:
                showError(getString(R.string.signup_invalid_phone_format));
                break;
            case NO_NETWORK:
            case NETWORK_ERROR:
            case RATELIMIT:
            case GENERAL_ERROR:
                showError(getString(R.string.err_text));
                break;
            case INCORRECT_SMS_CODE:
                showError(getString(R.string.signup_code_incorrect));
                break;
            default:
                throw new IllegalArgumentException();
        }
        L.e(reason);
    }

    @Override // ru.mail.libverify.controls.VerificationListener
    public void onSmsCodeReceived(@NonNull String s) {
        L.e(s);
    }

    @Override // ru.mail.libverify.controls.VerificationListener
    public void onCompleted(@NonNull String sessionId, @NonNull String token) {
        this.controller.onConfirmed();
        verifyLibverifyToken(sessionId, token);
        L.e(sessionId, token);
    }

    @Override // ru.mail.libverify.controls.VerificationListener
    public void onIvrCallError(VerificationApi.FailReason failReason) {
        showError(getString(R.string.err_text));
        L.e(failReason);
    }

    @Override // ru.mail.libverify.controls.VerificationListener
    public void onPhoneNumberReceived(@NonNull String s) {
        L.d(s);
    }
}
