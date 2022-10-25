package com.vk.attachpicker.jni;

import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Color;
import android.text.TextUtils;
import com.vk.attachpicker.Picker;
import com.vk.attachpicker.imageeditor.GLRenderer;
import com.vk.attachpicker.imageeditor.LutManager;
import com.vk.attachpicker.imageeditor.json.ApiColorPreference;
import com.vkontakte.android.R;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
/* loaded from: classes2.dex */
public class Native {
    private static volatile Bitmap labLookupBitmap;

    private static native String nativeAllInOneShader();

    private static native void nativeBlur(Bitmap bitmap, int i);

    private static native synchronized void nativeColorCorrection(Bitmap bitmap, Bitmap bitmap2, float[] fArr, int i, int i2);

    private static native String nativeCreateColorCorrectionShader(float[] fArr, int i, int i2);

    private static native void nativeCreateCurve(int[] iArr, int[] iArr2, int[] iArr3, int[] iArr4, int[] iArr5, float f, float f2, float f3, float f4, float f5);

    private static native void nativeCurveSaturation(Bitmap bitmap, int[] iArr, double d, int i);

    private static native void nativeEnhance(Bitmap bitmap, double d, int i);

    private static native void nativeFlipHorizontally(Bitmap bitmap);

    private static native void nativeFlipVertically(Bitmap bitmap);

    private static native void nativeHSLToRGB(float f, float f2, float f3, int[] iArr);

    private static native void nativeHSVToRGB(float f, float f2, float f3, int[] iArr);

    private static native void nativeHistogram(Bitmap bitmap, int[] iArr, int[] iArr2, int[] iArr3, int[] iArr4);

    private static native void nativeLabToRGB(float f, float f2, float f3, int[] iArr);

    private static native void nativeLookup(Bitmap bitmap, Bitmap bitmap2, int i);

    private static native String nativeOneInAllShader();

    private static native void nativePinBitmap(Bitmap bitmap);

    private static native void nativeRGBToHSL(int i, int i2, int i3, float[] fArr);

    private static native void nativeRGBToHSV(int i, int i2, int i3, float[] fArr);

    private static native void nativeRGBToLab(int i, int i2, int i3, float[] fArr);

    private static native synchronized void nativeRender(int i, Bitmap bitmap, Bitmap bitmap2, int i2, float[] fArr, int i3, float f, float f2, float f3, float f4, float f5, float f6, float f7, float f8, float f9, float f10, float f11, int[] iArr, int[] iArr2, int[] iArr3, int[] iArr4);

    private static native void nativeResize(Bitmap bitmap, Bitmap bitmap2, int i);

    public static synchronized Bitmap getLabLookupBitmap() {
        Bitmap bitmap;
        synchronized (Native.class) {
            if (labLookupBitmap == null || labLookupBitmap.isRecycled()) {
                BitmapFactory.Options options = new BitmapFactory.Options();
                options.inScaled = false;
                labLookupBitmap = BitmapFactory.decodeResource(Picker.getContext().getResources(), R.drawable.lookup_lab, options);
            }
            bitmap = labLookupBitmap;
        }
        return bitmap;
    }

    public static void enhanceBitmap(Bitmap bitmap, float intensity) {
        nativeEnhance(bitmap, intensity, Runtime.getRuntime().availableProcessors());
    }

    public static void flipVerticallyBitmap(Bitmap bitmap) {
        nativeFlipVertically(bitmap);
    }

    public static void flipHorizontallyBitmap(Bitmap bitmap) {
        nativeFlipHorizontally(bitmap);
    }

    public static void pinBitmap(Bitmap bitmap) {
        nativePinBitmap(bitmap);
    }

    public static void blurBitmap(Bitmap bitmap, int radius) {
        nativeBlur(bitmap, radius);
    }

    public static void colorCorrectionBitmap(Bitmap bitmap, Bitmap lab, List<ApiColorPreference> colors) {
        float[] params = getColorParams(colors, -1, true);
        nativeColorCorrection(bitmap, lab, params, params.length, Runtime.getRuntime().availableProcessors());
    }

    public static void renderBitmap(Bitmap bitmap, boolean doLookupColorCorrection, List<ApiColorPreference> colors, float brightness, float contrast, float saturation, float fade, float temperature, float tint, float vignetteIntensity, float sharpness, float enhance, float grain, float intensity, int[] red, int[] green, int[] blue, int[] rgb) {
        float[] params = getColorParams(colors, -1, true);
        nativeRender(Runtime.getRuntime().availableProcessors(), bitmap, doLookupColorCorrection ? LutManager.getLookupBitmap(colors) : getLabLookupBitmap(), doLookupColorCorrection ? 1 : 0, params, params.length, brightness, contrast, saturation, fade, temperature, tint, vignetteIntensity, sharpness, enhance, grain, intensity, red, green, blue, rgb);
    }

    public static void resizeBitmap(Bitmap bitmap, Bitmap scaledBitmap) {
        nativeResize(bitmap, scaledBitmap, Runtime.getRuntime().availableProcessors());
    }

    public static void lookupBitmap(Bitmap bitmap, Bitmap lut) {
        nativeLookup(bitmap, lut, Runtime.getRuntime().availableProcessors());
    }

    public static void applyCurveAndSaturationBitmap(Bitmap bitmap, int[] curve, float saturation) {
        nativeCurveSaturation(bitmap, curve, saturation, Runtime.getRuntime().availableProcessors());
    }

