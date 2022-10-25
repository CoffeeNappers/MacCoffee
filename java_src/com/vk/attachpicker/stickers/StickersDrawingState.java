package com.vk.attachpicker.stickers;

import android.graphics.Canvas;
import android.graphics.Matrix;
import java.util.ArrayList;
/* loaded from: classes2.dex */
public class StickersDrawingState {
    private final ArrayList<Sticker> stickers = new ArrayList<>();

    public void clear() {
        this.stickers.clear();
    }

    public void addSticker(Sticker sticker) {
        this.stickers.add(sticker);
    }

    public void removeSticker(Sticker sticker) {
        this.stickers.remove(sticker);
    }

    public void handleCrop(Matrix before, Matrix after) {
        for (int i = 0; i < this.stickers.size(); i++) {
            this.stickers.get(i).handleCrop(before, after);
        }
    }

    public void handleSizeChange(int w, int h) {
        for (int i = 0; i < this.stickers.size(); i++) {
            this.stickers.get(i).setCanvasDimension(w, h);
        }
    }

    public void postTranslate(float dx, float dy) {
        for (int i = 0; i < this.stickers.size(); i++) {
            this.stickers.get(i).getMatrix().postTranslate(dx, dy);
        }
    }

    public void postScale(float scale, float focalX, float focalY) {
        for (int i = 0; i < this.stickers.size(); i++) {
            this.stickers.get(i).getMatrix().postScale(scale, scale, focalX, focalY);
        }
    }

    public void draw(Canvas canvas) {
        for (int i = 0; i < this.stickers.size(); i++) {
            Sticker s = this.stickers.get(i);
            if (!s.isInEditMode()) {
                s.draw(canvas);
            }
        }
    }

    public int size() {
        return this.stickers.size();
    }

    public Sticker get(int pos) {
        return this.stickers.get(pos);
    }

    public ArrayList<Sticker> getStickers() {
        return this.stickers;
    }

    public StickersDrawingState copy() {
        StickersDrawingState drawingState = new StickersDrawingState();
        for (int i = 0; i < this.stickers.size(); i++) {
            drawingState.stickers.add(this.stickers.get(i).copy());
        }
        return drawingState;
    }
}
