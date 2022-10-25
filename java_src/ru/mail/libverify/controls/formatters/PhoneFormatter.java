package ru.mail.libverify.controls.formatters;

import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.text.Editable;
import android.text.TextUtils;
import android.text.TextWatcher;
import android.widget.EditText;
import com.google.i18n.phonenumbers.AsYouTypeFormatter;
import com.google.i18n.phonenumbers.PhoneNumberUtil;
import org.slf4j.Marker;
import ru.mail.libverify.api.VerificationApi;
import ru.mail.libverify.controls.Utils;
/* loaded from: classes3.dex */
public abstract class PhoneFormatter {
    private static final int BLOCK_PHONE_NUMBER_ENTER_AFTER_LENGTH = 20;
    private static final int CLEAR_PREVIOUS_TEXT_TIMEOUT = 300;
    private static final int MAX_CHECK_PHONE_NUMBER_WAIT = 10000;
    private static final int MAX_PHONE_NUMBER_LENGTH = 15;
    private static final int MIN_PHONE_NUMBER_LENGTH = 3;
    private String phoneCheckService;
    protected final EditText phoneNumber;
    private VerificationApi.PhoneNumberCheckSession phoneNumberCheckSession;
    private boolean processingNumber;
    private TextAction lastTextAction = TextAction.UNKNOWN;
    private final TextWatcherImpl textWatcher = new TextWatcherImpl();
    private final PhoneCheckListenerImpl phoneCheckListener = new PhoneCheckListenerImpl();
    private final Runnable clearTextRunnable = new Runnable() { // from class: ru.mail.libverify.controls.formatters.PhoneFormatter.1
        @Override // java.lang.Runnable
        public void run() {
            PhoneFormatter.this.onPhoneInfoChanged(null);
        }
    };
    private final Runnable unblockRunnable = new Runnable() { // from class: ru.mail.libverify.controls.formatters.PhoneFormatter.2
        @Override // java.lang.Runnable
        public void run() {
            PhoneFormatter.this.onPhoneInfoChanged(null, true, false);
        }
    };
    private AsYouTypeFormatter formatter = PhoneNumberUtil.getInstance().getAsYouTypeFormatter("");

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes3.dex */
    public class PhoneCheckListenerImpl implements VerificationApi.PhoneCheckListener {
        private PhoneCheckListenerImpl() {
        }

