package com.vk.attachpicker.widget;

import android.content.Context;
import android.content.res.TypedArray;
import android.util.AttributeSet;
import android.view.LayoutInflater;
import android.view.View;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.TextView;
import com.vk.core.util.Screen;
import com.vkontakte.android.R;
/* loaded from: classes2.dex */
public class EditorBottomPanel extends FrameLayout {
    private ImageView applyButton;
    private ImageView cancelButton;
    private FrameLayout centerViewContainer;
    private View divider;
    private TextView title;

    public EditorBottomPanel(Context context) {
        super(context);
        init(context, null);
    }

    public EditorBottomPanel(Context context, AttributeSet attrs) {
        super(context, attrs);
        init(context, attrs);
    }

    public EditorBottomPanel(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        init(context, attrs);
    }

    private void init(Context context, AttributeSet attrs) {
        View.OnClickListener onClickListener;
        onClickListener = EditorBottomPanel$$Lambda$1.instance;
        setOnClickListener(onClickListener);
        LayoutInflater.from(context).inflate(R.layout.picker_layout_editor_bottom_panel, this);
        this.title = (TextView) findViewById(R.id.tv_title);
        this.cancelButton = (ImageView) findViewById(R.id.iv_cancel);
        this.applyButton = (ImageView) findViewById(R.id.iv_apply);
        this.centerViewContainer = (FrameLayout) findViewById(R.id.fl_center_view_container);
        this.divider = findViewById(R.id.divider);
        if (attrs != null) {
            TypedArray a = context.getTheme().obtainStyledAttributes(attrs, R.styleable.EditorBottomPanel, 0, 0);
            try {
                int titleResId = a.getResourceId(0, 0);
                boolean applyVisible = a.getBoolean(1, true);
                if (titleResId != 0) {
                    this.title.setText(titleResId);
                }
                if (!applyVisible) {
                    this.applyButton.setVisibility(4);
                }
            } finally {
                a.recycle();
            }
        }
    }

    public static /* synthetic */ void lambda$init$0(View v) {
    }

    public void setDividerVisible(boolean visible) {
        this.divider.setVisibility(visible ? 0 : 8);
    }

    public void setLeftButtonResId(int resId) {
        this.cancelButton.setImageResource(resId);
    }

    public void setRightButtonResId(int resId) {
        this.applyButton.setImageResource(resId);
    }

    public void setLeftButtonTint(int color) {
        this.cancelButton.setColorFilter(color);
    }

    public void setRightButtonTint(int color) {
        this.applyButton.setColorFilter(color);
    }

    public void setCenterView(View v) {
        v.setMinimumWidth(Screen.dp(48));
        this.centerViewContainer.removeAllViews();
        FrameLayout.LayoutParams lp = new FrameLayout.LayoutParams(-2, -1);
        lp.gravity = 17;
        this.centerViewContainer.addView(v, lp);
    }

    public void setOnCancelClickListener(View.OnClickListener listener) {
        this.cancelButton.setOnClickListener(listener);
    }

    public void setOnApplyClickListener(View.OnClickListener listener) {
        this.applyButton.setOnClickListener(listener);
    }
}
