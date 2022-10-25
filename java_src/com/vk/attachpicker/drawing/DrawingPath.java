package com.vk.attachpicker.drawing;

import android.graphics.Matrix;
import android.graphics.Path;
import com.vk.attachpicker.util.DynamicFloatArray;
import com.vk.core.util.Screen;
/* loaded from: classes2.dex */
public class DrawingPath {
    private static final int MINOR_MOVE = Screen.dp(1);
    private final DynamicFloatArray pathX = new DynamicFloatArray(110);
    private final DynamicFloatArray pathY = new DynamicFloatArray(110);
    private boolean isMinorDelta = true;
    private final Path cachedPath = new Path();
    private boolean pathIsClosed = false;
    private boolean isClosed = false;

    public DrawingPath copy() {
        DrawingPath dp = new DrawingPath();
        this.pathX.copyTo(dp.pathX);
        this.pathY.copyTo(dp.pathY);
        dp.isMinorDelta = this.isMinorDelta;
        dp.cachedPath.set(this.cachedPath);
        dp.pathIsClosed = this.pathIsClosed;
        dp.isClosed = this.isClosed;
        return dp;
    }

    public void transform(Matrix matrix) {
        float[] temp = new float[this.pathX.size() * 2];
        for (int i = 0; i < temp.length; i += 2) {
            temp[i] = this.pathX.get(i / 2);
            temp[i + 1] = this.pathY.get(i / 2);
        }
        matrix.mapPoints(temp);
        this.pathX.clear();
        this.pathY.clear();
        for (int i2 = 0; i2 < temp.length; i2 += 2) {
            this.pathX.add(temp[i2]);
            this.pathY.add(temp[i2 + 1]);
        }
        this.pathIsClosed = false;
    }

    public int size() {
        return this.pathX.size();
    }

    public float getX(int i) {
        return this.pathX.get(i);
    }

    public float getY(int i) {
        return this.pathY.get(i);
    }

    public void add(float newX, float newY) {
        if (!this.isClosed) {
            this.pathX.add(newX);
            this.pathY.add(newY);
            if (this.isMinorDelta && this.pathX.size() > 1) {
                float beginX = this.pathX.get(0);
                float beginY = this.pathY.get(0);
                for (int i = 1; i < this.pathX.size(); i++) {
                    float x = this.pathX.get(i);
                    float y = this.pathY.get(i);
                    if (Math.abs(beginX - x) > MINOR_MOVE || Math.abs(beginY - y) > MINOR_MOVE) {
                        this.isMinorDelta = false;
                        return;
                    }
                }
            }
        }
    }

    public void close() {
        this.isClosed = true;
    }

    public Path getPath() {
        if (this.pathIsClosed) {
            return this.cachedPath;
        }
        fillPath(this.cachedPath, this.pathX, this.pathY, false, this.isMinorDelta);
        if (this.isClosed) {
            this.pathIsClosed = true;
        }
        return this.cachedPath;
    }

    private static void fillPath(Path path, DynamicFloatArray pathX, DynamicFloatArray pathY, boolean shouldEnd, boolean isMinorDelta) {
        path.rewind();
        if (pathX.size() != 0) {
            float beginPointX = pathX.get(0);
            float beginPointY = pathY.get(0);
            if (isMinorDelta) {
                path.moveTo(beginPointX, beginPointY);
                path.lineTo(1.0f + beginPointX, beginPointY);
                return;
            }
            path.moveTo(beginPointX, beginPointY);
            for (int i = 1; i < pathX.size(); i++) {
                float prePointX = pathX.get(i - 1);
                float prePointY = pathY.get(i - 1);
                float currentPointX = pathX.get(i);
                float currentPointY = pathY.get(i);
                double s = Math.sqrt(Math.pow(currentPointX - prePointX, 2.0d) + Math.pow(currentPointY - prePointY, 2.0d));
                if (s < 2.0d) {
                    path.lineTo(currentPointX, currentPointY);
                } else {
                    path.quadTo(prePointX, prePointY, (prePointX + currentPointX) / 2.0f, (prePointY + currentPointY) / 2.0f);
                }
                if (shouldEnd && i == pathX.size() - 1) {
                    path.quadTo((prePointX + currentPointX) / 2.0f, (prePointY + currentPointY) / 2.0f, currentPointX, currentPointY);
                }
            }
        }
    }
}
