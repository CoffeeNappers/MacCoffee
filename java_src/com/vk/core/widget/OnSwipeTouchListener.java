package com.vk.core.widget;

import android.content.Context;
import android.view.GestureDetector;
import android.view.MotionEvent;
import android.view.View;
import com.vk.core.util.Screen;
import com.vk.core.widget.OnTouchDownListener;
/* loaded from: classes2.dex */
public class OnSwipeTouchListener extends OnTouchDownListener {
    private static final int DEFAULT_SWIPE_THRESHOLD = Screen.dp(88);
    private final GestureDetector gestureDetector;
    private OnSwipeGestureListener gestureListener;
    private final int swipeThreshold;

    /* loaded from: classes2.dex */
    public interface OnSwipeGestureListener {
        void onSwipeBottom();

        void onSwipeLeft();

        void onSwipeRight();

        void onSwipeTop();
    }

    public OnSwipeTouchListener(Context ctx, OnTouchDownListener.DownUpListener downUpListener) {
        super(downUpListener);
        this.swipeThreshold = DEFAULT_SWIPE_THRESHOLD;
        this.gestureDetector = new GestureDetector(ctx, new GestureListener());
    }

    public OnSwipeTouchListener(Context ctx, int swipeThreshold, OnTouchDownListener.DownUpListener downUpListener) {
        super(downUpListener);
        this.swipeThreshold = swipeThreshold;
        this.gestureDetector = new GestureDetector(ctx, new GestureListener());
    }

    public void setGestureListener(OnSwipeGestureListener gestureListener) {
        this.gestureListener = gestureListener;
    }

    @Override // com.vk.core.widget.OnTouchDownListener, android.view.View.OnTouchListener
    public boolean onTouch(View v, MotionEvent event) {
        super.onTouch(v, event);
        this.gestureDetector.onTouchEvent(event);
        return true;
    }

    /* loaded from: classes2.dex */
    private final class GestureListener extends GestureDetector.SimpleOnGestureListener {
        private static final int SWIPE_VELOCITY_THRESHOLD = 100;

        private GestureListener() {
        }

        @Override // android.view.GestureDetector.SimpleOnGestureListener, android.view.GestureDetector.OnGestureListener
        public boolean onDown(MotionEvent e) {
            return true;
        }

        @Override // android.view.GestureDetector.SimpleOnGestureListener, android.view.GestureDetector.OnGestureListener
        public boolean onFling(MotionEvent e1, MotionEvent e2, float velocityX, float velocityY) {
            try {
                float diffY = e2.getY() - e1.getY();
                float diffX = e2.getX() - e1.getX();
                if (Math.abs(diffX) > Math.abs(diffY)) {
                    if (Math.abs(diffX) > OnSwipeTouchListener.this.swipeThreshold && Math.abs(velocityX) > 100.0f) {
                        if (diffX > 0.0f) {
                            OnSwipeTouchListener.this.onSwipeRight();
                        } else {
                            OnSwipeTouchListener.this.onSwipeLeft();
                        }
                    }
                } else if (Math.abs(diffY) > OnSwipeTouchListener.this.swipeThreshold && Math.abs(velocityY) > 100.0f) {
                    if (diffY > 0.0f) {
                        OnSwipeTouchListener.this.onSwipeBottom();
                    } else {
                        OnSwipeTouchListener.this.onSwipeTop();
                    }
                }
                return true;
            } catch (Exception exception) {
                exception.printStackTrace();
                return false;
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void onSwipeRight() {
        if (this.gestureListener != null) {
            this.gestureListener.onSwipeRight();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void onSwipeLeft() {
        if (this.gestureListener != null) {
            this.gestureListener.onSwipeLeft();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void onSwipeTop() {
        if (this.gestureListener != null) {
            this.gestureListener.onSwipeTop();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void onSwipeBottom() {
        if (this.gestureListener != null) {
            this.gestureListener.onSwipeBottom();
        }
    }
}
