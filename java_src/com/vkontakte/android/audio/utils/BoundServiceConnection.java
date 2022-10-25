package com.vkontakte.android.audio.utils;

import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.ServiceConnection;
import android.os.IBinder;
import android.util.Log;
import com.vkontakte.android.audio.utils.BoundService;
/* loaded from: classes2.dex */
public abstract class BoundServiceConnection<T extends BoundService> {
    private BoundServiceConnection<T>.MyConnection mConnection;
    private Context mContext;
    private final BoundServiceConnectionListener mListener;
    private T mService;

    /* loaded from: classes2.dex */
    public interface BoundServiceConnectionListener {
        void onConnected();
    }

    protected abstract Intent createBindIntent();

    protected abstract Intent createStartIntent();

    public BoundServiceConnection(BoundServiceConnectionListener listener) {
        this.mListener = listener;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void finalize() throws Throwable {
        if (this.mConnection != null) {
            Log.e("BoundServiceConnection", "Disconnect has not been called on " + toString());
        }
        super.finalize();
    }

    public Context getContext() {
        return this.mContext;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public T getService() {
        if (isConnected()) {
            return this.mService;
        }
        return null;
    }

    public void connect(Context context) {
        if (this.mContext == null) {
            this.mContext = context;
            this.mConnection = new MyConnection();
            onConnect();
            Intent startIntent = createStartIntent();
            if (startIntent != null) {
                this.mContext.startService(startIntent);
            }
            this.mContext.bindService(createBindIntent(), this.mConnection, 1);
        }
    }

    public void disconnect() {
        if (this.mContext != null) {
            onDisconnect();
            if (this.mService != null) {
                this.mService.unregisterOnServiceLoadedListener(this.mConnection);
                this.mService = null;
            }
            this.mContext.unbindService(this.mConnection);
            this.mConnection = null;
            this.mContext = null;
            onDisconnected();
        }
    }

    public boolean isConnected() {
        return this.mService != null && this.mService.isLoaded();
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void onConnect() {
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void onConnected() {
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void onDisconnect() {
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void onDisconnected() {
    }

    /* loaded from: classes2.dex */
    private class MyConnection implements ServiceConnection, BoundService.OnServiceLoadedListener {
        private MyConnection() {
        }

        @Override // android.content.ServiceConnection
        public void onServiceConnected(ComponentName name, IBinder service) {
            BoundServiceConnection.this.mService = (BoundService) Utils.checkedCast(((BoundService.Binder) service).service);
            BoundServiceConnection.this.mService.registerOnServiceLoadedListener(this);
        }

        @Override // android.content.ServiceConnection
        public void onServiceDisconnected(ComponentName name) {
        }

        @Override // com.vkontakte.android.audio.utils.BoundService.OnServiceLoadedListener
        public void onServiceLoaded() {
            BoundServiceConnection.this.onConnected();
            if (BoundServiceConnection.this.mListener != null) {
                BoundServiceConnection.this.mListener.onConnected();
            }
        }
    }
}
