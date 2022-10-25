package com.vk.attachpicker.widget;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.drawable.ColorDrawable;
import android.support.v4.content.ContextCompat;
import android.view.View;
import android.widget.LinearLayout;
import android.widget.PopupWindow;
import com.vk.attachpicker.Picker;
import com.vk.attachpicker.drawing.DrawingState;
import com.vk.core.util.Screen;
import com.vkontakte.android.R;
/* loaded from: classes2.dex */
public class WidthSelectorView extends LinearLayout {
    private final int color;
    private OnWidthSelectedListener onWidthSelectedListener;
    private static final int viewSize = Screen.dp(56);
    private static final int radius = Screen.dp(4);

    /* loaded from: classes2.dex */
    public interface OnWidthSelectedListener {
        void onWidthSelected(int i);
    }

    public static void show(View view, int color, int selectedWidth, OnWidthSelectedListener onWidthSelectedListener) {
        WidthSelectorView widthSelectorView = new WidthSelectorView(view.getContext(), color, selectedWidth);
        PopupWindow window = new PopupWindow((View) widthSelectorView, Screen.dp(64), Screen.dp(244), true);
        widthSelectorView.setOnWidthSelectedListener(WidthSelectorView$$Lambda$1.lambdaFactory$(onWidthSelectedListener, window));
        window.setBackgroundDrawable(new ColorDrawable(0));
        window.setOutsideTouchable(true);
        window.showAsDropDown(view);
    }

    public static /* synthetic */ void lambda$show$0(OnWidthSelectedListener onWidthSelectedListener, PopupWindow window, int widthIndex) {
        if (onWidthSelectedListener != null) {
            onWidthSelectedListener.onWidthSelected(widthIndex);
        }
        window.dismiss();
    }

    public WidthSelectorView(Context context, int color, int selectedWidth) {
        super(context);
        this.color = color;
        init();
        setWidth(selectedWidth);
    }

    private void init() {
        setOrientation(1);
        setPadding(0, Screen.dp(8), 0, Screen.dp(24));
        setBackgroundResource(R.drawable.picker_bg_tip_tail_left_bottom);
        addWidthView(DrawingState.WIDTH[4], 4, Screen.dp(56));
        addWidthView(DrawingState.WIDTH[3], 3, Screen.dp(48));
        addWidthView(DrawingState.WIDTH[2], 2, Screen.dp(44));
        addWidthView(DrawingState.WIDTH[1], 1, Screen.dp(40));
        addWidthView(DrawingState.WIDTH[0], 0, Screen.dp(32));
    }

    public void setOnWidthSelectedListener(OnWidthSelectedListener onWidthSelectedListener) {
        this.onWidthSelectedListener = onWidthSelectedListener;
    }

    public void setWidth(int widthIndex) {
        int realIndex = (DrawingState.WIDTH.length - widthIndex) - 1;
        int i = 0;
        while (i < getChildCount()) {
            ColorView cv = (ColorView) getChildAt(i);
            cv.setChecked(realIndex == i);
            i++;
        }
    }

    public int getColor() {
        return this.color;
    }

    private void addWidthView(float width, int widthIndex, int height) {
        ColorView colorView = new ColorView(getContext(), this.color, width);
        if (this.color == DrawingState.WIDTH[0]) {
            colorView.setChecked(true);
        }
        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(viewSize, height);
        lp.gravity = 1;
        addView(colorView, lp);
        colorView.setOnClickListener(WidthSelectorView$$Lambda$2.lambdaFactory$(this, colorView, widthIndex));
    }

    public /* synthetic */ void lambda$addWidthView$1(ColorView colorView, int widthIndex, View v) {
        for (int i = 0; i < getChildCount(); i++) {
            ColorView cv = (ColorView) getChildAt(i);
            cv.setChecked(cv == colorView);
        }
        if (this.onWidthSelectedListener != null) {
            this.onWidthSelectedListener.onWidthSelected(widthIndex);
        }
    }

    /* loaded from: classes2.dex */
    public static class ColorView extends View {
        private final int color;
        private final Paint coloredPaint;
        private boolean isChecked;
        private final float width;
        private static final int borderPadding = Screen.dp(2);
        private static final int borderWidth = Screen.dp(2);
        private static final Paint borderPaint = new Paint(1);
        private static final Paint grayBorder = new Paint(1);

        static {
            grayBorder.setColor(-3880756);
            grayBorder.setStyle(Paint.Style.STROKE);
            grayBorder.setStrokeWidth(Screen.dp(1));
            borderPaint.setColor(ContextCompat.getColor(Picker.getContext(), R.color.picker_blue));
            borderPaint.setStyle(Paint.Style.STROKE);
            borderPaint.setStrokeWidth(borderWidth);
        }

        public ColorView(Context context, int color, float width) {
            super(context);
            this.coloredPaint = new Paint(1);
            color = color == 0 ? -1 : color;
            this.color = color;
            this.width = width;
            this.coloredPaint.setColor(color);
            this.coloredPaint.setStyle(Paint.Style.FILL);
        }

        @Override // android.view.View
        protected void onDraw(Canvas canvas) {
            super.onDraw(canvas);
            int cx = canvas.getWidth() / 2;
            int cy = canvas.getHeight() / 2;
            canvas.drawCircle(cx, cy, WidthSelectorView.radius * this.width, this.coloredPaint);
            if (this.color == -1 && !this.isChecked) {
                canvas.drawCircle(cx, cy, WidthSelectorView.radius * this.width, grayBorder);
            }
            if (this.isChecked) {
                canvas.drawCircle(cx, cy, (WidthSelectorView.radius * this.width) + borderPadding + (borderWidth / 2), borderPaint);
            }
        }

        public boolean isChecked() {
            return this.isChecked;
        }

        public void setChecked(boolean checked) {
            this.isChecked = checked;
            invalidate();
        }
    }
}
