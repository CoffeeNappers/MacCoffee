package com.vk.attachpicker.widget;

import android.text.Editable;
import android.text.TextWatcher;
/* loaded from: classes2.dex */
public class EmptyLineTextWatcher implements TextWatcher {
    public static final EmptyLineTextWatcher INSTANCE = new EmptyLineTextWatcher();

    @Override // android.text.TextWatcher
    public void beforeTextChanged(CharSequence s, int start, int count, int after) {
    }

    @Override // android.text.TextWatcher
    public void onTextChanged(CharSequence s, int start, int before, int count) {
    }

    @Override // android.text.TextWatcher
    public void afterTextChanged(Editable s) {
        char[] buf = new char[1];
        if (s.length() > 0) {
            if (s.length() == 1) {
                s.getChars(0, 1, buf, 0);
                if (buf[0] == '\n') {
                    s.clear();
                    return;
                }
                return;
            }
            for (int i = 2; i < s.length(); i++) {
                s.getChars(i - 2, i - 1, buf, 0);
                char prevPrevChar = buf[0];
                s.getChars(i - 1, i, buf, 0);
                char prevChar = buf[0];
                s.getChars(i, i + 1, buf, 0);
                char curChar = buf[0];
                if (curChar == '\n' && ((prevChar == '\n' || prevChar == ' ' || prevChar == '\t') && (prevPrevChar == '\n' || prevPrevChar == ' ' || prevPrevChar == '\t'))) {
                    s.replace(i, i + 1, "");
                    return;
                }
            }
        }
    }
}
