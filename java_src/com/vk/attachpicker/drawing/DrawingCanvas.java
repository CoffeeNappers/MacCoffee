package com.vk.attachpicker.drawing;

import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Paint;
import com.vk.attachpicker.drawing.brushes.Brush;
import com.vkontakte.android.Log;
/* loaded from: classes2.dex */
public class DrawingCanvas {
    private static final Paint STUB_PAINT = new Paint();
    private Bitmap drawingBitmap;
    private Canvas drawingCanvas;
    private DrawingSession drawingSession;
    private final int height;
    private Bitmap sessionDrawingBitmap;
    private Canvas sessionDrawingCanvas;
    private final int width;

    public DrawingCanvas(int width, int height) {
        this.width = width;
        this.height = height;
        initDrawingBitmapIfNeeded(width, height);
    }

    public DrawingCanvas(Bitmap drawingBitmap) {
        this.width = drawingBitmap.getWidth();
        this.height = drawingBitmap.getHeight();
        this.drawingBitmap = drawingBitmap;
        this.drawingCanvas = new Canvas(this.drawingBitmap);
    }

    public int getWidth() {
        return this.width;
    }

    public int getHeight() {
        return this.height;
    }

    public void clearDrawCache() {
        this.drawingBitmap.eraseColor(0);
    }

    public void draw(DrawingState state) {
        destroyDrawingSession();
        for (int i = 0; i < state.size(); i++) {
            Brush brush = state.getBrushAt(i);
            DrawingPath path = state.getPathAt(i);
            if (brush.shouldBeDrawnInSessionDrawingLayer()) {
                startDrawingSession(brush, path);
                initSessionBitmapIfNeeded(this.width, this.height);
                this.drawingSession.drawUnprocessedPoints(this.sessionDrawingCanvas, false);
                saveDrawingSession();
            } else {
                brush.draw(this.drawingCanvas, path.getPath());
            }
        }
    }

    public void startDrawingSession(Brush brush, DrawingPath drawingPath) {
        destroyDrawingSession();
        this.drawingSession = new DrawingSession(brush, drawingPath);
        processPoints();
    }

    public void processPoints() {
        if (this.drawingSession != null && this.drawingSession.getBrush().shouldBeDrawnInSessionDrawingLayer()) {
            initSessionBitmapIfNeeded(this.width, this.height);
            this.drawingSession.drawUnprocessedPoints(this.sessionDrawingCanvas, false);
        }
    }

    public void saveDrawingSession() {
        if (this.drawingSession != null) {
            if (this.sessionDrawingBitmap != null && this.drawingSession.getBrush().shouldBeDrawnInSessionDrawingLayer()) {
                this.drawingSession.drawUnprocessedPoints(this.sessionDrawingCanvas, true);
                STUB_PAINT.setAlpha(this.drawingSession.getBrush().getAlpha());
                this.drawingCanvas.drawBitmap(this.sessionDrawingBitmap, 0.0f, 0.0f, STUB_PAINT);
            } else {
                this.drawingSession.draw(this.drawingCanvas);
            }
            destroyDrawingSession();
        }
    }

    public void destroyDrawingSession() {
        this.drawingSession = null;
        if (this.sessionDrawingBitmap != null) {
            this.sessionDrawingBitmap.eraseColor(0);
        }
    }

