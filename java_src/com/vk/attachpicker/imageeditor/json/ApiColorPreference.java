package com.vk.attachpicker.imageeditor.json;

import com.vk.attachpicker.jni.Native;
import java.util.List;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class ApiColorPreference {
    private float _labCacheB;
    private float _labCacheG;
    private float _labCacheR;
    private float _rgbHueCacheHue;
    public final float ctaB;
    public final float ctaG;
    public final float ctaR;
    public final float hue;
    private float hueRgbB;
    private float hueRgbG;
    private float hueRgbR;
    private float labA;
    private float labB;
    private float labL;
    public final float luminanceAdjustment;
    public final float saturationAdjustment;
    public final float smoothing;
    public final float threshold;
    public static float DEFAULT_SATURATION_ADJUSTMENT = 0.0f;
    public static float DEFAULT_LUMINANCE_ADJUSTMENT = 0.0f;
    public static float DEFAULT_THRESHOLD = 0.06f;
    public static float DEFAULT_SMOOTHING = 0.12f;

    public ApiColorPreference(JSONObject jo) {
        jo = jo == null ? new JSONObject() : jo;
        this.ctaR = (float) jo.optDouble("fR", 0.0d);
        this.ctaG = (float) jo.optDouble("fG", 0.0d);
        this.ctaB = (float) jo.optDouble("fB", 0.0d);
        float _hue = (float) jo.optDouble("hue", 1.0d);
        if (_hue == 0.0f) {
            this.hue = 1.0f;
        } else {
            this.hue = _hue;
        }
        this.saturationAdjustment = (float) jo.optDouble("satAdj", DEFAULT_SATURATION_ADJUSTMENT);
        this.luminanceAdjustment = (float) jo.optDouble("lumAdj", DEFAULT_LUMINANCE_ADJUSTMENT);
        this.threshold = (float) jo.optDouble("thr", DEFAULT_THRESHOLD);
        this.smoothing = (float) jo.optDouble("sm", DEFAULT_SMOOTHING);
    }

    public boolean isDefault() {
        return this.saturationAdjustment == DEFAULT_SATURATION_ADJUSTMENT && this.luminanceAdjustment == DEFAULT_LUMINANCE_ADJUSTMENT && this.threshold == DEFAULT_THRESHOLD && this.smoothing == DEFAULT_SMOOTHING;
    }

    public float getHueR() {
        checkHueRgb();
        return this.hueRgbR;
    }

    public float getHueG() {
        checkHueRgb();
        return this.hueRgbG;
    }

    public float getHueB() {
        checkHueRgb();
        return this.hueRgbB;
    }

    public float getLAB_L() {
        checkLab();
        return this.labL;
    }

    public float getLAB_A() {
        checkLab();
        return this.labA;
    }

    public float getLAB_B() {
        checkLab();
        return this.labB;
    }

    public float getRGB_R() {
        return this.ctaR;
    }

    public float getRGB_G() {
        return this.ctaG;
    }

    public float getRGB_B() {
        return this.ctaB;
    }

    public float getSaturationAdjustment() {
        return this.saturationAdjustment;
    }

    public float getLuminanceAdjustment() {
        return this.luminanceAdjustment;
    }

    public float getSmoothing() {
        return this.smoothing;
    }

    public float getThreshold() {
        return this.threshold;
    }

    public int getNormalizedCtaR() {
        return (int) (this.ctaR * 255.0f);
    }

    public int getNormalizedCtaG() {
        return (int) (this.ctaG * 255.0f);
    }

    public int getNormalizedCtaB() {
        return (int) (this.ctaB * 255.0f);
    }

    private void checkLab() {
        if (this.ctaR != this._labCacheR || this.ctaG != this._labCacheG || this.ctaB != this._labCacheB) {
            this._labCacheR = this.ctaR;
            this._labCacheG = this.ctaG;
            this._labCacheB = this.ctaB;
            float[] ctaLab = new float[3];
            Native.RGBToLab(getNormalizedCtaR(), getNormalizedCtaG(), getNormalizedCtaB(), ctaLab);
            this.labL = ctaLab[0];
            this.labA = ctaLab[1];
            this.labB = ctaLab[2];
        }
    }

    private void checkHueRgb() {
        if (this.hue != this._rgbHueCacheHue) {
            this._rgbHueCacheHue = this.hue;
            int[] colorRgb = new int[3];
            Native.HSLToRGB(this.hue * 360.0f, 1.0f, 0.5f, colorRgb);
            this.hueRgbR = colorRgb[0] / 255.0f;
            this.hueRgbG = colorRgb[1] / 255.0f;
            this.hueRgbB = colorRgb[2] / 255.0f;
        }
    }

    public static int getNonDefaultColorsCount(List<ApiColorPreference> colors, int ignorePosition, boolean skipColorCorrection) {
        int nonDefaultColors = 0;
        if (colors != null && colors.size() > 0) {
            int idx = 0;
            for (ApiColorPreference colorPreference : colors) {
                if (!colorPreference.isDefault() && (idx != ignorePosition || skipColorCorrection)) {
                    nonDefaultColors++;
                }
                idx++;
            }
        }
        return nonDefaultColors;
    }
}
