package ru.mail.libverify.controls.formatters;

import android.support.annotation.NonNull;
import android.text.TextUtils;
import android.widget.EditText;
import android.widget.TextView;
/* loaded from: classes3.dex */
public class SimplePhoneFormatter extends PhoneFormatter {
    private final TextView countryCode;

    public SimplePhoneFormatter(@NonNull EditText editText, @NonNull TextView textView) {
        super(editText, null, null);
        this.countryCode = textView;
    }

    @Override // ru.mail.libverify.controls.formatters.PhoneFormatter
    protected String getCountryCodeValue() {
        return this.countryCode.getText().toString().substring(1);
    }

    @Override // ru.mail.libverify.controls.formatters.PhoneFormatter
    protected boolean isFixedLineNumberBlockEnabled() {
        return false;
    }

    @Override // ru.mail.libverify.controls.formatters.PhoneFormatter
    protected boolean isModifyPhoneNumberBlockEnabled() {
        return false;
    }

    @Override // ru.mail.libverify.controls.formatters.PhoneFormatter
    protected void onPhoneInfoChanged(String str) {
    }

    @Override // ru.mail.libverify.controls.formatters.PhoneFormatter
    protected void onPhoneInfoChanged(String str, boolean z, boolean z2) {
    }

    @Override // ru.mail.libverify.controls.formatters.PhoneFormatter
    protected void onPhoneInfoChanged(boolean z, boolean z2) {
    }

    @Override // ru.mail.libverify.controls.formatters.PhoneFormatter
    protected boolean phoneCheckRequired() {
        return false;
    }

    @Override // ru.mail.libverify.controls.formatters.PhoneFormatter
    protected void setCountryCodeValue(@NonNull String str) {
        if (TextUtils.isEmpty(str)) {
            return;
        }
        this.countryCode.setText(str);
    }
}
