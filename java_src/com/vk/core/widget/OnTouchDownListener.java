package com.vk.core.widget;

import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import android.support.v4.view.MotionEventCompat;
import android.view.MotionEvent;
import android.view.View;
import com.vk.core.util.Screen;
/* loaded from: classes2.dex */
public class OnTouchDownListener implements View.OnTouchListener {
    private static final long CLICK_TIME = 200;
    private static final long DELAY = 10;
    private static final int DOWN_MESSAGE = 0;
    private static final float MAX_DELTA = Screen.dp(24);
    private long downTime;
    private final DownUpListener downUpListener;
    private float downX;
    private float downY;
    private final Handler handler = new Handler(Looper.getMainLooper()) { // from class: com.vk.core.widget.OnTouchDownListener.1
        @Override // android.os.Handler
        public void handleMessage(Message msg) {
            if (msg.what == 0 && OnTouchDownListener.this.downUpListener != null) {
                OnTouchDownListener.this.downUpListener.onDown(msg.arg1, msg.arg2);
            }
        }
    };

    /* loaded from: classes2.dex */
    public interface DownUpListener {
        void onClick(int i, int i2);

        void onDown(int i, int i2);

        void onUp(int i, int i2);
    }

    public OnTouchDownListener(DownUpListener downUpListener) {
        this.downUpListener = downUpListener;
    }

    @Override // android.view.View.OnTouchListener
    public boolean onTouch(View v, MotionEvent event) {
        int action = MotionEventCompat.getActionMasked(event);
        if (action == 0) {
            this.downX = event.getX();
            this.downY = event.getY();
            this.downTime = System.currentTimeMillis();
            this.handler.removeMessages(0);
            this.handler.sendMessageDelayed(Message.obtain(this.handler, 0, (int) event.getX(), (int) event.getY()), DELAY);
        } else if (action == 2) {
            if (Math.abs(this.downX - event.getX()) > MAX_DELTA || Math.abs(this.downY - event.getY()) > MAX_DELTA) {
                this.handler.removeMessages(0);
            }
        } else if (1 == action || 3 == action) {
            this.handler.removeMessages(0);
            if (this.downUpListener != null) {
                if (System.currentTimeMillis() - this.downTime < 200 && Math.abs(this.downX - event.getX()) < MAX_DELTA && Math.abs(this.downY - event.getY()) < MAX_DELTA) {
                    this.downUpListener.onClick((int) event.getX(), (int) event.getY());
                }
                this.downUpListener.onUp((int) event.getX(), (int) event.getY());
            }
        }
        return true;
    }
}
