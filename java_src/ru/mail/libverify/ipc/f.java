package ru.mail.libverify.ipc;

import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.ServiceConnection;
import android.content.pm.ResolveInfo;
import android.os.IBinder;
import android.os.Messenger;
import android.support.annotation.NonNull;
import android.text.TextUtils;
import java.io.File;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Timer;
import java.util.TimerTask;
import ru.mail.libverify.api.l;
import ru.mail.libverify.ipc.a;
/* loaded from: classes3.dex */
public final class f {
    public final Context a;
    public final l b;
    private final b d;
    final HashMap<d, a> c = new HashMap<>();
    private Timer e = null;

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes3.dex */
    public enum a {
        Initial,
        Connected,
        Completed,
        Failed
    }

    /* loaded from: classes3.dex */
    public interface b {
        void a(c cVar);
    }

    /* loaded from: classes3.dex */
    public enum c {
        OK,
        FAILED_TO_FIND_READY_SERVICE,
        FAILED_TO_FIND_TARGET_SESSION,
        CONNECTION_TIMEOUT_EXPIRED,
        GENERAL_FAILURE
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes3.dex */
    public class d implements ServiceConnection {
        private ru.mail.libverify.ipc.a b;
        private final ResolveInfo c;

        private d(ResolveInfo resolveInfo, @NonNull ru.mail.libverify.ipc.a aVar) {
            this.c = resolveInfo;
            this.b = aVar;
        }

        /* synthetic */ d(f fVar, ResolveInfo resolveInfo, ru.mail.libverify.ipc.a aVar, byte b) {
            this(resolveInfo, aVar);
        }

        private synchronized void b() {
            if (this.b != null) {
                ru.mail.libverify.ipc.a aVar = this.b;
                aVar.d = true;
                aVar.removeCallbacksAndMessages(null);
                this.b = null;
            }
        }

        public final synchronized void a() {
            ru.mail.libverify.utils.d.c("IpcMessageClient", "unbind service %s", this.c.toString());
            f.this.a.unbindService(this);
            b();
        }

        @Override // android.content.ServiceConnection
        public final void onServiceConnected(ComponentName componentName, IBinder iBinder) {
            if (this.b == null || iBinder == null) {
                ru.mail.libverify.utils.d.a("IpcMessageClient", "onServiceConnected connected %s, but connection had been already stopped or binder is null", this.c.toString());
                return;
            }
            ru.mail.libverify.utils.d.c("IpcMessageClient", "onServiceConnected connected %s", this.c.toString());
            this.b.a(new Messenger(iBinder), new a.InterfaceC0284a() { // from class: ru.mail.libverify.ipc.f.d.1
                @Override // ru.mail.libverify.ipc.a.InterfaceC0284a
                public final void a(boolean z) {
                    ru.mail.libverify.utils.d.c("IpcMessageClient", "onServiceConnected postDataToService result = %b", Boolean.valueOf(z));
                    d.this.a();
                    synchronized (f.this) {
                        f.this.c.put(d.this, z ? a.Completed : a.Failed);
                        f.a(f.this, false);
                    }
                }
            });
        }

        @Override // android.content.ServiceConnection
        public final void onServiceDisconnected(ComponentName componentName) {
            ru.mail.libverify.utils.d.c("IpcMessageClient", "onServiceDisconnected disconnected %s", this.c.toString());
            b();
            synchronized (f.this) {
                f.this.c.put(this, a.Failed);
                f.a(f.this, false);
            }
        }
    }

    public f(@NonNull Context context, @NonNull l lVar, @NonNull b bVar) {
        this.a = context;
        this.b = lVar;
        this.d = bVar;
    }

    static /* synthetic */ void a(f fVar, boolean z) {
        if (!fVar.c.isEmpty()) {
            Iterator<a> it = fVar.c.values().iterator();
            boolean z2 = true;
            boolean z3 = false;
            while (it.hasNext()) {
                a next = it.next();
                z2 &= next != a.Initial;
                z3 = (next == a.Completed) | z3;
            }
            if (z) {
                fVar.d.a(z3 ? c.OK : c.CONNECTION_TIMEOUT_EXPIRED);
            } else if (!z2) {
                return;
            } else {
                if (z3) {
                    fVar.d.a(c.OK);
                } else {
                    fVar.d.a(c.FAILED_TO_FIND_TARGET_SESSION);
                }
            }
            fVar.c.clear();
        }
    }

