package com.vkontakte.android.ui;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.drawable.Drawable;
import android.util.AttributeSet;
import android.view.View;
import com.vkontakte.android.R;
import me.grishka.appkit.utils.V;
/* loaded from: classes3.dex */
public class DrawerHeaderBackgroundView extends View {
    private Drawable gradientDrawable;

    public DrawerHeaderBackgroundView(Context context) {
        super(context);
        init();
    }

    public DrawerHeaderBackgroundView(Context context, AttributeSet attrs) {
        super(context, attrs);
        init();
    }

    public DrawerHeaderBackgroundView(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        init();
    }

    public DrawerHeaderBackgroundView(Context context, AttributeSet attrs, int defStyleAttr, int defStyleRes) {
        super(context, attrs, defStyleAttr, defStyleRes);
        init();
    }

    private void init() {
        this.gradientDrawable = getResources().getDrawable(R.drawable.scrim_menu);
    }

    @Override // android.view.View
    protected void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
        int h = View.MeasureSpec.getSize(heightMeasureSpec);
        int size = View.MeasureSpec.getSize(widthMeasureSpec);
        if (h <= 0) {
            h = V.dp(180.0f);
        }
        setMeasuredDimension(size, h);
    }

    @Override // android.view.View
    protected void onDraw(Canvas canvas) {
        super.onDraw(canvas);
        this.gradientDrawable.setBounds(0, getHeight() - this.gradientDrawable.getIntrinsicHeight(), getWidth(), getHeight());
        this.gradientDrawable.draw(canvas);
    }
}
