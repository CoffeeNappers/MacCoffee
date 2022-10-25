package ru.mail.libverify.controls;

import android.content.Context;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.text.TextUtils;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import ru.mail.libverify.api.VerificationApi;
import ru.mail.libverify.api.VerificationFactory;
import ru.mail.libverify.utils.LogReceiver;
/* loaded from: classes.dex */
public abstract class VerificationController implements VerificationSupportProvider {
    private static final String LOG_TAG = "VerificationController";
    private static final String VERIFICATION_INITIAL_PROFILE_CHECK = "verification_initial_profile_check";
    private static final String VERIFICATION_SESSION_ID = "verification_session_id";
    protected final Context context;
    private VerificationApi.VerificationStateDescriptor descriptor;
    private VerificationListener listener;
    private VerificationApi.PhoneNumberCheckSession phoneNumberCheckSession;
    private List<VerificationApi.PhoneAccountSearchItem> suggestedAccounts;
    private long validationRequestStarted;
    private VerificationApi verificationApi;
    private String verificationId;
    private final VerificationStateChangedListener apiListener = new VerificationStateChangedListener();
    private final VerificationApi.PhoneAccountSearchListener accountListener = new PhoneAccountSearchListener();
    private boolean suggestedAccountsRequested = false;

    /* loaded from: classes3.dex */
    private final class PhoneAccountSearchListener implements VerificationApi.PhoneAccountSearchListener {
        private PhoneAccountSearchListener() {
        }

        @Override // ru.mail.libverify.api.VerificationApi.PhoneAccountSearchListener
        public final void onComplete(@NonNull final List<VerificationApi.PhoneAccountSearchItem> list) {
            Utils.uiHandler.post(new Runnable() { // from class: ru.mail.libverify.controls.VerificationController.PhoneAccountSearchListener.1
                @Override // java.lang.Runnable
                public void run() {
                    VerificationController.this.suggestedAccounts = list;
                    if (list.size() != 1 || VerificationController.this.listener == null) {
                        return;
                    }
                    VerificationController.this.listener.onPhoneNumberReceived(((VerificationApi.PhoneAccountSearchItem) list.get(0)).phone);
                }
            });
        }
    }

    /* loaded from: classes3.dex */
    public enum State {
        EnterPhone,
        EnterSmsCode
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes3.dex */
    public final class VerificationStateChangedListener implements VerificationApi.VerificationStateChangedListener {
        private VerificationStateChangedListener() {
        }

        @Override // ru.mail.libverify.api.VerificationApi.VerificationStateChangedListener
        public final void onStateChanged(@NonNull final String str, @Nullable final VerificationApi.VerificationStateDescriptor verificationStateDescriptor) {
            Utils.uiHandler.post(new Runnable() { // from class: ru.mail.libverify.controls.VerificationController.VerificationStateChangedListener.1
                @Override // java.lang.Runnable
                public void run() {
                    VerificationController.this.onStateChanged(str, verificationStateDescriptor);
                }
            });
        }
    }

    public VerificationController(@NonNull Context context) {
        this.context = context;
    }

    private static boolean isNumericCode(@NonNull CharSequence charSequence) {
        for (int i = 0; i < charSequence.length(); i++) {
            if (!Character.isDigit(charSequence.charAt(i))) {
                return false;
            }
        }
        return true;
    }

    private boolean isOnEnterSmsCodeStage() {
        return (this.descriptor == null || TextUtils.isEmpty(this.descriptor.getModifiedPhoneNumber()) || this.descriptor.getSmsCodeInfo() == null || this.descriptor.getIvrInfo() == null) ? false : true;
    }

    private void loadVerificationId() {
        if (TextUtils.isEmpty(this.verificationId)) {
            this.verificationId = getPreferences().getString(VERIFICATION_SESSION_ID, null);
        }
    }

    private void resetVerificationId() {
        this.descriptor = null;
        this.verificationId = null;
        this.validationRequestStarted = 0L;
        getPreferences().edit().putString(VERIFICATION_SESSION_ID, null).commit();
        if (this.listener != null) {
            this.listener.onStateChanged(State.EnterPhone);
        }
    }

    private void updateVerificationId(@NonNull String str) {
        this.verificationId = str;
        getPreferences().edit().putString(VERIFICATION_SESSION_ID, this.verificationId).commit();
    }

