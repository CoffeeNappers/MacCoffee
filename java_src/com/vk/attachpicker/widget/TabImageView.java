package com.vk.attachpicker.widget;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.support.v4.content.ContextCompat;
import android.util.AttributeSet;
import android.widget.ImageView;
import com.vk.attachpicker.util.Utils;
import com.vk.core.util.Screen;
import com.vkontakte.android.R;
/* loaded from: classes2.dex */
public class TabImageView extends ImageView {
    private final int DP8;
    private final Paint bgCircle;
    private int colorNotSelected;
    private int colorSelected;
    private float selection;

    public TabImageView(Context context) {
        super(context);
        this.DP8 = Screen.dp(8);
        this.bgCircle = new Paint(1);
        init(context);
    }

    public TabImageView(Context context, AttributeSet attrs) {
        super(context, attrs);
        this.DP8 = Screen.dp(8);
        this.bgCircle = new Paint(1);
        init(context);
    }

    public TabImageView(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        this.DP8 = Screen.dp(8);
        this.bgCircle = new Paint(1);
        init(context);
    }

    private void init(Context context) {
        this.colorNotSelected = ContextCompat.getColor(context, R.color.picker_tab_bg_normal);
        this.colorSelected = ContextCompat.getColor(context, R.color.picker_tab_bg_selected);
    }

    @Override // android.widget.ImageView, android.view.View
    protected void onDraw(Canvas canvas) {
        int wr = (canvas.getWidth() / 2) - Math.max(getPaddingLeft(), getPaddingRight());
        int hr = (canvas.getHeight() / 2) - Math.max(getPaddingTop(), getPaddingBottom());
        int r = Math.min(wr, hr) - Utils.interpolate(0, this.DP8 / 2, 1.0f - this.selection);
        int color = Utils.interpolateColors(this.colorNotSelected, this.colorSelected, this.selection);
        this.bgCircle.setColor(color);
        canvas.drawCircle(canvas.getWidth() / 2, canvas.getHeight() / 2, r, this.bgCircle);
        super.onDraw(canvas);
    }

    public float getSelection() {
        return this.selection;
    }

    public void setSelection(float selection) {
        this.selection = selection;
        invalidate();
    }

    public void setSelection(int holderPosition, int realCurrentPage, float positionOffset) {
        if (holderPosition == realCurrentPage) {
            setSelection(1.0f - positionOffset);
        } else if (holderPosition == realCurrentPage + 1) {
            setSelection(positionOffset);
        } else {
            setSelection(0.0f);
        }
    }
}
