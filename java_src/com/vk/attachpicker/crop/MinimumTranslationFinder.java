package com.vk.attachpicker.crop;

import android.graphics.Matrix;
import android.graphics.PointF;
import android.graphics.RectF;
/* loaded from: classes2.dex */
public class MinimumTranslationFinder {
    private final RectF cropRect = new RectF();
    private final Matrix matrix = new Matrix();
    private final float[] rawPoints = new float[8];
    private final PointF globalResult = new PointF();
    private final float[] rawResult = new float[2];

    public PointF findMinTranslate(PointF[] polygon, float cropWidth, float cropHeight, float cropX, float cropY, float rotation) {
        this.globalResult.set(0.0f, 0.0f);
        if (Math.abs(rotation) < 0.001f) {
            findMinimumTranslationVector(polygon, cropWidth, cropHeight, cropX, cropY, this.globalResult);
        } else {
            this.cropRect.set(cropX, cropY, cropX + cropWidth, cropY + cropHeight);
            this.matrix.reset();
            this.matrix.postRotate(-rotation, 0.0f, 0.0f);
            fillRaw(polygon);
            this.matrix.mapPoints(this.rawPoints);
            fillFromRaw(polygon);
            this.matrix.mapRect(this.cropRect);
            findMinimumTranslationVector(polygon, this.cropRect.width(), this.cropRect.height(), this.cropRect.left, this.cropRect.top, this.globalResult);
            this.rawResult[0] = this.globalResult.x;
            this.rawResult[1] = this.globalResult.y;
            this.matrix.postRotate(2.0f * rotation, 0.0f, 0.0f);
            this.matrix.mapPoints(this.rawResult);
            this.globalResult.x = this.rawResult[0];
            this.globalResult.y = this.rawResult[1];
        }
        return this.globalResult;
    }

    private void fillRaw(PointF[] points) {
        this.rawPoints[0] = points[0].x;
        this.rawPoints[1] = points[0].y;
        this.rawPoints[2] = points[1].x;
        this.rawPoints[3] = points[1].y;
        this.rawPoints[4] = points[2].x;
        this.rawPoints[5] = points[2].y;
        this.rawPoints[6] = points[3].x;
        this.rawPoints[7] = points[3].y;
    }

    private void fillFromRaw(PointF[] points) {
        points[0].x = this.rawPoints[0];
        points[0].y = this.rawPoints[1];
        points[1].x = this.rawPoints[2];
        points[1].y = this.rawPoints[3];
        points[2].x = this.rawPoints[4];
        points[2].y = this.rawPoints[5];
        points[3].x = this.rawPoints[6];
        points[3].y = this.rawPoints[7];
    }

    private static void findMinimumTranslationVector(PointF[] polygon, float cropWidth, float cropHeight, float cropX, float cropY, PointF result) {
        float rectX0 = Float.MAX_VALUE;
        float rectY0 = Float.MAX_VALUE;
        float rectX1 = Float.MIN_VALUE;
        float rectY1 = Float.MIN_VALUE;
        for (int i = 0; i < polygon.length; i++) {
            if (polygon[i].x < rectX0) {
                rectX0 = polygon[i].x;
            }
            if (polygon[i].x > rectX1) {
                rectX1 = polygon[i].x;
            }
            if (polygon[i].y < rectY0) {
                rectY0 = polygon[i].y;
            }
            if (polygon[i].y > rectY1) {
                rectY1 = polygon[i].y;
            }
        }
        if (cropX < rectX0) {
            result.x = rectX0 - cropX;
        }
        if (cropY < rectY0) {
            result.y = rectY0 - cropY;
        }
        if (cropX + cropWidth > rectX1) {
            result.x = (rectX1 - cropX) - cropWidth;
        }
        if (cropY + cropHeight > rectY1) {
            result.y = (rectY1 - cropY) - cropHeight;
        }
    }
}
