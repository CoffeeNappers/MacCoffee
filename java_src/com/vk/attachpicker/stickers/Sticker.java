package com.vk.attachpicker.stickers;

import android.graphics.Canvas;
import android.graphics.Matrix;
import android.graphics.PointF;
import android.graphics.RectF;
import com.vk.attachpicker.crop.MathCropUtils;
/* loaded from: classes2.dex */
public abstract class Sticker {
    private float canvasHeight;
    private float canvasWidth;
    private boolean isInEditMode;
    private final float[] matrixValues = new float[9];
    private final Matrix matrix = new Matrix();
    private final Matrix tmpMatrix = new Matrix();
    private final float[] drawingRect = new float[8];
    private final RectF boundingBox = new RectF();
    private int alpha = 255;
    private final PointF[] points = {new PointF(), new PointF(), new PointF(), new PointF()};

    public abstract void doDraw(Canvas canvas);

    public abstract float getOriginalHeight();

    public abstract float getOriginalWidth();

    public Sticker() {
        updatePosition();
    }

    public boolean canRotate() {
        return true;
    }

    public boolean canScale() {
        return true;
    }

    public boolean canTranslateX() {
        return true;
    }

    public boolean canTranslateY() {
        return true;
    }

    public Sticker copy() {
        Sticker sticker;
        if (getClass() == TextSticker.class) {
            sticker = new TextSticker((TextSticker) this);
        } else if (getClass() == BitmapSticker.class) {
            sticker = new BitmapSticker((BitmapSticker) this);
        } else {
            sticker = null;
        }
        sticker.canvasWidth = this.canvasWidth;
        sticker.canvasHeight = this.canvasHeight;
        sticker.matrix.set(this.matrix);
        sticker.updatePosition();
        return sticker;
    }

    public boolean isInEditMode() {
        return this.isInEditMode;
    }

    public void setInEditMode(boolean inEditMode) {
        this.isInEditMode = inEditMode;
    }

    public Matrix getMatrix() {
        return this.matrix;
    }

    public float getScale() {
        return (float) Math.sqrt(((float) Math.pow(getValue(this.matrix, 0), 2.0d)) + ((float) Math.pow(getValue(this.matrix, 3), 2.0d)));
    }

    public void reset(float width, float height) {
        this.matrix.reset();
        setCanvasDimension(width, height);
        translateBy((width / 2.0f) - (getOriginalWidth() / 2.0f), (height / 2.0f) - (getOriginalHeight() / 2.0f));
    }

    public void translateBy(float translationX, float translationY) {
        if (canTranslateX() && canTranslateY()) {
            this.matrix.postTranslate(translationX, translationY);
        } else if (canTranslateX()) {
            this.matrix.postTranslate(translationX, 0.0f);
        } else if (canTranslateY()) {
            this.matrix.postTranslate(0.0f, translationY);
        }
        updatePosition();
    }

    public void scaleBy(float scale, float focusX, float focusY) {
        if (canScale() && getScale() * scale <= 4.0f && getScale() * scale >= 0.3f) {
            this.matrix.postScale(scale, scale, focusX, focusY);
            updatePosition();
        }
    }

    public void rotateBy(float rotation, float focusX, float focusY) {
        if (canRotate()) {
            this.matrix.postRotate(rotation, focusX, focusY);
            updatePosition();
        }
    }

    public int getAlpha() {
        return this.alpha;
    }

    public void setAlpha(int alpha) {
        this.alpha = alpha;
    }

    public void handleCrop(Matrix before, Matrix after) {
        before.invert(this.tmpMatrix);
        this.tmpMatrix.postConcat(after);
        this.matrix.postConcat(this.tmpMatrix);
        this.canvasWidth = 0.0f;
        this.canvasHeight = 0.0f;
        updatePosition();
    }

    public void setCanvasDimension(float width, float height) {
        if (this.canvasWidth > 0.0f && this.canvasHeight > 0.0f && width > 0.0f && height > 0.0f) {
            float scale = Math.min(width / this.canvasWidth, height / this.canvasHeight);
            this.matrix.postScale(scale, scale, 0.0f, 0.0f);
        }
        this.canvasWidth = width;
        this.canvasHeight = height;
        updatePosition();
    }

    public void draw(Canvas canvas) {
        int saveCount = canvas.save();
        canvas.concat(this.matrix);
        doDraw(canvas);
        canvas.restoreToCount(saveCount);
    }

    public boolean isCoordinatesInsideView(float x, float y) {
        this.points[0].set(this.drawingRect[0], this.drawingRect[1]);
        this.points[1].set(this.drawingRect[2], this.drawingRect[3]);
        this.points[2].set(this.drawingRect[4], this.drawingRect[5]);
        this.points[3].set(this.drawingRect[6], this.drawingRect[7]);
        return MathCropUtils.isPolygonContainsPoint(this.points, x, y);
    }

    public float getCenterX() {
        return this.boundingBox.centerX();
    }

    public float getCenterY() {
        return this.boundingBox.centerY();
    }

    public float distance(float x, float y) {
        return (float) Math.sqrt(((getCenterX() - x) * (getCenterX() - x)) + ((getCenterY() - y) * (getCenterY() - y)));
    }

    private void updatePosition() {
        this.boundingBox.left = 0.0f;
        this.boundingBox.top = 0.0f;
        this.boundingBox.right = getOriginalWidth();
        this.boundingBox.bottom = getOriginalHeight();
        this.drawingRect[0] = this.boundingBox.left;
        this.drawingRect[1] = this.boundingBox.top;
        this.drawingRect[2] = this.boundingBox.right;
        this.drawingRect[3] = this.boundingBox.top;
        this.drawingRect[4] = this.boundingBox.right;
        this.drawingRect[5] = this.boundingBox.bottom;
        this.drawingRect[6] = this.boundingBox.left;
        this.drawingRect[7] = this.boundingBox.bottom;
        this.matrix.mapRect(this.boundingBox);
        this.matrix.mapPoints(this.drawingRect);
    }

    private float getValue(Matrix matrix, int whichValue) {
        matrix.getValues(this.matrixValues);
        return this.matrixValues[whichValue];
    }
}
