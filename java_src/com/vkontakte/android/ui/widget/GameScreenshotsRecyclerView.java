package com.vkontakte.android.ui.widget;

import android.content.Context;
import android.util.AttributeSet;
import android.view.MotionEvent;
import android.view.ViewParent;
import me.grishka.appkit.views.UsableRecyclerView;
/* loaded from: classes3.dex */
public class GameScreenshotsRecyclerView extends UsableRecyclerView {
    protected boolean disallowed;
    protected float lastX;
    protected float lastY;

    public GameScreenshotsRecyclerView(Context context) {
        super(context);
        this.lastY = 0.0f;
        this.lastX = 0.0f;
        this.disallowed = false;
    }

    public GameScreenshotsRecyclerView(Context context, AttributeSet attrs) {
        super(context, attrs);
        this.lastY = 0.0f;
        this.lastX = 0.0f;
        this.disallowed = false;
    }

    public GameScreenshotsRecyclerView(Context context, AttributeSet attrs, int defStyle) {
        super(context, attrs, defStyle);
        this.lastY = 0.0f;
        this.lastX = 0.0f;
        this.disallowed = false;
    }

    protected void requestDisallowInterceptTouchEventPared(boolean b) {
        if (this.disallowed != b) {
            for (ViewParent viewParent = getParent(); viewParent != null; viewParent = viewParent.getParent()) {
                viewParent.requestDisallowInterceptTouchEvent(b);
            }
            this.disallowed = b;
        }
    }

    @Override // android.support.v7.widget.RecyclerView, android.view.ViewGroup
    public boolean onInterceptTouchEvent(MotionEvent e) {
        boolean retValue = super.onInterceptTouchEvent(e);
        switch (e.getAction()) {
            case 0:
                this.lastY = e.getY();
                this.lastX = e.getX();
                requestDisallowInterceptTouchEventPared(true);
                break;
            case 1:
            case 3:
                if (!retValue) {
                    requestDisallowInterceptTouchEventPared(false);
                    break;
                }
                break;
            case 2:
                float dx = Math.abs(this.lastX - e.getX());
                float dy = Math.abs(this.lastY - e.getY());
                if (dx < dy) {
                    requestDisallowInterceptTouchEventPared(false);
                }
                this.lastY = e.getY();
                this.lastX = e.getX();
                break;
        }
        return retValue;
    }

    @Override // me.grishka.appkit.views.UsableRecyclerView, android.support.v7.widget.RecyclerView, android.view.View
    public boolean onTouchEvent(MotionEvent e) {
        switch (e.getAction()) {
            case 0:
                this.lastY = e.getY();
                this.lastX = e.getX();
                requestDisallowInterceptTouchEventPared(true);
                break;
            case 1:
            case 3:
                requestDisallowInterceptTouchEventPared(false);
                break;
            case 2:
                float dx = Math.abs(this.lastX - e.getX());
                float dy = Math.abs(this.lastY - e.getY());
                if (dx < dy) {
                    requestDisallowInterceptTouchEventPared(false);
                } else {
                    requestDisallowInterceptTouchEventPared(true);
                }
                this.lastY = e.getY();
                this.lastX = e.getX();
                break;
        }
        return super.onTouchEvent(e);
    }
}
