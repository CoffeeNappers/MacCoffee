package com.vkontakte.android;

import android.accounts.AccountAuthenticatorActivity;
import android.app.ProgressDialog;
import android.content.DialogInterface;
import android.content.Intent;
import android.os.Build;
import android.os.Bundle;
import android.support.annotation.Nullable;
import android.text.TextUtils;
import android.view.KeyEvent;
import android.view.View;
import android.view.inputmethod.InputMethodManager;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;
import com.facebook.CallbackManager;
import com.facebook.FacebookCallback;
import com.facebook.FacebookException;
import com.facebook.FacebookSdk;
import com.facebook.login.LoginManager;
import com.facebook.login.LoginResult;
import com.my.tracker.MyTracker;
import com.vkontakte.android.VKAlertDialog;
import com.vkontakte.android.activities.LogoutReceiver;
import com.vkontakte.android.activities.RestoreActivity;
import com.vkontakte.android.activities.SignupActivity;
import com.vkontakte.android.auth.VKAccountManager;
import com.vkontakte.android.auth.VKAuth;
import com.vkontakte.android.auth.VKAuthHelper;
import com.vkontakte.android.auth.VKAuthState;
import com.vkontakte.android.auth.VKAuthUtils;
import com.vkontakte.android.fragments.AuthCheckFragment;
import com.vkontakte.android.ui.Font;
import com.vkontakte.android.ui.XFrameLayout;
import java.util.Arrays;
/* loaded from: classes2.dex */
public class AuthActivity extends AccountAuthenticatorActivity implements View.OnClickListener, FacebookCallback<LoginResult> {
    private static final int REGISTER_RESULT = 500;
    private static final int RESTORE_RESULT = 203;
    private CallbackManager fbCallbackMgr;
    ProgressDialog progress;
    public static boolean active = false;
    private static int[] CLICKABLE_VIEWS = {R.id.auth_login_btn, R.id.auth_signup_btn, R.id.auth_fb_btn, R.id.auth_forgot};
    private static int[] MEDIUM_VIEWS = {R.id.auth_forgot, R.id.auth_login_btn, R.id.auth_signup_btn, R.id.fb_text};
    private LogoutReceiver logoutReceiver = null;
    private VKAuthHelper authHelper = new VKAuthHelper(this) { // from class: com.vkontakte.android.AuthActivity.1
        {
            AuthActivity.this = this;
        }

        @Override // com.vkontakte.android.auth.VKAuth.AuthListener
        public void onAuthStart() {
            AuthActivity.this.showAuthProcess();
        }

        @Override // com.vkontakte.android.auth.VKAuth.AuthListener
        public void onAuthFinish(int result, @Nullable VKAuth.AuthAnswer answer) {
            AuthActivity.this.hideAuthProcess();
            if (result == 1) {
                try {
                    InputMethodManager imm = (InputMethodManager) AuthActivity.this.getSystemService("input_method");
                    View view = AuthActivity.this.getCurrentFocus();
                    if (view != null) {
                        imm.hideSoftInputFromWindow(view.getWindowToken(), 0);
                    }
                } catch (Exception e) {
                }
                AuthActivity.this.setResult(-1);
                if (AuthActivity.this.getIntent().hasExtra("accountAuthenticatorResponse")) {
                    try {
                        Bundle res = new Bundle();
                        res.putString("authAccount", VKAccountManager.getCurrent().getName());
                        res.putString("accountType", VKAuth.ACCOUNT_TYPE);
                        AuthActivity.this.setAccountAuthenticatorResult(res);
                    } catch (Exception e2) {
                    }
                }
                AuthActivity.this.finish();
            } else if (answer != null && !TextUtils.isEmpty(answer.concatError) && answer.concatError.contains(AuthCheckFragment.KEY_CODE)) {
                AuthActivity.this.doAuth();
            } else {
                showErrorMessage(AuthActivity.this, false, result, answer);
            }
        }

        @Override // com.vkontakte.android.auth.VKAuthHelper, com.vkontakte.android.auth.VKAuth.AuthListener
        public void onAuthNeedValidation(VKAuthState helper, VKAuth.AuthAnswer answer) {
            super.onAuthNeedValidation(helper, answer);
            AuthActivity.this.hideAuthProcess();
        }
    };

