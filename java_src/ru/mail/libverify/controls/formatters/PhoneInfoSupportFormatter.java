package ru.mail.libverify.controls.formatters;

import android.support.annotation.NonNull;
import android.text.Editable;
import android.text.TextUtils;
import android.text.TextWatcher;
import android.widget.EditText;
import android.widget.TextView;
import com.google.i18n.phonenumbers.NumberParseException;
import com.google.i18n.phonenumbers.PhoneNumberUtil;
import com.google.i18n.phonenumbers.Phonenumber;
import java.util.Locale;
import ru.mail.libverify.api.VerificationApi;
/* loaded from: classes3.dex */
public abstract class PhoneInfoSupportFormatter extends PhoneFormatter {
    protected final TextView countryCode;
    protected final TextView phoneInfo;
    private boolean phoneNumberValid;

    public PhoneInfoSupportFormatter(@NonNull TextView textView, @NonNull EditText editText, @NonNull TextView textView2, @NonNull String str, @NonNull VerificationApi.PhoneNumberCheckSession phoneNumberCheckSession) {
        super(editText, str, phoneNumberCheckSession);
        this.countryCode = textView;
        this.phoneInfo = textView2;
        this.countryCode.addTextChangedListener(new TextWatcher() { // from class: ru.mail.libverify.controls.formatters.PhoneInfoSupportFormatter.1
            @Override // android.text.TextWatcher
            public void afterTextChanged(Editable editable) {
            }

            @Override // android.text.TextWatcher
            public void beforeTextChanged(CharSequence charSequence, int i, int i2, int i3) {
            }

            @Override // android.text.TextWatcher
            public void onTextChanged(CharSequence charSequence, int i, int i2, int i3) {
                PhoneInfoSupportFormatter.this.update();
            }
        });
    }

    private void updateDoneButton() {
        onButtonStateChanged(!TextUtils.isEmpty(this.countryCode.getText()) && !TextUtils.isEmpty(this.phoneNumber.getText()) && this.phoneNumberValid);
    }

    @Override // ru.mail.libverify.controls.formatters.PhoneFormatter
    protected String getCountryCodeValue() {
        return this.countryCode.getText().toString().substring(1);
    }

    @Override // ru.mail.libverify.controls.formatters.PhoneFormatter
    protected boolean isFixedLineNumberBlockEnabled() {
        return true;
    }

    @Override // ru.mail.libverify.controls.formatters.PhoneFormatter
    protected boolean isModifyPhoneNumberBlockEnabled() {
        return false;
    }

    protected abstract void onButtonStateChanged(boolean z);

    @Override // ru.mail.libverify.controls.formatters.PhoneFormatter
    protected void onPhoneInfoChanged(String str) {
        this.phoneInfo.setText(str);
    }

    @Override // ru.mail.libverify.controls.formatters.PhoneFormatter
    protected void onPhoneInfoChanged(String str, boolean z, boolean z2) {
        this.phoneInfo.setText(str);
        onPhoneInfoChanged(z, z2);
    }

    @Override // ru.mail.libverify.controls.formatters.PhoneFormatter
    protected void onPhoneInfoChanged(boolean z, boolean z2) {
        this.phoneNumberValid = z;
        updateDoneButton();
        onWarningStateChanged(z2);
    }

    @Override // ru.mail.libverify.controls.formatters.PhoneFormatter
    protected void onTextChanged() {
        updateDoneButton();
    }

    protected abstract void onWarningStateChanged(boolean z);

    @Override // ru.mail.libverify.controls.formatters.PhoneFormatter
    protected boolean phoneCheckRequired() {
        return true;
    }

    @Override // ru.mail.libverify.controls.formatters.PhoneFormatter
    protected void setCountryCodeValue(@NonNull String str) {
        if (TextUtils.isEmpty(str)) {
            return;
        }
        this.countryCode.setText(str);
    }

    public void setPhoneNumberWithCode(String str) {
        if (TextUtils.isEmpty(str)) {
            return;
        }
        try {
            Phonenumber.PhoneNumber parse = PhoneNumberUtil.getInstance().parse(str, null);
            this.countryCode.setText(String.format(Locale.US, "+%d", Integer.valueOf(parse.getCountryCode())));
            this.phoneNumber.setText(String.format(Locale.US, "%d", Long.valueOf(parse.getNationalNumber())));
        } catch (NumberParseException e) {
        }
    }
}
