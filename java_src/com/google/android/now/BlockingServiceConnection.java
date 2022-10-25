package com.google.android.now;

import android.content.ComponentName;
import android.content.Context;
import android.content.ServiceConnection;
import android.os.Handler;
import android.os.IBinder;
import android.os.Looper;
import android.util.Log;
import java.util.concurrent.BlockingQueue;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.atomic.AtomicBoolean;
/* loaded from: classes2.dex */
class BlockingServiceConnection implements ServiceConnection {
    private static final String TAG = "BlockingServiceConnection";
    private boolean mBound = false;
    private AtomicBoolean mUsed = new AtomicBoolean(false);
    private final BlockingQueue<IBinder> mBlockingQueue = new LinkedBlockingQueue();

    @Override // android.content.ServiceConnection
    public void onServiceConnected(ComponentName name, IBinder service) {
        this.mBound = true;
        this.mBlockingQueue.clear();
        this.mBlockingQueue.add(service);
    }

    @Override // android.content.ServiceConnection
    public void onServiceDisconnected(ComponentName name) {
        this.mBound = false;
    }

    public IBinder getService() throws InterruptedException {
        if (this.mUsed.get()) {
            throw new IllegalStateException();
        }
        this.mUsed.set(true);
        return this.mBlockingQueue.take();
    }

    public void unbindServiceIfConnected(final Context context) {
        Runnable runnable = new Runnable() { // from class: com.google.android.now.BlockingServiceConnection.1
            @Override // java.lang.Runnable
            public void run() {
                if (BlockingServiceConnection.this.mBound) {
                    context.unbindService(BlockingServiceConnection.this);
                } else {
                    Log.w(BlockingServiceConnection.TAG, "Service disconnected before unbinding");
                }
            }
        };
        Handler handler = new Handler(Looper.getMainLooper());
        handler.post(runnable);
    }
}
