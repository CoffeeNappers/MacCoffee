package com.vk.lists;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.Handler;
import android.os.Looper;
import android.util.AttributeSet;
import android.widget.FrameLayout;
/* loaded from: classes2.dex */
public class AbstractErrorView extends FrameLayout {
    private BroadcastReceiver receiver;
    private OnRetryClickListener retryClickListener;

    public AbstractErrorView(Context context) {
        super(context);
        this.receiver = new BroadcastReceiver() { // from class: com.vk.lists.AbstractErrorView.1
            @Override // android.content.BroadcastReceiver
            public void onReceive(Context context2, Intent intent) {
                boolean isConnected = false;
                if (!isInitialStickyBroadcast() && "android.net.conn.CONNECTIVITY_CHANGE".equals(intent.getAction())) {
                    if (!intent.getBooleanExtra("noConnectivity", false)) {
                        isConnected = true;
                    }
                    if (isConnected) {
                        new Handler(Looper.getMainLooper()).postDelayed(new Runnable() { // from class: com.vk.lists.AbstractErrorView.1.1
                            @Override // java.lang.Runnable
                            public void run() {
                                AbstractErrorView.this.retry();
                            }
                        }, 1000L);
                    }
                }
            }
        };
    }

    public AbstractErrorView(Context context, AttributeSet attrs) {
        super(context, attrs);
        this.receiver = new BroadcastReceiver() { // from class: com.vk.lists.AbstractErrorView.1
            @Override // android.content.BroadcastReceiver
            public void onReceive(Context context2, Intent intent) {
                boolean isConnected = false;
                if (!isInitialStickyBroadcast() && "android.net.conn.CONNECTIVITY_CHANGE".equals(intent.getAction())) {
                    if (!intent.getBooleanExtra("noConnectivity", false)) {
                        isConnected = true;
                    }
                    if (isConnected) {
                        new Handler(Looper.getMainLooper()).postDelayed(new Runnable() { // from class: com.vk.lists.AbstractErrorView.1.1
                            @Override // java.lang.Runnable
                            public void run() {
                                AbstractErrorView.this.retry();
                            }
                        }, 1000L);
                    }
                }
            }
        };
    }

    public AbstractErrorView(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        this.receiver = new BroadcastReceiver() { // from class: com.vk.lists.AbstractErrorView.1
            @Override // android.content.BroadcastReceiver
            public void onReceive(Context context2, Intent intent) {
                boolean isConnected = false;
                if (!isInitialStickyBroadcast() && "android.net.conn.CONNECTIVITY_CHANGE".equals(intent.getAction())) {
                    if (!intent.getBooleanExtra("noConnectivity", false)) {
                        isConnected = true;
                    }
                    if (isConnected) {
                        new Handler(Looper.getMainLooper()).postDelayed(new Runnable() { // from class: com.vk.lists.AbstractErrorView.1.1
                            @Override // java.lang.Runnable
                            public void run() {
                                AbstractErrorView.this.retry();
                            }
                        }, 1000L);
                    }
                }
            }
        };
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

    public OnRetryClickListener getRetryClickListener() {
        return this.retryClickListener;
    }

    public void setRetryClickListener(OnRetryClickListener retryClickListener) {
        this.retryClickListener = retryClickListener;
    }

    public void retry() {
        if (getRetryClickListener() != null) {
            getRetryClickListener().onRetryClick();
        }
    }
}
