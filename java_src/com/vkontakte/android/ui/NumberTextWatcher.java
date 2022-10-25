package com.vkontakte.android.ui;

import android.text.Editable;
import android.text.TextWatcher;
import java.text.DecimalFormat;
import java.text.DecimalFormatSymbols;
import java.text.ParseException;
/* loaded from: classes3.dex */
public class NumberTextWatcher implements TextWatcher {
    private DecimalFormat dfnd = new DecimalFormat();
    private android.widget.EditText et;

    public NumberTextWatcher(android.widget.EditText et) {
        DecimalFormatSymbols symbols = this.dfnd.getDecimalFormatSymbols();
        symbols.setGroupingSeparator(' ');
        this.dfnd.setDecimalFormatSymbols(symbols);
        this.et = et;
    }

    @Override // android.text.TextWatcher
    public void afterTextChanged(Editable s) {
        this.et.removeTextChangedListener(this);
        try {
            int inilen = this.et.getText().length();
            String v = s.toString().replace(String.valueOf(this.dfnd.getDecimalFormatSymbols().getGroupingSeparator()), "");
            Number n = this.dfnd.parse(v);
            int cp = this.et.getSelectionStart();
            this.et.setText(this.dfnd.format(n));
            int endlen = this.et.getText().length();
            int sel = cp + (endlen - inilen);
            if (sel > 0 && sel <= this.et.getText().length()) {
                this.et.setSelection(sel);
            } else {
                this.et.setSelection(this.et.getText().length() - 1);
            }
        } catch (NumberFormatException e) {
        } catch (ParseException e2) {
        }
        this.et.addTextChangedListener(this);
    }

    @Override // android.text.TextWatcher
    public void beforeTextChanged(CharSequence s, int start, int count, int after) {
    }

    @Override // android.text.TextWatcher
    public void onTextChanged(CharSequence charSequence, int i, int i1, int i2) {
    }
}
