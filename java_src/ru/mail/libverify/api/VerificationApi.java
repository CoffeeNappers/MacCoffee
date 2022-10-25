package ru.mail.libverify.api;

import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.annotation.RequiresPermission;
import android.support.annotation.WorkerThread;
import android.text.TextUtils;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Random;
import java.util.Set;
/* loaded from: classes3.dex */
public interface VerificationApi {

    /* loaded from: classes3.dex */
    public interface AccountCheckListener {
        @WorkerThread
        void onComplete(AccountCheckResult accountCheckResult);
    }

    /* loaded from: classes3.dex */
    public enum AccountCheckResult {
        OK,
        NO_SMS_PERMISSION,
        NO_SMS_FOUND,
        NO_SMS_FOUND_HAS_SOURCE_MATCH,
        NO_SMS_FOUND_HAS_CODE,
        NO_SMS_INFO,
        EMPTY_ACCOUNT_DATA,
        GENERAL_ERROR
    }

    /* loaded from: classes3.dex */
    public enum FailReason {
        OK,
        GENERAL_ERROR,
        UNSUPPORTED_NUMBER,
        INCORRECT_PHONE_NUMBER,
        INCORRECT_SMS_CODE,
        RATELIMIT,
        NETWORK_ERROR,
        NO_NETWORK;
        
        String description;

        public final String getDescription() {
            return this.description;
        }
    }

    /* loaded from: classes3.dex */
    public interface IvrStateListener {
        @WorkerThread
        void onRequestExecuted(FailReason failReason);
    }

    /* loaded from: classes3.dex */
    public static class PhoneAccountSearchItem {
        public final String phone;
        public final String source;

        /* JADX INFO: Access modifiers changed from: package-private */
        public PhoneAccountSearchItem(String str, String str2) {
            this.phone = str;
            this.source = str2;
        }
    }

    /* loaded from: classes3.dex */
    public interface PhoneAccountSearchListener {
        @WorkerThread
        void onComplete(@NonNull List<PhoneAccountSearchItem> list);
    }

    /* loaded from: classes3.dex */
    public interface PhoneCheckListener {
        @WorkerThread
        void onCompleted(@NonNull String str, @NonNull PhoneCheckResult phoneCheckResult);
    }

    /* loaded from: classes3.dex */
    public interface PhoneCheckResult {

        /* loaded from: classes3.dex */
        public interface ExtendedInfo {
            String getModifiedPhoneNumber();

            String getModifiedPrefix();

            Integer getRemainingLength();

            boolean isFixedLine();

            boolean isMobile();
        }

        /* loaded from: classes3.dex */
        public enum State {
            VALID,
            INVALID,
            UNKNOWN
        }

        ExtendedInfo getExtendedInfo();

        String[] getPrintableText();

        FailReason getReason();

        State getState();

        boolean isApproximate();

        boolean isInvalid();

        boolean isUnknown();

        boolean isValid();

        boolean isWarning();
    }

    /* loaded from: classes3.dex */
    public static class PhoneNumberCheckSession {
        private static final Random a = new Random();
        private final String b;
        private final VerificationApi c;

        public PhoneNumberCheckSession(@NonNull VerificationApi verificationApi) {
            this.c = verificationApi;
            this.b = Integer.toString(a.nextInt());
        }

        public PhoneNumberCheckSession(@NonNull VerificationApi verificationApi, @NonNull String str) {
            this.c = verificationApi;
            this.b = str;
        }

        public void checkPhoneNumber(@NonNull String str, @NonNull String str2, boolean z, @NonNull PhoneCheckListener phoneCheckListener) {
            this.c.checkPhoneNumber(this.b, str, str2, z, phoneCheckListener);
        }

        public String getId() {
            return this.b;
        }
    }

    /* loaded from: classes3.dex */
    public interface SmsCodeNotificationListener {
        @WorkerThread
        void onNotification(@NonNull String str);
    }

    /* loaded from: classes3.dex */
    public enum VerificationSource {
        UNKNOWN,
        SMS,
        CALL,
        USER_INPUT,
        ALREADY_VERIFIED,
        APPLICATION_LOCAL,
        APPLICATION_EXTERNAL
    }

    /* loaded from: classes3.dex */
    public enum VerificationState {
        INITIAL,
        VERIFYING_PHONE_NUMBER,
        WAITING_FOR_SMS_CODE,
        VERIFYING_SMS_CODE,
        SUCCEEDED,
        FAILED,
        SUSPENDED,
        FINAL
    }

    /* loaded from: classes3.dex */
    public interface VerificationStateChangedListener {
        @WorkerThread
        void onStateChanged(@NonNull String str, @Nullable VerificationStateDescriptor verificationStateDescriptor);
    }

    /* loaded from: classes3.dex */
    public static class VerificationStateDescriptor {
        private VerificationState a;
        private VerificationSource b;
        private FailReason c;
        private String d;
        private String e;
        private int f;
        private SmsCodeInfo g;
        private IvrInfo h;
        private Map<String, String> i;

        /* loaded from: classes3.dex */
        public class IvrInfo {
            public final int ivrTimeoutSec;
            public final Set<String> supportedIvrLanguages;

            IvrInfo(Set<String> set, int i) {
                this.supportedIvrLanguages = set;
                this.ivrTimeoutSec = i;
            }

