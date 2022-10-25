package ru.mail.libverify.ipc;

import android.content.Context;
import android.os.Bundle;
import android.os.Message;
import android.os.Messenger;
import android.support.annotation.NonNull;
import io.sentry.marshaller.json.JsonMarshaller;
import ru.mail.libverify.api.l;
import ru.mail.libverify.utils.m;
/* loaded from: classes3.dex */
final class c extends ru.mail.libverify.ipc.a {
    private final String e;
    private final long f;

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes3.dex */
    public static class a implements d {
        private final l a;
        private final long b;
        private final String c;

        public a(@NonNull l lVar, @NonNull String str, long j) {
            this.a = lVar;
            this.c = str;
            this.b = j;
        }

        @Override // ru.mail.libverify.ipc.d
        public final ru.mail.libverify.ipc.a a() {
            return new c(this.a, this.c, this.b, (byte) 0);
        }

        @Override // ru.mail.libverify.ipc.d
        public final boolean a(@NonNull Context context, @NonNull String str) {
            return m.a(context, str);
        }

        @Override // ru.mail.libverify.ipc.d
        public final Class b() {
            return IpcNotificationService.class;
        }
    }

    private c(@NonNull l lVar, @NonNull String str, long j) {
        super(lVar);
        this.e = str;
        this.f = j;
    }

    /* synthetic */ c(l lVar, String str, long j, byte b) {
        this(lVar, str, j);
    }

    @Override // ru.mail.libverify.ipc.a
    protected final void b() {
        try {
            Messenger messenger = this.c;
            String str = this.e;
            Message obtain = Message.obtain(this, 5);
            obtain.replyTo = a();
            Bundle bundle = new Bundle();
            bundle.putString("data", str);
            bundle.putLong(JsonMarshaller.TIMESTAMP, this.f);
            obtain.setData(bundle);
            messenger.send(obtain);
            this.b.a(true);
        } catch (Exception e) {
            ru.mail.libverify.utils.d.a("CancelNotification", "postDataToService", e);
        }
    }
}
