package ru.mail.libverify.ipc;

import android.content.Context;
import android.os.Bundle;
import android.os.Message;
import android.os.Messenger;
import android.support.annotation.NonNull;
import ru.mail.libverify.api.l;
import ru.mail.libverify.utils.m;
/* loaded from: classes3.dex */
final class e extends ru.mail.libverify.ipc.a {
    private final int e;
    private final String f;

    /* renamed from: ru.mail.libverify.ipc.e$1  reason: invalid class name */
    /* loaded from: classes3.dex */
    static /* synthetic */ class AnonymousClass1 {
        static final /* synthetic */ int[] a = new int[b.a().length];

        static {
            try {
                a[b.a - 1] = 1;
            } catch (NoSuchFieldError e) {
            }
            try {
                a[b.b - 1] = 2;
            } catch (NoSuchFieldError e2) {
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes3.dex */
    public static class a implements d {
        private final l a;
        private final Context b;
        private final int c;

        public a(@NonNull l lVar, @NonNull Context context, int i) {
            this.a = lVar;
            this.b = context;
            this.c = i;
        }

        @Override // ru.mail.libverify.ipc.d
        public final ru.mail.libverify.ipc.a a() {
            return new e(this.a, this.c, this.b.getPackageName(), (byte) 0);
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

    /* JADX INFO: Access modifiers changed from: package-private */
    /* JADX WARN: Failed to restore enum class, 'enum' modifier removed */
    /* loaded from: classes3.dex */
    public static final class b extends Enum<b> {
        public static final int a = 1;
        public static final int b = 2;
        private static final /* synthetic */ int[] c = {a, b};

        public static int[] a() {
            return (int[]) c.clone();
        }
    }

    private e(@NonNull l lVar, int i, String str) {
        super(lVar);
        this.e = i;
        this.f = str;
    }

    /* synthetic */ e(l lVar, int i, String str, byte b2) {
        this(lVar, i, str);
    }

    @Override // ru.mail.libverify.ipc.a
    protected final void b() {
        Message obtain;
        try {
            Messenger messenger = this.c;
            switch (AnonymousClass1.a[this.e - 1]) {
                case 1:
                    obtain = Message.obtain(this, 6);
                    break;
                case 2:
                    obtain = Message.obtain(this, 7);
                    break;
                default:
                    throw new IllegalArgumentException("unknown fetcher state");
            }
            obtain.replyTo = a();
            Bundle bundle = new Bundle();
            bundle.putString("data", this.f);
            obtain.setData(bundle);
            messenger.send(obtain);
            this.b.a(true);
        } catch (Throwable th) {
            ru.mail.libverify.utils.d.a("FetcherState", "postDataToService", th);
        }
    }
}
