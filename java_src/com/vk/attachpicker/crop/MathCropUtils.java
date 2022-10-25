package com.vk.attachpicker.crop;

import android.graphics.PointF;
/* loaded from: classes2.dex */
public class MathCropUtils {
    public static boolean isPolygonContainsRectangle(PointF[] polygon, PointF[] rect) {
        for (PointF p : rect) {
            if (!isPolygonContainsPoint(polygon, p.x, p.y)) {
                return false;
            }
        }
        return true;
    }

    public static boolean isPolygonContainsPoint(PointF[] polygon, float x, float y) {
        PointF p2;
        PointF p22;
        boolean result = false;
        for (int i = 0; i < polygon.length; i++) {
            PointF p1 = polygon[i];
            if (i == polygon.length - 1) {
                p22 = polygon[0];
            } else {
                p22 = polygon[i + 1];
            }
            if ((p1.y >= y) != (p22.y >= y) && x <= (((p22.x - p1.x) * (y - p1.y)) / (p22.y - p1.y)) + p1.x) {
                result = !result;
            }
        }
        if (!result) {
            for (int i2 = 0; i2 < polygon.length; i2++) {
                PointF p12 = polygon[i2];
                if (i2 == polygon.length - 1) {
                    p2 = polygon[0];
                } else {
                    p2 = polygon[i2 + 1];
                }
                if (isPointOnTheLine(p12, p2, x, y)) {
                    return true;
                }
            }
            return result;
        }
        return result;
    }

    public static boolean isPointOnTheLine(PointF a, PointF b, float cx, float cy) {
        float crossProduct = ((cy - a.y) * (b.x - a.x)) - ((cx - a.x) * (b.y - a.y));
        if (compareFloat(Math.abs(crossProduct), 5.0E-4f) > 0) {
            return false;
        }
        float dotProduct = ((cx - a.x) * (b.x - a.x)) + ((cy - a.y) * (b.y - a.y));
        if (compareFloat(dotProduct, 0.0f) < 0) {
            return false;
        }
        float squaredLengthBA = ((b.x - a.x) * (b.x - a.x)) + ((b.y - a.y) * (b.y - a.y));
        return compareFloat(dotProduct, squaredLengthBA) <= 0;
    }

    public static int compareFloat(float a, float b) {
        float delta = Math.abs(a - b);
        if (delta < 5.0E-4d) {
            return 0;
        }
        if (a < b) {
            return -1;
        }
        return 1;
    }
}
