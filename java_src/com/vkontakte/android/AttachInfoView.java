package com.vkontakte.android;

import android.content.Context;
import android.text.Spannable;
import android.text.TextPaint;
import android.text.TextUtils;
import android.text.method.LinkMovementMethod;
import android.text.style.URLSpan;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;
/* loaded from: classes2.dex */
public class AttachInfoView extends LinearLayout {
    public AttachInfoView(Context context, int iconID, String text) {
        super(context);
        LinearLayout.LayoutParams lparams = new LinearLayout.LayoutParams(-1, -2);
        lparams.topMargin = (int) (3.0f * Global.displayDensity);
        setLayoutParams(lparams);
        setGravity(16);
        ImageView iconView = new ImageView(getContext());
        iconView.setDuplicateParentStateEnabled(true);
        addView(iconView);
        TextView textView = new TextView(getContext());
        textView.setMovementMethod(new LinkMovementMethod());
        textView.setTextColor(getResources().getColorStateList(R.color.hint));
        textView.setLinkTextColor(getResources().getColorStateList(R.color.link));
        textView.setSingleLine(true);
        textView.setEllipsize(TextUtils.TruncateAt.MARQUEE);
        addView(textView);
        iconView.setImageResource(iconID);
    }

    private Spannable stripUnderlines(Spannable s) {
        URLSpan[] spans = (URLSpan[]) s.getSpans(0, s.length(), URLSpan.class);
        for (URLSpan span : spans) {
            int start = s.getSpanStart(span);
            int end = s.getSpanEnd(span);
            s.removeSpan(span);
            s.setSpan(new URLSpanNoUnderline(span.getURL()), start, end, 0);
        }
        return s;
    }

    /* loaded from: classes2.dex */
    private class URLSpanNoUnderline extends URLSpan {
        public URLSpanNoUnderline(String url) {
            super(url);
        }

        @Override // android.text.style.ClickableSpan, android.text.style.CharacterStyle
        public void updateDrawState(TextPaint ds) {
            super.updateDrawState(ds);
            ds.setUnderlineText(false);
            if (ds.drawableState != null) {
                boolean isPressed = false;
                for (int i = 0; i < ds.drawableState.length; i++) {
                    if (ds.drawableState[i] == 16842919 || ds.drawableState[i] == 16842913) {
                        isPressed = true;
                    }
                }
                if (isPressed) {
                    ds.setColor(-1);
                } else {
                    ds.setColor(-13936518);
                }
            }
        }
    }
}
