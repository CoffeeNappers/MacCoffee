package com.vkontakte.android.audio.utils;

import android.app.Service;
import android.content.Intent;
import android.os.IBinder;
import java.util.HashSet;
import java.util.Set;
/* loaded from: classes2.dex */
public abstract class BoundService extends Service {
    private boolean mBound;
    private Set<OnServiceLoadedListener> mOnServiceLoadedListeners;

    /* loaded from: classes2.dex */
    public interface OnServiceLoadedListener {
        void onServiceLoaded();
    }

    @Override // android.app.Service
    public void onCreate() {
        super.onCreate();
        this.mOnServiceLoadedListeners = new HashSet();
    }

    @Override // android.app.Service
    public void onDestroy() {
        this.mOnServiceLoadedListeners = null;
        super.onDestroy();
    }

    @Override // android.app.Service
    public final IBinder onBind(Intent intent) {
        this.mBound = true;
        onBound(intent);
        return new Binder(this);
    }

    @Override // android.app.Service
    public final void onRebind(Intent intent) {
        super.onRebind(intent);
        this.mBound = true;
        onBound(intent);
    }

    @Override // android.app.Service
    public final boolean onUnbind(Intent intent) {
        this.mBound = false;
        onUnbound(intent);
        return true;
    }

    public void onBound(Intent intent) {
    }

    public void onUnbound(Intent intent) {
    }

    public void registerOnServiceLoadedListener(OnServiceLoadedListener listener) {
        if (listener != null) {
            if (isLoaded()) {
                listener.onServiceLoaded();
            } else {
                this.mOnServiceLoadedListeners.add(listener);
            }
        }
    }

    public void unregisterOnServiceLoadedListener(OnServiceLoadedListener listener) {
        if (listener != null && !isLoaded()) {
            this.mOnServiceLoadedListeners.remove(listener);
        }
    }

    public boolean isLoaded() {
        return this.mOnServiceLoadedListeners == null;
    }

    public void loadFinished() {
        if (!isLoaded()) {
            Set<OnServiceLoadedListener> listeners = this.mOnServiceLoadedListeners;
            this.mOnServiceLoadedListeners = null;
            for (OnServiceLoadedListener listener : listeners) {
                listener.onServiceLoaded();
            }
        }
    }

    public boolean isBound() {
        return this.mBound;
    }

    /* loaded from: classes2.dex */
    public static class Binder extends android.os.Binder {
        public final BoundService service;

        public Binder(BoundService service) {
            this.service = service;
        }
    }
}
