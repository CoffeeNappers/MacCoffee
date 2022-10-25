package ru.mail.libverify.api;

import android.support.annotation.NonNull;
import java.util.Collection;
import ru.mail.libverify.gcm.ServerNotificationMessage;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes3.dex */
public interface t {
    ServerNotificationMessage a(@NonNull String str);

    ServerNotificationMessage a(@NonNull String str, @NonNull ServerNotificationMessage serverNotificationMessage);

    boolean a();

    Collection<ServerNotificationMessage> b();

    ServerNotificationMessage b(@NonNull String str);

    void c();
}
