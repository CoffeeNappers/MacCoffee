package com.flask.colorpicker;

import android.content.Context;
import android.content.res.Configuration;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.support.v4.view.ViewCompat;
import android.util.AttributeSet;
import android.view.MotionEvent;
import android.view.View;
import android.widget.LinearLayout;
import com.flask.colorpicker.builder.ColorWheelRendererBuilder;
import com.flask.colorpicker.builder.PaintBuilder;
import com.flask.colorpicker.renderer.ColorWheelRenderOption;
import com.flask.colorpicker.renderer.ColorWheelRenderer;
import com.vkontakte.android.R;
import java.util.ArrayList;
import java.util.Iterator;
/* loaded from: classes.dex */
public class ColorPickerView extends View {
    private static final float STROKE_RATIO = 2.0f;
    private float alpha;
    private Paint alphaPatternPaint;
    private int alphaSliderViewId;
    private int backgroundColor;
    private LinearLayout colorPreview;
    private int colorSelection;
    private Paint colorWheelFill;
    private ColorCircle currentColorCircle;
    private int density;
    private Integer initialColor;
    private Integer[] initialColors;
    private float lightness;
    private int lightnessSliderViewId;
    private ArrayList<OnColorSelectedListener> listeners;
    private ColorWheelRenderer renderer;
    private Paint selectorStroke1;
    private Paint selectorStroke2;

    public ColorPickerView(Context context) {
        super(context);
        this.density = 10;
        this.lightness = 1.0f;
        this.alpha = 1.0f;
        this.backgroundColor = 0;
        this.initialColors = new Integer[]{null, null, null, null, null};
        this.colorSelection = 0;
        this.colorWheelFill = PaintBuilder.newPaint().color(0).build();
        this.selectorStroke1 = PaintBuilder.newPaint().color(-1).build();
        this.selectorStroke2 = PaintBuilder.newPaint().color(ViewCompat.MEASURED_STATE_MASK).build();
        this.alphaPatternPaint = PaintBuilder.newPaint().build();
        this.listeners = new ArrayList<>();
    }

    public ColorPickerView(Context context, AttributeSet attrs) {
        super(context, attrs);
        this.density = 10;
        this.lightness = 1.0f;
        this.alpha = 1.0f;
        this.backgroundColor = 0;
        this.initialColors = new Integer[]{null, null, null, null, null};
        this.colorSelection = 0;
        this.colorWheelFill = PaintBuilder.newPaint().color(0).build();
        this.selectorStroke1 = PaintBuilder.newPaint().color(-1).build();
        this.selectorStroke2 = PaintBuilder.newPaint().color(ViewCompat.MEASURED_STATE_MASK).build();
        this.alphaPatternPaint = PaintBuilder.newPaint().build();
        this.listeners = new ArrayList<>();
        initWith(context, attrs);
    }

    public ColorPickerView(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        this.density = 10;
        this.lightness = 1.0f;
        this.alpha = 1.0f;
        this.backgroundColor = 0;
        this.initialColors = new Integer[]{null, null, null, null, null};
        this.colorSelection = 0;
        this.colorWheelFill = PaintBuilder.newPaint().color(0).build();
        this.selectorStroke1 = PaintBuilder.newPaint().color(-1).build();
        this.selectorStroke2 = PaintBuilder.newPaint().color(ViewCompat.MEASURED_STATE_MASK).build();
        this.alphaPatternPaint = PaintBuilder.newPaint().build();
        this.listeners = new ArrayList<>();
        initWith(context, attrs);
    }

    private void initWith(Context context, AttributeSet attrs) {
        TypedArray typedArray = context.obtainStyledAttributes(attrs, R.styleable.ColorPickerPreference);
        this.density = typedArray.getInt(2, 10);
        this.initialColor = Integer.valueOf(typedArray.getInt(3, -1));
        WHEEL_TYPE wheelType = WHEEL_TYPE.indexOf(typedArray.getInt(4, 0));
        ColorWheelRenderer renderer = ColorWheelRendererBuilder.getRenderer(wheelType);
        this.alphaSliderViewId = typedArray.getResourceId(6, 0);
        this.lightnessSliderViewId = typedArray.getResourceId(5, 0);
        setRenderer(renderer);
        setDensity(this.density);
        setInitialColor(this.initialColor.intValue());
    }

    @Override // android.view.View
    protected void onAttachedToWindow() {
        super.onAttachedToWindow();
    }

    @Override // android.view.View
    public void onWindowFocusChanged(boolean hasWindowFocus) {
        super.onWindowFocusChanged(hasWindowFocus);
        updateColorWheel();
    }

    @Override // android.view.View
    protected void onConfigurationChanged(Configuration newConfig) {
        super.onConfigurationChanged(newConfig);
        updateColorWheel();
    }