    public static synchronized void rgbToLabBitmap(Bitmap bitmap) {
        synchronized (Native.class) {
            lookupBitmap(bitmap, getLabLookupBitmap());
        }
    }

    public static void createCurve(int[] red, int[] green, int[] blue, int[] rgb, int[] outCurve, float brightness, float contrast, float fade, float temperature, float tint) {
        nativeCreateCurve(red, green, blue, rgb, outCurve, brightness, contrast, fade, temperature, tint);
    }

    public static void generateHistogram(Bitmap b, int[] red, int[] green, int[] blue, int[] rgb) {
        nativeHistogram(b, red, green, blue, rgb);
    }

    public static float[] getColorParams(List<ApiColorPreference> colors, int ignorePosition, boolean skipColorCorrection) {
        int nonDefaultColors = ApiColorPreference.getNonDefaultColorsCount(colors, ignorePosition, skipColorCorrection);
        if (nonDefaultColors == 0) {
            return new float[0];
        }
        LinkedList<Float> paramsList = new LinkedList<>();
        int idx = 0;
        for (ApiColorPreference c : colors) {
            if (!c.isDefault() && (idx != ignorePosition || skipColorCorrection)) {
                paramsList.add(Float.valueOf(c.getRGB_R()));
                paramsList.add(Float.valueOf(c.getRGB_G()));
                paramsList.add(Float.valueOf(c.getRGB_B()));
                paramsList.add(Float.valueOf(c.getHueR()));
                paramsList.add(Float.valueOf(c.getHueG()));
                paramsList.add(Float.valueOf(c.getHueB()));
                paramsList.add(Float.valueOf(c.getSaturationAdjustment()));
                paramsList.add(Float.valueOf(c.getLuminanceAdjustment()));
                paramsList.add(Float.valueOf(c.getThreshold()));
                paramsList.add(Float.valueOf(c.getSmoothing()));
            }
            idx++;
        }
        float[] params = new float[paramsList.size()];
        int idx2 = 0;
        Iterator<Float> it = paramsList.iterator();
        while (it.hasNext()) {
            Float f = it.next();
            params[idx2] = f.floatValue();
            idx2++;
        }
        return params;
    }

    public static String createColorCorrectionShader(List<ApiColorPreference> colors, int ignorePosition, boolean skipColorCorrection) {
        int intSkipColorCorrection = skipColorCorrection ? 1 : 0;
        int nonDefaultColors = ApiColorPreference.getNonDefaultColorsCount(colors, ignorePosition, skipColorCorrection);
        if (nonDefaultColors == 0) {
            String shader = nativeCreateColorCorrectionShader(new float[0], 0, intSkipColorCorrection);
            if (TextUtils.isEmpty(shader)) {
                return GLRenderer.FRAGMENT_SHADER;
            }
            return shader;
        }
        float[] params = getColorParams(colors, ignorePosition, skipColorCorrection);
        StringBuilder sb = new StringBuilder();
        for (float p : params) {
            sb.append(p).append(',');
        }
        String shader2 = nativeCreateColorCorrectionShader(params, params.length, intSkipColorCorrection);
        if (TextUtils.isEmpty(shader2)) {
            return GLRenderer.FRAGMENT_SHADER;
        }
        return shader2;
    }

    public static String createAllInOneShader() {
        return nativeAllInOneShader();
    }

    public static String createOneInAllShader() {
        return nativeOneInAllShader();
    }

    public static void intRGBToLab(int rgb, float[] outLab) {
        nativeRGBToLab(Color.red(rgb), Color.green(rgb), Color.blue(rgb), outLab);
    }

    public static int LabToIntRGB(float l, float a, float b) {
        int[] outRGB = new int[3];
        nativeLabToRGB(l, a, b, outRGB);
        return Color.argb(255, outRGB[0], outRGB[1], outRGB[2]);
    }

    public static void RGBToLab(int r, int g, int b, float[] outLab) {
        nativeRGBToLab(r, g, b, outLab);
    }

    public static void LabToRGB(float l, float a, float b, int[] outRGB) {
        nativeLabToRGB(l, a, b, outRGB);
    }

    public static void intRGBToHSL(int rgb, float[] outHsl) {
        nativeRGBToHSL(Color.red(rgb), Color.green(rgb), Color.blue(rgb), outHsl);
    }

    public static int HSLToIntRGB(float h, float s, float l) {
        int[] outRGB = new int[3];
        nativeHSLToRGB(h, s, l, outRGB);
        return Color.argb(255, outRGB[0], outRGB[1], outRGB[2]);
    }

    public static void RGBToHSL(int r, int g, int b, float[] outHSL) {
        nativeRGBToHSL(r, g, b, outHSL);
    }

    public static void HSLToRGB(float h, float s, float l, int[] outRGB) {
        nativeHSLToRGB(h, s, l, outRGB);
    }

    public static void intRGBToHSV(int rgb, float[] outHsv) {
        nativeRGBToHSV(Color.red(rgb), Color.green(rgb), Color.blue(rgb), outHsv);
    }

    public static int HSVToIntRGB(float h, float s, float v) {
        int[] outRGB = new int[3];
        nativeHSVToRGB(h, s, v, outRGB);
        return Color.argb(255, outRGB[0], outRGB[1], outRGB[2]);
    }

    public static void RGBToHSV(int r, int g, int b, float[] outHSV) {
        nativeRGBToHSV(r, g, b, outHSV);
    }

    public static void HSVToRGB(float h, float s, float v, int[] outRGB) {
        nativeHSVToRGB(h, s, v, outRGB);
    }
}
