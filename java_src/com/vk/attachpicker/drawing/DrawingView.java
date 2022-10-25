package com.vk.attachpicker.drawing;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Matrix;
import android.util.AttributeSet;
import android.view.MotionEvent;
import android.view.View;
import com.vk.attachpicker.drawing.brushes.Brush;
import com.vk.attachpicker.drawing.brushes.EraserBrush;
import com.vk.attachpicker.drawing.brushes.MarkerBrush;
import com.vk.attachpicker.drawing.brushes.NeonBrush;
import com.vk.attachpicker.drawing.brushes.PenBrush;
import com.vk.attachpicker.util.Utils;
import com.vk.core.util.Screen;
/* loaded from: classes2.dex */
public class DrawingView extends View {
    private static final int TOUCH_OFFSET = Screen.dp(8);
    private int brushType;
    private int color;
    private DrawingCanvas drawingCanvas;
    private final DrawingState drawingState;
    private boolean fixTouchPosition;
    private boolean isDown;
    private OnMotionEventListener onMotionEventListener;
    private boolean touchEnabled;
    private float widthMultiplier;

    /* loaded from: classes2.dex */
    public interface OnMotionEventListener {
        void onDown();

        void onUp();
    }

    public DrawingView(Context context) {
        super(context);
        this.drawingState = new DrawingState();
        this.touchEnabled = false;
        this.fixTouchPosition = true;
        this.brushType = 1;
        this.color = DrawingColors.COLORS[0];
        this.widthMultiplier = DrawingState.WIDTH[2];
    }

    public DrawingView(Context context, AttributeSet attrs) {
        super(context, attrs);
        this.drawingState = new DrawingState();
        this.touchEnabled = false;
        this.fixTouchPosition = true;
        this.brushType = 1;
        this.color = DrawingColors.COLORS[0];
        this.widthMultiplier = DrawingState.WIDTH[2];
    }

    public DrawingView(Context context, AttributeSet attrs, int defStyle) {
        super(context, attrs, defStyle);
        this.drawingState = new DrawingState();
        this.touchEnabled = false;
        this.fixTouchPosition = true;
        this.brushType = 1;
        this.color = DrawingColors.COLORS[0];
        this.widthMultiplier = DrawingState.WIDTH[2];
    }

    private void startNewPath(MotionEvent event) {
        Brush brush;
        if (this.brushType == 1) {
            brush = new PenBrush();
        } else if (this.brushType == 0) {
            brush = new EraserBrush();
        } else if (this.brushType == 2) {
            brush = new MarkerBrush();
        } else if (this.brushType == 3) {
            brush = new NeonBrush();
        } else {
            brush = null;
        }
        brush.setSize(this.widthMultiplier);
        brush.setColor(this.color);
        DrawingPath path = new DrawingPath();
        float newX = event.getX();
        float newY = event.getY();
        path.add(newX, newY);
        this.drawingState.addElement(path, brush);
        this.drawingCanvas.startDrawingSession(brush, path);
    }

    private void endCurrentPath() {
        DrawingPath path = this.drawingState.getLastPath();
        if (path != null) {
            path.close();
        }
        this.drawingCanvas.saveDrawingSession();
    }

    private void onActionDown(MotionEvent event) {
        startNewPath(event);
        this.isDown = true;
        if (this.onMotionEventListener != null) {
            this.onMotionEventListener.onDown();
        }
    }

    private void onActionMove(MotionEvent event) {
        if (this.isDown) {
            float newX = event.getX();
            float newY = event.getY();
            DrawingPath path = this.drawingState.getLastPath();
            if (path != null) {
                path.add(newX, newY);
            }
            this.drawingCanvas.processPoints();
        }
    }

    private void onActionUp(MotionEvent event) {
        if (this.isDown) {
            endCurrentPath();
            this.isDown = false;
            if (this.onMotionEventListener != null) {
                this.onMotionEventListener.onUp();
            }
        }
    }

    private void invalidateBitmap() {
        if (this.drawingCanvas != null) {
            this.drawingCanvas.clearDrawCache();
            this.drawingCanvas.draw(this.drawingState);
        }
        invalidate();
    }

    public void setFixTouchPosition(boolean fixTouchPosition) {
        this.fixTouchPosition = fixTouchPosition;
    }

    public void setOnMotionEventListener(OnMotionEventListener onMotionEventListener) {
        this.onMotionEventListener = onMotionEventListener;
    }

    public void saveState() {
        this.drawingState.save();
    }

    public void restoreState() {
        this.drawingState.restore();
        invalidateBitmap();
    }

    public void handleSizeChange(int w, int h) {
        this.drawingState.handleSizeChange(w, h);
        invalidate();
    }

    public void handleCrop(Matrix before, Matrix after) {
        this.drawingState.handleCropChange(before, after);
        invalidate();
    }

    public int getHistorySize() {
        return this.drawingState.size();
    }

    public DrawingState getDrawingStateCopy() {
        return this.drawingState.copy();
    }

    @Override // android.view.View
    protected void onSizeChanged(int w, int h, int oldw, int oldh) {
        super.onSizeChanged(w, h, oldw, oldh);
        handleSizeChange(w, h);
        this.drawingCanvas = new DrawingCanvas(w, h);
        this.drawingCanvas.draw(this.drawingState);
    }

    @Override // android.view.View
    protected void onDraw(Canvas canvas) {
        super.onDraw(canvas);
        this.drawingCanvas.drawOnCanvas(canvas);
    }

    @Override // android.view.View
    public boolean onTouchEvent(MotionEvent event) {
        if (!this.touchEnabled) {
            return false;
        }
        if (this.fixTouchPosition) {
            int deltaX = -Utils.getXOnScreen(this);
            int deltaY = -Utils.getYOnScreen(this);
            event.offsetLocation(deltaX, deltaY - TOUCH_OFFSET);
        } else {
            event.offsetLocation(0.0f, -TOUCH_OFFSET);
        }
        switch (event.getAction()) {
            case 0:
                onActionDown(event);
                break;
            case 1:
                onActionUp(event);
                break;
            case 2:
                onActionMove(event);
                break;
        }
        invalidate();
        return true;
    }

    public boolean isTouchEnabled() {
        return this.touchEnabled;
    }

    public void setTouchEnabled(boolean touchEnabled) {
        this.touchEnabled = touchEnabled;
    }

    public void undo() {
        this.drawingState.removeLastElement();
        invalidateBitmap();
    }

    public void clear() {
        this.drawingState.clear();
        invalidateBitmap();
    }

    public boolean isDefault() {
        return this.drawingState.size() == 0;
    }

    public int getBrushType() {
        return this.brushType;
    }

    public void setBrushType(int brushType) {
        this.brushType = brushType;
    }

    public int getColor() {
        return this.color;
    }

    public void setColor(int color) {
        this.color = color;
    }

    public float getWidthMultiplier() {
        return this.widthMultiplier;
    }

    public void setWidthMultiplier(float widthMultiplier) {
        this.widthMultiplier = widthMultiplier;
    }
}