    private void updateColorWheel() {
    }

    private void drawColorWheel(Canvas colorWheelCanvas) {
        if (this.renderer != null) {
            float half = colorWheelCanvas.getWidth() / 2.0f;
            float maxRadius = (half - 2.05f) - (half / this.density);
            float cSize = (maxRadius / (this.density - 1)) / 2.0f;
            ColorWheelRenderOption colorWheelRenderOption = this.renderer.getRenderOption();
            colorWheelRenderOption.density = this.density;
            colorWheelRenderOption.maxRadius = maxRadius;
            colorWheelRenderOption.cSize = cSize;
            colorWheelRenderOption.strokeWidth = 2.05f;
            colorWheelRenderOption.alpha = this.alpha;
            colorWheelRenderOption.lightness = this.lightness;
            colorWheelRenderOption.targetCanvas = colorWheelCanvas;
            this.renderer.initWith(colorWheelRenderOption);
            this.renderer.draw();
            if (this.initialColor != null) {
                this.currentColorCircle = findNearestByColor(this.initialColor.intValue());
                float[] hsv = new float[3];
                Color.colorToHSV(this.initialColor.intValue(), hsv);
                this.currentColorCircle.set(this.currentColorCircle.getX(), this.currentColorCircle.getY(), hsv);
                this.initialColor = null;
            }
        }
    }