    @Override // android.app.Activity
    protected void onPause() {
        super.onPause();
        AppStateTracker.onActivityPaused();
    }

    @Override // android.app.Activity
    protected void onResume() {
        super.onResume();
        AppStateTracker.onActivityResumed(this);
    }

    @Override // android.accounts.AccountAuthenticatorActivity, android.app.Activity
    public void onCreate(Bundle savedInstanceState) {
        int[] iArr;
        int[] iArr2;
        super.onCreate(savedInstanceState);
        this.logoutReceiver = LogoutReceiver.register(this);
        this.progress = new ProgressDialog(this);
        this.progress.setMessage(getString(R.string.loading));
        if (getIntent().hasExtra("accountAuthenticatorResponse") && VKAccountManager.getCurrent().isReal() && VKAuthUtils.hasSystemAccount()) {
            if (Build.VERSION.SDK_INT >= 11) {
                setTheme(16973931);
            }
            new VKAlertDialog.Builder(this).setTitle(R.string.error).setMessage(R.string.already_logged_in).setPositiveButton(R.string.ok, AuthActivity$$Lambda$1.lambdaFactory$(this)).setOnCancelListener(AuthActivity$$Lambda$2.lambdaFactory$(this)).show();
            return;
        }
        setContentView(R.layout.auth);
        for (int id : MEDIUM_VIEWS) {
            TextView textView = (TextView) findViewById(id);
            if (textView != null) {
                textView.setTypeface(Font.Medium.typeface);
            }
        }
        for (int id2 : CLICKABLE_VIEWS) {
            View view = findViewById(id2);
            if (view != null) {
                view.setOnClickListener(this);
            }
        }
        ((EditText) findViewById(R.id.auth_pass)).setOnEditorActionListener(AuthActivity$$Lambda$3.lambdaFactory$(this));
        View facebookView = findViewById(R.id.auth_fb_btn);
        View facebookDivider = findViewById(R.id.divider);
        if (facebookView.getVisibility() == 0) {
            XFrameLayout xFrameLayout = (XFrameLayout) findViewById(R.id.auth);
            xFrameLayout.setOnKeyboardStateListener(AuthActivity$$Lambda$4.lambdaFactory$(facebookView, facebookDivider));
        }
        active = true;
    }

    public /* synthetic */ void lambda$onCreate$0(DialogInterface dialog, int which) {
        finish();
    }

    public /* synthetic */ void lambda$onCreate$1(DialogInterface dialog) {
        finish();
    }

    public /* synthetic */ boolean lambda$onCreate$2(TextView v, int actionId, KeyEvent event) {
        doAuth();
        return true;
    }

    public static /* synthetic */ void lambda$onCreate$3(View facebookView, View facebookDivider, boolean visible) {
        int i = 8;
        ViewUtils.setVisibility(facebookView, visible ? 8 : 0);
        if (!visible) {
            i = 0;
        }
        ViewUtils.setVisibility(facebookDivider, i);
    }

    @Override // android.app.Activity
    protected void onStart() {
        super.onStart();
        MyTracker.onStartActivity(this);
    }

    @Override // android.app.Activity
    protected void onStop() {
        super.onStop();
        MyTracker.onStopActivity(this);
    }

    public void showAuthProcess() {
        ViewUtils.showDialogSafety(this.progress);
        ViewUtils.setEnabled(findViewById(R.id.auth_login_btn), false);
    }

    public void hideAuthProcess() {
        ViewUtils.dismissDialogSafety(this.progress);
        ViewUtils.setEnabled(findViewById(R.id.auth_login_btn), true);
    }

    @Override // android.view.View.OnClickListener
    public void onClick(View v) {
        switch (v.getId()) {
            case R.id.auth_forgot /* 2131755584 */:
                Intent intent = new Intent(this, RestoreActivity.class);
                startActivityForResult(intent, 203);
                return;
            case R.id.auth_login_btn /* 2131755585 */:
                doAuth();
                return;
            case R.id.space3 /* 2131755586 */:
            default:
                return;
            case R.id.auth_signup_btn /* 2131755587 */:
                startActivityForResult(new Intent(this, SignupActivity.class), REGISTER_RESULT);
                return;
            case R.id.auth_fb_btn /* 2131755588 */:
                doFacebookAuth();
                return;
        }
    }

