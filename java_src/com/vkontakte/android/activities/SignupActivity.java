package com.vkontakte.android.activities;

import android.app.FragmentTransaction;
import android.app.ProgressDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.os.Bundle;
import android.support.annotation.NonNull;
import android.support.v7.app.ActionBar;
import android.support.v7.widget.Toolbar;
import android.text.TextUtils;
import android.util.Pair;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.FrameLayout;
import com.my.tracker.MyTracker;
import com.vkontakte.android.R;
import com.vkontakte.android.VKAlertDialog;
import com.vkontakte.android.VKApplication;
import com.vkontakte.android.ViewUtils;
import com.vkontakte.android.api.Callback;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.api.auth.AuthConfirm;
import com.vkontakte.android.api.auth.AuthSignup;
import com.vkontakte.android.auth.VKAccountManager;
import com.vkontakte.android.auth.VKAuthState;
import com.vkontakte.android.auth.libverify.VerificationControllerImpl;
import com.vkontakte.android.fragments.SignupCodeFragment;
import com.vkontakte.android.fragments.SignupPasswordFragment;
import com.vkontakte.android.fragments.SignupPhoneFragment;
import com.vkontakte.android.fragments.SignupProfileFragment;
import com.vkontakte.android.ui.ActionBarHacks;
import com.vkontakte.android.ui.ActionBarProgressDrawable;
import com.vkontakte.android.upload.ProfilePhotoUploadTask;
import com.vkontakte.android.upload.Upload;
import com.vkontakte.android.utils.L;
import ru.mail.libverify.api.VerificationApi;
import ru.mail.libverify.controls.VerificationController;
import ru.mail.libverify.controls.VerificationListener;
/* loaded from: classes2.dex */
public class SignupActivity extends TabletsDialogActivity implements VerificationListener {
    public static final String KEY_AUTH_STATE = "auth_state";
    private static final int RESTORE_RESULT = 203;
    private static final int[] titles = {R.string.registration, R.string.signup_phone_title, R.string.signup_code_title, R.string.signup_pass_title};
    private String bdate;
    private String code;
    private SignupCodeFragment codeFragment;
    private VerificationControllerImpl controller;
    private String firstName;
    private int gender;
    private String lastName;
    private String libverifySessionId;
    private String libverifyToken;
    private float mPhotoBottom;
    private float mPhotoLeft;
    private float mPhotoRight;
    private float mPhotoTop;
    private String number;
    private String password;
    private SignupPasswordFragment passwordFragment;
    private SignupPhoneFragment phoneFragment;
    private String photo;
    private SignupProfileFragment profileFragment;
    private ActionBarProgressDrawable progress;
    private ProgressDialog progressDialog;
    private String sid;
    private FrameLayout wrap;
    private int curStep = 0;
    private boolean libverifySupport = false;

    public void showProgress() {
        ViewUtils.showDialogSafety(this.progressDialog);
    }

    public void hideProgress() {
        ViewUtils.dismissDialogSafety(this.progressDialog);
    }

