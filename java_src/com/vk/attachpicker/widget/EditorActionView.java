package com.vk.attachpicker.widget;

import android.content.Context;
import android.content.res.TypedArray;
import android.util.AttributeSet;
import android.view.LayoutInflater;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.TextView;
import com.vkontakte.android.R;
/* loaded from: classes2.dex */
public class EditorActionView extends FrameLayout {
    private ImageView icon;
    private TextView title;

    public EditorActionView(Context context) {
        super(context);
        init(context, null);
    }

    public EditorActionView(Context context, AttributeSet attrs) {
        super(context, attrs);
        init(context, attrs);
    }

    public EditorActionView(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        init(context, attrs);
    }

    private void init(Context context, AttributeSet attrs) {
        setBackgroundResource(R.drawable.picker_white_ripple_unbounded);
        LayoutInflater.from(context).inflate(R.layout.picker_layout_editor_action_view, this);
        this.icon = (ImageView) findViewById(R.id.iv_icon);
        this.title = (TextView) findViewById(R.id.tv_title);
        if (attrs != null) {
            TypedArray a = context.getTheme().obtainStyledAttributes(attrs, R.styleable.EditorActionView, 0, 0);
            try {
                int iconResId = a.getResourceId(0, 0);
                int titleResId = a.getResourceId(1, 0);
                if (iconResId != 0) {
                    this.icon.setImageResource(iconResId);
                }
                if (titleResId != 0) {
                    this.title.setText(titleResId);
                }
            } finally {
                a.recycle();
            }
        }
    }
}
