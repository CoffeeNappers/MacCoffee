package ru.mail.libverify.requests.response;

import android.support.annotation.Nullable;
import java.util.Set;
import ru.mail.libverify.utils.Gsonable;
/* loaded from: classes3.dex */
public class SmsInfo implements Gsonable {
    private int depth;
    private int max_sms;
    private String[] sms_templates;
    private Set<String> source_numbers;
    private long timeshift_max;
    private long timeshift_min;
    private long timestamp;

    public int getDepth() {
        return this.depth;
    }

    public int getMaxSmsCount() {
        return this.max_sms;
    }

    @Nullable
    public String[] getSmsTemplates() {
        return this.sms_templates;
    }

    @Nullable
    public Set<String> getSourceNumbers() {
        return this.source_numbers;
    }

    public long getTimeShiftMax() {
        return this.timeshift_max * 1000;
    }

    public long getTimeShiftMin() {
        return this.timeshift_min * 1000;
    }

    public void setTimestamp(long j) {
        this.timestamp = j;
    }

    public String toString() {
        return "SmsInfo{timeshift_max=" + this.timeshift_max + ", timeshift_min=" + this.timeshift_min + ", depth=" + this.depth + ", max_sms=" + this.max_sms + '}';
    }
}