    @Override // android.view.View
    protected void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
        super.onMeasure(widthMeasureSpec, heightMeasureSpec);
        int widthMode = View.MeasureSpec.getMode(widthMeasureSpec);
        int width = 0;
        if (widthMode == 0) {
            width = widthMeasureSpec;
        } else if (widthMode == Integer.MIN_VALUE) {
            width = View.MeasureSpec.getSize(widthMeasureSpec);
        } else if (widthMode == 1073741824) {
            width = View.MeasureSpec.getSize(widthMeasureSpec);
        }
        int heightMode = View.MeasureSpec.getMode(heightMeasureSpec);
        int height = 0;
        if (heightMode == 0) {
            height = widthMeasureSpec;
        } else if (heightMode == Integer.MIN_VALUE) {
            height = View.MeasureSpec.getSize(heightMeasureSpec);
        } else if (widthMode == 1073741824) {
            height = View.MeasureSpec.getSize(heightMeasureSpec);
        }
        int squareDimen = width;
        if (height < width) {
            squareDimen = height;
        }
        setMeasuredDimension(squareDimen, squareDimen);
    }

    @Override // android.view.View
    protected void onSizeChanged(int w, int h, int oldw, int oldh) {
        super.onSizeChanged(w, h, oldw, oldh);
        updateColorWheel();
    }

    @Override // android.view.View
    public boolean onTouchEvent(MotionEvent event) {
        switch (event.getAction()) {
            case 0:
            case 2:
                getSelectedColor();
                this.currentColorCircle = findNearestByPosition(event.getX(), event.getY());
                invalidate();
                return true;
            case 1:
                int selectedColor = getSelectedColor();
                if (this.listeners != null) {
                    Iterator<OnColorSelectedListener> it = this.listeners.iterator();
                    while (it.hasNext()) {
                        OnColorSelectedListener listener = it.next();
                        try {
                            listener.onColorSelected(selectedColor);
                        } catch (Exception e) {
                        }
                    }
                }
                invalidate();
                return true;
            default:
                return true;
        }
    }

    @Override // android.view.View
    protected void onDraw(Canvas canvas) {
        super.onDraw(canvas);
        canvas.drawColor(this.backgroundColor);
        drawColorWheel(canvas);
        if (this.currentColorCircle != null) {
            this.currentColorCircle = findNearestByColor(this.currentColorCircle.getColor());
            float maxRadius = (canvas.getWidth() / 2.0f) - 2.05f;
            float size = (maxRadius / this.density) / 2.0f;
            this.colorWheelFill.setColor(Color.HSVToColor(this.currentColorCircle.getHsvWithLightness(this.lightness)));
            this.colorWheelFill.setAlpha((int) (this.alpha * 255.0f));
            canvas.drawCircle(this.currentColorCircle.getX(), this.currentColorCircle.getY(), size * 2.0f, this.selectorStroke1);
            canvas.drawCircle(this.currentColorCircle.getX(), this.currentColorCircle.getY(), 1.5f * size, this.selectorStroke2);
            canvas.drawCircle(this.currentColorCircle.getX(), this.currentColorCircle.getY(), size, this.alphaPatternPaint);
            canvas.drawCircle(this.currentColorCircle.getX(), this.currentColorCircle.getY(), size, this.colorWheelFill);
        }
    }

    private ColorCircle findNearestByPosition(float x, float y) {
        ColorCircle near = null;
        double minDist = Double.MAX_VALUE;
        for (ColorCircle colorCircle : this.renderer.getColorCircleList()) {
            double dist = colorCircle.sqDist(x, y);
            if (minDist > dist) {
                minDist = dist;
                near = colorCircle;
            }
        }
        return near;
    }

    private ColorCircle findNearestByColor(int color) {
        float[] hsv = new float[3];
        Color.colorToHSV(color, hsv);
        ColorCircle near = null;
        double minDiff = Double.MAX_VALUE;
        double x = hsv[1] * Math.cos((hsv[0] * 3.141592653589793d) / 180.0d);
        double y = hsv[1] * Math.sin((hsv[0] * 3.141592653589793d) / 180.0d);
        for (ColorCircle colorCircle : this.renderer.getColorCircleList()) {
            float[] hsv1 = colorCircle.getHsv();
            double x1 = hsv1[1] * Math.cos((hsv1[0] * 3.141592653589793d) / 180.0d);
            double y1 = hsv1[1] * Math.sin((hsv1[0] * 3.141592653589793d) / 180.0d);
            double dx = x - x1;
            double dy = y - y1;
            double dist = (dx * dx) + (dy * dy);
            if (dist < minDiff) {
                minDiff = dist;
                near = colorCircle;
            }
        }
        return near;
    }

    public int getSelectedColor() {
        int color = 0;
        if (this.currentColorCircle != null) {
            color = Color.HSVToColor(this.currentColorCircle.getHsvWithLightness(this.lightness));
        }
        return Utils.adjustAlpha(this.alpha, color);
    }

    public Integer[] getAllColors() {
        return this.initialColors;
    }

    public void setInitialColors(Integer[] colors, int selectedColor) {
        this.initialColors = colors;
        this.colorSelection = selectedColor;
        setInitialColor(this.initialColors[this.colorSelection].intValue());
    }

    public void setInitialColor(int color) {
        float[] hsv = new float[3];
        Color.colorToHSV(color, hsv);
        this.alpha = Utils.getAlphaPercent(color);
        this.lightness = hsv[2];
        this.initialColors[this.colorSelection] = Integer.valueOf(color);
        this.initialColor = Integer.valueOf(color);
        if (this.renderer.getColorCircleList() != null) {
            this.currentColorCircle = findNearestByColor(color);
        }
    }

    public void setLightness(float lightness) {
        this.lightness = lightness;
        this.initialColor = Integer.valueOf(Color.HSVToColor(Utils.alphaValueAsInt(this.alpha), this.currentColorCircle.getHsvWithLightness(lightness)));
        updateColorWheel();
        invalidate();
    }

    public void setColor(int color) {
        setInitialColor(color);
        updateColorWheel();
        invalidate();
    }

    public void setAlphaValue(float alpha) {
        this.alpha = alpha;
        this.initialColor = Integer.valueOf(Color.HSVToColor(Utils.alphaValueAsInt(this.alpha), this.currentColorCircle.getHsvWithLightness(this.lightness)));
        updateColorWheel();
        invalidate();
    }

    public void addOnColorSelectedListener(OnColorSelectedListener listener) {
        this.listeners.add(listener);
    }

    public void setDensity(int density) {
        this.density = Math.max(2, density);
        invalidate();
    }

    public void setRenderer(ColorWheelRenderer renderer) {
        this.renderer = renderer;
        invalidate();
    }

    public void setSelectedColor(int previewNumber) {
        if (this.initialColors != null && this.initialColors.length >= previewNumber) {
            this.colorSelection = previewNumber;
            setHighlightedColor(previewNumber);
            Integer color = this.initialColors[previewNumber];
            if (color != null) {
                setColor(color.intValue());
            }
        }
    }

    private void setHighlightedColor(int previewNumber) {
        int children = this.colorPreview.getChildCount();
        if (children != 0 && this.colorPreview.getVisibility() == 0) {
            for (int i = 0; i < children; i++) {
                View childView = this.colorPreview.getChildAt(i);
                if (childView instanceof LinearLayout) {
                    LinearLayout childLayout = (LinearLayout) childView;
                    if (i == previewNumber) {
                        childLayout.setBackgroundColor(-1);
                    } else {
                        childLayout.setBackgroundColor(0);
                    }
                }
            }
        }
    }

    /* loaded from: classes.dex */
    public enum WHEEL_TYPE {
        FLOWER,
        CIRCLE;

        public static WHEEL_TYPE indexOf(int index) {
            switch (index) {
                case 0:
                    return FLOWER;
                case 1:
                    return CIRCLE;
                default:
                    return FLOWER;
            }
        }
    }
}
