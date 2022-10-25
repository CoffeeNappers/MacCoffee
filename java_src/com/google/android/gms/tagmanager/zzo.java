package com.google.android.gms.tagmanager;

import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.tagmanager.ContainerHolder;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes2.dex */
public class zzo implements ContainerHolder {
    private boolean Kf;
    private Container aEg;
    private Container aEh;
    private zzb aEi;
    private zza aEj;
    private TagManager aEk;
    private Status hv;
    private final Looper zzajy;

    /* loaded from: classes2.dex */
    public interface zza {
        String zzcea();

        void zzcec();

        void zzox(String str);
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes2.dex */
    public class zzb extends Handler {
        private final ContainerHolder.ContainerAvailableListener aEl;

        public zzb(ContainerHolder.ContainerAvailableListener containerAvailableListener, Looper looper) {
            super(looper);
            this.aEl = containerAvailableListener;
        }

        @Override // android.os.Handler
        public void handleMessage(Message message) {
            switch (message.what) {
                case 1:
                    zzoz((String) message.obj);
                    return;
                default:
                    zzbo.e("Don't know how to handle this message.");
                    return;
            }
        }

        public void zzoy(String str) {
            sendMessage(obtainMessage(1, str));
        }

        protected void zzoz(String str) {
            this.aEl.onContainerAvailable(zzo.this, str);
        }
    }

    public zzo(Status status) {
        this.hv = status;
        this.zzajy = null;
    }

    public zzo(TagManager tagManager, Looper looper, Container container, zza zzaVar) {
        this.aEk = tagManager;
        this.zzajy = looper == null ? Looper.getMainLooper() : looper;
        this.aEg = container;
        this.aEj = zzaVar;
        this.hv = Status.xZ;
        tagManager.zza(this);
    }

    private void zzceb() {
        if (this.aEi != null) {
            this.aEi.zzoy(this.aEh.zzcdy());
        }
    }

    @Override // com.google.android.gms.tagmanager.ContainerHolder
    public synchronized Container getContainer() {
        Container container = null;
        synchronized (this) {
            if (this.Kf) {
                zzbo.e("ContainerHolder is released.");
            } else {
                if (this.aEh != null) {
                    this.aEg = this.aEh;
                    this.aEh = null;
                }
                container = this.aEg;
            }
        }
        return container;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public String getContainerId() {
        if (this.Kf) {
            zzbo.e("getContainerId called on a released ContainerHolder.");
            return "";
        }
        return this.aEg.getContainerId();
    }

    @Override // com.google.android.gms.common.api.Result
    public Status getStatus() {
        return this.hv;
    }

    @Override // com.google.android.gms.tagmanager.ContainerHolder
    public synchronized void refresh() {
        if (this.Kf) {
            zzbo.e("Refreshing a released ContainerHolder.");
        } else {
            this.aEj.zzcec();
        }
    }

    @Override // com.google.android.gms.common.api.Releasable
    public synchronized void release() {
        if (this.Kf) {
            zzbo.e("Releasing a released ContainerHolder.");
        } else {
            this.Kf = true;
            this.aEk.zzb(this);
            this.aEg.release();
            this.aEg = null;
            this.aEh = null;
            this.aEj = null;
            this.aEi = null;
        }
    }

    @Override // com.google.android.gms.tagmanager.ContainerHolder
    public synchronized void setContainerAvailableListener(ContainerHolder.ContainerAvailableListener containerAvailableListener) {
        if (this.Kf) {
            zzbo.e("ContainerHolder is released.");
        } else if (containerAvailableListener == null) {
            this.aEi = null;
        } else {
            this.aEi = new zzb(containerAvailableListener, this.zzajy);
            if (this.aEh != null) {
                zzceb();
            }
        }
    }

    public synchronized void zza(Container container) {
        if (!this.Kf) {
            if (container == null) {
                zzbo.e("Unexpected null container.");
            } else {
                this.aEh = container;
                zzceb();
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public String zzcea() {
        if (this.Kf) {
            zzbo.e("setCtfeUrlPathAndQuery called on a released ContainerHolder.");
            return "";
        }
        return this.aEj.zzcea();
    }

    public synchronized void zzov(String str) {
        if (!this.Kf) {
            this.aEg.zzov(str);
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void zzox(String str) {
        if (this.Kf) {
            zzbo.e("setCtfeUrlPathAndQuery called on a released ContainerHolder.");
        } else {
            this.aEj.zzox(str);
        }
    }
}
