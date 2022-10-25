package ru.mail.libverify.gcm;

import ru.mail.libverify.requests.response.CallInfo;
import ru.mail.libverify.utils.Gsonable;
/* loaded from: classes3.dex */
public class ServerInfo implements Gsonable {
    public CallInfo call_info;
    public int confirm_required;
    public NotificationInfo notification_info;

    public String toString() {
        return "ServerInfo{, call_info=" + this.call_info + ", notification_info=" + this.notification_info + ", confirm_required=" + this.confirm_required + '}';
    }
}