    protected boolean cancel() {
        boolean z = false;
        if (!TextUtils.isEmpty(this.verificationId)) {
            getVerificationApi().cancelVerification(this.verificationId);
            z = true;
        }
        resetVerificationId();
        return z;
    }

    public final void checkProfileVerification() {
        Boolean valueOf = Boolean.valueOf(getPreferences().getBoolean(VERIFICATION_INITIAL_PROFILE_CHECK, false));
        String alreadyExistingProfileDataJson = getAlreadyExistingProfileDataJson();
        if (valueOf.booleanValue() || TextUtils.isEmpty(alreadyExistingProfileDataJson)) {
            return;
        }
        getVerificationApi().checkAccountVerification(alreadyExistingProfileDataJson);
        getPreferences().edit().putBoolean(VERIFICATION_INITIAL_PROFILE_CHECK, true).commit();
    }

    protected void complete() {
        if (!TextUtils.isEmpty(this.verificationId)) {
            getVerificationApi().completeVerification(this.verificationId);
        }
        resetVerificationId();
    }

    protected void dismissError() {
        if (!TextUtils.isEmpty(this.verificationId)) {
            getVerificationApi().resetVerificationCodeError(this.verificationId);
        }
    }

    protected long getIvrTimeout() {
        return (this.descriptor == null || this.descriptor.getIvrInfo() == null) ? getIvrTimeoutDefault() : this.descriptor.getIvrInfo().ivrTimeoutSec * 1000;
    }

    public final long getIvtUnblockTimeout() {
        long ivrTimeout = getIvrTimeout() - (System.currentTimeMillis() - this.validationRequestStarted);
        if (ivrTimeout < 0) {
            return 0L;
        }
        return ivrTimeout;
    }

    public final String getModifiedPhoneNumber() {
        if (this.descriptor == null) {
            return null;
        }
        return this.descriptor.getModifiedPhoneNumber();
    }

    public VerificationApi.PhoneNumberCheckSession getPhoneCheckSession() {
        if (this.phoneNumberCheckSession == null) {
            this.phoneNumberCheckSession = new VerificationApi.PhoneNumberCheckSession(getVerificationApi(), getVerificationService());
        }
        return this.phoneNumberCheckSession;
    }

    public final String getSmsCode() {
        if (this.descriptor == null || this.descriptor.getSmsCodeInfo() == null) {
            return null;
        }
        return this.descriptor.getSmsCodeInfo().receivedSmsCode;
    }

    public final State getState() {
        return isOnEnterSmsCodeStage() ? State.EnterSmsCode : State.EnterPhone;
    }

    public final String getSuggestedPhoneNumber() {
        if (this.suggestedAccounts != null) {
            if (this.suggestedAccounts.size() != 1) {
                return null;
            }
            return this.suggestedAccounts.get(0).phone;
        } else if (this.suggestedAccountsRequested) {
            return null;
        } else {
            if (Utils.hasSelfPermission(this.context, "android.permission.READ_PHONE_STATE") || Utils.hasSelfPermission(this.context, "android.permission.GET_ACCOUNTS")) {
                getVerificationApi().searchPhoneAccounts(this.accountListener, true);
            }
            this.suggestedAccountsRequested = true;
            return null;
        }
    }

    protected final VerificationApi getVerificationApi() {
        if (this.verificationApi == null) {
            this.verificationApi = VerificationFactory.getInstance(this.context, getLogReceiver(), getExceptionListener());
            this.verificationApi.addVerificationStateChangedListener(this.apiListener);
        }
        return this.verificationApi;
    }

    public final boolean hasIncompletedVerification() {
        loadVerificationId();
        return !TextUtils.isEmpty(this.verificationId);
    }

    public final boolean isValidSmsCode(@NonNull CharSequence charSequence) {
        if (this.descriptor == null || TextUtils.isEmpty(charSequence)) {
            return false;
        }
        if (charSequence.length() != (this.descriptor.getSmsCodeInfo() == null ? getSmsCodeLengthDefault() : this.descriptor.getSmsCodeInfo().smsCodeLength)) {
            return false;
        }
        return !(this.descriptor.getSmsCodeInfo() == null ? isSmsCodeNumericDefault() : this.descriptor.getSmsCodeInfo().isNumericSmsCode) || isNumericCode(charSequence);
    }

