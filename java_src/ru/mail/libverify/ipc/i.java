package ru.mail.libverify.ipc;

import android.os.Bundle;
import android.os.Message;
import android.os.Messenger;
import android.support.annotation.NonNull;
import android.text.TextUtils;
import java.util.List;
import ru.mail.libverify.api.l;
import ru.mail.libverify.utils.m;
/* loaded from: classes3.dex */
final class i extends b {
    /* JADX INFO: Access modifiers changed from: package-private */
    public i(l lVar) {
        super(lVar);
    }

    @Override // ru.mail.libverify.ipc.b
    protected final void a(@NonNull Message message) {
        ru.mail.libverify.utils.d.c("SmsTextServiceHandler", "handleMessage %s", message.toString());
        switch (message.what) {
            case 1:
                ru.mail.libverify.utils.d.c("SmsTextServiceHandler", "processGetSessionsMessage");
                List<String> f = this.a.f();
                if (f.isEmpty()) {
                    ru.mail.libverify.utils.d.a("SmsTextServiceHandler", "processGetSessionsMessage skipped");
                    return;
                }
                try {
                    Messenger messenger = message.replyTo;
                    Message obtain = Message.obtain(this, 2);
                    obtain.replyTo = a();
                    Bundle bundle = new Bundle();
                    StringBuilder sb = new StringBuilder();
                    for (String str : f) {
                        if (sb.length() != 0) {
                            sb.append(",");
                        }
                        sb.append(m.a(str));
                    }
                    bundle.putString("data", sb.toString());
                    obtain.setData(bundle);
                    messenger.send(obtain);
                    return;
                } catch (Exception e) {
                    ru.mail.libverify.utils.d.a("SmsTextServiceHandler", "processGetSessionsMessage", e);
                    return;
                }
            case 2:
            default:
                ru.mail.libverify.utils.c.a("SmsTextServiceHandler", "handleMessage", new IllegalArgumentException("Can't process message with type " + message.what));
                return;
            case 3:
                try {
                    String string = message.getData().getString("data");
                    String string2 = message.getData().getString("receiver");
                    if (TextUtils.isEmpty(string) || TextUtils.isEmpty(string2)) {
                        ru.mail.libverify.utils.d.a("SmsTextServiceHandler", "processPostSmsTextMessage smsText and receiver shouldn't be empty");
                    } else {
                        ru.mail.libverify.utils.d.c("SmsTextServiceHandler", "processPostSmsTextMessage sms %s for receiver %s", string, string2);
                        this.a.b(string2, string);
                        Messenger messenger2 = message.replyTo;
                        Message obtain2 = Message.obtain(this, 4);
                        obtain2.replyTo = a();
                        obtain2.setData(new Bundle());
                        messenger2.send(obtain2);
                    }
                    return;
                } catch (Exception e2) {
                    ru.mail.libverify.utils.d.a("SmsTextServiceHandler", "processPostSmsTextMessage", e2);
                    return;
                }
        }
    }
}
