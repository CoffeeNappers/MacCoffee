package ru.mail.libverify.ipc;

import android.os.Message;
import android.support.annotation.NonNull;
import android.text.TextUtils;
import io.sentry.marshaller.json.JsonMarshaller;
import ru.mail.libverify.api.l;
/* loaded from: classes3.dex */
final class g extends b {
    /* JADX INFO: Access modifiers changed from: package-private */
    public g(l lVar) {
        super(lVar);
    }

    @Override // ru.mail.libverify.ipc.b
    protected final void a(@NonNull Message message) {
        ru.mail.libverify.utils.d.c("IpcNotifyHandler", "handleMessage %s", message.toString());
        switch (message.what) {
            case 5:
                try {
                    String string = message.getData().getString("data");
                    long j = message.getData().getLong(JsonMarshaller.TIMESTAMP);
                    if (TextUtils.isEmpty(string)) {
                        ru.mail.libverify.utils.d.a("IpcNotifyHandler", "serverNotificationId can't be empty");
                    } else {
                        ru.mail.libverify.utils.d.c("IpcNotifyHandler", "process cancel message from %s", string);
                        this.a.a(string, j);
                    }
                    return;
                } catch (Exception e) {
                    ru.mail.libverify.utils.d.a("IpcNotifyHandler", "process cancel message failed", e);
                    return;
                }
            case 6:
                try {
                    String string2 = message.getData().getString("data");
                    if (TextUtils.isEmpty(string2)) {
                        ru.mail.libverify.utils.d.a("IpcNotifyHandler", "fetcher package name can't be empty");
                    } else {
                        ru.mail.libverify.utils.d.c("IpcNotifyHandler", "fetcher started from %s", string2);
                        this.a.d(string2);
                    }
                    return;
                } catch (Exception e2) {
                    ru.mail.libverify.utils.d.a("IpcNotifyHandler", "process fetcher started message failed", e2);
                    return;
                }
            case 7:
                try {
                    String string3 = message.getData().getString("data");
                    if (TextUtils.isEmpty(string3)) {
                        ru.mail.libverify.utils.d.a("IpcNotifyHandler", "fetcher package name can't be empty");
                    } else {
                        ru.mail.libverify.utils.d.c("IpcNotifyHandler", "fetcher stopped from %s", string3);
                        this.a.e(string3);
                    }
                    return;
                } catch (Exception e3) {
                    ru.mail.libverify.utils.d.a("IpcNotifyHandler", "process fetcher stopped message failed", e3);
                    return;
                }
            default:
                ru.mail.libverify.utils.c.a("IpcNotifyHandler", "handleMessage", new IllegalArgumentException("Can't process message with type " + message.what));
                return;
        }
    }
}
