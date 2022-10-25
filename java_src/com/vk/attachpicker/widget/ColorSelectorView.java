package com.vk.attachpicker.widget;

import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.support.v4.content.ContextCompat;
import android.support.v4.view.ViewPager;
import android.util.AttributeSet;
import android.view.View;
import android.widget.LinearLayout;
import com.vk.attachpicker.Picker;
import com.vk.attachpicker.drawing.DrawingColors;
import com.vk.core.util.ColorUtils;
import com.vk.core.util.Screen;
import com.vkontakte.android.R;
/* loaded from: classes2.dex */
public class ColorSelectorView extends ViewPager {
    private static final int COLORS_PER_PAGE = 8;
    private static final int MAX_WIDTH = Screen.realWidth();
    private int innerMarginLeft;
    private int innerMarginRight;
    private OnColorSelectedListener onColorSelectedListener;
    private int selectedColor;
    private boolean whiteBorder;

    /* loaded from: classes2.dex */
    public interface OnColorSelectedListener {
        void onBrushTypeSelected(int i);

        void onColorSelected(int i);
    }

    public ColorSelectorView(Context context) {
        this(context, null);
    }

    public ColorSelectorView(Context context, AttributeSet attrs) {
        super(context, attrs);
        this.selectedColor = DrawingColors.COLORS[0];
        TypedArray a = context.obtainStyledAttributes(attrs, R.styleable.ColorSelectorView, 0, 0);
        this.whiteBorder = a.getBoolean(0, true);
        this.innerMarginLeft = a.getDimensionPixelSize(1, 0);
        this.innerMarginRight = a.getDimensionPixelSize(2, 0);
        a.recycle();
        init();
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // android.support.v4.view.ViewPager, android.view.View
    public void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
        if (View.MeasureSpec.getSize(widthMeasureSpec) > MAX_WIDTH) {
            super.onMeasure(View.MeasureSpec.makeMeasureSpec(MAX_WIDTH, 1073741824), heightMeasureSpec);
        } else {
            super.onMeasure(widthMeasureSpec, heightMeasureSpec);
        }
    }

    private void init() {
        setOffscreenPageLimit(5);
        setAdapter(new PagerAdapter());
    }

    public void setSelectedColor(int color) {
        this.selectedColor = color;
        int index = -1;
        int i = 0;
        while (true) {
            if (i < DrawingColors.COLORS.length) {
                if (DrawingColors.COLORS[i] != color) {
                    i++;
                } else {
                    index = i;
                    break;
                }
            } else {
                break;
            }
        }
        for (int j = 0; j < getChildCount(); j++) {
            LinearLayout ll = (LinearLayout) getChildAt(j);
            for (int k = 0; k < ll.getChildCount(); k++) {
                ColorView cv = (ColorView) ll.getChildAt(k);
                cv.setChecked(index == (j * 8) + k);
            }
        }
    }

    public int getSelectedColor() {
        return this.selectedColor;
    }

    public OnColorSelectedListener getOnColorSelectedListener() {
        return this.onColorSelectedListener;
    }