    @Override // com.vkontakte.android.activities.TabletsDialogActivity, com.vkontakte.android.VKActivity, android.support.v7.app.AppCompatActivity, android.support.v4.app.FragmentActivity, android.support.v4.app.BaseFragmentActivityGingerbread, android.app.Activity
    public void onCreate(Bundle b) {
        super.onCreate(b);
        this.progressDialog = new ProgressDialog(this);
        this.progressDialog.setMessage(getString(R.string.loading));
        try {
            if (this.controller == null) {
                this.controller = VerificationControllerImpl.registration(this);
            }
        } catch (Exception e) {
            L.e(e, new Object[0]);
        }
        setDialogWindowBackgroundResource(R.color.cards_bg);
        setContentView(R.layout.toolbar_activity);
        Toolbar toolbar = (Toolbar) findViewById(R.id.toolbar);
        this.progress = new ActionBarProgressDrawable(toolbar.getBackground()) { // from class: com.vkontakte.android.activities.SignupActivity.1
            {
                SignupActivity.this = this;
            }

            @Override // android.graphics.drawable.Drawable
            public void invalidateSelf() {
                super.invalidateSelf();
                View abv = ActionBarHacks.getActionBar(SignupActivity.this);
                if (abv != null) {
                    abv.postInvalidate();
                }
            }
        };
        setSupportActionBar(toolbar);
        ActionBar actionBar = getSupportActionBar();
        if (actionBar != null) {
            actionBar.setDisplayHomeAsUpEnabled(true);
            actionBar.setBackgroundDrawable(this.progress);
        }
        this.progress.setStepCount(4);
        this.wrap = (FrameLayout) findViewById(R.id.fragment_wrapper);
        this.profileFragment = new SignupProfileFragment();
        this.profileFragment.setOnDoneFunc(SignupActivity$$Lambda$1.lambdaFactory$(this));
        FragmentTransaction ft = getFragmentManager().beginTransaction();
        ft.add(R.id.fragment_wrapper, this.profileFragment).commit();
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
                        onProfileFragmentDone();
                        return true;
                    case 1:
                        onPhoneDone();
                        return true;
                    case 2:
                        onCodeDone();
                        return true;
                    case 3:
                        onPassDone();
                        return true;
                    default:
                        return true;
                }
            default:
                return super.onOptionsItemSelected(item);
        }
    }

    public void onProfileFragmentDone() {
        if (this.profileFragment.isFilled() == 1) {
            this.firstName = this.profileFragment.getFirstName();
            this.lastName = this.profileFragment.getLastName();
            this.gender = this.profileFragment.getGender();
            this.bdate = this.profileFragment.getBDate();
            this.photo = this.profileFragment.getPhoto();
            this.mPhotoLeft = this.profileFragment.getPhotoLeft();
            this.mPhotoTop = this.profileFragment.getPhotoTop();
            this.mPhotoRight = this.profileFragment.getPhotoRight();
            this.mPhotoBottom = this.profileFragment.getPhotoBottom();
            setStep(1);
        }
    }

    public void onPhoneDone() {
        if (this.phoneFragment.isFilled()) {
            this.number = this.phoneFragment.getNumber();
            requestCode(this.sid, false, SignupActivity$$Lambda$2.lambdaFactory$(this), true);
        }
    }

    public /* synthetic */ void lambda$onPhoneDone$0() {
        setStep(2);
    }

    public void onCodeDone() {
        String code = this.codeFragment.getCode();
        if (TextUtils.isEmpty(code)) {
            showError(getString(R.string.signup_code_incorrect));
        } else {
            verifyCode(code);
        }
    }

    public void setStep(int step) {
        this.curStep = step;
        this.wrap.postDelayed(SignupActivity$$Lambda$3.lambdaFactory$(this), 100L);
        setTitle(titles[step]);
        if (step == 0) {
            FragmentTransaction ft = getFragmentManager().beginTransaction();
            ft.replace(R.id.fragment_wrapper, this.profileFragment).commit();
        }
        if (step == 1) {
            if (this.phoneFragment == null) {
                this.phoneFragment = new SignupPhoneFragment();
                this.phoneFragment.setOnDoneFunc(SignupActivity$$Lambda$4.lambdaFactory$(this));
            }
            FragmentTransaction ft2 = getFragmentManager().beginTransaction();
            ft2.replace(R.id.fragment_wrapper, this.phoneFragment).commit();
        }
        if (step == 2) {
            String phoneNumber = this.phoneFragment.getNumber();
            if (this.codeFragment == null) {
                this.codeFragment = SignupCodeFragment.create(phoneNumber, this.libverifySupport);
                this.codeFragment.setOnResendListener(SignupActivity$$Lambda$5.lambdaFactory$(this));
                this.codeFragment.setOnDoneFunc(SignupActivity$$Lambda$6.lambdaFactory$(this));
            }
            FragmentTransaction ft3 = getFragmentManager().beginTransaction();
            ft3.replace(R.id.fragment_wrapper, this.codeFragment).commit();
            if (this.libverifySupport) {
                try {
                    this.controller.onStart(phoneNumber);
                } catch (Exception e) {
                    L.e(e, new Object[0]);
                }
            }
        }
        if (step == 3) {
            if (this.passwordFragment == null) {
                this.passwordFragment = new SignupPasswordFragment();
                this.passwordFragment.setOnDoneFunc(SignupActivity$$Lambda$7.lambdaFactory$(this));
            }
            FragmentTransaction ft4 = getFragmentManager().beginTransaction();
            ft4.replace(R.id.fragment_wrapper, this.passwordFragment).commitAllowingStateLoss();
        }
    }

    public /* synthetic */ void lambda$setStep$1() {
        this.progress.setStepAnimated(this.curStep);
    }

    public /* synthetic */ void lambda$setStep$2(boolean voice, Runnable action) {
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
            completeSignup();
        }
    }

    /* renamed from: com.vkontakte.android.activities.SignupActivity$2 */
    /* loaded from: classes2.dex */
    public class AnonymousClass2 implements Callback<Pair<String, Boolean>> {
        final /* synthetic */ Runnable val$runAfter;

        AnonymousClass2(Runnable runnable) {
            SignupActivity.this = this$0;
            this.val$runAfter = runnable;
        }

        @Override // com.vkontakte.android.api.Callback
        public void success(Pair<String, Boolean> sid) {
            SignupActivity.this.sid = (String) sid.first;
            SignupActivity.this.libverifySupport = ((Boolean) sid.second).booleanValue();
            if (this.val$runAfter != null) {
                this.val$runAfter.run();
            }
        }

        @Override // com.vkontakte.android.api.Callback
        public void fail(VKAPIRequest.VKErrorResponse error) {
            int errorCode = error.getCodeValue();
            if (errorCode != 14) {
                if (errorCode == -1) {
                    SignupActivity.this.showError(SignupActivity.this.getString(R.string.err_text));
                } else if (errorCode == 1004) {
                    new VKAlertDialog.Builder(SignupActivity.this).setTitle(R.string.error).setMessage(R.string.signup_phone_already_used).setPositiveButton(R.string.signup_btn_restore, SignupActivity$2$$Lambda$1.lambdaFactory$(this)).setNegativeButton(R.string.ok, (DialogInterface.OnClickListener) null).show();
                } else if (errorCode == 9 || errorCode == 1112) {
                    if (TextUtils.isEmpty(error.description)) {
                        SignupActivity.this.showError(SignupActivity.this.getString(R.string.signup_flood));
                    } else {
                        SignupActivity.this.showError(error.description);
                    }
                } else if (errorCode == 1000) {
                    SignupActivity.this.showError(SignupActivity.this.getString(R.string.signup_invalid_phone));
                } else if (errorCode != 100) {
                    SignupActivity.this.showError(error);
                } else if (error.message.contains("first_name") || error.message.contains("last_name")) {
                    SignupActivity.this.showError(SignupActivity.this.getString(R.string.signup_invalid_name));
                    SignupActivity.this.setStep(0);
                } else if (error.message.contains(SignupPhoneFragment.KEY_PHONE)) {
                    SignupActivity.this.showError(SignupActivity.this.getString(R.string.signup_invalid_phone_format));
                } else {
                    SignupActivity.this.showError(error);
                }
            }
        }

        public /* synthetic */ void lambda$fail$0(DialogInterface dialog, int which) {
            Intent intent = new Intent(SignupActivity.this, RestoreActivity.class);
            intent.putExtra(SignupPhoneFragment.KEY_PHONE, SignupActivity.this.number);
            SignupActivity.this.startActivityForResult(intent, 203);
        }
    }

    private void requestCode(String sid, boolean voice, Runnable runAfter, boolean libVerSupp) {
        new AuthSignup(this.firstName, this.lastName, this.gender, this.bdate, this.number, sid, voice, libVerSupp).setCallback(new AnonymousClass2(runAfter)).wrapProgress(this).exec((Context) this);
    }

    private void verifyCode(String code) {
        if (!TextUtils.isEmpty(code)) {
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
            verify(new AuthConfirm(this.number, code, null));
        }
    }

    private void verifyLibverifyToken(String session, String token) {
        this.libverifySessionId = session;
        this.libverifyToken = token;
        if (!TextUtils.isEmpty(session) && !TextUtils.isEmpty(token) && !TextUtils.isEmpty(this.sid)) {
            verify(new AuthConfirm(this.number, this.code, this.sid, session, token));
        }
    }

    private void verify(AuthConfirm authConfirm) {
        authConfirm.setCallback(new Callback<Integer>() { // from class: com.vkontakte.android.activities.SignupActivity.3
            {
                SignupActivity.this = this;
            }

            @Override // com.vkontakte.android.api.Callback
            public void success(Integer uid) {
            }

            @Override // com.vkontakte.android.api.Callback
            public void fail(VKAPIRequest.VKErrorResponse error) {
                int errorCode = error.getCodeValue();
                if (errorCode != 14) {
                    if (errorCode == 1110) {
                        SignupActivity.this.showError(SignupActivity.this.getString(R.string.signup_code_incorrect));
                    } else if (errorCode == 1111) {
                        SignupActivity.this.setStep(3);
                        SignupActivity.this.code = SignupActivity.this.code;
                    } else if (errorCode == -1) {
                        SignupActivity.this.showError(SignupActivity.this.getString(R.string.err_text));
                    } else {
                        SignupActivity.this.showError(error);
                    }
                }
            }
        }).wrapProgress(this).exec((Context) this);
    }

    private void completeSignup() {
        if (this.libverifySupport) {
            complete(new AuthConfirm(this.number, this.password, this.sid, this.libverifySessionId, this.libverifyToken));
        } else {
            complete(new AuthConfirm(this.number, this.code, this.password));
        }
    }

    private void complete(AuthConfirm authConfirm) {
        authConfirm.setCallback(new Callback<Integer>() { // from class: com.vkontakte.android.activities.SignupActivity.4
            {
                SignupActivity.this = this;
            }

            @Override // com.vkontakte.android.api.Callback
            public void success(Integer uid) {
                MyTracker.trackRegistrationEvent();
                Intent intent = new Intent();
                intent.putExtra("auth_state", VKAuthState.byLoginPassword(SignupActivity.this.number, SignupActivity.this.password));
                SignupActivity.this.setResult(-1, intent);
                SignupActivity.this.finish();
                if (SignupActivity.this.photo != null) {
                    Upload.start(SignupActivity.this, new ProfilePhotoUploadTask(SignupActivity.this, SignupActivity.this.photo, VKAccountManager.getCurrent().getUid(), true, SignupActivity.this.mPhotoLeft, SignupActivity.this.mPhotoTop, SignupActivity.this.mPhotoRight, SignupActivity.this.mPhotoBottom));
                }
            }

            @Override // com.vkontakte.android.api.Callback
            public void fail(VKAPIRequest.VKErrorResponse error) {
                int errorCode = error.getCodeValue();
                if (errorCode != 14) {
                    if (errorCode == 1110) {
                        SignupActivity.this.showError(SignupActivity.this.getString(R.string.signup_code_incorrect));
                    } else if (errorCode != 1111) {
                        if (errorCode == -1) {
                            SignupActivity.this.showError(SignupActivity.this.getString(R.string.err_text));
                        } else {
                            SignupActivity.this.showError(error);
                        }
                    }
                }
            }
        }).wrapProgress(this).exec((Context) this);
    }

    public void showError(VKAPIRequest.VKErrorResponse error) {
        showError(error.message);
    }

    public void showError(String err) {
        if ("I/O Error".equals(err)) {
            err = VKApplication.context.getString(R.string.network_error_description);
        }
        new VKAlertDialog.Builder(this).setTitle(R.string.error).setMessage(err).setPositiveButton(R.string.ok, (DialogInterface.OnClickListener) null).show();
    }

    @Override // com.vkontakte.android.VKActivity, android.support.v4.app.FragmentActivity, android.app.Activity
    public void onBackPressed() {
        try {
            if (this.controller.onCancel()) {
                if (this.curStep == 2) {
                    setStep(1);
                    return;
                }
                return;
            }
        } catch (Exception e) {
            L.e(e, new Object[0]);
        }
        if (this.curStep == 3) {
            setStep(1);
        } else if (this.curStep == 0) {
            setResult(0);
            finish();
        } else {
            setStep(this.curStep - 1);
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.vkontakte.android.VKActivity, android.support.v4.app.FragmentActivity, android.app.Activity
    public void onActivityResult(int requestCode, int resultCode, Intent intent) {
        super.onActivityResult(requestCode, resultCode, intent);
        if (resultCode == -1 && requestCode == 203 && intent != null) {
            String accessToken = intent.getStringExtra("access_token");
            String secret = intent.getStringExtra("secret");
            int userId = intent.getIntExtra("user_id", 0);
            if (userId != 0 && !TextUtils.isEmpty(accessToken) && !TextUtils.isEmpty(secret)) {
                Intent intent2 = new Intent();
                intent2.putExtra("auth_state", VKAuthState.byAuthData(accessToken, secret, userId));
                setResult(-1, intent2);
            }
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
