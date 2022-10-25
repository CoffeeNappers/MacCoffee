package ru.mail.libverify.ipc;

import android.content.Context;
import android.os.Bundle;
import android.os.Message;
import android.os.Messenger;
import android.support.annotation.NonNull;
import android.text.TextUtils;
import ru.mail.libverify.api.l;
import ru.mail.libverify.utils.m;
/* loaded from: classes3.dex */
final class h extends ru.mail.libverify.ipc.a {
    private final String e;
    private final String f;
    private String g;

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes3.dex */
    public static class a implements d {
        private final l a;
        private final String b;
        private final String c;

        public a(@NonNull l lVar, @NonNull String str, @NonNull String str2) {
            this.a = lVar;
            this.b = str;
            this.c = str2;
        }

        @Override // ru.mail.libverify.ipc.d
        public final ru.mail.libverify.ipc.a a() {
            return new h(this.a, this.b, this.c, (byte) 0);
        }

        @Override // ru.mail.libverify.ipc.d
        public final boolean a(@NonNull Context context, @NonNull String str) {
            return m.a(context, str, "android.permission.READ_SMS") && m.a(context, str);
        }

        @Override // ru.mail.libverify.ipc.d
        public final Class b() {
            return IpcMessageService.class;
        }
    }

    private h(@NonNull l lVar, @NonNull String str, @NonNull String str2) {
        super(lVar);
        this.e = str;
        this.f = str2;
    }

    /* synthetic */ h(l lVar, String str, String str2, byte b) {
        this(lVar, str, str2);
    }

    private boolean a(Message message) {
        boolean z;
        ru.mail.libverify.utils.d.c("SmsTextClientHandler", "processGetSessionsAckMessage");
        try {
            String string = message.getData().getString("data");
            if (TextUtils.isEmpty(string)) {
                ru.mail.libverify.utils.d.a("SmsTextClientHandler", "validateGetSessionsAckMessage can't parse empty ids");
                z = false;
            } else {
                String[] split = string.split(",");
                for (int i = 0; i < split.length && i < 5; i++) {
                    if (TextUtils.equals(c(), split[i])) {
                        ru.mail.libverify.utils.d.c("SmsTextClientHandler", "validateGetSessionsAckMessage found requested session id %s", this.e);
                        z = true;
                        break;
                    }
                }
                ru.mail.libverify.utils.d.a("SmsTextClientHandler", "validateGetSessionsAckMessage session id %s not found", this.e);
                z = false;
            }
            if (!z) {
                ru.mail.libverify.utils.d.a("SmsTextClientHandler", "processGetSessionsAckMessage - received message is not valid");
                return false;
            }
            Messenger messenger = this.c;
            Message obtain = Message.obtain(this, 3);
            obtain.replyTo = a();
            Bundle bundle = new Bundle();
            bundle.putString("data", this.f);
            bundle.putString("receiver", c());
            obtain.setData(bundle);
            messenger.send(obtain);
            return true;
        } catch (Exception e) {
            ru.mail.libverify.utils.d.a("SmsTextClientHandler", "processGetSessionsAckMessage", e);
            return false;
        }
    }

    private String c() {
        if (this.g == null) {
            this.g = m.a(this.e);
        }
        return this.g;
    }

    @Override // ru.mail.libverify.ipc.a
    protected final void b() {
        try {
            Messenger messenger = this.c;
            Message obtain = Message.obtain(this, 1);
            obtain.replyTo = a();
            obtain.setData(new Bundle());
            messenger.send(obtain);
        } catch (Exception e) {
            ru.mail.libverify.utils.d.a("SmsTextClientHandler", "postDataToService", e);
        }
    }

    @Override // android.os.Handler
    public final void handleMessage(Message message) {
        if (this.d) {
            return;
        }
        super.handleMessage(message);
        if (message == null) {
            return;
        }
        ru.mail.libverify.utils.d.c("SmsTextClientHandler", "handleMessage %s", message.toString());
        switch (message.what) {
            case 2:
                if (a(message)) {
                    return;
                }
                this.b.a(false);
                return;
            case 3:
            default:
                ru.mail.libverify.utils.c.a("SmsTextClientHandler", "handleMessage", new IllegalArgumentException("Can't process message with type " + message.what));
                this.b.a(false);
                return;
            case 4:
                this.b.a(true);
                return;
        }
    }
}