    final void a() {
        if (this.e != null) {
            this.e.cancel();
            this.e = null;
        }
    }

    public final synchronized void a(@NonNull ru.mail.libverify.ipc.d dVar, String str) {
        String packageName;
        boolean z;
        List<ResolveInfo> queryIntentServices;
        ru.mail.libverify.utils.d.c("IpcMessageClient", "connectAndPostData target package = %s", str);
        this.c.clear();
        try {
            Intent intent = new Intent(dVar.b().getName());
            packageName = this.a.getPackageName();
            z = !TextUtils.isEmpty(str);
            queryIntentServices = this.a.getPackageManager().queryIntentServices(intent, 0);
            Collections.sort(queryIntentServices, new Comparator<ResolveInfo>() { // from class: ru.mail.libverify.ipc.f.1
                @Override // java.util.Comparator
                public final /* synthetic */ int compare(ResolveInfo resolveInfo, ResolveInfo resolveInfo2) {
                    long lastModified = new File(resolveInfo.serviceInfo.applicationInfo.sourceDir).lastModified();
                    long lastModified2 = new File(resolveInfo2.serviceInfo.applicationInfo.sourceDir).lastModified();
                    if (lastModified > lastModified2) {
                        return -1;
                    }
                    return lastModified == lastModified2 ? 0 : 1;
                }
            });
            ru.mail.libverify.utils.d.b("IpcMessageClient", "connectAndPostData found services count %d", Integer.valueOf(queryIntentServices.size()));
        } catch (Exception e) {
            ru.mail.libverify.utils.d.a("IpcMessageClient", "connectAndPostData", e);
            a();
            b();
            this.d.a(c.GENERAL_FAILURE);
        }
        if (queryIntentServices.size() == 0) {
            this.d.a(c.FAILED_TO_FIND_READY_SERVICE);
        } else {
            int size = queryIntentServices.size();
            a();
            if (this.e == null) {
                this.e = new Timer("IpcMessageClient.connectionTimer");
            }
            this.e.schedule(new TimerTask() { // from class: ru.mail.libverify.ipc.f.2
                @Override // java.util.TimerTask, java.lang.Runnable
                public final void run() {
                    synchronized (f.this) {
                        ru.mail.libverify.utils.d.c("IpcMessageClient", "startTimer connection timeout expired");
                        f.this.b();
                        f.a(f.this, true);
                        f.this.a();
                    }
                }
            }, size * 1000);
            for (ResolveInfo resolveInfo : queryIntentServices) {
                boolean z2 = !TextUtils.equals(packageName, resolveInfo.serviceInfo.packageName);
                boolean z3 = !z || TextUtils.equals(str, resolveInfo.serviceInfo.packageName);
                if (z2 && z3) {
                    if (dVar.a(this.a, resolveInfo.serviceInfo.packageName)) {
                        ru.mail.libverify.utils.d.c("IpcMessageClient", "connectToService try binding to %s", resolveInfo.toString());
                        try {
                            Intent intent2 = new Intent();
                            intent2.setClassName(resolveInfo.serviceInfo.packageName, resolveInfo.serviceInfo.name);
                            d dVar2 = new d(this, resolveInfo, dVar.a(), (byte) 0);
                            if (this.a.bindService(intent2, dVar2, 1)) {
                                this.c.put(dVar2, a.Initial);
                                ru.mail.libverify.utils.d.c("IpcMessageClient", "connectToService bound to %s", resolveInfo.toString());
                            } else {
                                ru.mail.libverify.utils.d.a("IpcMessageClient", "connectToService failed to bind to %s", resolveInfo.toString());
                            }
                        } catch (SecurityException e2) {
                            ru.mail.libverify.utils.d.a("IpcMessageClient", e2, "connectToService failed to bind to %s", resolveInfo.toString());
                        }
                    } else {
                        ru.mail.libverify.utils.d.a("IpcMessageClient", "connectAndPostData service from %s is not trusted", resolveInfo.serviceInfo.packageName);
                    }
                }
            }
            if (this.c.isEmpty()) {
                this.d.a(c.FAILED_TO_FIND_READY_SERVICE);
            }
        }
    }

    final void b() {
        ru.mail.libverify.utils.d.b("IpcMessageClient", "unbind %d connections", Integer.valueOf(this.c.size()));
        for (d dVar : this.c.keySet()) {
            dVar.a();
        }
    }
}
