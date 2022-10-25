package ru.mail.libverify.notifications;

import android.content.Context;
import android.os.Handler;
import android.support.annotation.NonNull;
import ru.mail.libverify.gcm.ServerNotificationMessage;
/* loaded from: classes3.dex */
public interface d {
    Handler a();

    void a(@NonNull ServerNotificationMessage serverNotificationMessage, int i);

    Context b();
}