    @Override // android.app.Activity
    public void onDestroy() {
        this.logoutReceiver.unregister();
        super.onDestroy();
        active = false;
    }

    @Override // android.app.Activity, android.view.KeyEvent.Callback
    public boolean onKeyDown(int code, KeyEvent evt) {
        if (code == 4) {
            setResult(0);
            finish();
            return true;
        }
        return super.onKeyDown(code, evt);
    }

    @Override // android.app.Activity
    protected void onActivityResult(int requestCode, int resultCode, Intent intent) {
        VKAuthState authState;
        if (!this.authHelper.onActivityResult(requestCode, resultCode, intent)) {
            if (resultCode == 1 && requestCode == 203) {
                openBrowser("https://oauth.vk.com/restore?scope=nohttps,all&client_id=2274003&client_secret=hHbZxrka2uZ6jB1inYsH");
            } else if (resultCode == -1 && requestCode == 203) {
                if (intent != null) {
                    String accessToken = intent.getStringExtra("access_token");
                    String secret = intent.getStringExtra("secret");
                    int userId = intent.getIntExtra("user_id", 0);
                    if (userId != 0 && !TextUtils.isEmpty(accessToken) && !TextUtils.isEmpty(secret)) {
                        VKAuth.authAsync(VKAuthState.byAuthData(accessToken, secret, userId), this.authHelper);
                    }
                }
            } else if (resultCode == -1 && requestCode == REGISTER_RESULT) {
                if (intent != null && (authState = (VKAuthState) intent.getParcelableExtra("auth_state")) != null) {
                    VKAuth.authAsync(authState, this.authHelper);
                }
            } else if (this.fbCallbackMgr != null) {
                this.fbCallbackMgr.onActivityResult(requestCode, resultCode, intent);
            }
        }
    }

    private void openBrowser(String url) {
        startActivityForResult(new Intent(this, ValidationActivity.class).putExtra("url", url).putExtra(ValidationActivity.KEY_RETURN_RESULT, true), VKAuthHelper.REQUEST_VALIDATE_URL);
    }

    private void doFacebookAuth() {
        if (!FacebookSdk.isInitialized()) {
            FacebookSdk.sdkInitialize(getApplicationContext());
        }
        LoginManager.getInstance().logOut();
        this.fbCallbackMgr = CallbackManager.Factory.create();
        LoginManager.getInstance().registerCallback(this.fbCallbackMgr, this);
        LoginManager.getInstance().logInWithReadPermissions(this, Arrays.asList("email", "user_birthday"));
    }

    private void doExternalSignup(String service, String token) {
        VKAuth.authAsync(VKAuthState.byExternalService(service, token), this.authHelper);
    }

    public void doAuth() {
        String login = ((EditText) findViewById(R.id.auth_login)).getText().toString();
        String pass = ((EditText) findViewById(R.id.auth_pass)).getText().toString();
        doAuth(login, pass);
    }

    private void doAuth(String login, String pass) {
        if (!TextUtils.isEmpty(login) && !TextUtils.isEmpty(pass)) {
            VKAuth.authAsync(VKAuthState.byLoginPassword(login, pass).libverifySupport(), this.authHelper);
        }
    }

    @Override // com.facebook.FacebookCallback
    public void onSuccess(LoginResult loginResult) {
        this.fbCallbackMgr = null;
        if (loginResult.getAccessToken() != null) {
            doExternalSignup("facebook", loginResult.getAccessToken().getToken());
        }
    }

    @Override // com.facebook.FacebookCallback
    public void onCancel() {
        this.fbCallbackMgr = null;
    }

    @Override // com.facebook.FacebookCallback
    public void onError(FacebookException e) {
        this.fbCallbackMgr = null;
        Toast.makeText(this, (int) R.string.error, 1).show();
    }
}
