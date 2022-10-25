package com.vkontakte.android.ui;

import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.util.AttributeSet;
import com.vkontakte.android.R;
/* loaded from: classes3.dex */
public class StateShadowTextView extends android.widget.TextView {
    private int[] currentState;
    private ShadowLayer shDisabled;
    private ShadowLayer shNormal;
    private ShadowLayer shPressed;
    private ShadowLayer shSelected;

    public StateShadowTextView(Context context) {
        super(context);
        this.currentState = null;
        init(context, null, 0);
    }

    public StateShadowTextView(Context context, AttributeSet attrs) {
        super(context, attrs);
        this.currentState = null;
        init(context, attrs, 0);
    }

    public StateShadowTextView(Context context, AttributeSet attrs, int defStyle) {
        super(context, attrs, defStyle);
        this.currentState = null;
        init(context, attrs, defStyle);
    }

    private void init(Context context, AttributeSet attrs, int defStyle) {
        if (attrs != null) {
            TypedArray a = context.obtainStyledAttributes(attrs, R.styleable.StateShadowTextView, defStyle, 0);
            if (a.hasValue(0)) {
                this.shNormal = new ShadowLayer(a.getString(0));
            }
            if (a.hasValue(1)) {
                this.shPressed = new ShadowLayer(a.getString(1));
            }
            if (a.hasValue(2)) {
                this.shSelected = new ShadowLayer(a.getString(2));
            }
            if (a.hasValue(3)) {
                this.shDisabled = new ShadowLayer(a.getString(3));
            }
        }
        if (this.shNormal == null) {
            this.shNormal = new ShadowLayer();
        }
        if (this.shPressed == null) {
            this.shPressed = this.shNormal;
        }
        if (this.shSelected == null) {
            this.shSelected = this.shPressed;
        }
        if (this.shDisabled == null) {
            this.shDisabled = this.shNormal;
        }
    }

    private void updateState(int[] newState) {
        ShadowLayer sl = getShadow(newState);
        if (sl != null) {
            setShadowLayer(sl.radius, sl.dx, sl.dy, sl.color);
            this.currentState = newState;
        }
    }

    private ShadowLayer getShadow(int[] ds) {
        if (!inArray(16842910, ds)) {
            return this.shDisabled;
        }
        if (inArray(16842919, ds)) {
            return this.shPressed;
        }
        if (inArray(16842913, ds)) {
            return this.shSelected;
        }
        return this.shNormal;
    }

    private boolean inArray(int i, int[] a) {
        for (int aa : a) {
            if (aa == i) {
                return true;
            }
        }
        return false;
    }

    @Override // android.widget.TextView, android.view.View
    public void onDraw(Canvas canvas) {
        if (!getDrawableState().equals(this.currentState)) {
            updateState(getDrawableState());
        }
        super.onDraw(canvas);
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes3.dex */
    public class ShadowLayer {
        int color;
        float dx;
        float dy;
        float radius;

        public ShadowLayer(String s) {
            String[] ss = s.split(",");
            this.color = (int) Long.parseLong(ss[0], 16);
            this.dx = Float.parseFloat(ss[1]);
            this.dy = Float.parseFloat(ss[2]);
            this.radius = Float.parseFloat(ss[3]);
            if (this.radius == 0.0f) {
                this.radius = 1.0E-7f;
            }
        }

        public ShadowLayer() {
        }
    }
}
