package com.vk.attachpicker.crop;

import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Matrix;
import android.graphics.Paint;
import android.graphics.RectF;
import com.vk.attachpicker.editor.ImageState;
/* loaded from: classes2.dex */
public class CropUtils {
    private static final Paint PAINT_FILTER_BITMAP = new Paint(2);

    public static Bitmap applySquareMatrixFixed(Bitmap original, CropAreaProvider cropAreaProvider, Matrix matrix, int maxWidth) {
        int maxHeight = (int) (maxWidth / cropAreaProvider.getCropAspectRatio());
        float ar = maxWidth / maxHeight;
        if (maxHeight > maxWidth) {
            maxWidth = (int) (maxWidth * ar);
            maxHeight = maxWidth;
        }
        Bitmap target = Bitmap.createBitmap(maxWidth, maxHeight, Bitmap.Config.ARGB_8888);
        Matrix workingMatrix = createCropMatrix(matrix, cropAreaProvider, maxWidth);
        Canvas canvas = new Canvas(target);
        canvas.drawBitmap(original, workingMatrix, PAINT_FILTER_BITMAP);
        return target;
    }

    public static Matrix createCropMatrix(Matrix matrix, CropAreaProvider cropAreaProvider, int maxWidth) {
        Matrix workingMatrix = new Matrix(matrix);
        float scale = maxWidth / cropAreaProvider.getCropWidth();
        float translate = (maxWidth - cropAreaProvider.getCropWidth()) / 2.0f;
        workingMatrix.postTranslate(translate, translate);
        workingMatrix.postScale(scale, scale, maxWidth / 2, maxWidth / 2);
        workingMatrix.postTranslate((-cropAreaProvider.getX0()) * scale, (-cropAreaProvider.getY0()) * scale);
        return workingMatrix;
    }

    public static Matrix createDrawingMatrix(Matrix matrix, float matrixMaxWidth, float maxWidth, RectF drawingRect) {
        Matrix workingMatrix = new Matrix(matrix);
        float baseScale = maxWidth / matrixMaxWidth;
        workingMatrix.postScale(baseScale, baseScale, 0.0f, 0.0f);
        float scale = drawingRect.width() / maxWidth;
        workingMatrix.postScale(scale, scale, 0.0f, 0.0f);
        return workingMatrix;
    }

    public static Matrix createScaleMatrix(Matrix matrix, float previewWidth, float maxWidth) {
        Matrix workingMatrix = new Matrix(matrix);
        float baseScale = maxWidth / previewWidth;
        workingMatrix.postScale(baseScale, baseScale, 0.0f, 0.0f);
        return workingMatrix;
    }

    public static void convertGeometryStateForCrop(GeometryState geometryState, float cropWidth, float x0, float y0) {
        geometryState.postScale(cropWidth / ImageState.PREVIEW_WIDTH, 0.0f, 0.0f);
        geometryState.postTranslate(x0, y0);
    }

    public static void convertGeometryStateForAreaSelection(GeometryState geometryState, float cropWidth, float x0, float y0) {
        geometryState.postTranslate(x0, y0);
        geometryState.postScale(cropWidth / ImageState.PREVIEW_WIDTH, 0.0f, 0.0f);
    }

    public static void convertGeometryStateForPreview(GeometryState geometryState, float cropWidth, float x0, float y0) {
        geometryState.postTranslate(-x0, -y0);
        geometryState.postScale(ImageState.PREVIEW_WIDTH / cropWidth, 0.0f, 0.0f);
    }

    public static RectF calculatePosition(float cropAr, float measuredWidth, float measuredHeight, float leftSidePadding, float topSidePadding, float rightSidePadding, float bottomSidePadding) {
        float x0;
        float y0;
        float x1;
        float y1;
        float minSide = Math.min((measuredWidth - leftSidePadding) - rightSidePadding, (measuredHeight - topSidePadding) - bottomSidePadding);
        float w = (measuredWidth - leftSidePadding) - rightSidePadding;
        float h = (measuredHeight - topSidePadding) - bottomSidePadding;
        float viewAr = w / h;
        float cx = leftSidePadding + (w / 2.0f);
        float cy = topSidePadding + (h / 2.0f);
        if (Math.abs(1.0f - cropAr) < 1.0E-4f) {
            x0 = cx - (minSide / 2.0f);
            y0 = cy - (minSide / 2.0f);
            x1 = cx + (minSide / 2.0f);
            y1 = cy + (minSide / 2.0f);
        } else if (cropAr > viewAr) {
            x0 = cx - (w / 2.0f);
            y0 = cy - ((w / cropAr) / 2.0f);
            x1 = cx + (w / 2.0f);
            y1 = cy + ((w / cropAr) / 2.0f);
        } else {
            x0 = cx - ((h * cropAr) / 2.0f);
            y0 = cy - (h / 2.0f);
            x1 = cx + ((h * cropAr) / 2.0f);
            y1 = cy + (h / 2.0f);
        }
        return new RectF(x0, y0, x1, y1);
    }

    public static CropAreaProvider createCropAreaProvider(final int cropWidth, final int cropHeight) {
        final float centerX = cropWidth / 2;
        final float centerY = cropHeight / 2;
        final float ar = cropWidth / cropHeight;
        return new CropAreaProvider() { // from class: com.vk.attachpicker.crop.CropUtils.1
            @Override // com.vk.attachpicker.crop.CropAreaProvider
            public float getX0() {
                return 0.0f;
            }

            @Override // com.vk.attachpicker.crop.CropAreaProvider
            public float getX1() {
                return 0.0f;
            }

            @Override // com.vk.attachpicker.crop.CropAreaProvider
            public float getY0() {
                return 0.0f;
            }

            @Override // com.vk.attachpicker.crop.CropAreaProvider
            public float getY1() {
                return 0.0f;
            }

            @Override // com.vk.attachpicker.crop.CropAreaProvider
            public RectF getCropRect() {
                return null;
            }

            @Override // com.vk.attachpicker.crop.CropAreaProvider
            public float getCropAspectRatio() {
                return ar;
            }

            @Override // com.vk.attachpicker.crop.CropAreaProvider
            public float getCenterX() {
                return centerX;
            }

            @Override // com.vk.attachpicker.crop.CropAreaProvider
            public float getCenterY() {
                return centerY;
            }

            @Override // com.vk.attachpicker.crop.CropAreaProvider
            public float getCropWidth() {
                return cropWidth;
            }

            @Override // com.vk.attachpicker.crop.CropAreaProvider
            public float getCropHeight() {
                return cropHeight;
            }

            @Override // com.vk.attachpicker.crop.CropAreaProvider
            public float getCropScale() {
                return 0.0f;
            }
        };
    }
}
