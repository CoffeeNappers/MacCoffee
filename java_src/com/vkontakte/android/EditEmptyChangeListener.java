package com.vkontakte.android;

import android.text.Editable;
import android.text.TextWatcher;
/* loaded from: classes2.dex */
public abstract class EditEmptyChangeListener implements TextWatcher {
    private boolean isEmpty = true;

    public abstract void onEmptyChanged(boolean z);

    @Override // android.text.TextWatcher
    public void afterTextChanged(Editable s) {
    }

    @Override // android.text.TextWatcher
    public void beforeTextChanged(CharSequence s, int start, int count, int after) {
    }

    @Override // android.text.TextWatcher
    public void onTextChanged(CharSequence s, int start, int before, int count) {
        boolean e = s.length() == 0;
        if (e != this.isEmpty) {
            this.isEmpty = e;
            onEmptyChanged(e);
        }
    }
}
