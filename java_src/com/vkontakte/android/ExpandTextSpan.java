package com.vkontakte.android;

import android.content.Context;
import android.text.TextPaint;
import android.view.View;
import com.vkontakte.android.ui.Font;
/* loaded from: classes2.dex */
public class ExpandTextSpan extends LinkSpan {
    private View.OnClickListener clickListener;

    public ExpandTextSpan(String l) {
        super(l);
    }

    @Override // com.vkontakte.android.LinkSpan
    public void onClick(Context context) {
        if (this.clickListener != null) {
            this.clickListener.onClick(null);
        }
    }

    public void setOnClickListener(View.OnClickListener l) {
        this.clickListener = l;
    }

    @Override // com.vkontakte.android.LinkSpan, android.text.style.CharacterStyle
    public void updateDrawState(TextPaint tp) {
        super.updateDrawState(tp);
        tp.setTypeface(Font.Medium.typeface);
    }
}
