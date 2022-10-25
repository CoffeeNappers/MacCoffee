package com.vk.attachpicker.crop;

import android.graphics.Matrix;
import android.graphics.PointF;
/* loaded from: classes2.dex */
public class MinimumScaleFinder {
    private static final float SCALE_DIM = 10000.0f;
    private static final float SCALE_DIM2 = 5000.0f;
    private final PointF[] cropBoxRect = {new PointF(), new PointF(), new PointF(), new PointF()};
    private final PointF[] imageBoxPolygon = {new PointF(), new PointF(), new PointF(), new PointF()};
    private final float[] rawImageBoxPolygon = new float[8];
    private final Matrix scaleWorkMatrix = new Matrix();

    private void fillScaleCropRect(float cropWidth, float cropHeight) {
        this.cropBoxRect[0].x = SCALE_DIM2 - (cropWidth / 2.0f);
        this.cropBoxRect[0].y = SCALE_DIM2 - (cropHeight / 2.0f);
        this.cropBoxRect[1].x = (cropWidth / 2.0f) + SCALE_DIM2;
        this.cropBoxRect[1].y = SCALE_DIM2 - (cropHeight / 2.0f);
        this.cropBoxRect[2].x = (cropWidth / 2.0f) + SCALE_DIM2;
        this.cropBoxRect[2].y = (cropHeight / 2.0f) + SCALE_DIM2;
        this.cropBoxRect[3].x = SCALE_DIM2 - (cropWidth / 2.0f);
        this.cropBoxRect[3].y = (cropHeight / 2.0f) + SCALE_DIM2;
    }

    private void resetScaleImagePolygon(float angle, float scale, float imageWidth, float imageHeight) {
        this.rawImageBoxPolygon[0] = SCALE_DIM2 - (imageWidth / 2.0f);
        this.rawImageBoxPolygon[1] = SCALE_DIM2 - (imageHeight / 2.0f);
        this.rawImageBoxPolygon[2] = (imageWidth / 2.0f) + SCALE_DIM2;
        this.rawImageBoxPolygon[3] = SCALE_DIM2 - (imageHeight / 2.0f);
        this.rawImageBoxPolygon[4] = (imageWidth / 2.0f) + SCALE_DIM2;
        this.rawImageBoxPolygon[5] = (imageHeight / 2.0f) + SCALE_DIM2;
        this.rawImageBoxPolygon[6] = SCALE_DIM2 - (imageWidth / 2.0f);
        this.rawImageBoxPolygon[7] = (imageHeight / 2.0f) + SCALE_DIM2;
        this.scaleWorkMatrix.reset();
        this.scaleWorkMatrix.postRotate(angle, SCALE_DIM2, SCALE_DIM2);
        this.scaleWorkMatrix.postScale(scale, scale, SCALE_DIM2, SCALE_DIM2);
        this.scaleWorkMatrix.mapPoints(this.rawImageBoxPolygon);
        this.imageBoxPolygon[0].x = this.rawImageBoxPolygon[0];
        this.imageBoxPolygon[0].y = this.rawImageBoxPolygon[1];
        this.imageBoxPolygon[1].x = this.rawImageBoxPolygon[2];
        this.imageBoxPolygon[1].y = this.rawImageBoxPolygon[3];
        this.imageBoxPolygon[2].x = this.rawImageBoxPolygon[4];
        this.imageBoxPolygon[2].y = this.rawImageBoxPolygon[5];
        this.imageBoxPolygon[3].x = this.rawImageBoxPolygon[6];
        this.imageBoxPolygon[3].y = this.rawImageBoxPolygon[7];
    }

    public float findMinimumScale(float angleDeg, float imageWidth, float imageHeight, boolean swapSides, float cropWidth, float cropHeight) {
        fillScaleCropRect(cropWidth, cropHeight);
        if (swapSides) {
            imageWidth = imageHeight;
            imageHeight = imageWidth;
        }
        return simpleSearch(angleDeg, imageWidth, imageHeight);
    }

    private float binarySearch(float angleDeg, float imageWidth, float imageHeight) {
        float prevGoodScale = 1.0f;
        float low = 0.001f;
        float high = 20.0f;
        while (low < high) {
            float mid = low + ((high - low) / 2.0f);
            resetScaleImagePolygon(angleDeg, mid, imageWidth, imageHeight);
            boolean isGoodScale = MathCropUtils.isPolygonContainsRectangle(this.imageBoxPolygon, this.cropBoxRect);
            if (Math.abs(prevGoodScale - mid) <= 0.001f) {
                if (isGoodScale) {
                    return mid;
                }
                return prevGoodScale;
            }
            if (isGoodScale) {
                high = mid;
            } else {
                low = mid + 0.001f;
            }
            if (isGoodScale) {
                prevGoodScale = mid;
            }
        }
        return prevGoodScale;
    }

    private float simpleSearch(float angleDeg, float imageWidth, float imageHeight) {
        float decStep = 0.0f;
        float scale = 0.001f;
        while (true) {
            if (scale >= 20.0f) {
                break;
            }
            resetScaleImagePolygon(angleDeg, scale, imageWidth, imageHeight);
            if (!MathCropUtils.isPolygonContainsRectangle(this.imageBoxPolygon, this.cropBoxRect)) {
                scale += 0.1f;
            } else if (scale >= 0.1f) {
                decStep = scale - 0.1f;
            } else {
                decStep = scale;
            }
        }
        float hundStep = decStep;
        float scale2 = decStep;
        while (true) {
            if (scale2 >= 20.0f) {
                break;
            }
            resetScaleImagePolygon(angleDeg, scale2, imageWidth, imageHeight);
            if (!MathCropUtils.isPolygonContainsRectangle(this.imageBoxPolygon, this.cropBoxRect)) {
                scale2 += 0.01f;
            } else if (scale2 >= 0.01f) {
                hundStep = scale2 - 0.01f;
            } else {
                hundStep = scale2;
            }
        }
        for (float scale3 = hundStep; scale3 < 20.0f; scale3 += 0.001f) {
            resetScaleImagePolygon(angleDeg, scale3, imageWidth, imageHeight);
            if (MathCropUtils.isPolygonContainsRectangle(this.imageBoxPolygon, this.cropBoxRect)) {
                return scale3 + 0.001f;
            }
        }
        return 1.0f;
    }
}
