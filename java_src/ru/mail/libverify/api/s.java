package ru.mail.libverify.api;

import android.os.Handler;
import android.support.annotation.NonNull;
import ru.mail.libverify.gcm.ServerNotificationMessage;
/* loaded from: classes3.dex */
interface s {
    Handler a();

    void a(@NonNull ServerNotificationMessage serverNotificationMessage);

    ru.mail.libverify.storage.o b();

    void b(@NonNull ServerNotificationMessage serverNotificationMessage);
}
