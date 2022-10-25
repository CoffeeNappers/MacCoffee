package com.vkontakte.android.fragments;

import android.app.Activity;
import android.app.ProgressDialog;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.Bundle;
import android.support.annotation.NonNull;
import android.telephony.SmsMessage;
import android.text.Editable;
import android.text.Html;
import android.text.Spannable;
import android.text.SpannableStringBuilder;
import android.text.TextUtils;
import android.text.TextWatcher;
import android.view.KeyEvent;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.widget.EditText;
import android.widget.TextView;
import com.fasterxml.jackson.core.util.MinimalPrettyPrinter;
import com.vkontakte.android.R;
import com.vkontakte.android.VKAlertDialog;
import com.vkontakte.android.VKApplication;
import com.vkontakte.android.ViewUtils;
import com.vkontakte.android.api.Callback;
import com.vkontakte.android.api.ResultlessCallback;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.api.auth.AuthValidatePhone;
import com.vkontakte.android.auth.VKAuthState;
import com.vkontakte.android.auth.libverify.VerificationControllerImpl;
import com.vkontakte.android.navigation.Navigator;
import com.vkontakte.android.ui.cardview.CardDrawable;
import com.vkontakte.android.utils.L;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import me.grishka.appkit.utils.V;
import ru.mail.libverify.api.VerificationApi;
import ru.mail.libverify.controls.VerificationController;
import ru.mail.libverify.controls.VerificationListener;
/* loaded from: classes2.dex */
public class AuthCheckFragment extends VKToolbarFragment implements View.OnClickListener, TextWatcher, VerificationApi.SmsCodeNotificationListener, VerificationListener {
    public static final String KEY_CODE = "code";
    public static final String KEY_SESSION = "session";
    public static final String KEY_TOKEN = "token";
    private View buttonRetry;
    private VerificationControllerImpl controller;
    private EditText editText;
    private long initTime;
    private ProgressDialog progressDialog;
    private BroadcastReceiver receiver = new BroadcastReceiver() { // from class: com.vkontakte.android.fragments.AuthCheckFragment.1
        @Override // android.content.BroadcastReceiver
        public void onReceive(Context context, Intent intent) {
            if ("android.provider.Telephony.SMS_RECEIVED".equals(intent.getAction())) {
                Object[] pdus = (Object[]) intent.getExtras().get("pdus");
                SmsMessage sms = SmsMessage.createFromPdu((byte[]) pdus[0]);
                if (sms.getTimestampMillis() > AuthCheckFragment.this.initTime && AuthCheckFragment.this.view != null) {
                    AuthCheckFragment.this.processSms(sms.getMessageBody());
                }
            }
        }
    };
    private TextView textInfo1;
    private TextView textInfo2;
    private View view;

    /* loaded from: classes2.dex */
    public static class Builder extends Navigator {
        public static final String AUTH_STATE = "auth_state";
        private static final String CODE = "code";
        private static final String IS_LIBVERIFY = "is_libverify";
        private static final String IS_SMS = "is_sms";
        private static final String LIBVERIFY_PHONE = "libverify_phone";
        private static final String PHONE = "phone";
        private static final String PHONE_MASK = "phoneMask";
        private static final String SID = "sid";
        private static final String VALIDATE_PHONE_ON_START = "validate_phone_on_start";

        public Builder(String phone, String phoneMask, boolean isSms, String sid) {
            super(AuthCheckFragment.class);
            this.args.putString("phone", phone);
            this.args.putString(PHONE_MASK, phoneMask);
            this.args.putBoolean(IS_SMS, isSms);
            this.args.putString(SID, sid);
        }

        public Builder validatePhoneOnStart() {
            this.args.putBoolean(VALIDATE_PHONE_ON_START, true);
            return this;
        }

        public Builder setCode(String code) {
            this.args.putString("code", code);
            return this;
        }

        public Builder setLoginHelper(VKAuthState helper) {
            this.args.putParcelable("auth_state", helper);
            return this;
        }

