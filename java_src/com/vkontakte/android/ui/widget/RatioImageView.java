package com.vkontakte.android.ui.widget;

import android.annotation.TargetApi;
import android.content.Context;
import android.content.res.TypedArray;
import android.util.AttributeSet;
import android.view.View;
import android.widget.ImageView;
import com.vkontakte.android.R;
/* loaded from: classes3.dex */
public class RatioImageView extends ImageView {
    public static final int HORIZONTAL = 0;
    public static final int VERTICAL = 1;
    private float imageRatio;
    private int orientation;

    public RatioImageView(Context context) {
        super(context);
        this.orientation = 1;
        this.imageRatio = 0.0f;
    }

    public RatioImageView(Context context, AttributeSet attrs) {
        super(context, attrs);
        this.orientation = 1;
        this.imageRatio = 0.0f;
        init(attrs);
    }

    public RatioImageView(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        this.orientation = 1;
        this.imageRatio = 0.0f;
        init(attrs);
    }

    @TargetApi(21)
    public RatioImageView(Context context, AttributeSet attrs, int defStyleAttr, int defStyleRes) {
        super(context, attrs, defStyleAttr, defStyleRes);
        this.orientation = 1;
        this.imageRatio = 0.0f;
        init(attrs);
    }

    private void init(AttributeSet attrs) {
        TypedArray a = getContext().obtainStyledAttributes(attrs, R.styleable.RatioImageView);
        if (a != null) {
            this.imageRatio = a.getFloat(1, this.imageRatio);
            this.orientation = a.getInt(0, this.orientation);
            a.recycle();
        }
    }

    public void setImageRatio(float imageRatio) {
        if (this.imageRatio != imageRatio) {
            this.imageRatio = imageRatio;
            requestLayout();
        }
    }

    public void setOrientation(int orientation) {
        switch (orientation) {
            case 0:
            case 1:
                this.orientation = orientation;
                requestLayout();
                return;
            default:
                return;
        }
    }

    @Override // android.widget.ImageView, android.view.View
    protected void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
        if (this.imageRatio != 0.0f) {
            switch (this.orientation) {
                case 0:
                    int w = View.MeasureSpec.getSize(widthMeasureSpec);
                    heightMeasureSpec = View.MeasureSpec.makeMeasureSpec((int) (w * this.imageRatio), 1073741824);
                    break;
                case 1:
                    int h = View.MeasureSpec.getSize(heightMeasureSpec);
                    widthMeasureSpec = View.MeasureSpec.makeMeasureSpec((int) (h * this.imageRatio), 1073741824);
                    break;
            }
        }
        super.onMeasure(widthMeasureSpec, heightMeasureSpec);
    }
}
