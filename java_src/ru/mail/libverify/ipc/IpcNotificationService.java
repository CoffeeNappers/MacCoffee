package ru.mail.libverify.ipc;

import android.app.Service;
import android.content.Intent;
import android.os.IBinder;
import android.util.Log;
import ru.mail.libverify.api.VerificationFactory;
import ru.mail.libverify.api.k;
/* loaded from: classes3.dex */
public class IpcNotificationService extends Service {
    private g a;

    @Override // android.app.Service
    public IBinder onBind(Intent intent) {
        ru.mail.libverify.utils.d.c("IpcNotifyService", "onBind from initiator %s", intent.getStringExtra("bind_initiator"));
        if (!VerificationFactory.hasInstallation(this)) {
            Log.e("IpcNotifyService", "libverify isn't initialized for this application");
            return null;
        }
        if (this.a == null) {
            this.a = new g(k.b(this));
        }
        return this.a.a().getBinder();
    }

    @Override // android.app.Service
    public void onDestroy() {
        ru.mail.libverify.utils.d.c("IpcNotifyService", "onDestroy");
        super.onDestroy();
    }

    @Override // android.app.Service
    public int onStartCommand(Intent intent, int i, int i2) {
        ru.mail.libverify.utils.d.c("IpcNotifyService", "onStartCommand");
        return super.onStartCommand(intent, i, i2);
    }
}
