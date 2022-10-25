package com.vkontakte.android.ui.widget;

import android.annotation.TargetApi;
import android.content.Context;
import android.util.AttributeSet;
import android.view.View;
import android.view.ViewGroup;
import com.vkontakte.android.Global;
import com.vkontakte.android.R;
/* loaded from: classes3.dex */
public class AppsItemLayout extends ViewGroup {
    private View bubble;
    private View icon;
    private View iconInstant;
    private View subtitle;
    private View title;

    public AppsItemLayout(Context context) {
        super(context);
    }

    public AppsItemLayout(Context context, AttributeSet attrs) {
        super(context, attrs);
    }

    public AppsItemLayout(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
    }

    @TargetApi(21)
    public AppsItemLayout(Context context, AttributeSet attrs, int defStyleAttr, int defStyleRes) {
        super(context, attrs, defStyleAttr, defStyleRes);
    }

    @Override // android.view.View
    protected void onFinishInflate() {
        super.onFinishInflate();
        this.icon = findViewById(R.id.app_icon);
        this.title = findViewById(R.id.app_title);
        this.subtitle = findViewById(R.id.app_subtitle);
        this.bubble = findViewById(R.id.app_bubble);
        this.iconInstant = findViewById(R.id.app_img_instant);
    }

    @Override // android.view.ViewGroup, android.view.View
    protected void onLayout(boolean changed, int l, int t, int r, int b) {
        layoutChild(this.icon, getPaddingLeft(), getPaddingTop());
        layoutChild(this.iconInstant, getPaddingLeft() - Global.scale(6.0f), getPaddingTop() - Global.scale(6.0f));
        int heightTopBlock = Math.max(this.title.getMeasuredHeight(), this.bubble.getMeasuredHeight());
        int dy = ((this.icon.getMeasuredHeight() - heightTopBlock) - this.subtitle.getMeasuredHeight()) / 2;
        layoutChild(this.title, getPaddingLeft() + this.icon.getMeasuredWidth(), getPaddingTop() + ((heightTopBlock - this.title.getMeasuredHeight()) / 2) + dy);
        layoutChild(this.bubble, getPaddingLeft() + this.icon.getMeasuredWidth() + this.title.getMeasuredWidth(), getPaddingTop() + ((heightTopBlock - this.bubble.getMeasuredHeight()) / 2) + dy);
        layoutChild(this.subtitle, getPaddingLeft() + this.icon.getMeasuredWidth(), getPaddingTop() + heightTopBlock + dy);
    }

    protected static void layoutChild(View v, int x, int y) {
        v.layout(x, y, v.getMeasuredWidth() + x, v.getMeasuredHeight() + y);
    }

    @Override // android.view.View
    protected void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
        measureChild(this.icon, widthMeasureSpec, heightMeasureSpec);
        measureChild(this.iconInstant, widthMeasureSpec, heightMeasureSpec);
        measureChild(this.bubble, widthMeasureSpec, heightMeasureSpec);
        int width = View.MeasureSpec.getSize(widthMeasureSpec);
        int height = this.icon.getMeasuredHeight() + getPaddingTop() + getPaddingBottom();
        int widthText = ((width - getPaddingLeft()) - getPaddingRight()) - this.icon.getMeasuredWidth();
        int bubbleWidth = this.bubble.getVisibility() == 8 ? 0 : this.bubble.getMeasuredWidth();
        this.title.measure(View.MeasureSpec.makeMeasureSpec(widthText - bubbleWidth, Integer.MIN_VALUE), this.title.getLayoutParams().height);
        this.subtitle.measure(View.MeasureSpec.makeMeasureSpec(widthText, 1073741824), this.subtitle.getLayoutParams().height);
        setMeasuredDimension(width, height);
    }
}
