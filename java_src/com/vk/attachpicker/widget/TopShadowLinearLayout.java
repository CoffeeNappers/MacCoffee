package com.vk.attachpicker.widget;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.drawable.Drawable;
import android.support.v4.content.ContextCompat;
import android.util.AttributeSet;
import android.widget.LinearLayout;
import com.vk.core.util.Screen;
import com.vkontakte.android.R;
/* loaded from: classes2.dex */
public class TopShadowLinearLayout extends LinearLayout {
    private Drawable mShadowDrawable;
    private final int shadowHeight;

    public TopShadowLinearLayout(Context context) {
        super(context);
        this.shadowHeight = Screen.dp(8);
        init();
    }

    public TopShadowLinearLayout(Context context, AttributeSet attrs) {
        super(context, attrs);
        this.shadowHeight = Screen.dp(8);
        init();
    }

    public TopShadowLinearLayout(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        this.shadowHeight = Screen.dp(8);
        init();
    }

    private void init() {
        this.mShadowDrawable = ContextCompat.getDrawable(getContext(), R.drawable.picker_bg_attach_toolbar);
        this.mShadowDrawable.setCallback(this);
        setWillNotDraw(false);
    }

    @Override // android.view.View
    protected void onSizeChanged(int w, int h, int oldw, int oldh) {
        super.onSizeChanged(w, h, oldw, oldh);
        if (this.mShadowDrawable != null) {
            int top = (int) getResources().getDimension(R.dimen.picker_toolbar_height);
            this.mShadowDrawable.setBounds(0, top, w, this.shadowHeight + top);
        }
    }

    @Override // android.view.View
    public void draw(Canvas canvas) {
        super.draw(canvas);
        if (this.mShadowDrawable != null) {
            this.mShadowDrawable.draw(canvas);
        }
    }
}
