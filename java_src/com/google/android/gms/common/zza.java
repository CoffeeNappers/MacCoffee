package com.google.android.gms.common;

import android.content.ComponentName;
import android.content.ServiceConnection;
import android.os.IBinder;
import com.google.android.gms.common.internal.zzaa;
import java.util.concurrent.BlockingQueue;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.TimeoutException;
/* loaded from: classes2.dex */
public class zza implements ServiceConnection {
    boolean wM = false;
    private final BlockingQueue<IBinder> wN = new LinkedBlockingQueue();

    @Override // android.content.ServiceConnection
    public void onServiceConnected(ComponentName componentName, IBinder iBinder) {
        this.wN.add(iBinder);
    }

    @Override // android.content.ServiceConnection
    public void onServiceDisconnected(ComponentName componentName) {
    }

    public IBinder zza(long j, TimeUnit timeUnit) throws InterruptedException, TimeoutException {
        zzaa.zzht("BlockingServiceConnection.getServiceWithTimeout() called on main thread");
        if (this.wM) {
            throw new IllegalStateException("Cannot call get on this connection more than once");
        }
        this.wM = true;
        IBinder poll = this.wN.poll(j, timeUnit);
        if (poll != null) {
            return poll;
        }
        throw new TimeoutException("Timed out waiting for the service connection");
    }

    public IBinder zzaqk() throws InterruptedException {
        zzaa.zzht("BlockingServiceConnection.getService() called on main thread");
        if (this.wM) {
            throw new IllegalStateException("Cannot call get on this connection more than once");
        }
        this.wM = true;
        return this.wN.take();
    }
}
