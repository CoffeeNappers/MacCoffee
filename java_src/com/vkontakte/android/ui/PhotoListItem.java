package com.vkontakte.android.ui;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.support.v4.view.ViewCompat;
import android.util.AttributeSet;
import android.view.animation.AlphaAnimation;
import android.widget.FrameLayout;
import android.widget.ImageView;
/* loaded from: classes3.dex */
public class PhotoListItem extends FrameLayout {
    private long animStartTime;
    private Paint blackPaint;
    private int image;
    private ImageView img;
    private int item;
    private boolean reset;

    public PhotoListItem(Context context) {
        super(context);
        this.animStartTime = 0L;
        this.reset = true;
        this.blackPaint = new Paint();
        init();
    }

    public PhotoListItem(Context context, AttributeSet attrs) {
        super(context, attrs);
        this.animStartTime = 0L;
        this.reset = true;
        this.blackPaint = new Paint();
        init();
    }

    public PhotoListItem(Context context, AttributeSet attrs, int defStyle) {
        super(context, attrs, defStyle);
        this.animStartTime = 0L;
        this.reset = true;
        this.blackPaint = new Paint();
        init();
    }

    private void init() {
        setBackgroundColor(-14540254);
        this.img = new ImageView(getContext());
        this.img.setBackgroundColor(ViewCompat.MEASURED_STATE_MASK);
        this.img.setVisibility(4);
        addView(this.img);
        this.blackPaint.setColor(ViewCompat.MEASURED_STATE_MASK);
        setWillNotDraw(false);
    }

    public void setBitmapAnimated(Bitmap bmp) {
        this.img.setImageBitmap(bmp);
        this.img.setVisibility(0);
        this.img.clearAnimation();
        if (this.reset && getWidth() > 0) {
            this.animStartTime = System.currentTimeMillis();
            AlphaAnimation aa = new AlphaAnimation(0.0f, 1.0f);
            aa.setDuration(200L);
            this.img.startAnimation(aa);
            postDelayed(new Runnable() { // from class: com.vkontakte.android.ui.PhotoListItem.1
                @Override // java.lang.Runnable
                public void run() {
                    PhotoListItem.this.img.clearAnimation();
                }
            }, 200L);
            this.reset = false;
        }
    }

    public void setBitmap(Bitmap bmp) {
        this.img.clearAnimation();
        this.img.setVisibility(0);
        this.img.setImageBitmap(bmp);
        this.reset = false;
    }

    public Bitmap getBitmap() {
        Drawable d = this.img.getDrawable();
        if (d == null || !(d instanceof BitmapDrawable)) {
            return null;
        }
        return ((BitmapDrawable) d).getBitmap();
    }

    public void reset() {
        this.reset = true;
        this.img.clearAnimation();
        this.img.setImageBitmap(null);
        this.img.setVisibility(4);
    }

    @Override // android.view.View
    public void onDraw(Canvas c) {
        super.onDraw(c);
        if (getPaddingTop() > 0) {
            c.drawRect(0.0f, 0.0f, getWidth(), getPaddingTop(), this.blackPaint);
        }
    }
}
