package com.vkontakte.android.fragments;

import android.animation.LayoutTransition;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.os.Build;
import android.os.Bundle;
import android.telephony.PhoneNumberUtils;
import android.telephony.SmsMessage;
import android.text.Editable;
import android.text.Spannable;
import android.text.SpannableStringBuilder;
import android.text.TextUtils;
import android.text.TextWatcher;
import android.view.KeyEvent;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.inputmethod.InputMethodManager;
import android.widget.EditText;
import android.widget.TextView;
import com.fasterxml.jackson.core.util.MinimalPrettyPrinter;
import com.vkontakte.android.R;
import com.vkontakte.android.VKApplication;
import com.vkontakte.android.functions.VoidF0;
import com.vkontakte.android.ui.cardview.CardDrawable;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import me.grishka.appkit.utils.V;
/* loaded from: classes2.dex */
public class SignupCodeFragment extends VKFragment {
    private static final String KEY_LIBVERIFY_SUPPORT = "key_libverify_support";
    private static final String KEY_NUMBER = "key_number";
    private VoidF0 doneFunc;
    private long initTime;
    private OnResendListener listener;
    private String phoneNumber;
    private BroadcastReceiver receiver = new BroadcastReceiver() { // from class: com.vkontakte.android.fragments.SignupCodeFragment.1
        @Override // android.content.BroadcastReceiver
        public void onReceive(Context context, Intent intent) {
            if ("android.provider.Telephony.SMS_RECEIVED".equals(intent.getAction())) {
                Object[] pdus = (Object[]) intent.getExtras().get("pdus");
                SmsMessage sms = SmsMessage.createFromPdu((byte[]) pdus[0]);
                if (sms.getTimestampMillis() > SignupCodeFragment.this.initTime) {
                    SignupCodeFragment.this.processSms(sms.getMessageBody());
                }
            }
        }
    };
    private CharSequence smsCode;
    private View view;

    /* loaded from: classes2.dex */
    public interface OnResendListener {
        void resendCode(boolean z, Runnable runnable);
    }

