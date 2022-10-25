package com.my.target.core.ui.views.controls;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.net.Uri;
import android.view.View;
import com.my.target.Tracer;
/* loaded from: classes2.dex */
public class AdInfoButton extends View implements View.OnClickListener {
    private static String a = "#99333333";
    private static String b = "debug";
    private Paint c;
    private float d;
    private float e;
    private float f;
    private float g;
    private String h;
    private int i;

    public void setUrl(String str) {
        this.h = str;
    }

    public AdInfoButton(Context context) {
        super(context);
        this.c = new Paint();
        setBackgroundColor(Color.parseColor(a));
        float f = context.getResources().getDisplayMetrics().density;
        this.i = (int) ((60.0f * f) + 0.5f);
        this.c.setTextSize((int) ((f * 10.0f) + 0.5f));
        this.c.setColor(-1);
        this.c.setAntiAlias(true);
        this.d = this.c.measureText(b);
        this.e = this.c.getTextSize();
        setOnClickListener(this);
    }

    @Override // android.view.View
    protected void onMeasure(int i, int i2) {
        int mode = View.MeasureSpec.getMode(i);
        int mode2 = View.MeasureSpec.getMode(i2);
        int size = View.MeasureSpec.getSize(i);
        int size2 = View.MeasureSpec.getSize(i2);
        if (mode == Integer.MIN_VALUE && size > this.i) {
            size = this.i;
        }
        if (mode2 == Integer.MIN_VALUE && size2 > this.i) {
            size2 = this.i;
        }
        setMeasuredDimension(size, size2);
        this.f = (size - this.d) / 2.0f;
        this.g = (size2 + this.e) / 2.0f;
    }

    @Override // android.view.View
    protected void onDraw(Canvas canvas) {
        super.onDraw(canvas);
        canvas.drawText(b, this.f, this.g, this.c);
    }

    @Override // android.view.View.OnClickListener
    public void onClick(View view) {
        if (this.h != null) {
            try {
                Intent intent = new Intent("android.intent.action.VIEW", Uri.parse(this.h));
                if (!(getContext() instanceof Activity)) {
                    intent.addFlags(268435456);
                }
                getContext().startActivity(intent);
            } catch (Throwable th) {
                Tracer.d(th.getMessage());
            }
        }
    }
}
