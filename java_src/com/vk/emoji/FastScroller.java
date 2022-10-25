package com.vk.emoji;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.RectF;
import android.support.annotation.Nullable;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.util.AttributeSet;
import android.util.Property;
import android.view.MotionEvent;
import android.view.View;
/* loaded from: classes2.dex */
public class FastScroller extends View {
    private static final int DEFAULT_HANDLE_COLOR = -11433012;
    private static final int DEFAULT_TRACK_COLOR = -3880756;
    private static final int HANDLE_HEIGHT_DP = 32;
    private static final float HANDLE_RADIUS_DP = 1.5f;
    private static final int HANDLE_WIDTH_DP = 3;
    public static final Property<FastScroller, Integer> PADDING_BOTTOM = new Property<FastScroller, Integer>(Integer.class, "paddingBottom") { // from class: com.vk.emoji.FastScroller.1
        @Override // android.util.Property
        public void set(FastScroller object, Integer value) {
            object.setPaddingBottom(value.intValue());
        }

        @Override // android.util.Property
        public Integer get(FastScroller object) {
            return Integer.valueOf(object.getPaddingBottom());
        }
    };
    public static final Property<FastScroller, Integer> PADDING_TOP = new Property<FastScroller, Integer>(Integer.class, "paddingTop") { // from class: com.vk.emoji.FastScroller.2
        @Override // android.util.Property
        public void set(FastScroller object, Integer value) {
            object.setPaddingTop(value.intValue());
        }

        @Override // android.util.Property
        public Integer get(FastScroller object) {
            return Integer.valueOf(object.getPaddingTop());
        }
    };
    private static final int TRACK_WIDTH_DP = 1;
    private static final int VIEW_PADDING_DP = 8;
    private static final int VIEW_WIDTH_DP = 20;
    private int baseViewPadding;
    private float downProgress;
    private int downY;
    private final RectF drawRect;
    private boolean gestureInProgress;
    private int handleColor;
    private int handleHeight;
    private final Paint handlePaint;
    private int handleRadius;
    private int handleWidth;
    private float progress;
    private RecyclerView recyclerView;
    private final RecyclerView.OnScrollListener scrollListener;
    private ScrollPositionProvider scrollPositionProvider;
    private int trackColor;
    private final Paint trackPaint;
    private int trackWidth;

    public FastScroller(Context context) {
        super(context);
        this.handlePaint = new Paint(1);
        this.trackPaint = new Paint(1);
        this.drawRect = new RectF();
        this.handleColor = DEFAULT_HANDLE_COLOR;
        this.trackColor = DEFAULT_TRACK_COLOR;
        this.scrollListener = new RecyclerView.OnScrollListener() { // from class: com.vk.emoji.FastScroller.3
            @Override // android.support.v7.widget.RecyclerView.OnScrollListener
            public void onScrolled(RecyclerView recyclerView, int dx, int dy) {
                FastScroller.this.onScrolled(recyclerView, dx, dy);
            }
        };
        this.downProgress = -1.0f;
        this.downY = -1;
        this.gestureInProgress = false;
        init(context);
    }

    public FastScroller(Context context, @Nullable AttributeSet attrs) {
        super(context, attrs);
        this.handlePaint = new Paint(1);
        this.trackPaint = new Paint(1);
        this.drawRect = new RectF();
        this.handleColor = DEFAULT_HANDLE_COLOR;
        this.trackColor = DEFAULT_TRACK_COLOR;
        this.scrollListener = new RecyclerView.OnScrollListener() { // from class: com.vk.emoji.FastScroller.3
            @Override // android.support.v7.widget.RecyclerView.OnScrollListener
            public void onScrolled(RecyclerView recyclerView, int dx, int dy) {
                FastScroller.this.onScrolled(recyclerView, dx, dy);
            }
        };
        this.downProgress = -1.0f;
        this.downY = -1;
        this.gestureInProgress = false;
        init(context);
    }

    public FastScroller(Context context, @Nullable AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        this.handlePaint = new Paint(1);
        this.trackPaint = new Paint(1);
        this.drawRect = new RectF();
        this.handleColor = DEFAULT_HANDLE_COLOR;
        this.trackColor = DEFAULT_TRACK_COLOR;
        this.scrollListener = new RecyclerView.OnScrollListener() { // from class: com.vk.emoji.FastScroller.3
            @Override // android.support.v7.widget.RecyclerView.OnScrollListener
            public void onScrolled(RecyclerView recyclerView, int dx, int dy) {
                FastScroller.this.onScrolled(recyclerView, dx, dy);
            }
        };
        this.downProgress = -1.0f;
        this.downY = -1;
        this.gestureInProgress = false;
        init(context);
    }

