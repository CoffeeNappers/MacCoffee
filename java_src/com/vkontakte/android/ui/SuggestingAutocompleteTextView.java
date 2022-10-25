package com.vkontakte.android.ui;

import android.content.Context;
import android.util.AttributeSet;
import android.widget.AutoCompleteTextView;
/* loaded from: classes3.dex */
public class SuggestingAutocompleteTextView extends AutoCompleteTextView {
    public SuggestingAutocompleteTextView(Context context) {
        super(context);
    }

    public SuggestingAutocompleteTextView(Context context, AttributeSet attrs) {
        super(context, attrs);
    }

    public SuggestingAutocompleteTextView(Context context, AttributeSet attrs, int defStyle) {
        super(context, attrs, defStyle);
    }

    @Override // android.widget.AutoCompleteTextView
    public boolean enoughToFilter() {
        return true;
    }

    @Override // android.widget.AutoCompleteTextView
    public void showDropDown() {
        postDelayed(new Runnable() { // from class: com.vkontakte.android.ui.SuggestingAutocompleteTextView.1
            @Override // java.lang.Runnable
            public void run() {
                SuggestingAutocompleteTextView.super.showDropDown();
            }
        }, 200L);
    }
}
