package com.vk.attachpicker.widget;

import android.content.Context;
import android.util.AttributeSet;
import android.view.LayoutInflater;
import android.widget.FrameLayout;
import android.widget.TextView;
import com.vkontakte.android.R;
/* loaded from: classes2.dex */
public class AttachCounterView extends FrameLayout {
    private TextView counterView;

    public AttachCounterView(Context context) {
        super(context);
        init();
    }

    public AttachCounterView(Context context, AttributeSet attrs) {
        super(context, attrs);
        init();
    }

    public AttachCounterView(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        init();
    }

    private void init() {
        setBackgroundResource(R.drawable.picker_btn_blue);
        LayoutInflater.from(getContext()).inflate(R.layout.picker_layout_attach_counter, this);
        this.counterView = (TextView) findViewById(R.id.tv_counter);
    }

    public void setCount(int count) {
        if (count == 0) {
            this.counterView.setVisibility(8);
            return;
        }
        this.counterView.setVisibility(0);
        if (count > 99) {
            this.counterView.setText("∞");
        } else {
            this.counterView.setText(String.valueOf(count));
        }
    }
}
