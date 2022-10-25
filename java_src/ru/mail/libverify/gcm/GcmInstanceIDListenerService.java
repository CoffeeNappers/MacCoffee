package ru.mail.libverify.gcm;

import android.content.Intent;
import com.google.android.gms.iid.InstanceIDListenerService;
import ru.mail.libverify.api.VerificationFactory;
import ru.mail.libverify.utils.d;
/* loaded from: classes3.dex */
public class GcmInstanceIDListenerService extends InstanceIDListenerService {
    private final String a = "GcmIDService";

    @Override // com.google.android.gms.iid.InstanceIDListenerService, android.app.Service
    public void onDestroy() {
        super.onDestroy();
        d.c("GcmIDService", "service destroyed");
    }

    @Override // com.google.android.gms.iid.InstanceIDListenerService, android.app.Service
    public int onStartCommand(Intent intent, int i, int i2) {
        d.c("GcmIDService", "onStartCommand");
        return super.onStartCommand(intent, i, i2);
    }

    @Override // com.google.android.gms.iid.InstanceIDListenerService
    public void onTokenRefresh() {
        super.onTokenRefresh();
        if (!VerificationFactory.hasInstallation(this)) {
            d.b("GcmIDService", "token refreshed, but no libverify installation found");
            return;
        }
        d.c("GcmIDService", "token refresh");
        GcmRegisterService.a(this);
    }
}
