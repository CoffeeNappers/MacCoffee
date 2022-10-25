package com.vkontakte.android.ui;

import android.content.Context;
import android.util.AttributeSet;
import android.widget.FrameLayout;
import android.widget.ProgressBar;
import com.vkontakte.android.Global;
/* loaded from: classes3.dex */
public class LoadMoreFooterView extends FrameLayout {
    private ProgressBar progress;
    private boolean visible;

    public LoadMoreFooterView(Context context) {
        super(context);
        this.visible = true;
        init();
    }

    public LoadMoreFooterView(Context context, AttributeSet attrs) {
        super(context, attrs);
        this.visible = true;
        init();
    }

    public LoadMoreFooterView(Context context, AttributeSet attrs, int defStyle) {
        super(context, attrs, defStyle);
        this.visible = true;
        init();
    }

    private void init() {
        this.progress = new ProgressBar(getContext());
        this.progress.setLayoutParams(new FrameLayout.LayoutParams(Global.scale(32.0f), Global.scale(32.0f), 17));
        addView(this.progress);
        int pad = Global.scale(8.0f);
        setPadding(pad, pad, pad, pad);
    }

    @Override // android.widget.FrameLayout, android.view.View
    public void onMeasure(int wms, int hms) {
        if (this.visible) {
            super.onMeasure(wms, hms);
        } else {
            setMeasuredDimension(1, 1);
        }
    }

    public void setVisible(boolean v) {
        this.visible = v;
        requestLayout();
    }

    public boolean isVisible() {
        return this.visible;
    }

    public ProgressBar getProgressBar() {
        return this.progress;
    }
}
