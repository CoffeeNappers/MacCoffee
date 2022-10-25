package ru.mail.libverify.gcm;

import ru.mail.libverify.utils.Gsonable;
/* loaded from: classes3.dex */
public class NotificationInfo implements Gsonable {
    public a action = a.UNKNOWN;
    public String session_id;

    /* loaded from: classes.dex */
    public enum a {
        COMPLETED,
        UNKNOWN
    }

    public String toString() {
        return "NotificationInfo{, session_id='" + this.session_id + "', action=" + this.action + '}';
    }
}