    public boolean onCancel() {
        return cancel();
    }

    public void onConfirmed() {
        complete();
    }

    public void onEnterSmsCode(@NonNull String str) {
        verifySmsCode(str);
    }

    public void onErrorDismissed() {
        dismissError();
    }

    public void onRequestIvrCall() {
        requestIvrCall();
    }

    public void onResendSms() {
        requestNewSmsCode();
    }

    public void onStart(@NonNull String str) {
        start(str);
    }

    protected void onStateChanged(@NonNull String str, VerificationApi.VerificationStateDescriptor verificationStateDescriptor) {
        if (verificationStateDescriptor == null || !TextUtils.equals(str, this.verificationId)) {
            return;
        }
        this.descriptor = verificationStateDescriptor;
        switch (this.descriptor.getState()) {
            case INITIAL:
            case VERIFYING_PHONE_NUMBER:
                onVerificationInitialStarted();
                return;
            case SUSPENDED:
                onVerificationSuspended(this.descriptor);
                return;
            case VERIFYING_SMS_CODE:
                onVerifyingSmsCode(this.descriptor);
                return;
            case WAITING_FOR_SMS_CODE:
                onWaitingVerificationCode(this.descriptor);
                return;
            case FAILED:
                onVerificationFailed(this.descriptor);
                return;
            case FINAL:
                onVerificationFinalized(this.descriptor);
                return;
            case SUCCEEDED:
                onVerificationSucceeded(this.descriptor);
                return;
            default:
                throw new IllegalStateException(String.format("Handler for %s state is not defined", this.descriptor.getState()));
        }
    }

    protected void onVerificationFailed(@NonNull VerificationApi.VerificationStateDescriptor verificationStateDescriptor) {
        if (this.listener != null) {
            this.listener.onProgress(false);
            this.listener.onError(verificationStateDescriptor.getReason());
            cancel();
        }
    }

    protected void onVerificationFinalized(@NonNull VerificationApi.VerificationStateDescriptor verificationStateDescriptor) {
        if (this.listener != null) {
            this.listener.onProgress(false);
            if (TextUtils.isEmpty(verificationStateDescriptor.getToken())) {
                this.listener.onError(verificationStateDescriptor.getReason());
            } else {
                this.listener.onCompleted(this.verificationId, verificationStateDescriptor.getToken());
            }
        }
    }

    protected void onVerificationInitialStarted() {
        if (this.listener != null) {
            this.listener.onProgress(true);
            this.listener.onStateChanged(getState());
        }
    }

    protected void onVerificationSucceeded(@NonNull VerificationApi.VerificationStateDescriptor verificationStateDescriptor) {
        if (this.listener != null) {
            this.listener.onProgress(false);
            this.listener.onCompleted(this.verificationId, verificationStateDescriptor.getToken());
        }
    }

    protected void onVerificationSuspended(@NonNull VerificationApi.VerificationStateDescriptor verificationStateDescriptor) {
        if (this.listener != null) {
            this.listener.onProgress(true);
            this.listener.onStateChanged(getState());
        }
    }

    protected void onVerifyingSmsCode(@NonNull VerificationApi.VerificationStateDescriptor verificationStateDescriptor) {
        if (this.listener != null) {
            this.listener.onProgress(true);
            this.listener.onStateChanged(getState());
            if (verificationStateDescriptor.getSmsCodeInfo() == null || TextUtils.isEmpty(verificationStateDescriptor.getSmsCodeInfo().receivedSmsCode)) {
                return;
            }
            this.listener.onSmsCodeReceived(verificationStateDescriptor.getSmsCodeInfo().receivedSmsCode);
        }
    }

    protected void onWaitingVerificationCode(@NonNull VerificationApi.VerificationStateDescriptor verificationStateDescriptor) {
        if (this.listener != null) {
            this.listener.onProgress(false);
            this.listener.onStateChanged(getState());
            if (verificationStateDescriptor.getSmsCodeInfo() != null && !TextUtils.isEmpty(verificationStateDescriptor.getSmsCodeInfo().receivedSmsCode)) {
                this.listener.onSmsCodeReceived(verificationStateDescriptor.getSmsCodeInfo().receivedSmsCode);
            }
            if (verificationStateDescriptor.getReason() == VerificationApi.FailReason.OK) {
                return;
            }
            this.listener.onError(verificationStateDescriptor.getReason());
        }
    }

