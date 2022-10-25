package com.vk.attachpicker.imageeditor.filter;

import android.graphics.Bitmap;
import android.opengl.GLES20;
import com.vk.attachpicker.imageeditor.LutManager;
import com.vk.attachpicker.imageeditor.helper.ImageHelper;
import com.vk.attachpicker.imageeditor.input.GLTextureOutputRenderer;
import com.vk.attachpicker.imageeditor.json.ApiFilterWrapper;
import com.vk.attachpicker.jni.Native;
/* loaded from: classes2.dex */
public class AllInOneFilter extends BasicFilter {
    private static final String FRAGMENT_SHADER = Native.createAllInOneShader();
    private int centerLutTextureHandle;
    private final float centerOriginal;
    private int centerOriginalHandle;
    private final Bitmap enhanceBitmap;
    private int enhanceIntensityHandle;
    private int enhanceTextureHandle;
    private int filterIntensityHandle;
    private int filterPositionHandle;
    private int leftLutTextureHandle;
    private final float leftOriginal;
    private int leftOriginalHandle;
    private final Bitmap lutCenter;
    private final Bitmap lutLeft;
    private final Bitmap lutRight;
    private int rightLutTextureHandle;
    private final float rightOriginal;
    private int rightOriginalHandle;
    private float filterPosition = 0.0f;
    private float filterIntensity = 1.0f;
    private float enhanceIntensityValue = 0.0f;
    private final int[] leftLutTexture = new int[1];
    private final int[] centerLutTexture = new int[1];
    private final int[] rightLutTexture = new int[1];
    private final int[] enhanceTexture = new int[1];

    public AllInOneFilter(Bitmap enhanceBitmap, ApiFilterWrapper leftFilter, ApiFilterWrapper centerFilter, ApiFilterWrapper rightFilter) {
        float f = 1.0f;
        this.enhanceBitmap = enhanceBitmap;
        this.lutLeft = LutManager.getLookupBitmap(leftFilter);
        this.lutCenter = LutManager.getLookupBitmap(centerFilter);
        this.lutRight = LutManager.getLookupBitmap(rightFilter);
        this.leftOriginal = ApiFilterWrapper.FILTER_ORIGINAL.equals(leftFilter.id) ? 1.0f : 0.0f;
        this.centerOriginal = ApiFilterWrapper.FILTER_ORIGINAL.equals(centerFilter.id) ? 1.0f : 0.0f;
        this.rightOriginal = !ApiFilterWrapper.FILTER_ORIGINAL.equals(rightFilter.id) ? 0.0f : f;
    }

    public void setEnhanceIntensity(float amount) {
        this.enhanceIntensityValue = amount;
    }

    @Override // com.vk.attachpicker.imageeditor.filter.BasicFilter, com.vk.attachpicker.imageeditor.output.GLTextureInputRenderer
    public void newTextureReady(int texture, GLTextureOutputRenderer source, boolean newData) {
        if (this.leftLutTexture[0] == 0) {
            this.leftLutTexture[0] = ImageHelper.bitmapToTexture(this.lutLeft);
        }
        if (this.centerLutTexture[0] == 0) {
            this.centerLutTexture[0] = ImageHelper.bitmapToTexture(this.lutCenter);
        }
        if (this.rightLutTexture[0] == 0) {
            this.rightLutTexture[0] = ImageHelper.bitmapToTexture(this.lutRight);
        }
        if (this.enhanceTexture[0] == 0) {
            this.enhanceTexture[0] = ImageHelper.bitmapToTexture(this.enhanceBitmap);
        }
        super.newTextureReady(texture, source, newData);
    }

    @Override // com.vk.attachpicker.imageeditor.input.GLTextureOutputRenderer, com.vk.attachpicker.imageeditor.GLRenderer
    public void destroy() {
        super.destroy();
        if (this.leftLutTexture[0] != 0) {
            GLES20.glDeleteTextures(1, this.leftLutTexture, 0);
            this.leftLutTexture[0] = 0;
        }
        if (this.centerLutTexture[0] != 0) {
            GLES20.glDeleteTextures(1, this.centerLutTexture, 0);
            this.centerLutTexture[0] = 0;
        }
        if (this.rightLutTexture[0] != 0) {
            GLES20.glDeleteTextures(1, this.rightLutTexture, 0);
            this.rightLutTexture[0] = 0;
        }
        if (this.enhanceTexture[0] != 0) {
            GLES20.glDeleteTextures(1, this.enhanceTexture, 0);
            this.enhanceTexture[0] = 0;
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.vk.attachpicker.imageeditor.GLRenderer
    public void initShaderHandles() {
        super.initShaderHandles();
        this.filterPositionHandle = GLES20.glGetUniformLocation(this.programHandle, "filterPosition");
        this.filterIntensityHandle = GLES20.glGetUniformLocation(this.programHandle, "filterIntensity");
        this.enhanceIntensityHandle = GLES20.glGetUniformLocation(this.programHandle, "autoEnhanceIntensity");
        this.leftOriginalHandle = GLES20.glGetUniformLocation(this.programHandle, "leftOriginal");
        this.centerOriginalHandle = GLES20.glGetUniformLocation(this.programHandle, "centerOriginal");
        this.rightOriginalHandle = GLES20.glGetUniformLocation(this.programHandle, "rightOriginal");
        this.leftLutTextureHandle = GLES20.glGetUniformLocation(this.programHandle, "leftLutTexture");
        this.centerLutTextureHandle = GLES20.glGetUniformLocation(this.programHandle, "centerLutTexture");
        this.rightLutTextureHandle = GLES20.glGetUniformLocation(this.programHandle, "rightLutTexture");
        this.enhanceTextureHandle = GLES20.glGetUniformLocation(this.programHandle, "enhanceTexture");
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.vk.attachpicker.imageeditor.GLRenderer
    public void passShaderValues() {
        super.passShaderValues();
        GLES20.glUniform1f(this.filterPositionHandle, this.filterPosition);
        GLES20.glUniform1f(this.filterIntensityHandle, this.filterIntensity);
        GLES20.glUniform1f(this.enhanceIntensityHandle, this.enhanceIntensityValue * this.filterIntensity);
        GLES20.glUniform1f(this.leftOriginalHandle, this.leftOriginal);
        GLES20.glUniform1f(this.centerOriginalHandle, this.centerOriginal);
        GLES20.glUniform1f(this.rightOriginalHandle, this.rightOriginal);
        passTexture(33985, this.leftLutTexture, this.leftLutTextureHandle, 1);
        passTexture(33986, this.centerLutTexture, this.centerLutTextureHandle, 2);
        passTexture(33987, this.rightLutTexture, this.rightLutTextureHandle, 3);
        passTexture(33988, this.enhanceTexture, this.enhanceTextureHandle, 4);
    }

    @Override // com.vk.attachpicker.imageeditor.filter.BasicFilter
    public void setIntensity(float intensityValue) {
        this.filterIntensity = intensityValue;
    }

    public void setFilterPosition(float filterPosition) {
        this.filterPosition = filterPosition;
    }

    @Override // com.vk.attachpicker.imageeditor.GLRenderer
    protected String getFragmentShader() {
        return FRAGMENT_SHADER;
    }

    private static void passTexture(int activeTexture, int[] texture, int textureHandle, int index) {
        GLES20.glActiveTexture(activeTexture);
        GLES20.glBindTexture(3553, texture[0]);
        GLES20.glUniform1i(textureHandle, index);
    }
}
