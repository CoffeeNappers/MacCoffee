package com.vk.core.util;

import android.view.MotionEvent;
import android.view.View;
/* loaded from: classes2.dex */
public abstract class OnClickCoordinatesListener implements View.OnTouchListener {
    private int downX = -1;
    private int downY = -1;
    private long downTime = -1;

    public abstract void onClick(View view, int i, int i2);

    @Override // android.view.View.OnTouchListener
    public boolean onTouch(View v, MotionEvent ev) {
        if (ev.getActionMasked() == 0 || ev.getActionMasked() == 5) {
            this.downX = getMotionEventX(ev);
            this.downY = getMotionEventY(ev);
            this.downTime = System.currentTimeMillis();
        } else if (ev.getActionMasked() == 3 || ev.getActionMasked() == 1 || ev.getActionMasked() == 6) {
            int upX = getMotionEventX(ev);
            int upY = getMotionEventY(ev);
            if (this.downX != -1 && this.downY != -1 && this.downTime != -1 && Math.abs(this.downX - upX) < Screen.dp(5) && Math.abs(this.downY - upY) < Screen.dp(5) && System.currentTimeMillis() - this.downTime < 300) {
                onClick(v, upX, upY);
            }
            this.downX = -1;
            this.downY = -1;
            this.downTime = -1L;
        }
        return true;
    }

    public int getMotionEventX(MotionEvent e) {
        return (int) e.getX();
    }

    public int getMotionEventY(MotionEvent e) {
        return (int) e.getY();
    }
}