    protected void requestIvrCall() {
        if (this.listener == null) {
            return;
        }
        if (TextUtils.isEmpty(this.verificationId)) {
            this.listener.onError(VerificationApi.FailReason.GENERAL_ERROR);
            return;
        }
        this.listener.onProgress(true);
        getVerificationApi().requestIvrPhoneCall(this.verificationId, new VerificationApi.IvrStateListener() { // from class: ru.mail.libverify.controls.VerificationController.1
            @Override // ru.mail.libverify.api.VerificationApi.IvrStateListener
            public void onRequestExecuted(final VerificationApi.FailReason failReason) {
                Utils.uiHandler.post(new Runnable() { // from class: ru.mail.libverify.controls.VerificationController.1.1
                    @Override // java.lang.Runnable
                    public void run() {
                        if (VerificationController.this.listener != null) {
                            VerificationController.this.listener.onProgress(false);
                            if (failReason == VerificationApi.FailReason.OK) {
                                return;
                            }
                            VerificationController.this.listener.onIvrCallError(failReason);
                        }
                    }
                });
            }
        });
    }

    protected void requestNewSmsCode() {
        if (!TextUtils.isEmpty(this.verificationId)) {
            getVerificationApi().requestNewSmsCode(this.verificationId);
        } else if (this.listener == null) {
        } else {
            this.listener.onError(VerificationApi.FailReason.GENERAL_ERROR);
        }
    }

    public void setApiEndpoints(@NonNull Map<String, String> map) {
        VerificationFactory.setApiEndpoints(this.context, map);
    }

    public void setCustomLocale(@NonNull Locale locale) {
        VerificationFactory.setCustomLocale(this.context, locale);
    }

    public final void setListener(@Nullable VerificationListener verificationListener) {
        this.listener = verificationListener;
        if (verificationListener != null) {
            loadVerificationId();
            VerificationApi verificationApi = getVerificationApi();
            if (!TextUtils.isEmpty(this.verificationId)) {
                verificationApi.requestVerificationState(this.verificationId, this.apiListener);
            } else {
                verificationListener.onStateChanged(State.EnterPhone);
            }
        }
    }

    public void setLocationUsage(boolean z) {
        VerificationFactory.setLocationUsage(this.context, z);
    }

    @Deprecated
    public void signOut() {
        getPreferences().edit().remove(VERIFICATION_INITIAL_PROFILE_CHECK).apply();
        VerificationFactory.signOut(this.context, false);
    }

    public void softSignOut() {
        getPreferences().edit().remove(VERIFICATION_INITIAL_PROFILE_CHECK).apply();
        VerificationFactory.softSignOut(this.context);
    }

    protected void start(@NonNull String str) {
        if (!TextUtils.isEmpty(this.verificationId)) {
            LogReceiver logReceiver = getLogReceiver();
            if (logReceiver != null) {
                logReceiver.e(LOG_TAG, "Previous session must be stopped properly. Please, ensure that your code calls cancel() or complete() methods.");
            }
            cancel();
        }
        this.validationRequestStarted = System.currentTimeMillis();
        updateVerificationId(getVerificationApi().startVerification(getVerificationService(), str, null, getSmsCodeTemplatesDefault()));
        if (this.listener != null) {
            this.listener.onProgress(true);
        }
    }

    public void subscribeSmsNotificationListener(@NonNull VerificationApi.SmsCodeNotificationListener smsCodeNotificationListener) {
        getVerificationApi().addSmsCodeNotificationListener(smsCodeNotificationListener);
    }

    public void unSubscribeSmsNotificationListener(@NonNull VerificationApi.SmsCodeNotificationListener smsCodeNotificationListener) {
        getVerificationApi().removeSmsCodeNotificationListener(smsCodeNotificationListener);
    }

    protected void verifySmsCode(@NonNull String str) {
        if (TextUtils.isEmpty(this.verificationId) || !isValidSmsCode(str)) {
            if (this.listener == null) {
                return;
            }
            this.listener.onError(VerificationApi.FailReason.GENERAL_ERROR);
        } else if (this.descriptor == null || TextUtils.isEmpty(this.descriptor.getToken())) {
            getVerificationApi().verifySmsCode(this.verificationId, str);
        } else {
            onVerificationFinalized(this.descriptor);
        }
    }
}
