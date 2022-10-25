package com.vk.attachpicker.stickers;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Matrix;
import android.graphics.Rect;
import android.support.v4.media.TransportMediator;
import android.util.AttributeSet;
import android.view.Gravity;
import android.view.MotionEvent;
import android.view.ScaleGestureDetector;
import android.view.View;
import android.view.ViewTreeObserver;
import com.vk.attachpicker.gesture.MoveGestureDetector;
import com.vk.attachpicker.gesture.RotationGestureDetector;
import com.vk.attachpicker.util.Utils;
import com.vk.core.util.Screen;
import java.util.ArrayList;
import java.util.Collections;
/* loaded from: classes2.dex */
public class StickersDrawingView extends View implements ScaleGestureDetector.OnScaleGestureListener, MoveGestureDetector.OnMoveGestureListener, RotationGestureDetector.OnRotationGestureListener {
    private static final int STATE_IN_DRAWING_AREA = 1;
    private static final int STATE_IN_REMOVE_AREA = 2;
    private static final int STATE_NONE = 0;
    private static final int STATE_WAS_SCALED_OR_ROTATED = 3;
    private long downTime;
    private int downX;
    private int downY;
    private StickersDrawingState drawingState;
    private View.OnTouchListener interceptTouchListener;
    private MoveGestureDetector moveGestureDetector;
    private Sticker moveView;
    private OnStickerMoveListener onStickerMoveListener;
    private OnTextStickerClickListener onTextStickerClickListener;
    private ArrayList<RemoveArea> removeAreas;
    private RotationGestureDetector rotationGestureDetector;
    private ScaleGestureDetector scaleGestureDetector;
    private int state;
    private final Rect testRect;
    private final Rect thisViewRect;
    private boolean touchEnabled;

    /* loaded from: classes2.dex */
    public interface OnStickerMoveListener {
        void onEnterRemoveArea();

        void onLeaveRemoveArea();

        void onStartMove();

        void onTwoFingerGesture();

        void onUp();
    }

    /* loaded from: classes2.dex */
    public interface OnTextStickerClickListener {
        void onClick(TextSticker textSticker);
    }

    public StickersDrawingView(Context context) {
        super(context);
        this.thisViewRect = new Rect();
        this.testRect = new Rect();
        this.removeAreas = new ArrayList<>();
        this.drawingState = new StickersDrawingState();
        this.downX = -1;
        this.downY = -1;
        this.downTime = -1L;
        this.touchEnabled = true;
        init(context);
    }

    public StickersDrawingView(Context context, AttributeSet attrs) {
        super(context, attrs);
        this.thisViewRect = new Rect();
        this.testRect = new Rect();
        this.removeAreas = new ArrayList<>();
        this.drawingState = new StickersDrawingState();
        this.downX = -1;
        this.downY = -1;
        this.downTime = -1L;
        this.touchEnabled = true;
        init(context);
    }

    public StickersDrawingView(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        this.thisViewRect = new Rect();
        this.testRect = new Rect();
        this.removeAreas = new ArrayList<>();
        this.drawingState = new StickersDrawingState();
        this.downX = -1;
        this.downY = -1;
        this.downTime = -1L;
        this.touchEnabled = true;
        init(context);
    }

    private void init(Context context) {
        this.moveGestureDetector = new MoveGestureDetector(this);
        this.scaleGestureDetector = new ScaleGestureDetector(context, this);
        this.rotationGestureDetector = new RotationGestureDetector(this);
    }

    public void addRemoveArea(int gravity, int width, int height) {
        this.removeAreas.add(new RemoveArea(gravity, width, height));
    }

    public boolean hitRemoveArea(int x, int y, boolean useOutsideAreasAsRemoveAreas) {
        if (!useOutsideAreasAsRemoveAreas || (x >= 0 && y >= 0 && x <= getMeasuredWidth() && y <= getMeasuredHeight())) {
            this.thisViewRect.set(0, 0, getMeasuredWidth(), getMeasuredHeight());
            for (int i = 0; i < this.removeAreas.size(); i++) {
                RemoveArea removeArea = this.removeAreas.get(i);
                removeArea.get(this.thisViewRect, this.testRect);
                if (this.testRect.contains(x, y)) {
                    return true;
                }
            }
            return false;
        }
        return true;
    }

