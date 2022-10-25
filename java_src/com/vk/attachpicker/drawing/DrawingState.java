package com.vk.attachpicker.drawing;

import android.graphics.Matrix;
import android.graphics.Path;
import com.vk.attachpicker.drawing.brushes.Brush;
import java.util.ArrayList;
import java.util.Iterator;
/* loaded from: classes2.dex */
public class DrawingState {
    public static final float[] WIDTH = {1.0f, 2.0f, 2.5f, 3.0f, 4.0f};
    private float canvasHeight;
    private float canvasWidth;
    private final Matrix transformMatrix = new Matrix();
    private final Matrix tmpMatrix = new Matrix();
    private final ArrayList<DrawingPath> backupPathList = new ArrayList<>();
    private final ArrayList<Brush> backupBrushList = new ArrayList<>();
    private final ArrayList<DrawingPath> pathList = new ArrayList<>();
    private final ArrayList<Brush> brushList = new ArrayList<>();

    public static int findIntIndex(float w) {
        for (int i = 0; i < WIDTH.length; i++) {
            if (WIDTH[i] == w) {
                return i;
            }
        }
        return 0;
    }

    public float getMaxBrushWidth() {
        float maxWidth = 0.0f;
        Iterator<Brush> it = this.brushList.iterator();
        while (it.hasNext()) {
            Brush b = it.next();
            if (b.getMaxDimension() > maxWidth) {
                maxWidth = b.getMaxDimension();
            }
        }
        return maxWidth;
    }

    public float getCanvasWidth() {
        return this.canvasWidth;
    }

    public float getCanvasHeight() {
        return this.canvasHeight;
    }

    public DrawingState copy() {
        DrawingState drawingState = new DrawingState();
        Iterator<DrawingPath> it = this.pathList.iterator();
        while (it.hasNext()) {
            DrawingPath p = it.next();
            drawingState.pathList.add(p.copy());
        }
        Iterator<Brush> it2 = this.brushList.iterator();
        while (it2.hasNext()) {
            Brush p2 = it2.next();
            drawingState.brushList.add(p2.copy());
        }
        drawingState.canvasWidth = this.canvasWidth;
        drawingState.canvasHeight = this.canvasHeight;
        return drawingState;
    }

    public void save() {
        this.backupPathList.clear();
        Iterator<DrawingPath> it = this.pathList.iterator();
        while (it.hasNext()) {
            DrawingPath p = it.next();
            this.backupPathList.add(p.copy());
        }
        this.backupBrushList.clear();
        Iterator<Brush> it2 = this.brushList.iterator();
        while (it2.hasNext()) {
            Brush p2 = it2.next();
            this.backupBrushList.add(p2.copy());
        }
    }

    public void restore() {
        this.pathList.clear();
        Iterator<DrawingPath> it = this.backupPathList.iterator();
        while (it.hasNext()) {
            DrawingPath p = it.next();
            this.pathList.add(p.copy());
        }
        this.brushList.clear();
        Iterator<Brush> it2 = this.backupBrushList.iterator();
        while (it2.hasNext()) {
            Brush p2 = it2.next();
            this.brushList.add(p2.copy());
        }
    }

    public void addElement(DrawingPath path, Brush paint) {
        this.pathList.add(path);
        this.brushList.add(paint);
    }

    public DrawingPath getPathAt(int i) {
        if (this.pathList.size() > i) {
            return this.pathList.get(i);
        }
        return null;
    }

    public Brush getBrushAt(int i) {
        if (this.brushList.size() > i) {
            return this.brushList.get(i);
        }
        return null;
    }

    public DrawingPath getLastPath() {
        if (this.pathList.size() > 0) {
            return this.pathList.get(this.pathList.size() - 1);
        }
        return null;
    }

    public void removeLastElement() {
        if (this.pathList.size() > 0) {
            this.pathList.remove(this.pathList.size() - 1);
        }
        if (this.brushList.size() > 0) {
            this.brushList.remove(this.brushList.size() - 1);
        }
    }

    public int size() {
        return this.pathList.size();
    }

    public Path getMergedPath() {
        Path path = new Path();
        for (int i = 0; i < this.pathList.size(); i++) {
            path.addPath(this.pathList.get(i).getPath());
        }
        return path;
    }

    public void clear() {
        this.pathList.clear();
        this.brushList.clear();
    }

    public void postTranslate(float dx, float dy) {
        this.tmpMatrix.reset();
        this.tmpMatrix.postTranslate(dx, dy);
        applyTransformMatrix(this.tmpMatrix);
    }

    public void postScale(float scale, float focalX, float focalY) {
        this.tmpMatrix.reset();
        this.tmpMatrix.postScale(scale, scale, focalX, focalY);
        applyTransformMatrix(this.tmpMatrix);
        applyScale(scale);
    }

    public void handleCropChange(Matrix before, Matrix after) {
        before.invert(this.tmpMatrix);
        this.tmpMatrix.postConcat(after);
        applyTransformMatrix(this.tmpMatrix);
        this.canvasWidth = 0.0f;
        this.canvasHeight = 0.0f;
    }

    private void applyTransformMatrix(Matrix matrix) {
        Iterator<DrawingPath> it = this.pathList.iterator();
        while (it.hasNext()) {
            DrawingPath p = it.next();
            p.transform(matrix);
        }
        Iterator<DrawingPath> it2 = this.backupPathList.iterator();
        while (it2.hasNext()) {
            DrawingPath p2 = it2.next();
            p2.transform(matrix);
        }
    }

    private void applyScale(float scale) {
        Iterator<Brush> it = this.brushList.iterator();
        while (it.hasNext()) {
            Brush p = it.next();
            p.setSize(p.getSize() * scale);
        }
        Iterator<Brush> it2 = this.backupBrushList.iterator();
        while (it2.hasNext()) {
            Brush p2 = it2.next();
            p2.setSize(p2.getSize() * scale);
        }
    }

    public void handleSizeChange(float width, float height) {
        if (this.canvasWidth != 0.0f && this.canvasHeight != 0.0f && width != 0.0f && height != 0.0f) {
            this.transformMatrix.reset();
            float scale = Math.min(width / this.canvasWidth, height / this.canvasHeight);
            this.transformMatrix.postScale(scale, scale, 0.0f, 0.0f);
            applyTransformMatrix(this.transformMatrix);
            applyScale(scale);
        }
        this.canvasWidth = width;
        this.canvasHeight = height;
    }
}
