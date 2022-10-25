package com.vkontakte.android;

import android.content.Context;
import android.util.AttributeSet;
import android.view.View;
import android.widget.ScrollView;
/* loaded from: classes2.dex */
public class AlignedScrollView extends ScrollView {
    boolean addingContentAtTop;
    private int prevHeight;
    private int prevViewH;

    public AlignedScrollView(Context context) {
        super(context);
        this.prevHeight = 0;
        this.prevViewH = 0;
        this.addingContentAtTop = false;
    }

    public AlignedScrollView(Context context, AttributeSet attrs) {
        super(context, attrs);
        this.prevHeight = 0;
        this.prevViewH = 0;
        this.addingContentAtTop = false;
    }

    public AlignedScrollView(Context context, AttributeSet attrs, int defStyle) {
        super(context, attrs, defStyle);
        this.prevHeight = 0;
        this.prevViewH = 0;
        this.addingContentAtTop = false;
    }

    @Override // android.widget.ScrollView, android.widget.FrameLayout, android.view.ViewGroup, android.view.View
    protected void onLayout(boolean changed, int l, int t, int r, int b) {
        if (changed && this.prevHeight > 0) {
            scrollBy(0, -(getHeight() - this.prevHeight));
        }
        super.onLayout(changed, l, t, r, b);
        if (!changed && this.addingContentAtTop) {
            View v = getChildAt(0);
            if (v != null) {
                scrollTo(0, (v.getHeight() - this.prevViewH) + getScrollY());
            }
            this.addingContentAtTop = false;
        }
        this.prevHeight = getHeight();
        View v2 = getChildAt(0);
        if (v2 != null) {
            this.prevViewH = v2.getHeight();
        }
    }
}