            public String toString() {
                return "IvrInfo{supportedIvrLanguages=" + this.supportedIvrLanguages + ", ivrTimeoutSec=" + this.ivrTimeoutSec + '}';
            }
        }

        /* loaded from: classes3.dex */
        public class SmsCodeInfo {
            public final boolean isNumericSmsCode;
            public final String receivedSmsCode;
            public final int smsCodeLength;

            SmsCodeInfo(int i, boolean z, String str) {
                this.smsCodeLength = i;
                this.isNumericSmsCode = z;
                this.receivedSmsCode = str;
            }

            public String toString() {
                return "SmsCodeInfo{smsCodeLength=" + this.smsCodeLength + ", isNumericSmsCode=" + this.isNumericSmsCode + '}';
            }
        }

        public VerificationStateDescriptor(VerificationState verificationState) {
            this.a = VerificationState.INITIAL;
            this.b = VerificationSource.UNKNOWN;
            this.c = FailReason.OK;
            this.a = verificationState;
        }

        public VerificationStateDescriptor(VerificationState verificationState, FailReason failReason) {
            this.a = VerificationState.INITIAL;
            this.b = VerificationSource.UNKNOWN;
            this.c = FailReason.OK;
            this.a = verificationState;
            this.c = failReason;
        }

        public VerificationStateDescriptor(VerificationState verificationState, VerificationSource verificationSource, FailReason failReason, String str, String str2, int i, int i2, boolean z, String str3, Set<String> set, int i3, Map<String, String> map) {
            this.a = VerificationState.INITIAL;
            this.b = VerificationSource.UNKNOWN;
            this.c = FailReason.OK;
            this.d = str;
            this.b = verificationSource;
            this.c = failReason;
            this.e = str2;
            this.f = i;
            this.a = verificationState;
            this.g = new SmsCodeInfo(i2, z, str3);
            this.h = new IvrInfo(set, i3);
            this.i = map;
        }

        public boolean completedSuccessfully() {
            return (this.a == VerificationState.FINAL || this.a == VerificationState.SUCCEEDED) && this.c == FailReason.OK && !TextUtils.isEmpty(this.e);
        }

        public Map<String, String> getAppEndpoints() {
            return this.i;
        }

        public IvrInfo getIvrInfo() {
            return this.h;
        }

        public String getModifiedPhoneNumber() {
            return this.d;
        }

        public FailReason getReason() {
            return this.c;
        }

        public SmsCodeInfo getSmsCodeInfo() {
            return this.g;
        }

        public VerificationSource getSource() {
            return this.b;
        }

        public VerificationState getState() {
            return this.a;
        }

        public String getToken() {
            return this.e;
        }

        public int getTokenExpirationTimeoutSec() {
            return this.f;
        }

        public String toString() {
            return "VerificationStateDescriptor{state='" + this.a + "', source='" + this.b + "', reason='" + this.c + "', modifiedPhoneNumber='" + this.d + "', token='" + this.e + "', smsCodeInfo='" + this.g + "', ivrInfo='" + this.h + "', appEndpoints='" + this.i + "'}";
        }
    }

    /* loaded from: classes3.dex */
    public interface VerificationStatesHandler {
        void onExistingVerificationsFound(List<String> list);
    }

    void addSmsCodeNotificationListener(@NonNull SmsCodeNotificationListener smsCodeNotificationListener);

    void addVerificationStateChangedListener(@NonNull VerificationStateChangedListener verificationStateChangedListener);

    void cancelVerification(@NonNull String str);

    void checkAccountVerification(@NonNull String str);

    void checkAccountVerificationBySms(@NonNull String str, @Nullable AccountCheckListener accountCheckListener);

    void checkPhoneNumber(@NonNull String str, @NonNull String str2, @NonNull String str3, boolean z, @NonNull PhoneCheckListener phoneCheckListener);

    void completeVerification(@NonNull String str);

    void removeSmsCodeNotificationListener(@NonNull SmsCodeNotificationListener smsCodeNotificationListener);

    void removeVerificationStateChangedListener(@NonNull VerificationStateChangedListener verificationStateChangedListener);

    void reportNetworkStateChange(boolean z);

    void requestIvrPhoneCall(@NonNull String str, IvrStateListener ivrStateListener);

    void requestNewSmsCode(@NonNull String str);

    void requestVerificationState(@NonNull String str, @NonNull VerificationStateChangedListener verificationStateChangedListener);

    void requestVerificationStates(@NonNull VerificationStatesHandler verificationStatesHandler);

    void reset();

    void resetVerificationCodeError(@NonNull String str);

    @RequiresPermission(allOf = {"android.permission.GET_ACCOUNTS", "android.permission.READ_PHONE_STATE"})
    void searchPhoneAccounts(@NonNull PhoneAccountSearchListener phoneAccountSearchListener, boolean z);

    void setAllowedPermissions(@NonNull String[] strArr);

    void setApiEndpoints(@NonNull Map<String, String> map);

    void setCustomLocale(@NonNull Locale locale);

    void setLocationUsage(boolean z);

    void signOut(boolean z);

    void softSignOut();

    String startVerification(@NonNull String str, @NonNull String str2, String str3, Map<String, String> map);

    void verifySmsCode(@NonNull String str, @NonNull String str2);
}
