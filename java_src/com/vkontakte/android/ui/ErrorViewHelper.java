package com.vkontakte.android.ui;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.support.annotation.Nullable;
import android.view.View;
import com.vkontakte.android.R;
import com.vkontakte.android.ViewUtils;
import com.vkontakte.android.api.APIUtils;
import com.vkontakte.android.api.VKAPIRequest;
/* loaded from: classes3.dex */
public class ErrorViewHelper implements View.OnAttachStateChangeListener {
    private View button;
    private BroadcastReceiver receiver = new BroadcastReceiver() { // from class: com.vkontakte.android.ui.ErrorViewHelper.1
        @Override // android.content.BroadcastReceiver
        public void onReceive(Context context, Intent intent) {
            boolean isConnected = false;
            if (!isInitialStickyBroadcast() && "android.net.conn.CONNECTIVITY_CHANGE".equals(intent.getAction())) {
                if (!intent.getBooleanExtra("noConnectivity", false)) {
                    isConnected = true;
                }
                if (isConnected && ErrorViewHelper.this.view.getVisibility() == 0) {
                    ErrorViewHelper.this.retry();
                }
            }
        }
    };
    private View.OnClickListener retryListener;
    private android.widget.TextView text;
    private View view;

    public ErrorViewHelper(View view) {
        this.view = view;
        this.view.addOnAttachStateChangeListener(this);
        this.button = view.findViewById(R.id.error_retry);
        this.button = this.button != null ? this.button : view.findViewById(R.id.error_button);
        this.text = (android.widget.TextView) view.findViewById(R.id.error_text);
    }

    public View getView() {
        return this.view;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void retry() {
        if (this.retryListener != null) {
            this.retryListener.onClick(this.button);
        }
    }

    public void setOnRetryListener(View.OnClickListener onRetryListener) {
        View view = this.button;
        this.retryListener = onRetryListener;
        view.setOnClickListener(onRetryListener);
    }

    public void setErrorInfo(VKAPIRequest.VKErrorResponse error) {
        setErrorInfo(error.getCode(), error.message);
    }

    public void setErrorInfo(int code, String msg) {
        setMessage(APIUtils.getLocalizedError(this.view.getContext(), code, msg));
    }

    public void setMessage(String msg) {
        this.text.setText(msg);
    }

    public void setVisibility(int visibility) {
        ViewUtils.setVisibility(this.view, visibility);
    }

    public static void setVisibility(@Nullable ErrorViewHelper viewHelper, int visibility) {
        ViewUtils.setVisibility(viewHelper == null ? null : viewHelper.view, visibility);
    }

    public static void setVisibilityAnimated(@Nullable ErrorViewHelper viewHelper, int visibility) {
        if (viewHelper != null) {
            ViewUtils.setVisibilityAnimated(viewHelper.view, visibility);
        }
    }

    @Override // android.view.View.OnAttachStateChangeListener
    public void onViewAttachedToWindow(View v) {
        this.view.getContext().registerReceiver(this.receiver, new IntentFilter("android.net.conn.CONNECTIVITY_CHANGE"));
    }

    @Override // android.view.View.OnAttachStateChangeListener
    public void onViewDetachedFromWindow(View v) {
        try {
            this.view.getContext().unregisterReceiver(this.receiver);
        } catch (Exception e) {
        }
    }
}
