package com.vkontakte.android.ui.drawables;

import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.drawable.Drawable;
import com.vkontakte.android.data.GameRequest;
/* loaded from: classes3.dex */
public class RequestBgDrawable extends Drawable {
    public GameRequest lastRequest;
    private boolean isCanceled = false;
    private int color = -1;

    public void updateRequest(GameRequest gameRequest) {
        int newColor;
        this.lastRequest = gameRequest;
        if (!this.isCanceled && !gameRequest.fromDb && gameRequest.unread && gameRequest.type == 2) {
            newColor = -1315086;
        } else {
            newColor = -1;
        }
        if (newColor != this.color) {
            this.color = newColor;
            invalidateSelf();
        }
    }

    public void setCanceled() {
        this.isCanceled = true;
    }

    public int getCurrentColor() {
        return this.color;
    }

    public void setCurrentColor(int color) {
        this.color = color;
        invalidateSelf();
    }

    @Override // android.graphics.drawable.Drawable
    public void draw(Canvas canvas) {
        canvas.drawColor(this.color);
    }

    @Override // android.graphics.drawable.Drawable
    public void setAlpha(int alpha) {
    }

    @Override // android.graphics.drawable.Drawable
    public void setColorFilter(ColorFilter cf) {
    }

    @Override // android.graphics.drawable.Drawable
    public int getOpacity() {
        return 0;
    }
}
