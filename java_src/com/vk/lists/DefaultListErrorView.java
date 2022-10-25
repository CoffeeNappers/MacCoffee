package com.vk.lists;

import android.content.Context;
import android.util.AttributeSet;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.TextView;
/* loaded from: classes2.dex */
public class DefaultListErrorView extends AbstractErrorView {
    private TextView errorButton;
    private TextView errorText;
    private long lastClickTime;

    public DefaultListErrorView(Context context) {
        super(context);
        this.lastClickTime = 0L;
        init(context);
    }

    public DefaultListErrorView(Context context, AttributeSet attrs) {
        super(context, attrs);
        this.lastClickTime = 0L;
        init(context);
    }

    public DefaultListErrorView(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        this.lastClickTime = 0L;
        init(context);
    }

    private void init(Context context) {
        LinearLayout ll = (LinearLayout) LayoutInflater.from(context).inflate(R.layout.view_default_list_error_view, (ViewGroup) null);
        addView(ll, new FrameLayout.LayoutParams(-1, (int) context.getResources().getDimension(R.dimen.footer_height)));
        this.errorText = (TextView) findViewById(R.id.error_text);
        this.errorButton = (TextView) findViewById(R.id.error_button);
        this.errorButton.setOnClickListener(new View.OnClickListener() { // from class: com.vk.lists.DefaultListErrorView.1
            @Override // android.view.View.OnClickListener
            public void onClick(View v) {
                if (System.currentTimeMillis() - DefaultListErrorView.this.lastClickTime >= 400) {
                    DefaultListErrorView.this.retry();
                    DefaultListErrorView.this.lastClickTime = System.currentTimeMillis();
                }
            }
        });
    }

    public void setMessage(String msg) {
        this.errorText.setText(msg);
    }
}
