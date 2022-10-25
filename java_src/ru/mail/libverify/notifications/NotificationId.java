package ru.mail.libverify.notifications;

import ru.mail.libverify.utils.Gsonable;
/* loaded from: classes3.dex */
enum NotificationId implements Gsonable {
    SMS_CODE { // from class: ru.mail.libverify.notifications.NotificationId.1
        @Override // ru.mail.libverify.notifications.NotificationId
        public final int a() {
            return 1;
        }
    };

    public abstract int a();
}
