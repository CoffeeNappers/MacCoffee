package com.flask.colorpicker.builder;

import android.app.AlertDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.widget.LinearLayout;
import com.flask.colorpicker.ColorPickerView;
import com.flask.colorpicker.OnColorSelectedListener;
import com.flask.colorpicker.renderer.ColorWheelRenderer;
/* loaded from: classes.dex */
public class ColorPickerDialogBuilder {
    private AlertDialog.Builder builder;
    private ColorPickerView colorPickerView;
    private LinearLayout colorPreview;
    private LinearLayout pickerContainer;
    private boolean isLightnessSliderEnabled = true;
    private boolean isAlphaSliderEnabled = true;
    private boolean isColorEditEnabled = false;
    private boolean isPreviewEnabled = false;
    private int pickerCount = 1;
    private int defaultMargin = 0;
    private Integer[] initialColor = {null, null, null, null, null};

    private ColorPickerDialogBuilder(Context context) {
        this.builder = new AlertDialog.Builder(context);
        this.pickerContainer = new LinearLayout(context);
        this.pickerContainer.setOrientation(1);
        this.pickerContainer.setGravity(1);
        LinearLayout.LayoutParams layoutParamsForColorPickerView = new LinearLayout.LayoutParams(-1, 0);
        layoutParamsForColorPickerView.weight = 1.0f;
        this.colorPickerView = new ColorPickerView(context);
        this.pickerContainer.addView(this.colorPickerView, layoutParamsForColorPickerView);
        this.builder.setView(this.pickerContainer);
    }

    public static ColorPickerDialogBuilder with(Context context) {
        return new ColorPickerDialogBuilder(context);
    }

    public ColorPickerDialogBuilder setTitle(String title) {
        this.builder.setTitle(title);
        return this;
    }

    public ColorPickerDialogBuilder initialColor(int initialColor) {
        this.initialColor[0] = Integer.valueOf(initialColor);
        return this;
    }

    public ColorPickerDialogBuilder initialColors(int[] initialColor) {
        for (int i = 0; i < initialColor.length && i < this.initialColor.length; i++) {
            this.initialColor[i] = Integer.valueOf(initialColor[i]);
        }
        return this;
    }

    public ColorPickerDialogBuilder wheelType(ColorPickerView.WHEEL_TYPE wheelType) {
        ColorWheelRenderer renderer = ColorWheelRendererBuilder.getRenderer(wheelType);
        this.colorPickerView.setRenderer(renderer);
        return this;
    }

    public ColorPickerDialogBuilder density(int density) {
        this.colorPickerView.setDensity(density);
        return this;
    }

    public ColorPickerDialogBuilder setOnColorSelectedListener(OnColorSelectedListener onColorSelectedListener) {
        this.colorPickerView.addOnColorSelectedListener(onColorSelectedListener);
        return this;
    }

    public ColorPickerDialogBuilder setPositiveButton(String text, final ColorPickerClickListener onClickListener) {
        this.builder.setPositiveButton(text, new DialogInterface.OnClickListener() { // from class: com.flask.colorpicker.builder.ColorPickerDialogBuilder.1
            @Override // android.content.DialogInterface.OnClickListener
            public void onClick(DialogInterface dialog, int which) {
                int selectedColor = ColorPickerDialogBuilder.this.colorPickerView.getSelectedColor();
                Integer[] allColors = ColorPickerDialogBuilder.this.colorPickerView.getAllColors();
                onClickListener.onClick(dialog, selectedColor, allColors);
            }
        });
        return this;
    }

    public ColorPickerDialogBuilder setNegativeButton(String text, DialogInterface.OnClickListener onClickListener) {
        this.builder.setNegativeButton(text, onClickListener);
        return this;
    }

    public ColorPickerDialogBuilder noSliders() {
        this.isLightnessSliderEnabled = false;
        this.isAlphaSliderEnabled = false;
        return this;
    }

    public ColorPickerDialogBuilder alphaSliderOnly() {
        this.isLightnessSliderEnabled = false;
        this.isAlphaSliderEnabled = true;
        return this;
    }

    public ColorPickerDialogBuilder lightnessSliderOnly() {
        this.isLightnessSliderEnabled = true;
        this.isAlphaSliderEnabled = false;
        return this;
    }

    public ColorPickerDialogBuilder showAlphaSlider(boolean showAlpha) {
        this.isAlphaSliderEnabled = showAlpha;
        return this;
    }

    public ColorPickerDialogBuilder showLightnessSlider(boolean showLightness) {
        this.isLightnessSliderEnabled = showLightness;
        return this;
    }

    public ColorPickerDialogBuilder showColorEdit(boolean showEdit) {
        this.isColorEditEnabled = showEdit;
        return this;
    }

    public ColorPickerDialogBuilder showColorPreview(boolean showPreview) {
        this.isPreviewEnabled = showPreview;
        if (!showPreview) {
            this.pickerCount = 1;
        }
        return this;
    }

    public ColorPickerDialogBuilder setPickerCount(int pickerCount) throws IndexOutOfBoundsException {
        if (pickerCount < 1 || pickerCount > 5) {
            throw new IndexOutOfBoundsException("Picker Can Only Support 1-5 Colors");
        }
        this.pickerCount = pickerCount;
        if (this.pickerCount > 1) {
            this.isPreviewEnabled = true;
        }
        return this;
    }

    public AlertDialog build() {
        this.builder.getContext();
        this.colorPickerView.setInitialColors(this.initialColor, getStartOffset(this.initialColor).intValue());
        return this.builder.create();
    }

    private Integer getStartOffset(Integer[] colors) {
        Integer start = null;
        for (int i = 0; i < colors.length && colors[i] != null; i++) {
            start = Integer.valueOf((i + 1) / 2);
        }
        return start;
    }

    private int getStartColor(Integer[] colors) {
        Integer startColor = getStartOffset(colors);
        if (startColor == null) {
            return -1;
        }
        return colors[startColor.intValue()].intValue();
    }

    private static int getDimensionAsPx(Context context, int rid) {
        return (int) (context.getResources().getDimension(rid) + 0.5f);
    }
}
