package com.vk.attachpicker.crop;

import android.graphics.Matrix;
import com.facebook.imagepipeline.common.RotationOptions;
import com.vk.attachpicker.editor.ImageState;
/* loaded from: classes2.dex */
public class GeometryState {
    private static final MinimumScaleFinder LOCAL_SCALE_FINDER = new MinimumScaleFinder();
    private static final float MAX_SCALE = 5.0f;
    private float cropAspectRatio;
    private final float height;
    private final float width;
    private float defaultScale = 1.0f;
    private float scale = 1.0f;
    private float rotation = 0.0f;
    private float baseRotation = 0.0f;
    private float tx = 0.0f;
    private float ty = 0.0f;
    private final Matrix transformationMatrix = new Matrix();

    public GeometryState(float width, float height) {
        this.width = width;
        this.height = height;
        this.cropAspectRatio = width / height;
    }

    public void resetTransformationMatrix() {
        resetTransformationMatrix(CropUtils.createCropAreaProvider((int) ImageState.PREVIEW_WIDTH, (int) getHeightForWidth(ImageState.PREVIEW_WIDTH)), LOCAL_SCALE_FINDER, 0);
    }

    public void resetTransformationMatrix(CropAreaProvider cropAreaProvider, MinimumScaleFinder minimumScaleFinder, int baseRotation) {
        this.transformationMatrix.reset();
        this.baseRotation = baseRotation;
        this.rotation = 0.0f;
        this.tx = 0.0f;
        this.ty = 0.0f;
        float dx = cropAreaProvider.getCenterX() - (this.width / 2.0f);
        float dy = cropAreaProvider.getCenterY() - (this.height / 2.0f);
        this.transformationMatrix.postTranslate(dx, dy);
        this.scale = minimumScaleFinder.findMinimumScale(0.0f, this.width, this.height, baseRotation % RotationOptions.ROTATE_180 != 0, cropAreaProvider.getCropWidth(), cropAreaProvider.getCropHeight());
        this.defaultScale = this.scale;
        this.transformationMatrix.postScale(this.scale, this.scale, cropAreaProvider.getCenterX(), cropAreaProvider.getCenterY());
        this.transformationMatrix.postRotate(baseRotation, cropAreaProvider.getCenterX(), cropAreaProvider.getCenterY());
        if (baseRotation % RotationOptions.ROTATE_180 == 0) {
            this.cropAspectRatio = this.width / this.height;
        } else {
            this.cropAspectRatio = this.height / this.width;
        }
    }

    public void setCropAspectRatio(float cropAspectRatio) {
        this.cropAspectRatio = cropAspectRatio;
    }

    public void postTranslate(float translateX, float translateY) {
        this.transformationMatrix.postTranslate(translateX, translateY);
        this.tx += translateX;
        this.ty += translateY;
    }

    public void postScale(float deltaScale, float focalX, float focalY) {
        this.transformationMatrix.postScale(deltaScale, deltaScale, focalX, focalY);
        this.scale *= deltaScale;
    }

    public void postRotate(float deltaRotate, float focalX, float focalY) {
        this.transformationMatrix.postRotate(deltaRotate, focalX, focalY);
        this.rotation += deltaRotate;
    }

    public void postRotate90Degrees(float focalX, float focalY) {
        this.transformationMatrix.postRotate(-90.0f, focalX, focalY);
        this.baseRotation -= 90.0f;
    }

    public void getTransformationMatrix(Matrix matrix) {
        matrix.set(this.transformationMatrix);
    }

    public Matrix getTransformationMatrix() {
        Matrix matrix = new Matrix();
        getTransformationMatrix(matrix);
        return matrix;
    }

    public boolean isDefaultTranslation() {
        return this.tx == 0.0f && this.ty == 0.0f;
    }

    public boolean isDefaultState() {
        return this.rotation == 0.0f && this.tx == 0.0f && this.ty == 0.0f && this.baseRotation == 0.0f && this.scale == this.defaultScale && Math.abs((this.width / this.height) - this.cropAspectRatio) < 0.001f;
    }

    public void set(GeometryState geometryState) {
        this.defaultScale = geometryState.defaultScale;
        this.scale = geometryState.scale;
        this.rotation = geometryState.rotation;
        this.baseRotation = geometryState.baseRotation;
        this.transformationMatrix.set(geometryState.transformationMatrix);
        this.tx = geometryState.tx;
        this.ty = geometryState.ty;
        this.cropAspectRatio = geometryState.cropAspectRatio;
    }

    public float getScale() {
        return this.scale;
    }

    public float getMaxScale() {
        return this.defaultScale * MAX_SCALE;
    }

    public float getRotation() {
        return this.rotation;
    }

    public float getBaseRotation() {
        return this.baseRotation;
    }

    public float getWidth() {
        return this.width;
    }

    public float getHeight() {
        return this.height;
    }

    public float getOriginalAspectRatio() {
        return this.width / this.height;
    }

    public float getCropAspectRatio() {
        return this.cropAspectRatio;
    }

    public float getHeightForWidth(float forWidth) {
        return forWidth / this.cropAspectRatio;
    }

    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        GeometryState that = (GeometryState) o;
        if (Float.compare(that.cropAspectRatio, this.cropAspectRatio) != 0) {
            return false;
        }
        return this.transformationMatrix != null ? this.transformationMatrix.equals(that.transformationMatrix) : that.transformationMatrix == null;
    }

    public int hashCode() {
        int i = 0;
        int result = this.cropAspectRatio != 0.0f ? Float.floatToIntBits(this.cropAspectRatio) : 0;
        int i2 = result * 31;
        if (this.transformationMatrix != null) {
            i = this.transformationMatrix.hashCode();
        }
        int result2 = i2 + i;
        return result2;
    }
}
