package com.vkontakte.android.ui;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.util.AttributeSet;
import android.view.View;
import android.widget.LinearLayout;
import com.vkontakte.android.R;
import com.vkontakte.android.api.APIUtils;
import com.vkontakte.android.api.VKAPIRequest;
/* loaded from: classes3.dex */
public class ErrorView extends LinearLayout {
    private long lastClickTime;
    private BroadcastReceiver receiver;
    private View.OnClickListener retryListener;

    public ErrorView(Context context) {
        super(context);
        this.lastClickTime = 0L;
        this.receiver = new BroadcastReceiver() { // from class: com.vkontakte.android.ui.ErrorView.1
            @Override // android.content.BroadcastReceiver
            public void onReceive(Context context2, Intent intent) {
                boolean isConnected = false;
                if (!isInitialStickyBroadcast() && "android.net.conn.CONNECTIVITY_CHANGE".equals(intent.getAction())) {
                    if (!intent.getBooleanExtra("noConnectivity", false)) {
                        isConnected = true;
                    }
                    if (isConnected) {
                        ErrorView.this.retry();
                    }
                }
            }
        };
        init();
    }

    public ErrorView(Context context, AttributeSet attrs) {
        super(context, attrs);
        this.lastClickTime = 0L;
        this.receiver = new BroadcastReceiver() { // from class: com.vkontakte.android.ui.ErrorView.1
            @Override // android.content.BroadcastReceiver
            public void onReceive(Context context2, Intent intent) {
                boolean isConnected = false;
                if (!isInitialStickyBroadcast() && "android.net.conn.CONNECTIVITY_CHANGE".equals(intent.getAction())) {
                    if (!intent.getBooleanExtra("noConnectivity", false)) {
                        isConnected = true;
                    }
                    if (isConnected) {
                        ErrorView.this.retry();
                    }
                }
            }
        };
        init();
    }

    public ErrorView(Context context, AttributeSet attrs, int defStyle) {
        super(context, attrs, defStyle);
        this.lastClickTime = 0L;
        this.receiver = new BroadcastReceiver() { // from class: com.vkontakte.android.ui.ErrorView.1
            @Override // android.content.BroadcastReceiver
            public void onReceive(Context context2, Intent intent) {
                boolean isConnected = false;
                if (!isInitialStickyBroadcast() && "android.net.conn.CONNECTIVITY_CHANGE".equals(intent.getAction())) {
                    if (!intent.getBooleanExtra("noConnectivity", false)) {
                        isConnected = true;
                    }
                    if (isConnected) {
                        ErrorView.this.retry();
                    }
                }
            }
        };
        init();
    }

    private void init() {
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void retry() {
        if (this.retryListener != null) {
            this.retryListener.onClick(findViewById(R.id.error_button));
        }
    }

    @Override // android.view.View
    public void onFinishInflate() {
        if (!isInEditMode()) {
            ((android.widget.TextView) findViewById(R.id.error_text)).setTypeface(Fonts.getRobotoLight());
        }
        findViewById(R.id.error_button).setOnClickListener(new View.OnClickListener() { // from class: com.vkontakte.android.ui.ErrorView.2
            @Override // android.view.View.OnClickListener
            public void onClick(View v) {
                if (System.currentTimeMillis() - ErrorView.this.lastClickTime >= 400) {
                    ErrorView.this.retry();
                    ErrorView.this.lastClickTime = System.currentTimeMillis();
                }
            }
        });
    }

    @Override // android.view.ViewGroup, android.view.View
    public void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        if (getVisibility() == 0) {
            try {
                getContext().unregisterReceiver(this.receiver);
            } catch (Exception e) {
            }
        }
    }

    @Override // android.view.View
    public void setVisibility(int vis) {
        int prev = getVisibility();
        super.setVisibility(vis);
        if (vis == 0 && prev != 0) {
            IntentFilter filter = new IntentFilter();
            filter.addAction("android.net.conn.CONNECTIVITY_CHANGE");
            getContext().registerReceiver(this.receiver, filter);
        } else if (vis != 0 && prev == 0) {
            try {
                getContext().unregisterReceiver(this.receiver);
            } catch (Exception e) {
            }
        }
    }

    public void setOnRetryListener(View.OnClickListener l) {
        this.retryListener = l;
    }

    public void setErrorInfo(VKAPIRequest.VKErrorResponse error) {
        setErrorInfo(error.getCode(), error.message);
    }

    public void setErrorInfo(int code, String msg) {
        setMessage(APIUtils.getLocalizedError(getContext(), code, msg));
    }

    public void setMessage(String msg) {
        ((android.widget.TextView) findViewById(R.id.error_text)).setText(msg);
    }

    public void setIsInline(boolean inl) {
        findViewById(R.id.error_icon).setVisibility(inl ? 8 : 4);
    }
}
