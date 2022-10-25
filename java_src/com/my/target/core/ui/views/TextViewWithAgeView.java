package com.my.target.core.ui.views;

import android.content.Context;
import android.text.TextUtils;
import android.view.View;
import android.widget.RelativeLayout;
import android.widget.TextView;
import com.my.target.core.utils.l;
/* loaded from: classes2.dex */
public class TextViewWithAgeView extends RelativeLayout {
    private static final int a = l.a();
    private final l b;
    private final RelativeLayout.LayoutParams c;
    private final RelativeLayout.LayoutParams d;
    private final TextView e;
    private final BorderedTextView f;

    public TextViewWithAgeView(Context context) {
        super(context);
        this.b = new l(context);
        this.e = new TextView(context);
        this.f = new BorderedTextView(context);
        this.e.setId(a);
        this.f.setSingleLine();
        this.e.setTextSize(2, 18.0f);
        this.e.setSingleLine();
        this.e.setHorizontallyScrolling(true);
        this.e.setEllipsize(TextUtils.TruncateAt.END);
        this.e.setMaxLines(1);
        this.e.setTextColor(-1);
        this.c = new RelativeLayout.LayoutParams(-2, -2);
        this.d = new RelativeLayout.LayoutParams(-2, -2);
        this.d.setMargins(this.b.a(8), 0, this.b.a(8), 0);
        this.d.addRule(15, -1);
        if (l.c(18)) {
            this.d.addRule(17, a);
        } else {
            this.d.addRule(1, a);
        }
        this.f.setLayoutParams(this.d);
        this.e.setLayoutParams(this.c);
        addView(this.e);
        addView(this.f);
    }

    public final TextView a() {
        return this.e;
    }

    public final BorderedTextView b() {
        return this.f;
    }

    @Override // android.widget.RelativeLayout, android.view.View
    protected void onMeasure(int i, int i2) {
        int size;
        int i3 = 0;
        int measuredWidth = getChildAt(0) != null ? getChildAt(0).getMeasuredWidth() : 0;
        if (getChildAt(1) != null) {
            i3 = getChildAt(1).getMeasuredWidth();
        }
        if (measuredWidth != 0 && i3 != 0 && getChildCount() == 2 && measuredWidth + i3 > (size = View.MeasureSpec.getSize(i))) {
            this.c.width = (size - i3) - this.b.a(8);
            this.e.setLayoutParams(this.c);
        }
        super.onMeasure(i, i2);
    }
}
