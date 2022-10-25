package com.vk.attachpicker.stickers;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Path;
import android.graphics.RectF;
import android.os.Build;
import android.util.AttributeSet;
import android.widget.FrameLayout;
import com.vk.core.util.Screen;
/* loaded from: classes2.dex */
public class StickersTabStripContainer extends FrameLayout {
    private final int clipRadius;
    private final Path clippingPath;
    private final RectF clippingRect;

    public StickersTabStripContainer(Context context) {
        super(context);
        this.clippingPath = new Path();
        this.clippingRect = new RectF();
        this.clipRadius = Screen.dp(48) / 2;
        init();
    }

    public StickersTabStripContainer(Context context, AttributeSet attrs) {
        super(context, attrs);
        this.clippingPath = new Path();
        this.clippingRect = new RectF();
        this.clipRadius = Screen.dp(48) / 2;
        init();
    }

    public StickersTabStripContainer(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        this.clippingPath = new Path();
        this.clippingRect = new RectF();
        this.clipRadius = Screen.dp(48) / 2;
        init();
    }

    private void init() {
        setWillNotDraw(false);
        setPadding(Screen.dp(4), Screen.dp(4), Screen.dp(4), 0);
        if (Build.VERSION.SDK_INT < 18) {
            setLayerType(1, null);
        }
    }

    @Override // android.view.View
    protected void onSizeChanged(int w, int h, int oldw, int oldh) {
        super.onSizeChanged(w, h, oldw, oldh);
        this.clippingPath.rewind();
        this.clippingRect.set(getPaddingLeft(), (h / 2) - this.clipRadius, w - getPaddingRight(), (h / 2) + this.clipRadius);
        this.clippingPath.addRoundRect(this.clippingRect, this.clipRadius, this.clipRadius, Path.Direction.CW);
    }

    @Override // android.view.View
    public void draw(Canvas canvas) {
        canvas.clipPath(this.clippingPath);
        super.draw(canvas);
    }
}
