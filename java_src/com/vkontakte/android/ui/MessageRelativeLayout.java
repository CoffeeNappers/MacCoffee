package com.vkontakte.android.ui;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.RectF;
import android.util.AttributeSet;
import android.view.MotionEvent;
import android.widget.RelativeLayout;
import com.vkontakte.android.Global;
/* loaded from: classes3.dex */
public class MessageRelativeLayout extends RelativeLayout {
    public static final int STEP_DP = Global.scale(8.0f);
    public static final int WIDTH_DP = Global.scale(2.0f);
    private int level;
    private int levelLast;
    private int levelNext;
    private int mBackgroundResource;
    protected int originPaddingBottom;
    protected int originPaddingLeft;
    protected int originPaddingRight;
    protected int originPaddingTop;
    protected int paddingBottomD;
    protected int paddingTopD;
    private Paint paint;

    public MessageRelativeLayout(Context context) {
        super(context);
        this.mBackgroundResource = 0;
        this.originPaddingTop = 0;
        this.originPaddingBottom = 0;
        this.originPaddingLeft = 0;
        this.originPaddingRight = 0;
        this.paddingTopD = 0;
        this.paddingBottomD = 0;
        this.levelLast = 0;
        this.level = 0;
        this.levelNext = 0;
        this.paint = new Paint();
    }

    public MessageRelativeLayout(Context context, AttributeSet attrs) {
        super(context, attrs);
        this.mBackgroundResource = 0;
        this.originPaddingTop = 0;
        this.originPaddingBottom = 0;
        this.originPaddingLeft = 0;
        this.originPaddingRight = 0;
        this.paddingTopD = 0;
        this.paddingBottomD = 0;
        this.levelLast = 0;
        this.level = 0;
        this.levelNext = 0;
        this.paint = new Paint();
    }

    public MessageRelativeLayout(Context context, AttributeSet attrs, int defStyle) {
        super(context, attrs, defStyle);
        this.mBackgroundResource = 0;
        this.originPaddingTop = 0;
        this.originPaddingBottom = 0;
        this.originPaddingLeft = 0;
        this.originPaddingRight = 0;
        this.paddingTopD = 0;
        this.paddingBottomD = 0;
        this.levelLast = 0;
        this.level = 0;
        this.levelNext = 0;
        this.paint = new Paint();
    }

    @Override // android.view.ViewGroup, android.view.View
    public boolean dispatchTouchEvent(MotionEvent ev) {
        return isEnabled() && super.dispatchTouchEvent(ev);
    }

    @Override // android.view.View
    protected void onFinishInflate() {
        super.onFinishInflate();
        this.originPaddingTop = getPaddingTop();
        this.originPaddingBottom = getPaddingBottom();
        this.originPaddingLeft = getPaddingLeft();
        this.originPaddingRight = getPaddingRight();
        this.paint.setColor(1715958952);
        this.paint.setAntiAlias(true);
    }

    public void setPaddingD(int paddingTopD, int paddingBottomD) {
        this.paddingTopD = paddingTopD;
        this.paddingBottomD = paddingBottomD;
    }

    public void setLevel(int levelLast, int l, int levelNext) {
        this.levelLast = levelLast;
        this.level = l;
        this.levelNext = levelNext;
        super.setPadding(this.originPaddingLeft + (this.level * STEP_DP) + STEP_DP, this.originPaddingTop + this.paddingTopD, this.originPaddingRight, this.originPaddingBottom + this.paddingBottomD);
        requestLayout();
    }

    @Override // android.view.ViewGroup, android.view.View
    protected void dispatchDraw(Canvas canvas) {
        super.dispatchDraw(canvas);
        int i = 1;
        while (i < this.level + 1) {
            drawLine(canvas, (this.originPaddingLeft + (STEP_DP * i)) - WIDTH_DP, 0.0f, this.originPaddingLeft + (STEP_DP * i), canvas.getHeight(), this.paint, i > this.levelLast, i > this.levelNext, getPaddingTop(), getPaddingBottom());
            i++;
        }
    }

    private static void drawLine(Canvas c, float l, float t, float r, float b, Paint p, boolean top, boolean bottom, int paddingTop, int paddingBottom) {
        c.drawPath(updatePath(l, t + (top ? paddingTop : 0.0f), r, b - (bottom ? paddingBottom : 0.0f), null, top, bottom), p);
    }

    private static Path updatePath(float l, float t, float r, float b, Path path, boolean topCorners, boolean bottomCorners) {
        float cornerD = r - l;
        float cornerRadius = cornerD / 2.0f;
        if (path == null) {
            path = new Path();
        } else {
            path.reset();
        }
        if (topCorners) {
            RectF top = new RectF(l, t, r, t + cornerD);
            path.moveTo(l, t + cornerRadius);
            path.arcTo(top, 180.0f, 180.0f);
        } else {
            path.moveTo(l, t);
            path.lineTo(r, t);
        }
        if (bottomCorners) {
            RectF bottom = new RectF(l, b - cornerD, r, b);
            path.arcTo(bottom, 0.0f, 180.0f);
        } else {
            path.lineTo(r, b);
            path.lineTo(l, b);
        }
        path.close();
        return path;
    }
}