    public static SignupCodeFragment create(String phoneNumber, boolean libverifySupport) {
        Bundle bundle = new Bundle();
        bundle.putString(KEY_NUMBER, phoneNumber);
        bundle.putBoolean(KEY_LIBVERIFY_SUPPORT, libverifySupport);
        SignupCodeFragment fragment = new SignupCodeFragment();
        fragment.setArguments(bundle);
        return fragment;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void processSms(String msg) {
        Pattern ptn = Pattern.compile(": ([0-9a-z]+).+(?:VK|ВКонтакте)", 40);
        Matcher m = ptn.matcher(msg);
        if (m.find()) {
            String code = m.group(1);
            TextView textViewSignUpCode = (TextView) this.view.findViewById(R.id.signup_edit_code);
            if (textViewSignUpCode != null) {
                textViewSignUpCode.setText(code);
            }
            this.smsCode = String.valueOf(code);
            if (this.doneFunc != null) {
                this.doneFunc.f();
            }
        }
    }

    @Override // android.app.DialogFragment, android.app.Fragment
    public void onCreate(Bundle b) {
        super.onCreate(b);
        if (b != null) {
            this.initTime = b.getLong("init_time");
        } else {
            this.initTime = System.currentTimeMillis();
        }
        if (TextUtils.isEmpty(this.phoneNumber) && getArguments() != null) {
            this.phoneNumber = getArguments().getString(KEY_NUMBER, String.valueOf(this.phoneNumber));
        }
    }

    @Override // com.vkontakte.android.fragments.VKFragment, android.app.Fragment
    public void onDestroy() {
        super.onDestroy();
        try {
            VKApplication.context.unregisterReceiver(this.receiver);
        } catch (Exception e) {
        }
    }

    public void setNumber(String n) {
        this.phoneNumber = n;
    }

    public void setOnDoneFunc(VoidF0 doneFunc) {
        this.doneFunc = doneFunc;
    }

    @Override // android.app.Fragment
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        this.view = inflater.inflate(R.layout.signup_code, container, false);
        View topBlock = this.view.findViewById(R.id.top_block);
        int pl = topBlock.getPaddingLeft();
        int pt = topBlock.getPaddingTop();
        int pr = topBlock.getPaddingRight();
        int pb = topBlock.getPaddingBottom();
        topBlock.setBackgroundDrawable(new CardDrawable(getResources(), -1, V.dp(2.0f), !this.isTablet));
        topBlock.setPadding(pl, pt, pr, pb);
        if (Build.VERSION.SDK_INT >= 16) {
            LayoutTransition trans = new LayoutTransition();
            trans.enableTransitionType(4);
            ((ViewGroup) ((ViewGroup) this.view).getChildAt(0)).setLayoutTransition(trans);
        }
        this.view.postDelayed(new TimeUpdater(), 500L);
        this.view.findViewById(R.id.signup_code_number).setOnClickListener(SignupCodeFragment$$Lambda$1.lambdaFactory$(this));
        try {
            ((TextView) this.view.findViewById(R.id.signup_code_number)).setText(PhoneNumberUtils.formatNumber(this.phoneNumber));
        } catch (Exception e) {
            ((TextView) this.view.findViewById(R.id.signup_code_number)).setText(this.phoneNumber);
        }
        this.view.findViewById(R.id.signup_call_me).setOnClickListener(SignupCodeFragment$$Lambda$2.lambdaFactory$(this));
        EditText editTextSignUpCode = (EditText) this.view.findViewById(R.id.signup_edit_code);
        this.view.post(SignupCodeFragment$$Lambda$3.lambdaFactory$(this, editTextSignUpCode));
        editTextSignUpCode.setOnEditorActionListener(SignupCodeFragment$$Lambda$4.lambdaFactory$(this));
        editTextSignUpCode.addTextChangedListener(new TextWatcher() { // from class: com.vkontakte.android.fragments.SignupCodeFragment.2
            @Override // android.text.TextWatcher
            public void beforeTextChanged(CharSequence s, int start, int count, int after) {
            }

            @Override // android.text.TextWatcher
            public void onTextChanged(CharSequence s, int start, int before, int count) {
            }

            @Override // android.text.TextWatcher
            public void afterTextChanged(Editable s) {
                SignupCodeFragment.this.smsCode = s;
            }
        });
        return this.view;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$onCreateView$0(View v) {
        getActivity().onBackPressed();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$onCreateView$2(View v) {
        if (this.listener != null) {
            this.listener.resendCode(true, SignupCodeFragment$$Lambda$5.lambdaFactory$(this));
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$null$1() {
        if (this.view != null) {
            ((TextView) this.view.findViewById(R.id.signup_text_info_1)).setText(R.string.signup_code_call_sent);
            this.view.findViewById(R.id.signup_call_me).setVisibility(8);
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$onCreateView$3(EditText editTextSignUpCode) {
        editTextSignUpCode.requestFocus();
        InputMethodManager imm = (InputMethodManager) getActivity().getSystemService("input_method");
        imm.showSoftInput(this.view.findViewById(R.id.signup_phone_number), 0);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ boolean lambda$onCreateView$4(TextView v, int actionId, KeyEvent event) {
        if (this.doneFunc != null) {
            this.doneFunc.f();
            return false;
        }
        return false;
    }

    public String getCode() {
        return this.smsCode == null ? "" : String.valueOf(this.smsCode);
    }

    @Override // android.app.DialogFragment, android.app.Fragment
    public void onDestroyView() {
        super.onDestroyView();
        this.view = null;
    }

    public void setOnResendListener(OnResendListener l) {
        this.listener = l;
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes2.dex */
    public class TimeUpdater implements Runnable {
        private TimeUpdater() {
        }

        @Override // java.lang.Runnable
        public void run() {
            if (SignupCodeFragment.this.view != null) {
                long time = 60 - ((System.currentTimeMillis() - SignupCodeFragment.this.initTime) / 1000);
                if (time < 0) {
                    if (SignupCodeFragment.this.listener != null) {
                        SignupCodeFragment.this.listener.resendCode(false, SignupCodeFragment$TimeUpdater$$Lambda$1.lambdaFactory$(this));
                        return;
                    }
                    return;
                }
                SpannableStringBuilder ssb = new SpannableStringBuilder();
                ssb.append((CharSequence) SignupCodeFragment.this.getString(R.string.signup_code_waiting));
                ssb.append((CharSequence) MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR);
                Spannable sp = Spannable.Factory.getInstance().newSpannable(String.format("%d:%02d", Long.valueOf(time / 60), Long.valueOf(time % 60)));
                ssb.append((CharSequence) sp);
                ((TextView) SignupCodeFragment.this.view.findViewById(R.id.signup_text_info_2)).setText(ssb);
                SignupCodeFragment.this.view.postDelayed(this, 500L);
            }
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public /* synthetic */ void lambda$run$0() {
            if (SignupCodeFragment.this.view != null) {
                ((TextView) SignupCodeFragment.this.view.findViewById(R.id.signup_text_info_1)).setText(R.string.signup_code_explain_resent);
                SignupCodeFragment.this.view.findViewById(R.id.signup_text_info_2).setVisibility(8);
                SignupCodeFragment.this.view.findViewById(R.id.signup_call_me).setVisibility(0);
            }
        }
    }
}
