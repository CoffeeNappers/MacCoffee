package ru.mail.libverify.sms;

import android.support.annotation.NonNull;
import ru.mail.libverify.utils.Gsonable;
/* loaded from: classes3.dex */
public class SmsItem implements Gsonable {
    public final String extracted;
    public final String from;
    public final long timestamp;

    SmsItem() {
        this.timestamp = 0L;
        this.from = null;
        this.extracted = null;
    }

    public SmsItem(long j, @NonNull String str, @NonNull String str2) {
        this.timestamp = j;
        this.from = str;
        this.extracted = str2;
    }

    public String toString() {
        return "SmsItem{extracted='" + this.extracted + "', from='" + this.from + "', timestamp=" + this.timestamp + '}';
    }
}