    public void clear() {
        this.drawingState.clear();
        invalidate();
    }

    public boolean isDefault() {
        return this.drawingState.size() == 0;
    }

    public void setOnTextStickerClickListener(OnTextStickerClickListener onTextStickerClickListener) {
        this.onTextStickerClickListener = onTextStickerClickListener;
    }

    public void setOnStickerMoveListener(OnStickerMoveListener onStickerMoveListener) {
        this.onStickerMoveListener = onStickerMoveListener;
    }

    public void removeStickerView(Sticker sticker) {
        this.drawingState.removeSticker(sticker);
        invalidate();
    }

    public void addStickerView(final Sticker sticker) {
        getViewTreeObserver().addOnPreDrawListener(new ViewTreeObserver.OnPreDrawListener() { // from class: com.vk.attachpicker.stickers.StickersDrawingView.1
            @Override // android.view.ViewTreeObserver.OnPreDrawListener
            public boolean onPreDraw() {
                StickersDrawingView.this.getViewTreeObserver().removeOnPreDrawListener(this);
                sticker.setCanvasDimension(StickersDrawingView.this.getMeasuredWidth(), StickersDrawingView.this.getMeasuredHeight());
                sticker.translateBy((StickersDrawingView.this.getMeasuredWidth() / 2) - (sticker.getOriginalWidth() / 2.0f), (StickersDrawingView.this.getMeasuredHeight() / 2) - (sticker.getOriginalHeight() / 2.0f));
                StickersDrawingView.this.drawingState.addSticker(sticker);
                StickersDrawingView.this.invalidate();
                return false;
            }
        });
        invalidate();
    }

    public void handleCrop(Matrix before, Matrix after) {
        this.drawingState.handleCrop(before, after);
        invalidate();
    }

    public void handleSizeChange(int w, int h) {
        this.drawingState.handleSizeChange(w, h);
        invalidate();
    }

    public boolean isTouchEnabled() {
        return this.touchEnabled;
    }

    public void setTouchEnabled(boolean touchEnabled) {
        this.touchEnabled = touchEnabled;
    }

    @Override // android.view.View
    protected void onDraw(Canvas canvas) {
        super.onDraw(canvas);
        this.drawingState.draw(canvas);
    }

    @Override // android.view.View
    protected void onSizeChanged(int w, int h, int oldw, int oldh) {
        super.onSizeChanged(w, h, oldw, oldh);
        handleSizeChange(w, h);
    }

