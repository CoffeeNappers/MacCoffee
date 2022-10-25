package com.vkontakte.android.ui;

import android.content.Context;
import android.os.Build;
import android.util.AttributeSet;
import android.view.MotionEvent;
import android.view.View;
import com.vkontakte.android.R;
/* loaded from: classes3.dex */
public class HighlightView extends View {
    public HighlightView(Context context) {
        super(context);
        init();
    }

    public HighlightView(Context context, AttributeSet attrs) {
        super(context, attrs);
        init();
    }

    public HighlightView(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        init();
    }

    public HighlightView(Context context, AttributeSet attrs, int defStyleAttr, int defStyleRes) {
        super(context, attrs, defStyleAttr, defStyleRes);
        init();
    }

    private void init() {
        setBackgroundDrawable(getResources().getDrawable(R.drawable.highlight));
    }

    @Override // android.view.View
    public boolean dispatchTouchEvent(MotionEvent event) {
        if (Build.VERSION.SDK_INT >= 21 && getBackground() != null) {
            getBackground().setHotspot(event.getX(), event.getY());
        }
        return super.dispatchTouchEvent(event);
    }
}