    private void init(Context context) {
        setTrackColor(DEFAULT_TRACK_COLOR);
        setHandleColor(DEFAULT_HANDLE_COLOR);
        this.progress = 0.0f;
        this.trackPaint.setStyle(Paint.Style.FILL);
        this.handlePaint.setStyle(Paint.Style.FILL);
        this.baseViewPadding = (int) Utils.convertDpToPixel(8.0f, context);
        this.trackWidth = (int) Utils.convertDpToPixel(1.0f, context);
        this.handleWidth = (int) Utils.convertDpToPixel(3.0f, context);
        this.handleHeight = (int) Utils.convertDpToPixel(32.0f, context);
        this.handleRadius = (int) Utils.convertDpToPixel(HANDLE_RADIUS_DP, context);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void onScrolled(RecyclerView recyclerView, int dx, int dy) {
        if (!this.gestureInProgress) {
            setProgress(calculateScrollProgress(recyclerView));
        }
    }

    private int getHandlePathLength() {
        int handleHalfHeight = this.handleHeight / 2;
        int topHandlePosition = this.baseViewPadding + getPaddingTop() + handleHalfHeight;
        int bottomHandlePosition = ((getMeasuredHeight() - this.baseViewPadding) - getPaddingBottom()) - handleHalfHeight;
        return bottomHandlePosition - topHandlePosition;
    }

    @Override // android.view.View
    protected void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
        super.onMeasure(View.MeasureSpec.makeMeasureSpec((int) Utils.convertDpToPixel(20.0f, getContext()), 1073741824), heightMeasureSpec);
    }

    @Override // android.view.View
    protected void onDraw(Canvas canvas) {
        super.onDraw(canvas);
        int cx = canvas.getWidth() / 2;
        this.drawRect.set(cx - (this.trackWidth / 2), this.baseViewPadding + getPaddingTop(), (this.trackWidth / 2) + cx, (canvas.getHeight() - this.baseViewPadding) - getPaddingBottom());
        canvas.drawRect(this.drawRect, this.trackPaint);
        int handleHalfHeight = this.handleHeight / 2;
        int topHandlePosition = this.baseViewPadding + getPaddingTop() + handleHalfHeight;
        int handlePathLength = getHandlePathLength();
        int handleCenterY = (int) (topHandlePosition + (handlePathLength * this.progress));
        this.drawRect.set(cx - (this.handleWidth / 2), handleCenterY - handleHalfHeight, (this.handleWidth / 2) + cx, handleCenterY + handleHalfHeight);
        canvas.drawRoundRect(this.drawRect, this.handleRadius, this.handleRadius, this.handlePaint);
    }

    @Override // android.view.View
    public boolean onTouchEvent(MotionEvent event) {
        int action = event.getAction() & 255;
        int y = (int) event.getY();
        if (action == 0 || action == 5) {
            this.downProgress = this.progress;
            this.downY = y;
            this.gestureInProgress = true;
        } else if (action == 1 || action == 3) {
            this.downProgress = -1.0f;
            this.downY = -1;
            this.gestureInProgress = false;
            onScrolled(this.recyclerView, 0, 0);
        } else if (action == 2) {
            if (this.recyclerView != null) {
                this.recyclerView.stopScroll();
            }
            float handlePathLength = getHandlePathLength();
            float deltaY = y - this.downY;
            float deltaProgress = deltaY / handlePathLength;
            setProgress(this.downProgress + deltaProgress);
            if (this.scrollPositionProvider != null && (this.recyclerView.getLayoutManager() instanceof LinearLayoutManager)) {
                ((LinearLayoutManager) this.recyclerView.getLayoutManager()).scrollToPositionWithOffset(this.scrollPositionProvider.getScrollPosition(getProgress()), 0);
            }
        }
        return true;
    }

    public void setRecyclerView(RecyclerView recyclerView, ScrollPositionProvider scrollPositionProvider) {
        if (this.recyclerView != null) {
            this.recyclerView.removeOnScrollListener(this.scrollListener);
        }
        this.recyclerView = recyclerView;
        this.recyclerView.addOnScrollListener(this.scrollListener);
        this.scrollPositionProvider = scrollPositionProvider;
    }

    public int getHandleColor() {
        return this.handleColor;
    }

    public void setHandleColor(int handleColor) {
        this.handleColor = handleColor;
        this.handlePaint.setColor(handleColor);
        invalidate();
    }

    public int getTrackColor() {
        return this.trackColor;
    }

    public void setTrackColor(int trackColor) {
        this.trackColor = trackColor;
        this.trackPaint.setColor(trackColor);
        invalidate();
    }

    public float getProgress() {
        return this.progress;
    }

    public void setProgress(float progress) {
        this.progress = Math.min(1.0f, Math.max(0.0f, progress));
        invalidate();
    }

    public void setPaddingBottom(int paddingBottom) {
        setPadding(getPaddingLeft(), getPaddingTop(), getPaddingRight(), paddingBottom);
        invalidate();
    }

    public void setPaddingTop(int paddingTop) {
        setPadding(getPaddingLeft(), paddingTop, getPaddingRight(), getPaddingBottom());
        invalidate();
    }

    private static float calculateScrollProgress(RecyclerView recyclerView) {
        float offset = recyclerView.computeVerticalScrollOffset();
        float range = recyclerView.computeVerticalScrollRange() - recyclerView.computeVerticalScrollExtent();
        return offset / range;
    }
}
