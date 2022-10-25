package com.my.target.core.ui.views;

import android.content.Context;
import android.graphics.BitmapFactory;
import android.util.Base64;
import android.util.TypedValue;
import android.view.View;
import android.widget.RelativeLayout;
import android.widget.TextView;
import com.my.target.core.engines.b;
import com.my.target.core.ui.views.controls.IconButton;
/* loaded from: classes2.dex */
public class AdTitle extends RelativeLayout implements View.OnClickListener {
    private TextView a;
    private String b;
    private final View c;
    private b.a d;

    public void setLabel(String str) {
        this.b = str;
        this.a.setText(str);
    }

    public AdTitle(Context context) {
        super(context);
        this.b = "";
        this.a = new TextView(context);
        this.a.setTextColor(-1);
        this.a.setTypeface(null, 1);
        this.a.setTextSize(2, 20.0f);
        RelativeLayout.LayoutParams layoutParams = new RelativeLayout.LayoutParams(-2, -2);
        layoutParams.leftMargin = (int) TypedValue.applyDimension(1, 8.0f, getContext().getResources().getDisplayMetrics());
        layoutParams.addRule(15);
        layoutParams.addRule(1, 256);
        addView(this.a, layoutParams);
        setBackgroundColor(-7829368);
        RelativeLayout.LayoutParams layoutParams2 = new RelativeLayout.LayoutParams(-1, (int) (context.getResources().getDisplayMetrics().density + 0.5f));
        layoutParams2.addRule(12);
        this.c = new View(context);
        this.c.setBackgroundColor(-10066330);
        addView(this.c, layoutParams2);
        IconButton iconButton = new IconButton(context);
        byte[] decode = Base64.decode("iVBORw0KGgoAAAANSUhEUgAAAEAAAABACAYAAACqaXHeAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAARNJREFUeNrs2osNgCAMhGFK3H/lGhcwKC30jmOD/1PkEc3d28mjt8OHAAQgAAEIQAACEMCO4ScDeBWEXuDJ+0kAXm069EJz3pkBRuKMFaBs/AqA0vHZAOXjMwEg4rMAYOIzAKDiowHg4iMBIOOjAGDjIwCg42cB4ONnACji/wLQxD/jSojfer7/+iB6QjzU6CfHr7oPoAAwvQGkCF9XAWNbBv98A0binBmACmFmFaBAmF0G4REi9gHQCFEbIViEyJ0gJEL0VhgOIeMsAIWQdRiCQcg8DUIgZB+HyyOsuA8ojbDqQqQswsobIQtAggZ4izT2KfAWS/uLzAgC7S8yUR9GaoAmAAEIQAACEIAABLBz3AIMAMj9LYGJKTxCAAAAAElFTkSuQmCC", 0);
        BitmapFactory.Options options = new BitmapFactory.Options();
        options.inDensity = 420;
        options.inTargetDensity = context.getResources().getDisplayMetrics().densityDpi;
        iconButton.setBitmap(BitmapFactory.decodeByteArray(decode, 0, decode.length, options), false);
        iconButton.setId(256);
        iconButton.setOnClickListener(this);
        RelativeLayout.LayoutParams layoutParams3 = new RelativeLayout.LayoutParams(-2, -2);
        layoutParams3.leftMargin = (int) TypedValue.applyDimension(1, 5.0f, getContext().getResources().getDisplayMetrics());
        layoutParams3.addRule(15);
        layoutParams3.addRule(9);
        iconButton.setLayoutParams(layoutParams3);
        addView(iconButton);
    }

    public void setCloseClickListener(b.a aVar) {
        this.d = aVar;
    }

    public void setStripeColor(int i) {
        this.c.setBackgroundColor(i);
    }

    public void setMainColor(int i) {
        setBackgroundColor(i);
    }

    public void setTitleColor(int i) {
        this.a.setTextColor(i);
    }

    @Override // android.view.View.OnClickListener
    public void onClick(View view) {
        if (view.getId() == 256 && this.d != null) {
            this.d.onCloseClick();
        }
    }
}
