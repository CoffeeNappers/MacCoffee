package com.vkontakte.android;

import android.content.Context;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.text.Html;
import android.text.Spannable;
import android.text.TextPaint;
import android.text.style.URLSpan;
import android.util.AttributeSet;
import android.widget.RemoteViews;
import android.widget.TextView;
@RemoteViews.RemoteView
/* loaded from: classes.dex */
public class ExTextView extends TextView {
    public ExTextView(Context context) {
        super(context);
    }

    public ExTextView(Context context, AttributeSet attrs) {
        super(context, attrs);
    }

    public ExTextView(Context context, AttributeSet attrs, int defStyle) {
        super(context, attrs, defStyle);
    }

    @Override // android.view.View
    public void onFinishInflate() {
        setFocusable(false);
        setFocusableInTouchMode(false);
    }

    public void setTextEx(CharSequence s) {
        try {
            Spannable sp = doIt((Spannable) s);
            super.setText(sp);
        } catch (Exception e) {
            super.setText(s);
        }
    }

    public void setHTML(String h) {
        try {
            Spannable sp = doIt((Spannable) Html.fromHtml(h, new ResourceImageGetter(), null));
            super.setText(Global.replaceEmoji(sp));
        } catch (Exception e) {
            super.setText(Html.fromHtml(h, new ResourceImageGetter(), null));
        }
    }

    public void setHTML(String h, Html.ImageGetter igetter) {
        try {
            Spannable sp = doIt((Spannable) Html.fromHtml(h, igetter, null));
            super.setText(sp);
        } catch (Exception e) {
            super.setText(Html.fromHtml(h, new ResourceImageGetter(), null));
        }
    }

    private Spannable doIt(Spannable s) {
        URLSpan[] spans = (URLSpan[]) s.getSpans(0, s.length(), URLSpan.class);
        for (URLSpan span : spans) {
            int start = s.getSpanStart(span);
            int end = s.getSpanEnd(span);
            s.removeSpan(span);
            s.setSpan(new URLSpanNoUnderline(span.getURL()), start, end, 0);
        }
        return s;
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes2.dex */
    public class URLSpanNoUnderline extends URLSpan {
        public URLSpanNoUnderline(String url) {
            super(url);
        }

        @Override // android.text.style.ClickableSpan, android.text.style.CharacterStyle
        public void updateDrawState(TextPaint ds) {
            super.updateDrawState(ds);
            ds.setUnderlineText(false);
            if (ds.drawableState != null) {
                if (ExTextView.this.isPressed() || ExTextView.this.isSelected()) {
                    ds.setColor(-1);
                } else {
                    ds.setColor(-13936518);
                }
            }
        }
    }

    /* loaded from: classes2.dex */
    private class ResourceImageGetter implements Html.ImageGetter {
        private ResourceImageGetter() {
        }

        @Override // android.text.Html.ImageGetter
        public Drawable getDrawable(String source) {
            if (source.startsWith("empty,")) {
                String[] t = source.split(",");
                ColorDrawable cd = new ColorDrawable(-2147418368);
                cd.setBounds(0, 0, Integer.parseInt(t[1]), Integer.parseInt(t[2]));
                return cd;
            }
            try {
                Drawable drawable = ExTextView.this.getResources().getDrawable(Integer.parseInt(source));
                drawable.setBounds(0, 0, drawable.getIntrinsicWidth(), drawable.getIntrinsicHeight());
                return drawable;
            } catch (Exception e) {
                return null;
            }
        }
    }
}