        public Builder setIsLibverify(String phone) {
            this.args.putBoolean(IS_LIBVERIFY, true);
            this.args.putString(LIBVERIFY_PHONE, phone);
            return this;
        }
    }

    @Override // ru.mail.libverify.api.VerificationApi.SmsCodeNotificationListener
    public void onNotification(@NonNull String s) {
        processSms(s);
    }

    private boolean isLibverifySupport() {
        return getArguments() != null && getArguments().getBoolean("is_libverify", false);
    }

    private String getLibverifyPhone() {
        return getArguments() == null ? "" : getArguments().getString("libverify_phone", "");
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void processSms(String msg) {
        if (!TextUtils.isEmpty(msg)) {
            ViewUtils.runOnUiThread(AuthCheckFragment$$Lambda$1.lambdaFactory$(this, msg));
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$processSms$1(String msg) {
        Pattern ptn = Pattern.compile("(?:VK|ВКонтакте).*?([0-9]+).*", 40);
        Matcher m = ptn.matcher(msg);
        if (m.find()) {
            String code = m.group(1);
            if (this.editText != null) {
                this.editText.setText(code);
                this.editText.postDelayed(AuthCheckFragment$$Lambda$3.lambdaFactory$(this, code), 500L);
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$null$0(String code) {
        Activity activity = getActivity();
        if (activity != null) {
            setResultAndFinish(code);
        }
    }

    public void showProgress() {
        ViewUtils.showDialogSafety(this.progressDialog);
    }

    public void hideProgress() {
        ViewUtils.dismissDialogSafety(this.progressDialog);
    }

    @Override // android.app.DialogFragment, android.app.Fragment
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setHasOptionsMenu(true);
        this.progressDialog = new ProgressDialog(getActivity());
        this.progressDialog.setMessage(getString(R.string.loading));
        if (savedInstanceState != null) {
            this.initTime = savedInstanceState.getLong("init_time");
        } else {
            this.initTime = System.currentTimeMillis();
        }
        if (!isLibverifySupport()) {
            VKApplication.context.registerReceiver(this.receiver, new IntentFilter("android.provider.Telephony.SMS_RECEIVED"));
        }
        if (getArguments() != null && getArguments().getBoolean("validate_phone_on_start", false)) {
            new AuthValidatePhone(getArguments().getString("sid"), getPhone(), false).wrapProgress(getActivity()).exec((Context) getActivity()).setCallback(new Callback<Boolean>() { // from class: com.vkontakte.android.fragments.AuthCheckFragment.2
                @Override // com.vkontakte.android.api.Callback
                public void success(Boolean result) {
                    if (result != null && !result.booleanValue()) {
                        AuthCheckFragment.this.showError(AuthCheckFragment.this.getString(R.string.signup_invalid_phone));
                    }
                }

                @Override // com.vkontakte.android.api.Callback
                public void fail(VKAPIRequest.VKErrorResponse error) {
                    AuthCheckFragment.this.showError(AuthCheckFragment.this.getString(R.string.signup_invalid_phone));
                }
            });
        }
    }

    @Override // android.app.Fragment
    public void onResume() {
        super.onResume();
        try {
            boolean needStart = this.controller == null;
            if (this.controller == null) {
                this.controller = VerificationControllerImpl.auth(getActivity());
            }
            this.controller.subscribeSmsNotificationListener(this);
            this.controller.setListener(this);
            if (needStart && isLibverifySupport()) {
                this.controller.onStart(getLibverifyPhone());
            }
        } catch (Exception e) {
            L.e(e, new Object[0]);
        }
    }

    @Override // android.app.Fragment
    public void onPause() {
        try {
            this.controller.unSubscribeSmsNotificationListener(this);
            this.controller.setListener(null);
        } catch (Exception e) {
            L.e(e, new Object[0]);
        }
        super.onPause();
    }

    @Override // android.app.Fragment
    public boolean onOptionsItemSelected(MenuItem item) {
        if (item.getItemId() != R.id.done || this.editText == null) {
            return super.onOptionsItemSelected(item);
        }
        String code = this.editText.getText().toString();
        if (!TextUtils.isEmpty(code)) {
            setResultAndFinish(code);
        }
        return true;
    }

    private void setResultAndFinish(String code) {
        Activity activity = getActivity();
        if (isLibverifySupport()) {
            try {
                if (this.controller.isValidSmsCode(code)) {
                    this.controller.onEnterSmsCode(code);
                } else {
                    onError(VerificationApi.FailReason.INCORRECT_SMS_CODE);
                }
            } catch (Exception e) {
                L.e(e, new Object[0]);
            }
        } else if (activity != null) {
            activity.setResult(-1, new Intent().putExtra(KEY_CODE, code).putExtra("auth_state", getArguments().getParcelable("auth_state")));
            activity.finish();
        }
    }

    private void setResultAndFinish(String session, String token) {
        Activity activity = getActivity();
        if (activity != null) {
            activity.setResult(-1, new Intent().putExtra("session", session).putExtra(KEY_TOKEN, token).putExtra("auth_state", getArguments().getParcelable("auth_state")));
            activity.finish();
        }
    }

    @Override // android.app.Fragment
    public void onCreateOptionsMenu(Menu menu, MenuInflater inflater) {
        inflater.inflate(R.menu.submit_code, menu);
        menu.findItem(R.id.done).setEnabled(this.editText != null && !TextUtils.isEmpty(this.editText.getText()));
        super.onCreateOptionsMenu(menu, inflater);
    }

    @Override // android.app.Fragment
    public void onDestroy() {
        super.onDestroy();
        try {
            if (!isLibverifySupport()) {
                VKApplication.context.unregisterReceiver(this.receiver);
            }
        } catch (Exception e) {
        }
    }

    @Override // me.grishka.appkit.fragments.AppKitFragment, android.app.DialogFragment, android.app.Fragment
    public void onSaveInstanceState(Bundle state) {
        super.onSaveInstanceState(state);
        state.putLong("init_time", this.initTime);
    }

    @Override // me.grishka.appkit.fragments.AppKitFragment, android.app.Fragment
    public void onAttach(Activity activity) {
        super.onAttach(activity);
        setTitle(R.string.security_check_title);
    }

    @Override // me.grishka.appkit.fragments.ToolbarFragment, me.grishka.appkit.fragments.AppKitFragment, android.app.DialogFragment, android.app.Fragment
    public void onDestroyView() {
        super.onDestroyView();
        this.view = null;
        this.editText = null;
        this.textInfo1 = null;
        this.textInfo2 = null;
        this.buttonRetry = null;
    }

    @Override // me.grishka.appkit.fragments.ToolbarFragment
    public View onCreateContentView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        boolean sms = getArguments().getBoolean("is_sms");
        this.view = inflater.inflate(R.layout.two_f_a_fragment, container, false);
        this.editText = (EditText) this.view.findViewById(R.id.edit_text);
        this.textInfo1 = (TextView) this.view.findViewById(R.id.text_info_1);
        this.textInfo2 = (TextView) this.view.findViewById(R.id.text_info_2);
        this.buttonRetry = this.view.findViewById(R.id.auth_2fa_retry);
        this.editText.addTextChangedListener(this);
        this.editText.setText(getArguments().getString(KEY_CODE, ""));
        this.editText.setImeOptions(6);
        this.editText.setOnEditorActionListener(AuthCheckFragment$$Lambda$2.lambdaFactory$(this));
        if (sms) {
            this.view.postDelayed(new TimeUpdater(), 500L);
        } else {
            this.textInfo2.setVisibility(8);
            this.buttonRetry.setVisibility(0);
        }
        this.buttonRetry.setOnClickListener(this);
        View topBlock = this.view.findViewById(R.id.top_block);
        int pl = topBlock.getPaddingLeft();
        int pt = topBlock.getPaddingTop();
        int pr = topBlock.getPaddingRight();
        int pb = topBlock.getPaddingBottom();
        topBlock.setBackgroundDrawable(new CardDrawable(getResources(), -1, V.dp(2.0f), !this.isTablet));
        topBlock.setPadding(pl, pt, pr, pb);
        updateText(sms);
        return this.view;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ boolean lambda$onCreateContentView$2(TextView v, int actionId, KeyEvent event) {
        String code = v.getText().toString();
        if (actionId != 6 || TextUtils.isEmpty(code)) {
            return false;
        }
        setResultAndFinish(code);
        return true;
    }

    @Override // android.view.View.OnClickListener
    public void onClick(View v) {
        resendCode();
    }

    @Override // android.text.TextWatcher
    public void beforeTextChanged(CharSequence s, int start, int count, int after) {
    }

    @Override // android.text.TextWatcher
    public void onTextChanged(CharSequence s, int start, int before, int count) {
    }

    @Override // android.text.TextWatcher
    public void afterTextChanged(Editable s) {
        invalidateOptionsMenu();
    }

    private void updateText(boolean sms) {
        if (this.textInfo1 != null) {
            if (sms) {
                this.textInfo1.setText(Html.fromHtml(getString(R.string.auth_2fa_sms, new Object[]{getArguments().getString("phoneMask")})));
            } else {
                this.textInfo1.setText(Html.fromHtml(getString(R.string.auth_2fa_app)));
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void resendCode() {
        updateText(true);
        ResultlessCallback callback = new ResultlessCallback(this) { // from class: com.vkontakte.android.fragments.AuthCheckFragment.3
            @Override // com.vkontakte.android.api.ResultlessCallback
            public void success() {
                ViewUtils.setVisibility(AuthCheckFragment.this.textInfo2, 0);
                ViewUtils.setText(AuthCheckFragment.this.textInfo2, Integer.valueOf((int) R.string.auth_sms_resent));
                ViewUtils.setVisibility(AuthCheckFragment.this.buttonRetry, 8);
            }

            @Override // com.vkontakte.android.api.SimpleCallback, com.vkontakte.android.api.Callback
            public void fail(VKAPIRequest.VKErrorResponse error) {
                ViewUtils.setVisibility(AuthCheckFragment.this.textInfo2, 8);
                ViewUtils.setVisibility(AuthCheckFragment.this.buttonRetry, 0);
            }
        };
        if (isLibverifySupport()) {
            try {
                this.controller.onResendSms();
                callback.success();
                return;
            } catch (Exception e) {
                callback.fail(null);
                L.e(e, new Object[0]);
                return;
            }
        }
        new AuthValidatePhone(getArguments().getString("sid"), getPhone(), false).setCallback(callback).wrapProgress(getActivity()).exec((Context) getActivity());
    }

    public String getPhone() {
        if (getArguments() == null) {
            return null;
        }
        return getArguments().getString(SignupPhoneFragment.KEY_PHONE);
    }

    /* loaded from: classes2.dex */
    private class TimeUpdater implements Runnable {
        private TimeUpdater() {
        }

        @Override // java.lang.Runnable
        public void run() {
            if (AuthCheckFragment.this.view != null) {
                long time = 60 - ((System.currentTimeMillis() - AuthCheckFragment.this.initTime) / 1000);
                if (time < 0) {
                    AuthCheckFragment.this.resendCode();
                    return;
                }
                SpannableStringBuilder ssb = new SpannableStringBuilder().append((CharSequence) AuthCheckFragment.this.getString(R.string.signup_code_waiting)).append((CharSequence) MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR);
                ssb.append((CharSequence) Spannable.Factory.getInstance().newSpannable(String.format("%d:%02d", Long.valueOf(time / 60), Long.valueOf(time % 60))));
                AuthCheckFragment.this.textInfo2.setText(ssb);
                AuthCheckFragment.this.view.postDelayed(this, 500L);
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
        setResultAndFinish(sessionId, token);
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

    /* JADX INFO: Access modifiers changed from: private */
    public void showError(String err) {
        Activity activity = getActivity();
        if (activity != null) {
            new VKAlertDialog.Builder(activity).setTitle(R.string.error).setMessage(err).setPositiveButton(R.string.ok, (DialogInterface.OnClickListener) null).show();
        }
    }
}