    public void drawOnCanvas(Canvas canvas) {
        if (this.drawingSession != null && this.drawingSession.getBrush().shouldBeDrawnInDrawingLayer()) {
            this.drawingSession.draw(this.drawingCanvas);
        }
        STUB_PAINT.setAlpha(255);
        canvas.drawBitmap(this.drawingBitmap, 0.0f, 0.0f, STUB_PAINT);
        if (this.drawingSession != null && this.drawingSession.getBrush().shouldBeDrawnInSessionDrawingLayer() && this.sessionDrawingBitmap != null) {
            STUB_PAINT.setAlpha(this.drawingSession.getBrush().getAlpha());
            canvas.drawBitmap(this.sessionDrawingBitmap, 0.0f, 0.0f, STUB_PAINT);
        } else if (this.drawingSession != null && !this.drawingSession.getBrush().shouldBeDrawnInDrawingLayer()) {
            this.drawingSession.draw(canvas);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes2.dex */
    public static class DrawingSession {
        private static final float interpolateQualityFactor = 0.3f;
        private float distanceSinceLastDrawnPoint;
        private final DrawingPath drawingPath;
        private float lastDrawnPointX = 0.0f;
        private float lastDrawnPointY = 0.0f;
        private int pointsProcessed;
        private final Brush textureBrush;

        public DrawingSession(Brush textureBrush, DrawingPath drawingPath) {
            this.textureBrush = textureBrush;
            this.drawingPath = drawingPath;
        }

        public Brush getBrush() {
            return this.textureBrush;
        }

        public void draw(Canvas canvas) {
            this.textureBrush.draw(canvas, this.drawingPath.getPath());
        }

        public void drawUnprocessedPoints(Canvas canvas, boolean finish) {
            if (finish && this.drawingPath.size() > 0 && this.drawingPath.size() < 5) {
                Log.d("tmp", "drawingPath.size(): " + this.drawingPath.size() + ", finish: " + finish);
                this.textureBrush.draw(canvas, this.drawingPath.getX(0), this.drawingPath.getY(0));
                return;
            }
            int start = Math.max(0, this.pointsProcessed - 2);
            int end = this.drawingPath.size() - 2;
            for (int j = start; j < end; j++) {
                float x0 = this.drawingPath.getX(j);
                float y0 = this.drawingPath.getY(j);
                float x1 = this.drawingPath.getX(j + 1);
                float y1 = this.drawingPath.getY(j + 1);
                float x02 = (x0 + x1) / 2.0f;
                float y02 = (y0 + y1) / 2.0f;
                float x2 = (x1 + this.drawingPath.getX(j + 2)) / 2.0f;
                float y2 = (y1 + this.drawingPath.getY(j + 2)) / 2.0f;
                float length = distance(x02, y02, x1, y1) + distance(x1, y1, x2, y2);
                int count = Math.round(0.3f * length);
                for (int i = 0; i < count; i++) {
                    float t = i / count;
                    float t2 = t * t;
                    float x = (((x02 - (2.0f * x1)) + x2) * t2) + (((2.0f * x1) - (2.0f * x02)) * t) + x02;
                    float y = (((y02 - (2.0f * y1)) + y2) * t2) + (((2.0f * y1) - (2.0f * y02)) * t) + y02;
                    float distance = distance(this.lastDrawnPointX, this.lastDrawnPointY, x, y);
                    this.distanceSinceLastDrawnPoint += distance;
                    if (this.distanceSinceLastDrawnPoint > this.textureBrush.drawPeriod()) {
                        this.textureBrush.draw(canvas, x, y);
                        this.distanceSinceLastDrawnPoint = 0.0f;
                    }
                    this.lastDrawnPointX = x;
                    this.lastDrawnPointY = x;
                }
            }
            this.pointsProcessed = this.drawingPath.size();
        }

        private float distance(float x0, float y0, float x1, float y1) {
            return (float) Math.sqrt(((x0 - x1) * (x0 - x1)) + ((y0 - y1) * (y0 - y1)));
        }
    }

    private void initDrawingBitmapIfNeeded(int width, int height) {
        if (!checkBitmapValid(this.drawingBitmap, this.drawingCanvas, width, height)) {
            this.drawingBitmap = Bitmap.createBitmap(width, height, Bitmap.Config.ARGB_8888);
            this.drawingCanvas = new Canvas(this.drawingBitmap);
        }
    }

    private void initSessionBitmapIfNeeded(int width, int height) {
        if (!checkBitmapValid(this.sessionDrawingBitmap, this.sessionDrawingCanvas, width, height)) {
            this.sessionDrawingBitmap = Bitmap.createBitmap(width, height, Bitmap.Config.ARGB_8888);
            this.sessionDrawingCanvas = new Canvas(this.sessionDrawingBitmap);
        }
    }

    private static boolean checkCanvasExists(Bitmap bitmap, Canvas canvas) {
        return (bitmap == null || bitmap.isRecycled() || canvas == null) ? false : true;
    }

    private static boolean checkBitmapValid(Bitmap bitmap, Canvas canvas, int width, int height) {
        return checkCanvasExists(bitmap, canvas) && bitmap.getWidth() == width && bitmap.getHeight() == height && canvas.getWidth() == width && canvas.getHeight() == height;
    }
}