    public void setOnColorSelectedListener(OnColorSelectedListener onColorSelectedListener) {
        this.onColorSelectedListener = onColorSelectedListener;
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes2.dex */
    public static class ColorView extends View {
        private final int color;
        private final Paint coloredPaint;
        private boolean isChecked;
        private final boolean useWhiteBorder;
        private static final int SELECTED_RADIUS = Screen.dp(14);
        private static final int RADIUS = Screen.dp(12);
        private static final int SELECTED_CENTER_RADIUS = Screen.dp(4);
        private static final int WHITE_BORDER_WIDTH = Screen.dp(2);
        private static final int GRAY_BORDER_WIDTH = Screen.dp(1);
        private static final Paint borderPaint = new Paint(1);
        private static final Paint grayBorder = new Paint(1);
        private static final Paint whiteBorder = new Paint(1);
        private static final Paint selectedCenter = new Paint(1);

        static {
            grayBorder.setColor(-2104602);
            grayBorder.setStyle(Paint.Style.STROKE);
            grayBorder.setStrokeWidth(GRAY_BORDER_WIDTH);
            borderPaint.setColor(ContextCompat.getColor(Picker.getContext(), R.color.picker_blue));
            borderPaint.setStyle(Paint.Style.STROKE);
            borderPaint.setStrokeWidth(WHITE_BORDER_WIDTH);
            whiteBorder.setColor(-1);
            whiteBorder.setStyle(Paint.Style.STROKE);
            whiteBorder.setStrokeWidth(WHITE_BORDER_WIDTH);
            selectedCenter.setColor(-1);
            selectedCenter.setStyle(Paint.Style.FILL);
        }

        public ColorView(Context context, int color, boolean useWhiteBorder) {
            super(context);
            this.coloredPaint = new Paint(1);
            this.color = color;
            this.useWhiteBorder = useWhiteBorder;
            this.coloredPaint.setColor(color);
            this.coloredPaint.setStyle(Paint.Style.FILL);
        }

        @Override // android.view.View
        protected void onDraw(Canvas canvas) {
            int radius;
            super.onDraw(canvas);
            int cx = canvas.getWidth() / 2;
            int cy = canvas.getHeight() / 2;
            if (this.isChecked) {
                radius = SELECTED_RADIUS;
            } else {
                radius = RADIUS;
            }
            canvas.drawCircle(cx, cy, radius - 1, this.coloredPaint);
            if (this.useWhiteBorder) {
                canvas.drawCircle(cx, cy, radius - (WHITE_BORDER_WIDTH / 2), whiteBorder);
                if (this.color == -1 && !this.isChecked) {
                    canvas.drawCircle(cx, cy, radius - WHITE_BORDER_WIDTH, grayBorder);
                }
            } else if (this.color == -1) {
                canvas.drawCircle(cx, cy, radius - GRAY_BORDER_WIDTH, grayBorder);
            }
            if (this.isChecked) {
                selectedCenter.setColor(ColorUtils.getOverlayColor(this.color));
                canvas.drawCircle(cx, cy, SELECTED_CENTER_RADIUS, selectedCenter);
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

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes2.dex */
    public class PagerAdapter extends ViewPagerAdapter {
        private PagerAdapter() {
        }

        @Override // com.vk.attachpicker.widget.ViewPagerAdapter
        public View getView(int position, ViewPager pager) {
            LinearLayout innerLayout = new LinearLayout(ColorSelectorView.this.getContext());
            innerLayout.setOrientation(0);
            innerLayout.setPadding(Screen.dp(8) + ColorSelectorView.this.innerMarginLeft, 0, Screen.dp(8) + ColorSelectorView.this.innerMarginRight, 0);
            for (int i = position * 8; i < (position * 8) + 8; i++) {
                int color = DrawingColors.COLORS[i];
                ColorView colorView = new ColorView(ColorSelectorView.this.getContext(), color, ColorSelectorView.this.whiteBorder);
                colorView.setChecked(color == ColorSelectorView.this.selectedColor);
                LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(0, -1);
                lp.weight = 1.0f;
                lp.gravity = 16;
                innerLayout.addView(colorView, lp);
                colorView.setOnClickListener(ColorSelectorView$PagerAdapter$$Lambda$1.lambdaFactory$(this, color, colorView));
            }
            return innerLayout;
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public /* synthetic */ void lambda$getView$0(int color, ColorView colorView, View v) {
            ColorSelectorView.this.selectedColor = color;
            if (ColorSelectorView.this.onColorSelectedListener != null) {
                ColorSelectorView.this.onColorSelectedListener.onColorSelected(color);
            }
            for (int j = 0; j < ColorSelectorView.this.getChildCount(); j++) {
                LinearLayout ll = (LinearLayout) ColorSelectorView.this.getChildAt(j);
                for (int k = 0; k < ll.getChildCount(); k++) {
                    ColorView cv = (ColorView) ll.getChildAt(k);
                    cv.setChecked(cv == colorView);
                }
            }
        }

        @Override // android.support.v4.view.PagerAdapter
        public int getCount() {
            return DrawingColors.COLORS.length / 8;
        }
    }
}
