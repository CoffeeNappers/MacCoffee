package com.flask.colorpicker;

import android.graphics.Color;
/* loaded from: classes.dex */
public class ColorCircle {
    private int color;
    private float[] hsv = new float[3];
    private float[] hsvClone;
    private float x;
    private float y;

    public ColorCircle(float x, float y, float[] hsv) {
        set(x, y, hsv);
    }

    public double sqDist(float x, float y) {
        double dx = this.x - x;
        double dy = this.y - y;
        return (dx * dx) + (dy * dy);
    }

    public float getX() {
        return this.x;
    }

    public float getY() {
        return this.y;
    }

    public float[] getHsv() {
        return this.hsv;
    }

    public float[] getHsvWithLightness(float lightness) {
        if (this.hsvClone == null) {
            this.hsvClone = (float[]) this.hsv.clone();
        }
        this.hsvClone[0] = this.hsv[0];
        this.hsvClone[1] = this.hsv[1];
        this.hsvClone[2] = lightness;
        return this.hsvClone;
    }

    public void set(float x, float y, float[] hsv) {
        this.x = x;
        this.y = y;
        this.hsv[0] = hsv[0];
        this.hsv[1] = hsv[1];
        this.hsv[2] = hsv[2];
        this.color = Color.HSVToColor(this.hsv);
    }

    public int getColor() {
        return this.color;
    }
}