        @Override // ru.mail.libverify.api.VerificationApi.PhoneCheckListener
        public void onCompleted(@NonNull final String str, @NonNull final VerificationApi.PhoneCheckResult phoneCheckResult) {
            Utils.uiHandler.post(new Runnable() { // from class: ru.mail.libverify.controls.formatters.PhoneFormatter.PhoneCheckListenerImpl.1
                @Override // java.lang.Runnable
                public void run() {
                    String[] printableText;
                    boolean z = true;
                    if (TextUtils.equals(PhoneFormatter.this.getPhoneWithCode(PhoneFormatter.this.phoneNumber.getText()), str)) {
                        Utils.uiHandler.removeCallbacks(PhoneFormatter.this.clearTextRunnable);
                        if (!phoneCheckResult.isApproximate()) {
                            Utils.uiHandler.removeCallbacks(PhoneFormatter.this.unblockRunnable);
                        }
                        if (phoneCheckResult.getReason() != VerificationApi.FailReason.OK) {
                            PhoneFormatter.this.onPhoneInfoChanged(null, true, false);
                            return;
                        }
                        StringBuilder sb = new StringBuilder();
                        if (phoneCheckResult.getPrintableText() != null) {
                            for (String str2 : phoneCheckResult.getPrintableText()) {
                                if (!TextUtils.isEmpty(sb)) {
                                    sb.append("\n");
                                }
                                sb.append(str2);
                            }
                        }
                        VerificationApi.PhoneCheckResult.ExtendedInfo extendedInfo = phoneCheckResult.getExtendedInfo();
                        boolean z2 = (extendedInfo != null && extendedInfo.isFixedLine()) && !(extendedInfo != null && extendedInfo.isMobile()) && PhoneFormatter.this.isFixedLineNumberBlockEnabled();
                        boolean z3 = phoneCheckResult.isValid() && !z2;
                        if (!phoneCheckResult.isWarning() && !z2) {
                            z = false;
                        }
                        if (!phoneCheckResult.isApproximate() || z) {
                            PhoneFormatter.this.onPhoneInfoChanged(sb.toString(), z3, z);
                        } else {
                            Utils.uiHandler.postDelayed(PhoneFormatter.this.clearTextRunnable, 300L);
                            PhoneFormatter.this.onPhoneInfoChanged(z3, false);
                        }
                        if (PhoneFormatter.this.isModifyPhoneNumberBlockEnabled() || phoneCheckResult.isApproximate() || phoneCheckResult.getExtendedInfo() == null || PhoneFormatter.this.lastTextAction != TextAction.ADD) {
                            return;
                        }
                        String modifiedPhoneNumber = phoneCheckResult.getExtendedInfo().getModifiedPhoneNumber();
                        String modifiedPrefix = phoneCheckResult.getExtendedInfo().getModifiedPrefix();
                        if (TextUtils.isEmpty(modifiedPrefix) || TextUtils.isEmpty(modifiedPhoneNumber)) {
                            return;
                        }
                        if (TextUtils.equals(PhoneNumberUtil.normalizeDigitsOnly(modifiedPhoneNumber), PhoneNumberUtil.normalizeDigitsOnly(PhoneFormatter.this.getPhoneWithCode(PhoneFormatter.this.phoneNumber.getText())))) {
                            return;
                        }
                        PhoneFormatter.this.phoneNumber.setText(PhoneFormatter.this.getFormattedPhoneNumber(modifiedPhoneNumber.substring(modifiedPrefix.length())));
                        PhoneFormatter.this.phoneNumber.setSelection(PhoneFormatter.this.phoneNumber.length());
                        PhoneFormatter.this.setCountryCodeValue(modifiedPrefix);
                    }
                }
            });
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes3.dex */
    public enum TextAction {
        UNKNOWN,
        ADD,
        REMOVE
    }

    /* loaded from: classes3.dex */
    private class TextWatcherImpl implements TextWatcher {
        private TextWatcherImpl() {
        }

        @Override // android.text.TextWatcher
        public void afterTextChanged(Editable editable) {
        }

        @Override // android.text.TextWatcher
        public void beforeTextChanged(CharSequence charSequence, int i, int i2, int i3) {
        }

        @Override // android.text.TextWatcher
        public void onTextChanged(CharSequence charSequence, int i, int i2, int i3) {
            boolean z = true;
            PhoneFormatter.this.onTextChanged();
            if (!PhoneFormatter.this.processingNumber) {
                PhoneFormatter.this.processingNumber = true;
                if (i2 > i3) {
                    PhoneFormatter.this.lastTextAction = TextAction.REMOVE;
                } else {
                    PhoneFormatter.this.lastTextAction = TextAction.ADD;
                }
                boolean z2 = PhoneFormatter.this.phoneNumber.getSelectionStart() == charSequence.length();
                String normalizeDigitsOnly = PhoneNumberUtil.normalizeDigitsOnly(PhoneFormatter.this.getCountryCodeValue() + charSequence.toString());
                boolean z3 = normalizeDigitsOnly.length() >= 15;
                boolean z4 = charSequence.length() >= 3;
                if (normalizeDigitsOnly.length() <= 20) {
                    z = false;
                }
                if (z && i3 > 0) {
                    PhoneFormatter.this.phoneNumber.getText().delete(i, i + i3);
                }
                if (z4) {
                    String formattedPhoneNumber = PhoneFormatter.this.getFormattedPhoneNumber(charSequence);
                    if (z2 || z3) {
                        PhoneFormatter.this.phoneNumber.getText().clear();
                        PhoneFormatter.this.phoneNumber.append(formattedPhoneNumber);
                    }
                    PhoneFormatter.this.checkPhoneNumber(PhoneFormatter.this.getPhoneWithCode(PhoneFormatter.this.phoneNumber.getText()));
                } else {
                    PhoneFormatter.this.onPhoneInfoChanged(null, false, false);
                }
                PhoneFormatter.this.processingNumber = false;
            }
        }
    }

    public PhoneFormatter(@NonNull EditText editText, @Nullable String str, @Nullable VerificationApi.PhoneNumberCheckSession phoneNumberCheckSession) {
        this.processingNumber = false;
        this.processingNumber = false;
        this.phoneNumber = editText;
        this.phoneNumber.setSelection(editText.length(), editText.length());
        this.phoneCheckService = str;
        this.phoneNumberCheckSession = phoneNumberCheckSession;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void checkPhoneNumber(String str) {
        if (!phoneCheckRequired() || TextUtils.isEmpty(str) || this.phoneNumberCheckSession == null) {
            return;
        }
        this.phoneNumberCheckSession.checkPhoneNumber(this.phoneCheckService, str, true, this.phoneCheckListener);
        Utils.uiHandler.removeCallbacks(this.unblockRunnable);
        Utils.uiHandler.postDelayed(this.unblockRunnable, 10000L);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public String getFormattedPhoneNumber(CharSequence charSequence) {
        String phoneWithCode = getPhoneWithCode(charSequence);
        String str = "";
        for (int i = 0; i < phoneWithCode.length(); i++) {
            char charAt = phoneWithCode.charAt(i);
            if (Character.isDigit(charAt) || charAt == '+') {
                str = this.formatter.inputDigit(charAt);
            }
        }
        String trim = str.substring(1).replaceFirst(getCountryCodeValue(), "").trim();
        this.formatter.clear();
        return trim;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public String getPhoneWithCode(CharSequence charSequence) {
        return Marker.ANY_NON_NULL_MARKER + getCountryCodeValue() + ((Object) charSequence);
    }

    public void attach() {
        this.phoneNumber.setSelection(this.phoneNumber.length(), this.phoneNumber.length());
        this.textWatcher.onTextChanged(this.phoneNumber.getText(), 0, 0, 0);
        this.phoneNumber.addTextChangedListener(this.textWatcher);
    }

    public void detach() {
        this.phoneNumber.removeTextChangedListener(this.textWatcher);
    }

    protected abstract String getCountryCodeValue();

    protected abstract boolean isFixedLineNumberBlockEnabled();

    protected abstract boolean isModifyPhoneNumberBlockEnabled();

    protected abstract void onPhoneInfoChanged(String str);

    protected abstract void onPhoneInfoChanged(String str, boolean z, boolean z2);

    protected abstract void onPhoneInfoChanged(boolean z, boolean z2);

    protected void onTextChanged() {
    }

    protected abstract boolean phoneCheckRequired();

    protected abstract void setCountryCodeValue(@NonNull String str);

    /* JADX INFO: Access modifiers changed from: protected */
    public void update() {
        checkPhoneNumber(getPhoneWithCode(this.phoneNumber.getText()));
    }
}
