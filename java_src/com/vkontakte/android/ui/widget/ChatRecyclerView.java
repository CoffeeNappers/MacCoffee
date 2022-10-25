package com.vkontakte.android.ui.widget;

import android.content.Context;
import android.graphics.Canvas;
import android.support.annotation.Nullable;
import android.util.AttributeSet;
import android.view.GestureDetector;
import android.view.MotionEvent;
import com.vkontakte.android.R;
import com.vkontakte.android.VKApplication;
/* loaded from: classes3.dex */
public class ChatRecyclerView extends VKRecyclerView {
    int dx;
    @Nullable
    private GestureDetector gestureDetector;
    private boolean ret;

    public ChatRecyclerView(Context context) {
        super(context);
        this.ret = false;
        this.dx = VKApplication.context.getResources().getDimensionPixelSize(R.dimen.message_time);
    }

    public ChatRecyclerView(Context context, AttributeSet attrs) {
        super(context, attrs);
        this.ret = false;
        this.dx = VKApplication.context.getResources().getDimensionPixelSize(R.dimen.message_time);
    }

    public ChatRecyclerView(Context context, AttributeSet attrs, int defStyle) {
        super(context, attrs, defStyle);
        this.ret = false;
        this.dx = VKApplication.context.getResources().getDimensionPixelSize(R.dimen.message_time);
    }

    public void setGestureDetector(@Nullable GestureDetector gestureDetector) {
        this.gestureDetector = gestureDetector;
    }

    @Override // android.support.v7.widget.RecyclerView, android.view.ViewGroup
    public boolean onInterceptTouchEvent(MotionEvent e) {
        if (this.gestureDetector == null) {
            return super.onInterceptTouchEvent(e);
        }
        boolean onTouchEvent = this.gestureDetector.onTouchEvent(e);
        this.ret = onTouchEvent;
        return onTouchEvent || super.onInterceptTouchEvent(e);
    }

    @Override // me.grishka.appkit.views.UsableRecyclerView, android.support.v7.widget.RecyclerView, android.view.View
    public boolean onTouchEvent(MotionEvent e) {
        if (this.gestureDetector == null) {
            return super.onTouchEvent(e);
        }
        return this.ret || super.onTouchEvent(e);
    }

    @Override // android.view.View
    public void onDrawForeground(Canvas canvas) {
        canvas.save();
        canvas.translate(-this.dx, 0.0f);
        super.onDrawForeground(canvas);
        canvas.restore();
    }
}