    @Override // android.view.View
    public boolean onTouchEvent(MotionEvent event) {
        int newState;
        if (this.interceptTouchListener != null && this.moveView == null) {
            this.interceptTouchListener.onTouch(this, event);
        }
        if (!this.touchEnabled) {
            return false;
        }
        int deltaX = -Utils.getXOnScreen(this);
        int deltaY = -Utils.getYOnScreen(this);
        event.offsetLocation(deltaX, deltaY);
        int action = event.getAction() & 255;
        int x = (int) event.getX();
        int y = (int) event.getY();
        if ((action == 0 || action == 5) && this.moveView == null) {
            if (this.drawingState.size() > 0) {
                for (int i = this.drawingState.size() - 1; i >= 0 && this.moveView == null; i--) {
                    Sticker v = this.drawingState.get(i);
                    int pc = event.getPointerCount();
                    int j = 0;
                    while (true) {
                        if (j < pc) {
                            if (!v.isCoordinatesInsideView(event.getX(j), event.getY(j))) {
                                j++;
                            } else {
                                this.moveView = v;
                                Collections.swap(this.drawingState.getStickers(), i, this.drawingState.size() - 1);
                                invalidate();
                                break;
                            }
                        } else {
                            break;
                        }
                    }
                }
                if (this.moveView == null && event.getPointerCount() > 1) {
                    float focalX = MoveGestureDetector.getFocalX(event);
                    float focalY = MoveGestureDetector.getFocalY(event);
                    Sticker closestSticker = this.drawingState.get(0);
                    float distance = closestSticker.distance(focalX, focalY);
                    for (int i2 = 0; i2 < this.drawingState.size(); i2++) {
                        float d = this.drawingState.get(i2).distance(focalX, focalY);
                        if (d <= distance) {
                            distance = d;
                            closestSticker = this.drawingState.get(i2);
                        }
                    }
                    this.moveView = closestSticker;
                }
            }
            this.downX = x;
            this.downY = y;
            this.downTime = System.currentTimeMillis();
            this.state = 0;
        } else if (action == 1 || action == 3) {
            if (this.downX != -1 && this.downY != -1 && Math.abs(this.downX - x) < Screen.dp(5) && Math.abs(this.downY - y) < Screen.dp(5) && System.currentTimeMillis() - this.downTime < 500 && this.moveView != null && (this.moveView instanceof TextSticker) && this.onTextStickerClickListener != null) {
                this.onTextStickerClickListener.onClick((TextSticker) this.moveView);
            }
            if (this.onStickerMoveListener != null && this.state != 3 && hitRemoveArea(x, y, true) && this.moveView != null) {
                this.drawingState.removeSticker(this.moveView);
                this.moveView = null;
                invalidate();
            }
            this.onStickerMoveListener.onUp();
            this.moveView = null;
        } else if (action == 2 && System.currentTimeMillis() - this.downTime > 150 && this.moveView != null && this.state != 3) {
            if (this.state == 0 && this.onStickerMoveListener != null) {
                this.onStickerMoveListener.onStartMove();
            }
            if (hitRemoveArea(x, y, true)) {
                newState = 2;
            } else {
                newState = 1;
            }
            if (newState != this.state && this.onStickerMoveListener != null) {
                if (newState == 2) {
                    this.moveView.setAlpha(TransportMediator.KEYCODE_MEDIA_PAUSE);
                    this.onStickerMoveListener.onEnterRemoveArea();
                } else {
                    this.moveView.setAlpha(255);
                    this.onStickerMoveListener.onLeaveRemoveArea();
                }
                this.state = newState;
            }
        }
        try {
            this.moveGestureDetector.onTouchEvent(event);
            this.scaleGestureDetector.onTouchEvent(event);
            this.rotationGestureDetector.onTouchEvent(event);
        } catch (Exception e) {
        }
        return true;
    }

    @Override // android.view.ScaleGestureDetector.OnScaleGestureListener
    public boolean onScale(ScaleGestureDetector detector) {
        if (this.moveView != null) {
            if (this.state != 3) {
                this.state = 3;
                this.onStickerMoveListener.onTwoFingerGesture();
            }
            this.moveView.scaleBy(detector.getScaleFactor(), detector.getFocusX(), detector.getFocusY());
            invalidate();
            return true;
        }
        return true;
    }

    @Override // android.view.ScaleGestureDetector.OnScaleGestureListener
    public boolean onScaleBegin(ScaleGestureDetector detector) {
        return true;
    }

    @Override // android.view.ScaleGestureDetector.OnScaleGestureListener
    public void onScaleEnd(ScaleGestureDetector detector) {
    }

    @Override // com.vk.attachpicker.gesture.RotationGestureDetector.OnRotationGestureListener
    public void onRotation(float delta, float focalX, float focalY) {
        if (this.moveView != null) {
            if (this.state != 3) {
                this.state = 3;
                this.onStickerMoveListener.onTwoFingerGesture();
            }
            this.moveView.rotateBy(-delta, focalX, focalY);
            invalidate();
        }
    }

    @Override // com.vk.attachpicker.gesture.MoveGestureDetector.OnMoveGestureListener
    public void onMove(float deltaX, float deltaY) {
        if (this.moveView != null) {
            this.moveView.translateBy(deltaX, deltaY);
            invalidate();
        }
    }

    public View.OnTouchListener getInterceptTouchListener() {
        return this.interceptTouchListener;
    }

    public void setInterceptTouchListener(View.OnTouchListener interceptTouchListener) {
        this.interceptTouchListener = interceptTouchListener;
    }

    public StickersDrawingState getDrawingState() {
        return this.drawingState.copy();
    }

    /* loaded from: classes2.dex */
    public class RemoveArea {
        final int gravity;
        final int heigth;
        final int width;

        public RemoveArea(int gravity, int width, int heigth) {
            this.gravity = gravity;
            this.width = width;
            this.heigth = heigth;
        }

        public void get(Rect parent, Rect output) {
            Gravity.apply(this.gravity, this.width, this.heigth, parent, output);
        }
    }
}
